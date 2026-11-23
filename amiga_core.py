"""Execute recovered Lotus II 68000 routines against four independent car states.

Addresses are from the user's CPY ADF after its own bootstrap relocation.
This is a subsystem adapter, not a complete Amiga chipset emulator.
"""
import struct,sys,math,json
from pathlib import Path
from unicorn import Uc,UC_ARCH_M68K,UC_MODE_BIG_ENDIAN,UC_HOOK_CODE
from unicorn.m68k_const import *

ROOT=Path(getattr(sys,'_MEIPASS',Path(__file__).parent))
ASSETS=ROOT/'assets'
COURSES=['FOREST','NIGHT','FOG','SNOW','DESERT','MOTORWAY','MARSH','STORM']
SCALE=180.
FPS=50
TURBO_BUTTON=0x76
TURBO_VOICE=0x5d
TUNNEL_ENTRANCE=0xfc
TUNNEL_EXIT=0xfd

class OriginalCore:
    def __init__(self,course,time_limit=True,smooth_corner_entry=False):
        self.course=course
        self.time_limit=time_limit
        self.smooth_corner_entry=smooth_corner_entry
        self.u=Uc(UC_ARCH_M68K,UC_MODE_BIG_ENDIAN);self.u.ctl_set_cpu_model(UC_CPU_M68K_M68000)
        resident=(ASSETS/'resident.bin').read_bytes()
        self.u.mem_map(0,0x1000000);self.u.mem_write(0,resident)
        self.g=0x280000;self.cars=[0x300000+i*0x200 for i in range(4)]
        # Do not run Amiga DMA allocation: return -1 for skid channel so the
        # car routine writes to a harmless custom-register page instead.
        self.u.mem_write(0x73740,bytes.fromhex('70ff4e75'))
        self.u.mem_write(self.g-0x8000,b'\0'*0x10000)
        source=(ASSETS/f'{24+course:03}.bin').read_bytes()
        self.records=[source[i:i+12]+b'\0'*4 for i in range(0,len(source),12)]
        self.finish=next((i for i,r in enumerate(self.records) if r[2]==0x79),1014)
        self.gates=[(i,r[3]) for i,r in enumerate(self.records) if r[2]==0x7a and i>0]
        self.initial_time=source[3]
        self.u.mem_write(self.g-0x1e78,b''.join(self.records))
        # Execute the original curve/height accumulator, which fills bytes 12/13.
        self.call(0x771f8,self.cars[0])
        expanded=bytes(self.u.mem_read(self.g-0x1e78,16384))
        self.records=[expanded[i:i+16] for i in range(0,16384,16)]
        # The start gate supplies initial time, and must not award it twice.
        if self.records[0][2]==0x7a:self.u.mem_write(self.g-0x1e78+2,b'\0\0')
        # Original Elan / Esprit acceleration curves and gear-ratio tables.
        base=(0x74f8e,0x75026,0x750be) if course%2 else (0x750c8,0x75160,0x751f8)
        for off,addr in zip((0x2ff2,0x2ff6,0x2ffa),base):self.long(self.g+off,addr)
        vmax,vmin,steer,slip=(0xa00,0xa00,2,30)
        if course==3:vmax,vmin,steer,slip=0x355,0x6aa,8,15
        elif course==4:vmax,vmin,steer,slip=0,0xa00,4,20
        elif course==7:vmax,vmin,steer,slip=0x6aa,0x6aa,4,25
        for off,v in [(0x2f7c,vmax),(0x2f7e,vmin),(0x2f80,steer),(0x2f82,slip)]:self.word(self.g+off,v)
        common=(ASSETS/'035.bin').read_bytes()
        width=int.from_bytes(common[0xd30+2*course:0xd32+2*course],'big')
        extra=int.from_bytes(common[0xd40+2*course:0xd42+2*course],'big')
        self.long(self.g+0x2c7a,-(width+extra)*4-32)
        self.long(self.g+0x2c7e,-(width+extra)*4+40)
        # Exact 64-byte original lateral surface map for this course.
        self.u.mem_write(self.g+0x23f8,common[0xf50+64*course:0xf90+64*course])
        for offset,courses in [(0x2dd4,(0,6,7)),(0x2dd6,(4,7)),(0x2dd8,(1,5)),(0x2dda,(1,2)),(0x2ddc,(3,7))]:
            self.word(self.g+offset,int(course in courses))
        self.word(self.g+0x2f40,1) # route sound requests through host audio
        self.word(self.g+0x2cf2,1) # original configuration with sampled voices
        self.word(self.g+0x2f8a,100)
        self.word(self.g+0x302e,(width>>2)+2)
        self.u.mem_write(self.g+0x28ec,resident[0x72ba2:0x72de2])
        self.call(0x7724c,self.cars[0],budget=400000)
        expanded=bytes(self.u.mem_read(self.g-0x1e78,16384))
        self.records=[expanded[i:i+16] for i in range(0,16384,16)]
        self.u.mem_write(self.g-0x3e46,(ASSETS/'reference-npc-start.bin').read_bytes())
        ai_base=int.from_bytes(common[0xd20+course*2:0xd22+course*2],'big')*8192//192
        self.word(self.g+0x2f9a,ai_base)
        self.events=[]
        self.u.hook_add(UC_HOOK_CODE,self._sound_request,begin=0x73740,end=0x73740)
        self.accumulators=[[0.,0.,0.] for _ in range(4)]
        for i,c in enumerate(self.cars):
            # Four distinct lanes, all behind the start line and the AI grid.
            self.long(c,0x41800);self.long(c+4,(-64,64,-176,176)[i]*65536)
            self.word(c+0x38,1);self.word(c+0x3a,1) # fire accelerates / automatic gearbox
            self.word(c+0xb2,-1);self.word(c+0x20,self.initial_time);self.word(c+0x22,0)

    def word(self,a,v):self.u.mem_write(a,struct.pack('>H',int(v)&65535))
    def long(self,a,v):self.u.mem_write(a,struct.pack('>I',int(v)&0xffffffff))
    def rw(self,a,signed=False):return int.from_bytes(self.u.mem_read(a,2),'big',signed=signed)
    def rl(self,a,signed=False):return int.from_bytes(self.u.mem_read(a,4),'big',signed=signed)

    def _sound_request(self,uc,address,size,user_data):
        self.events.append(uc.reg_read(UC_M68K_REG_D0)&65535)

    def tick_traffic(self):
        self.call(0x7afb6,self.cars[0])

    def traffic(self):
        data=bytes(self.u.mem_read(self.g-0x3e46,120));cars=[]
        for i in range(10):
            z,x,speed=struct.unpack_from('>IhH',data,i*12)
            cars.append(dict(z=z/65536*SCALE,x=x/256,speed=speed*FPS*SCALE/65536,index=i))
        return cars

    def call(self,pc,car,budget=30000):
        self.u.reg_write(UC_M68K_REG_SR,0x2700);self.u.reg_write(UC_M68K_REG_A7,0x800000)
        self.long(0x800000,0xfffffe)
        self.u.reg_write(UC_M68K_REG_A3,self.g);self.u.reg_write(UC_M68K_REG_A4,car);self.u.reg_write(UC_M68K_REG_A6,0xdff000)
        self.u.emu_start(pc,0xfffffe,count=budget)
        if self.u.reg_read(UC_M68K_REG_PC)!=0xfffffe:raise RuntimeError(f'Original routine {pc:x} exceeded its instruction budget')

    def step(self,i,steer,gas,brake,gear_shift=0):
        c=self.cars[i]
        self.events=[]
        previous_lean=self.rw(c+0x10,True)
        # Pulse-density conversion preserves the original joystick routine and
        # its inertia while accepting continuous host inputs at the 50 Hz tick.
        vals=(max(0,-steer),max(0,steer),gas);bits=0
        for n,v in enumerate(vals):
            self.accumulators[i][n]+=max(0,min(1,v))
            if self.accumulators[i][n]>=1:
                self.accumulators[i][n]-=1;bits|=(1,2,16)[n]
        if brake>.05:bits|=4
        if gear_shift>0:bits|=8
        elif gear_shift<0:bits|=4
        previous_buttons=bytes(self.u.mem_read(c+0x32,1))[0]
        self.u.mem_write(c+0x34,bytes([bits&~previous_buttons]))
        self.u.mem_write(c+0x32,bytes([bits]))
        self.u.mem_write(c+0x36,bytes([bits]))
        # The original interrupt wrapper copies the previous world position
        # into the road-query position before calling the car chain.
        self.u.mem_write(c+8,bytes(self.u.mem_read(c,6)))
        # Original order: integrate position, checkpoints, time, road values,
        # then controls + engine/gearbox for the next interrupt.
        for entry in (0x77fd4,0x78442,0x78a04,0x78692,0x7864e,0x78bb6,0x7871c):
            if entry==0x78a04 and self.smooth_corner_entry:
                # Ramp the lateral corner force over the entering record,
                # instead of applying the new curvature as an instant shove.
                record=self.rl(c+8)/65536;at=int(record)%len(self.records);f=record%1
                signed=lambda x:x-256 if x>127 else x
                before=signed(self.records[(at-1)%len(self.records)][0])*2
                after=signed(self.records[at][0])*2
                blend=f*f*(3-2*f)
                self.word(c+0x12,round(before+(after-before)*blend))
            if entry!=0x7864e or self.time_limit:self.call(entry,c)
        if 0<abs(steer)<.999:
            # A half-duty digital button adds +2 on alternate ticks, while
            # original centering subtracts 1 every tick: it canceled steering.
            # Fractional analog positions instead request a fractional lean.
            target=steer*32
            rate=max(1,self.rw(self.g+0x2f80)-1)
            lean=previous_lean+max(-rate,min(rate,target-previous_lean))
            self.word(c+0x10,round(lean))
        if .05<brake<1 and self.rw(c+0xe)>425:
            # Original digital brake is 48 units/tick; restore fractional part.
            self.word(c+0xe,self.rw(c+0xe)+round(48*(1-brake)))
        return self.state(i)

    def state(self,i):
        c=self.cars[i]
        return dict(z=self.rl(c)/65536*SCALE,x=self.rl(c+4,True)/65536/256,
                    speed=self.rw(c+0xe)*FPS*SCALE/65536,
                    timer=self.rw(c+0x20)+self.rw(c+0x22)/50,
                    gear=self.rw(c+0x28)+1,rpm=self.rw(c+0x2c),lean=self.rw(c+0x10,True),
                    road_height=self.rw(c+0x16,True),raw_speed=self.rw(c+0xe),jump=self.rw(c+0x3c,True)/256,
                    airborne=bool(self.rw(c+0x40)),engine_sample=97 if self.rw(c+0x24) else 96,
                    skid_volume=min(1,self.rw(c+0xb4)/64),
                    checkpoint_record=(self.rl(c+8)>>16) if self.rw(c+0x18) else None,
                    turbo_ticks=self.rw(c+0xbc),effects=list(self.events))

    def collide(self,i,speed_factor=.6,push=0):
        c=self.cars[i];self.word(c+0xe,self.rw(c+0xe)*speed_factor);self.word(c+0xce,self.rw(c+0xce)*speed_factor)
        if push:self.long(c+4,self.rl(c+4,True)+int(push*256*65536))

    def collide_players(self,i,j):
        """Use the original linked-player impact routine for each local pair."""
        for current,other in ((i,j),(j,i)):
            self.u.reg_write(UC_M68K_REG_D1,self.rl(self.cars[other]))
            self.u.reg_write(UC_M68K_REG_D2,self.rw(self.cars[other]+4))
            self.call(0x78600,self.cars[current])

    def reset_for_test(self,i,z=0,x=0,speed=0):
        c=self.cars[i];self.long(c,z/SCALE*65536);self.long(c+4,x*256*65536);self.word(c+0xe,speed);self.word(c+0xce,speed)
