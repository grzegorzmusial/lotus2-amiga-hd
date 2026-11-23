"""Lotus 2 HD / local four-player arcade reconstruction. Python 3.11+ / pygame-ce."""
import os, sys, math, random, json, argparse, time, copy
from pathlib import Path
from array import array
import pygame as pg
from pygame._sdl2 import controller as sdl
from amiga_core import OriginalCore,ASSETS,COURSES,TURBO_VOICE,TUNNEL_ENTRANCE,TUNNEL_EXIT
import numpy as np

W,H=1920,1080
SEG=180.0
N=1024
LENGTH=1014*SEG
MAX_SPEED=1050.0
CAMERA_DISTANCE=64.0
CAMERA_HEIGHT=96.0
FORWARD_SCALE=2.25
FOCAL=.9
HORIZON=.68
ROAD_HALF=256.0
TUNNEL_HALF=ROAD_HALF*1.13
TUNNEL_HEIGHT=184
CAR_WIDTH=64.0
PASSING_DISTANCE=SEG*.125
MENU_MUSIC='intro'  # Asset 36, module name "bootup": original opening theme.
START_VOICES=(('marks',88),('set',89),('go',90))
CHECKPOINT_FLASH_DURATION=.72
COLORS=[(232,235,240),(42,44,50),(236,45,48),(40,115,240)]
UI_COLORS=[COLORS[0],(165,174,190),COLORS[2],(92,161,255)]
SPRITE_FILES={p.name:p for p in ASSETS.glob('sprite-*.png')}
HD_CAR_FILES=[ASSETS/f'hd-car-{frame}.png' for frame in range(9)]
HD_CARS=all(path.exists() for path in HD_CAR_FILES)
THEMES=[dict(name=name,sub='Original Amiga course',sky=sky,haze=haze,grass=grass,road=(34,34,34),accent=(62,224,213)) for name,sky,haze,grass in [
 ('FOREST',(34,34,204),(155,191,210),(42,76,0)),('NIGHT',(6,9,22),(19,22,42),(20,22,28)),
 ('FOG',(146,151,149),(188,195,190),(99,111,99)),('SNOW',(116,157,184),(220,229,234),(206,218,224)),
 ('DESERT',(82,156,201),(241,207,156),(184,143,76)),('MOTORWAY',(59,122,174),(186,210,222),(80,119,65)),
 ('MARSH',(79,115,132),(172,187,162),(78,100,66)),('STORM',(55,64,82),(105,117,130),(51,75,58))]]
KEYS=[(pg.K_LEFT,pg.K_RIGHT,pg.K_UP,pg.K_DOWN),(pg.K_a,pg.K_d,pg.K_w,pg.K_s),(pg.K_j,pg.K_l,pg.K_i,pg.K_k),(pg.K_KP4,pg.K_KP6,pg.K_KP8,pg.K_KP5)]

def clamp(x,a,b): return max(a,min(b,x))
def mix(a,b,t): return a+(b-a)*t
def tint(c,k): return tuple(int(clamp(v*k,0,255)) for v in c)
def deadzone(x,d): return math.copysign(max(0,(abs(x)-d)/(1-d)),x)

class Driver:
    def __init__(self,i):
        self.i=i; self.z=-i*650.; self.x=(i%2-.5)*.65; self.speed=0.; self.steer=0.; self.elapsed=0.
        self.remaining=47.; self.checkpoint=1; self.finished=False; self.dnf=False; self.finish_time=0.; self.hit=0.; self.distance=0.
        self.passed_gates=set()
        self.checkpoint_flash=0.
        self.turbo_ticks=0
        self.previous=None

class Game:
    def __init__(self,headless=False):
        pg.mixer.pre_init(44100,-16,2,512)
        pg.init(); sdl.init()
        self.headless=headless; self.fullscreen=not headless
        self.screen=pg.display.set_mode((W,H),pg.HIDDEN if headless else pg.FULLSCREEN)
        pg.display.set_caption('LOTUS 2 / Amiga HD v3.8')
        self.canvas=pg.Surface((W,H)); self.clock=pg.time.Clock(); self.fonts={}
        self.running=True; self.state='menu'; self.players=4; self.course=0; self.selection=0; self.dead=.12
        self.time_limit=False
        self.countdown=3.; self.paused=False; self.muted=False; self.pads=[]; self.joys=[]; self.last_scan=0.; self.t=0.; self.fps=0.
        self.settings_path=Path(os.environ.get('LOCALAPPDATA',str(Path.home())))/'Lotus2AmigaHD'/'settings.json'
        if not headless:
            try:
                cfg=json.loads(self.settings_path.read_text()); self.dead=clamp(float(cfg.get('deadzone',.12)),.02,.4); self.muted=bool(cfg.get('muted',False))
            except (OSError,ValueError,TypeError): pass
        self.scan_pads(); self.build_track(); self.reset(); self.audio()
        self.sky_cache={}
        self.rain_particles=np.random.default_rng(1991).random((1200,3))

    def font(self,size,bold=False):
        key=(size,bold)
        if key not in self.fonts: self.fonts[key]=pg.font.SysFont('Bahnschrift,Segoe UI,Arial',size,bold=bold)
        return self.fonts[key]

    def text(self,s,txt,x,y,size=25,color=(231,239,246),bold=False,anchor='topleft'):
        img=self.font(size,bold).render(str(txt),True,color); r=img.get_rect(**{anchor:(int(x),int(y))}); s.blit(img,r); return r

    def scan_pads(self):
        for c in self.pads:
            try: c.quit()
            except pg.error: pass
        for j in self.joys:
            try: j.quit()
            except pg.error: pass
        self.pads=[]; self.joys=[]
        for i in range(pg.joystick.get_count()):
            try:
                if sdl.is_controller(i): self.pads.append(sdl.Controller(i))
                else:
                    j=pg.joystick.Joystick(i); j.init(); self.joys.append(j)
            except pg.error: pass

    def audio(self):
        self.channel=None; self.voice=None; self.crash=None; self.beep=None; self.check_sound=None; self.turbo_sound=None
        self.rain_channel=None;self.thunder_channel=None
        self.sprite_cache={};self.scale_cache={};self.music_on=True
        self.sprite_paths=SPRITE_FILES
        if not pg.mixer.get_init():return
        pg.mixer.set_num_channels(24);pg.mixer.set_reserved(8)
        self.engine_level=-1;self.channel=pg.mixer.Channel(0);self.voice=pg.mixer.Channel(1)
        self.engine_channels=[pg.mixer.Channel(i) for i in (0,2,3,4)]
        self.skid_channel=pg.mixer.Channel(5);self.skid_sound=self.original_sound(108)
        self.rain_channel=pg.mixer.Channel(6);self.thunder_channel=pg.mixer.Channel(7)
        self.rain_sound=self.original_sound(81);self.thunder_sound=self.original_sound(109)
        self.engine_phases=[0.]*4;self.engine_pcm={};self.effects={}
        for index in (96,97):
            raw=(ASSETS/f'{index:03}.bin').read_bytes();length=int.from_bytes(raw[:2],'big')*2
            self.engine_pcm[index]=np.frombuffer(raw[14:14+length],np.int8).astype(np.float32)*192
        self.last_checkpoint_voice=-100.
        self.crash=self.original_sound(104)
        self.beep=self.original_sound(102)
        self.check_sound=self.original_sound(91)
        self.turbo_sound=self.original_sound(TURBO_VOICE)
        # Original 0x73472/0x7347c/0x73486 calls: 88 -> 89 -> 90.
        self.count_sounds=[self.original_sound(index) for _,index in START_VOICES]
        self.play_music(MENU_MUSIC)

    def original_sound(self,index,period=None):
        b=(ASSETS/f'{index:03}.bin').read_bytes()
        length=int.from_bytes(b[:2],'big')*2
        period=period or int.from_bytes(b[2:4],'big')
        samples=np.frombuffer(b[14:14+length],dtype=np.int8).astype(np.float32)*192
        if not len(samples):return None
        rate=3546895/max(1,period)
        output_rate,format_bits,channels=pg.mixer.get_init()
        if format_bits!=-16:raise RuntimeError('Signed 16-bit audio mixer required')
        count=max(1,round(len(samples)*output_rate/rate))
        positions=np.arange(count)*rate/output_rate
        mono=np.interp(positions,np.arange(len(samples)),samples).astype(np.int16)
        # A raw Sound buffer must contain interleaved samples for every mixer
        # channel. Sending mono bytes to a stereo mixer doubled voice speed.
        pcm=np.repeat(mono[:,None],channels,axis=1)
        sound=pg.mixer.Sound(buffer=pcm.tobytes())
        sound.set_volume(min(1,int.from_bytes(b[4:6],'big')/64))
        return sound

    def announce(self,sound):
        if sound is not None and self.voice and not self.muted:self.voice.play(sound)

    def music_volume(self):
        return 0 if self.muted else (.24 if self.state=='race' else .5)

    def apply_audio_volume(self):
        if not pg.mixer.get_init():return
        pg.mixer.music.set_volume(self.music_volume())
        if self.voice:self.voice.set_volume(0 if self.muted else 1)
        for channel in getattr(self,'engine_channels',[]):channel.set_volume(0 if self.muted or self.paused else (.4 if self.players==1 else .22))
        if hasattr(self,'skid_channel') and (self.muted or self.paused):self.skid_channel.set_volume(0)
        weather_audible=self.state=='race' and self.course==7 and not self.muted and not self.paused
        if self.rain_channel:self.rain_channel.set_volume(.8 if weather_audible else 0)
        if self.thunder_channel:self.thunder_channel.set_volume(.9 if weather_audible else 0)

    def update_weather_audio(self):
        if not self.rain_channel:return
        if self.course!=7 or self.state!='race':
            self.rain_channel.stop();self.thunder_channel.stop()
            return
        if not self.rain_channel.get_busy():self.rain_channel.play(self.rain_sound,loops=-1)
        cycle=math.floor((self.weather_time-4.7)/8.3)
        if cycle>=0 and cycle!=self.last_thunder_cycle:
            self.thunder_channel.play(self.thunder_sound)
            self.last_thunder_cycle=cycle
        audible=not self.muted and not self.paused
        self.rain_channel.set_volume(.8 if audible else 0)
        self.thunder_channel.set_volume(.9 if audible else 0)

    def play_effect(self,code):
        if self.muted or not pg.mixer.get_init() or not 98<=code<=111 or code==108:return
        if code not in self.effects:self.effects[code]=self.original_sound(code)
        self.effects[code].play()

    def engine_chunk(self,index,rpm):
        # Original routine 0x732d2: Paula period = max(124, 0xFCC3A / RPM).
        period=max(124,1035322//max(1000,int(rpm)))
        output_rate,_,channels=pg.mixer.get_init();frames=max(1,round(output_rate*.04))
        source=self.engine_pcm[getattr(self.drivers[index],'engine_sample',96)]
        phase=self.engine_phases[index];step=3546895/period/output_rate
        positions=(phase+np.arange(frames)*step)%len(source)
        pcm=np.interp(positions,np.arange(len(source)),source,period=len(source)).astype(np.int16)
        self.engine_phases[index]=(phase+frames*step)%len(source)
        return pg.mixer.Sound(buffer=np.repeat(pcm[:,None],channels,axis=1).tobytes())

    def update_engine_audio(self):
        for i,channel in enumerate(self.engine_channels):
            if i>=self.players or self.drivers[i].finished or self.drivers[i].dnf:channel.stop();continue
            rpm=getattr(self.drivers[i],'rpm',1000)
            if not channel.get_busy():channel.play(self.engine_chunk(i,rpm))
            if channel.get_queue() is None:channel.queue(self.engine_chunk(i,rpm))
            channel.set_volume(0 if self.muted else (.4 if self.players==1 else .22))
        skid=max(self.corner_skid_level(p) for p in self.drivers[:self.players])
        if skid>0:
            if not self.skid_channel.get_busy():self.skid_channel.play(self.skid_sound,loops=-1)
            self.skid_channel.set_volume(0 if self.muted else skid*.45)
        else:self.skid_channel.stop()

    def corner_skid_level(self,p):
        # The original request also covers wheelspin while accelerating.
        # Only play tire squeal for a grounded car steering through a bend.
        turning=abs(self.curves[int(p.z/SEG)%N])>0 and abs(p.steer)>.12
        if not turning or p.speed<200 or getattr(p,'jump',0)>0:return 0.
        return getattr(p,'skid_volume',0)

    def stop_driving_audio(self):
        for channel in getattr(self,'engine_channels',[]):channel.stop()
        if hasattr(self,'skid_channel'):self.skid_channel.stop()
        if self.rain_channel:self.rain_channel.stop()
        if self.thunder_channel:self.thunder_channel.stop()

    def play_music(self,name):
        if not pg.mixer.get_init():return
        pg.mixer.music.load(str(ASSETS/f'{name}.mod'))
        self.current_music=name
        pg.mixer.music.set_volume(self.music_volume())
        pg.mixer.music.play(-1)

    def sprite(self,index,width,frame=None,color=None,wheel_phase=None):
        hd_car=index==126 and frame is not None and HD_CARS
        palette='hd' if hd_car else self.course
        key=(palette,index,frame,None)
        if key not in self.sprite_cache:
            name=f"sprite-{self.course}-{index}{'-v'+str(frame) if frame is not None else ''}.png"
            path=HD_CAR_FILES[frame] if hd_car else SPRITE_FILES.get(name)
            self.sprite_cache[key]=pg.image.load(str(path)).convert_alpha() if path is not None else None
        src=self.sprite_cache[key]
        if src is None:return None
        if color is not None:
            color=tuple(color);colored_key=(palette,index,frame,color)
            if colored_key not in self.sprite_cache:
                variant=src.copy();pixels=pg.surfarray.pixels3d(variant)
                if hd_car:
                    paint_key=('paint',frame)
                    if paint_key not in self.sprite_cache:
                        brightness=pixels.mean(axis=2)
                        neutral=pixels.max(axis=2).astype(int)-pixels.min(axis=2).astype(int)<28
                        xx,yy=np.indices(brightness.shape)
                        paint=neutral&(brightness>90)&((yy>src.get_height()*.32)|(yy<src.get_height()*.15))
                        self.sprite_cache[paint_key]=(paint,brightness[paint,None]/235)
                    paint,shade=self.sprite_cache[paint_key]
                    pixels[paint]=np.clip(np.array(color)*shade,0,255)
                else:
                    common=(ASSETS/'035.bin').read_bytes();offset=0x1a0+self.course*32
                    for palette_index,brightness in [(4,.67),(5,1.0)]:
                        v=int.from_bytes(common[offset+palette_index*2:offset+palette_index*2+2],'big')
                        original=np.array([((v>>8)&15)*17,((v>>4)&15)*17,(v&15)*17])
                        mask=np.all(pixels==original,axis=2)
                        pixels[mask]=np.array(color)*brightness
                del pixels;self.sprite_cache[colored_key]=variant
            src=self.sprite_cache[colored_key]
        phase_count=8 if hd_car else 4
        phase=None if wheel_phase is None else int(wheel_phase)%phase_count
        if phase is not None:
            wheel_key=(palette,index,frame,color,'wheel',phase)
            if wheel_key not in self.sprite_cache:
                variant=src.copy();pixels=pg.surfarray.pixels3d(variant)
                tire_key=('tires',palette,index,frame)
                if tire_key not in self.sprite_cache:
                    sw,sh=variant.get_size();xx,yy=np.indices((sw,sh))
                    original=pg.surfarray.array3d(self.sprite_cache[(palette,index,frame,None)])
                    alpha=pg.surfarray.array_alpha(variant)
                    if hd_car:
                        yaw=(frame-4)/4
                        left_turn=max(0,-yaw);right_turn=max(0,yaw)
                        left=(xx>=sw*(.00+.08*left_turn))&(xx<sw*(.14+.13*left_turn))
                        right=(xx>sw*(.86-.13*right_turn))&(xx<=sw*(1.0-.08*right_turn))
                        tires=(yy>=int(sh*.80))&(left|right)&(original.max(axis=2)<115)&(alpha>180)
                        pattern=(yy[tires]+xx[tires]//3)%64
                    else:
                        tire_columns=((xx>=sw*.07)&(xx<sw*.17))|((xx>sw*.83)&(xx<=sw*.93))
                        tires=(yy>=int(sh*.82))&tire_columns&(original.max(axis=2)<36)&(alpha>0)
                        pattern=(xx[tires]+yy[tires]*2)%4
                    self.sprite_cache[tire_key]=(tires,pattern,original[tires])
                tires,pattern,tire_colors=self.sprite_cache[tire_key]
                if hd_car:
                    rolling=(pattern+phase*8)%64
                    highlight=np.maximum(0,np.cos(rolling*math.tau/64))**6
                    pixels[tires]=np.clip(tire_colors*.7+8+highlight[:,None]*50,0,110)
                else:
                    pixels[tires]=(18+(pattern[:,None]+phase)%4*9)
                del pixels;self.sprite_cache[wheel_key]=variant
            src=self.sprite_cache[wheel_key]
        width=int(clamp(width,2,1300));key=(palette,index,frame,color,width,phase)
        if key not in self.scale_cache:
            if len(self.scale_cache)>1800:self.scale_cache.clear()
            size=(width,max(1,round(src.get_height()*width/src.get_width())))
            self.scale_cache[key]=pg.transform.smoothscale(src,size) if hd_car else pg.transform.scale(src,size)
        return self.scale_cache[key]

    def build_track(self):
        self.original=OriginalCore(self.course,time_limit=self.time_limit,smooth_corner_entry=True);self.sim_accum=0.
        def signed(v):return v-256 if v>127 else v
        self.curves=[-signed(r[0])*2.5 for r in self.original.records]
        # Integrate once in track coordinates. Restarting this integration at
        # each camera segment changed its origin at boundaries on every bend.
        self.road_positions=[0.];self.road_headings=[0.]
        for curvature in self.curves:
            self.road_positions.append(self.road_positions[-1]+self.road_headings[-1]+curvature*.5)
            self.road_headings.append(self.road_headings[-1]+curvature)
        self.heights=[];height=0.;previous=self.original.records[0][13]
        for r in self.original.records:
            height-=signed((r[13]-previous)&255)*2.5
            self.heights.append(height);previous=r[13]
        self.scenery=[];widths={};self.scenery_bins=[[] for _ in range(N)];self.track_gates=[]
        self.tunnel_sections=[self.course==1 and bool(r[10]&0x80) for r in self.original.records]
        for idx,r in enumerate(self.original.records):
            for slot in range(4):
                code=r[2+slot*2];lateral=signed(r[3+slot*2])/16
                if code in (120,121,122):self.track_gates.append(dict(z=(idx+slot/4)*SEG,index=code))
                if code>=112 and code not in (120,121,122,TUNNEL_ENTRANCE,TUNNEL_EXIT):
                    if code not in widths:
                        path=ASSETS/f'{code:03}.bin'
                        widths[code]=int.from_bytes(path.read_bytes()[12:14],'big') if path.exists() else 72
                    obj=dict(z=(idx+slot/4)*SEG,x=lateral,index=code,width=widths[code],visible=f'sprite-{self.course}-{code}.png' in SPRITE_FILES)
                    self.scenery.append(obj);self.scenery_bins[idx].append(obj)
        self.traffic=self.original.traffic()
        self.previous_traffic=[dict(car) for car in self.traffic]
        for car in self.traffic:car['color']=[(221,44,34),(36,165,64)][car['index']%2]

    def reset(self):
        self.drivers=[Driver(i) for i in range(4)]; self.countdown=3.; self.paused=False; self.results_timer=0.; self.build_track()
        self.weather_time=0.
        self.last_thunder_cycle=None
        self.next_course=None

    def road_geometry(self,record):
        """Continuous position and heading, including fractional records."""
        if record<0:return self.curves[0]*record*record*.5,self.curves[0]*record
        if record>=N:return self.road_positions[N]+self.road_headings[N]*(record-N),self.road_headings[N]
        index=int(record);fraction=record-index
        return (self.road_positions[index]+self.road_headings[index]*fraction+self.curves[index]*fraction*fraction*.5,
                self.road_headings[index]+self.curves[index]*fraction)

    def start(self):
        self.stop_driving_audio()
        self.reset();self.state='race';self.sky_cache={}
        for p in self.drivers:
            state=self.original.state(p.i);p.z=state['z'];p.x=state['x'];p.remaining=state['timer']
            p.previous=(p.z,p.x,p.speed,p.steer,0.)
        if pg.mixer.get_init():
            if self.music_on:self.play_music(MENU_MUSIC)
            else:pg.mixer.music.stop()
        self.last_checkpoint_voice=-100.
        if hasattr(self,'count_sounds'):self.announce(self.count_sounds[0])
        self.update_weather_audio()

    def controls(self,i):
        keys=pg.key.get_pressed(); left,right,gas,brake=KEYS[i]
        steer=float(keys[right])-float(keys[left]); throttle=float(keys[gas]); stop=float(keys[brake])
        try:
            if i<len(self.pads):
                pad=self.pads[i]
                a=deadzone(pad.get_axis(pg.CONTROLLER_AXIS_LEFTX)/32767.,self.dead)
                if abs(a)>abs(steer): steer=a
                throttle=max(throttle,clamp(pad.get_axis(pg.CONTROLLER_AXIS_TRIGGERRIGHT)/32767.,0,1),float(pad.get_button(pg.CONTROLLER_BUTTON_A)))
                stop=max(stop,clamp(pad.get_axis(pg.CONTROLLER_AXIS_TRIGGERLEFT)/32767.,0,1),float(pad.get_button(pg.CONTROLLER_BUTTON_B)))
            elif i-len(self.pads)<len(self.joys):
                j=self.joys[i-len(self.pads)]; analog=deadzone(j.get_axis(0),self.dead)
                if abs(analog)>abs(steer):steer=analog
                throttle=max(throttle,float(j.get_button(0)) if j.get_numbuttons() else 0)
                stop=max(stop,float(j.get_button(1)) if j.get_numbuttons()>1 else 0)
        except pg.error: pass
        return steer,throttle,stop

    def update(self,dt,inputs=None):
        self.t+=dt
        if self.state=='results' and self.next_course is not None:
            self.results_timer+=dt
            if self.results_timer>=4:
                self.course=self.next_course
                self.start()
            return
        if self.state!='race' or self.paused:return
        self.weather_time+=dt
        self.update_weather_audio()
        for p in self.drivers:p.checkpoint_flash=max(0,p.checkpoint_flash-dt)
        if self.countdown>0:
            before=self.countdown;self.countdown=max(0,self.countdown-dt)
            if hasattr(self,'count_sounds'):
                if before>1.5>=self.countdown:self.announce(self.count_sounds[1])
                if before>0>=self.countdown:self.announce(self.count_sounds[2])
            if self.channel:self.update_engine_audio()
            return
        self.sim_accum+=dt
        while self.sim_accum>=.02 and self.state=='race':
            self.sim_accum-=.02
            self.previous_traffic=[dict(car) for car in self.traffic]
            self.original.tick_traffic();self.traffic=self.original.traffic();played_effects=set()
            for car in self.traffic:car['color']=[(221,44,34),(36,165,64)][car['index']%2]
            for p in self.drivers[:self.players]:
                if p.finished or p.dnf:continue
                p.previous=(p.z,p.x,p.speed,p.steer,getattr(p,'jump',0))
                steer,gas,brake=inputs[p.i] if inputs else self.controls(p.i)
                p.hit=max(0,p.hit-.02)
                state=self.original.step(p.i,steer,gas,brake)
                p.z=state['z'];p.x=state['x'];p.speed=state['speed'];p.remaining=state['timer']
                p.gear=state['gear'];p.rpm=state['rpm'];p.elapsed+=.02;p.distance=p.z;p.raw_speed=state['raw_speed']
                p.jump=state['jump'];p.steer=state['lean']/32
                p.engine_sample=state['engine_sample'];p.skid_volume=state['skid_volume']
                p.turbo_ticks=state['turbo_ticks']
                p.checkpoint=1+sum(p.z>=idx*SEG for idx,_ in self.original.gates)
                gate=state['checkpoint_record']
                if gate in dict(self.original.gates) and gate not in p.passed_gates:
                    p.passed_gates.add(gate)
                    p.checkpoint_flash=CHECKPOINT_FLASH_DURATION
                    if self.check_sound and self.t-self.last_checkpoint_voice>.8:
                        self.announce(self.check_sound);self.last_checkpoint_voice=self.t
                for code in state['effects']:
                    if code not in played_effects and code!=TURBO_VOICE:self.play_effect(code)
                    played_effects.add(code)
                if any(code in (98,99,101,104,105,106,107,109,110) for code in state['effects']) and p.hit<=0:
                    p.hit=.35
                if p.z>=LENGTH:p.finished=True;p.finish_time=p.elapsed;p.speed=0
                elif self.time_limit and p.remaining<=0:p.dnf=True;p.speed=0
            for a in self.drivers[:self.players]:
                for b in self.drivers[a.i+1:self.players]:
                    if not(a.finished or b.finished or a.dnf or b.dnf) and abs(a.z-b.z)<22.5 and abs(a.x-b.x)<.25 and a.hit<=0 and b.hit<=0:
                        self.original.collide_players(a.i,b.i);a.hit=b.hit=.35
                        for driver in (a,b):
                            impact=self.original.state(driver.i);driver.z=impact['z'];driver.x=impact['x'];driver.speed=impact['speed']
                        self.play_effect(98)
            if TURBO_VOICE in played_effects:self.announce(self.turbo_sound)
            if all(p.finished or p.dnf for p in self.drivers[:self.players]):
                self.state='results';self.stop_driving_audio();self.play_music('gameover' if all(p.dnf for p in self.drivers[:self.players]) else 'jingle-40')
                self.results_timer=0.
                if any(p.finished for p in self.drivers[:self.players]) and self.course<len(COURSES)-1:
                    self.next_course=self.course+1
        if self.channel and self.state=='race':self.update_engine_audio()

    def car(self,s,x,y,size,color,steer=0,braking=False,wheel_phase=None):
        frame=int(clamp(round(4+steer*4),0,8))
        # Steering poses are wider, not shorter. Keep their original 39px
        # height instead of squeezing every pose into the straight-car width.
        pose_width=(72,70,67,67,64,67,67,70,72)[frame]
        sprite=self.sprite(126,size*pose_width/64,frame,color,wheel_phase)
        if sprite is not None:
            s.blit(sprite,(int(x-sprite.get_width()/2),int(y-sprite.get_height())))

    def background(self,w,h):
        key=(self.course,w,h)
        if key in self.sky_cache:return self.sky_cache[key]
        th=THEMES[self.course];s=pg.Surface((w,h));horizon=int(h*HORIZON)
        for y in range(horizon+30):
            t=y/(horizon+30);c=tuple(int(mix(a,b,t)) for a,b in zip(th['sky'],th['haze']));pg.draw.line(s,c,(0,y),(w,y))
        hd=ASSETS/f'hd-background-{self.course}.png'
        if hd.exists():
            image=pg.image.load(str(hd)).convert()
            factor=max(w/image.get_width(),horizon/(image.get_height()*.88))
            scaled=pg.transform.smoothscale(image,(round(image.get_width()*factor),round(image.get_height()*factor)))
            s.blit(scaled,((w-scaled.get_width())//2,horizon-round(scaled.get_height()*.88)))
        elif self.course==0:
            sky=pg.image.load(str(ASSETS/'racing-sky-0.png'))
            s.blit(pg.transform.scale(sky,(w,horizon)),(0,0))
        else:
            # Course preview images are 160x100, not two adjacent 160px tiles.
            backdrop=pg.image.load(str(ASSETS/f'backdrop-{self.course}.png'))
            backdrop=pg.transform.scale(backdrop,(w,int(h*.27)))
            s.blit(backdrop,(0,horizon-backdrop.get_height()))
        self.sky_cache[key]=s;return s

    def render_driver(self,p):
        if p.previous is None or p.finished or p.dnf:return p
        sample=copy.copy(p);alpha=clamp(self.sim_accum/.02,0,1)
        for index,name in enumerate(('z','x','speed','steer','jump')):
            setattr(sample,name,mix(p.previous[index],getattr(p,name,0),alpha))
        sample.render_sample=True
        return sample

    def render_traffic(self):
        alpha=clamp(self.sim_accum/.02,0,1)
        previous={car['index']:car for car in self.previous_traffic}
        sampled=[]
        for car in self.traffic:
            sample=dict(car)
            before=previous.get(car.get('index'))
            if before:
                # The original AI has a 64-record ring. Unwrap before
                # interpolation so recycling never sweeps a car across it.
                distance=(car['z']-before['z']+32*SEG)%(64*SEG)-32*SEG
                sample['z']=before['z']+distance*alpha
                sample['x']=mix(before['x'],car['x'],alpha)
            sampled.append(sample)
        return sampled

    def lightning(self):
        phase=(self.weather_time-4.7)%8.3
        for strike in (0.,.16):
            age=phase-strike
            if 0<=age<.11:return 1-age/.11
        return 0.

    def storm_sky(self,s):
        w,h=s.get_size()
        offset=int(math.sin(self.weather_time*.08)*35)
        s.blit(self.background(w+80,h),(-40+offset,0))
        flash=self.lightning()
        if flash>0:
            cycle=int((self.weather_time-4.7)//8.3)
            x=w*(.23 if cycle%2 else .72)
            points=[(x,0),(x-w*.014,h*.07),(x+w*.008,h*.12),
                    (x-w*.025,h*.19),(x-w*.006,h*.22),(x-w*.042,h*.31)]
            pg.draw.lines(s,(119,157,195),False,points,max(2,round(w*.005)))
            pg.draw.lines(s,(240,249,255),False,points,max(1,round(w*.0016)))
            branch=[points[2],(x+w*.032,h*.17),(x+w*.025,h*.23)]
            pg.draw.lines(s,(220,239,255),False,branch,max(1,round(w*.001)))

    def storm_rain(self,s):
        w,h=s.get_size()
        stamp=(w,h,self.weather_time)
        if getattr(self,'rain_frame_stamp',None)==stamp:
            s.blit(self.rain_frame,(0,0),special_flags=pg.BLEND_ALPHA_SDL2)
            return
        weather=pg.Surface((w,h),pg.SRCALPHA)
        wind=-.065+math.sin(self.weather_time*.4)*.018
        rx,ry,depth=self.rain_particles.T
        speeds=.65+depth*1.05
        ys=((ry+self.weather_time*speeds)%1.15-.08)*h
        xs=((rx+self.weather_time*wind*(.5+depth))%1.1-.05)*w
        lengths=h*(.006+depth*.026)
        for x,y,length,d in zip(xs,ys,lengths,depth):
            color=(128,192,228,int(105+d*110))
            pg.draw.line(weather,color,(x,y),(x+wind*length*2.5,y+length),1 if d<.8 else 2)
        flash=self.lightning()
        if flash>0:
            light=pg.Surface((w,h),pg.SRCALPHA)
            light.fill((202,222,244,round(65*flash)))
            weather.blit(light,(0,0))
        weather.set_alpha(255,pg.RLEACCEL)
        s.blit(weather,(0,0),special_flags=pg.BLEND_ALPHA_SDL2)
        self.rain_frame_stamp=stamp
        self.rain_frame=weather

    def car_scale(self,distance_ahead):
        # Treat the native bumper-contact window as the passing plane, so a
        # neighboring car reaches player size while it is alongside.
        depth=CAMERA_DISTANCE+max(0,distance_ahead-PASSING_DISTANCE)
        return FOCAL/(depth*FORWARD_SCALE)

    def start_label(self,p):
        if self.countdown>1.5:return 'MARKS'
        if self.countdown>0:return 'SET'
        if p.elapsed<.75:return 'GO!'
        return None

    def tunnel_frame(self,point,w,h):
        x,y,_,scale,*_=point
        half=scale*TUNNEL_HALF*w/2
        top=y-scale*TUNNEL_HEIGHT*h/2
        return ((x-half,y),(x-half,top),(x+half,top),(x+half,y))

    def draw_tunnel(self,s,near,far,entrance,lit):
        w,h=s.get_size()
        left,upper_left,upper_right,right=self.tunnel_frame(near,w,h)
        if far:
            far_left,far_upper_left,far_upper_right,far_right=self.tunnel_frame(far,w,h)
            walls=(30,31,31)
            pg.draw.polygon(s,walls,(left,upper_left,far_upper_left,far_left))
            pg.draw.polygon(s,walls,(upper_right,right,far_right,far_upper_right))
            pg.draw.polygon(s,(13,14,16),(upper_left,upper_right,far_upper_right,far_upper_left))
            if lit:
                # Two rows of lamps in the original tunnel ceiling.
                lamp_far_left=tuple(mix(a,b,.36) for a,b in zip(upper_left,far_upper_left))
                lamp_far_right=tuple(mix(a,b,.36) for a,b in zip(upper_right,far_upper_right))
                for offset in (.18,.82):
                    lamp=(
                        (mix(a[0],b[0],t),a[1])
                        for a,b,t in ((upper_left,upper_right,offset-.012),
                                      (upper_left,upper_right,offset+.012),
                                      (lamp_far_left,lamp_far_right,offset+.012),
                                      (lamp_far_left,lamp_far_right,offset-.012))
                    )
                    pg.draw.polygon(s,(215,213,201),tuple(lamp))
        if entrance:
            jamb=(right[0]-left[0])*.16
            lintel=(left[1]-upper_left[1])*.24
            outer_left=left[0]-jamb*10
            outer_right=right[0]+jamb*10
            x0,y0=upper_left;x1=upper_right[0];bottom=left[1]
            face=(80,83,85)
            pg.draw.polygon(s,face,((outer_left,bottom),(outer_left,y0-lintel),(x0,y0-lintel),left))
            pg.draw.polygon(s,face,(right,(x1,y0-lintel),(outer_right,y0-lintel),(outer_right,bottom)))
            pg.draw.polygon(s,face,((x0,y0-lintel),(x1,y0-lintel),upper_right,upper_left))
            edge=max(1,round(lintel*.12))
            pg.draw.line(s,(119,121,123),(outer_left,y0-lintel),(outer_right,y0-lintel),edge)

    def view(self,s,p,show_hud=True):
        w,h=s.get_size(); th=THEMES[self.course]; horizon=h*HORIZON
        s.fill(th['grass']);s.blit(self.background(w,h),(0,0))
        if self.course==7:self.storm_sky(s)
        camheight=CAMERA_HEIGHT;depth=FOCAL;drawdist=24;subdiv=8
        camera_distance=CAMERA_DISTANCE
        camera_z=p.z-camera_distance
        base=math.floor(camera_z/SEG);frac=(camera_z/SEG)%1
        player_index=int(p.z/SEG)%N;player_fraction=(p.z/SEG)%1
        cam_y=mix(self.heights[player_index],self.heights[(player_index+1)%N],player_fraction)+camheight
        player_record=p.z/SEG
        origin,heading=self.road_geometry(player_record)
        world=[]
        for n in range(drawdist*subdiv):
            record=base+n/subdiv;idx=math.floor(record)%N
            z=(n/subdiv-frac)*SEG*FORWARD_SCALE
            x=self.road_geometry(record)[0]-origin-heading*(record-player_record)
            world.append((x,z,idx,(record%1)))
        def project(xx,z,idx,part):
            scale=depth/z
            px=w/2+scale*(xx-p.x*256)*w/2
            road_y=mix(self.heights[idx],self.heights[(idx+1)%N],part)
            yy=horizon-scale*(road_y-cam_y)*h/2
            half=scale*ROAD_HALF*w/2
            return (px,yy,half,scale,idx,h)
        projections=[project(*point) if point[1]>=20 else None for point in world]
        far=projections[-1]
        if far:projections.append((far[0],horizon,0.,0.,far[4],h))
        envelope=h
        for n in range(1,len(projections)):
            point=projections[n]
            if point:
                projections[n]=(*point[:5],envelope);envelope=min(envelope,point[1])
        roads=[th['road'],tint(th['road'],.86)];greens=[th['grass'],tint(th['grass'],.88)]
        tunnel_roads=[(58,57,53),(50,49,46)]
        objects=[]
        near_record=(camera_z+20/FORWARD_SCALE)/SEG
        near_idx=math.floor(near_record)%N
        if self.tunnel_sections[near_idx]:
            # Continue the interior to the camera's near plane so sky cannot
            # show above the ceiling between consecutive mesh samples.
            nearest=next(point for point in projections if point)
            xx=self.road_geometry(near_record)[0]-origin-heading*(near_record-player_record)
            near=project(xx,20,near_idx,near_record%1)
            objects.append((20/FORWARD_SCALE,'tunnel',(near,nearest,False,False)))
        for n in range(len(projections)-2,0,-1):
            a=projections[n];b=projections[n+1]
            if not a or not b:continue
            ax,ay,aw,_,idx,_=a;bx,by,bw,*_=b
            in_tunnel=self.tunnel_sections[idx]
            if in_tunnel:
                entrance=n%subdiv==0 and self.original.records[idx][2]==TUNNEL_ENTRANCE
                objects.append((world[n][1]/FORWARD_SCALE,'tunnel',(a,b,entrance,n%subdiv==2)))
            if int(ay)<=int(by) or by>h:continue
            ay=min(h+2000,ay);by=max(-2000,by)
            # Markings have a fixed world length; they do not depend on mesh tessellation.
            stripe=math.floor((base+n/subdiv)*4);band=stripe%2
            pg.draw.rect(s,(27,28,28) if in_tunnel else greens[band],(0,by,w,max(1,ay-by+1)))
            def strip(l,r,color):pg.draw.polygon(s,color,[(ax+aw*l,ay),(ax+aw*r,ay),(bx+bw*r,by),(bx+bw*l,by)])
            strip(-1.06,1.06,(210,212,196) if band else (88,90,82))
            strip(-1,1,(tunnel_roads if in_tunnel else roads)[band])
            if band:
                for lane in [-1/3,1/3]:strip(lane-.012,lane+.012,(200,209,207))
        traffic=self.render_traffic() if getattr(p,'render_sample',False) else self.traffic
        for car in traffic:
            relative=(car['z']-p.z+32*SEG)%(64*SEG)-32*SEG
            dz=relative+camera_distance
            if relative>8-camera_distance and 8<dz<drawdist*SEG: objects.append((dz,'car',car))
        for other in self.drivers[:self.players]:
            if other.i!=p.i:
                if getattr(p,'render_sample',False):other=self.render_driver(other)
                dz=other.z-camera_z
                if other.z-p.z>8-camera_distance and 8<dz<drawdist*SEG:objects.append((dz,'car',{'x':other.x,'color':COLORS[other.i],'jump':getattr(other,'jump',0),'speed':other.speed,'z':other.z,'steer':other.steer}))
        for gate in self.track_gates:
            dz=gate['z']-camera_z
            if 8<dz<drawdist*SEG:objects.append((dz,'gate',gate))
        for sector in range(base,base+drawdist):
            for obj in self.scenery_bins[sector%N]:
                dz=(obj['z']-camera_z)%(N*SEG)
                if obj['visible'] and 8<dz<drawdist*SEG:objects.append((dz,'original',obj))
        for dz,kind,obj in sorted(objects,key=lambda o:o[0],reverse=True):
            if kind=='tunnel':
                self.draw_tunnel(s,*obj)
                continue
            at=(dz/SEG+frac)*subdiv;n=int(at);part=at-n
            if n<=0 or n+1>=len(world) or not projections[n] or not projections[n+1]:continue
            a,b=projections[n],projections[n+1];idx=a[4];clip=min(a[5],b[5])
            # Project each object's exact depth, rather than snapping it to a
            # road-mesh sample (which made nearby cars jump in position/size).
            record=(camera_z+dz)/SEG;ri=math.floor(record)%N
            wx=self.road_geometry(record)[0]-origin-heading*(record-player_record)
            altitude=mix(self.heights[ri],self.heights[(ri+1)%N],record%1)
            scale=depth/(dz*FORWARD_SCALE)
            xx=w/2+scale*(wx-p.x*256)*w/2
            yy=horizon-scale*(altitude-cam_y)*h/2;half=scale*ROAD_HALF*w/2
            if (yy>clip+4 and clip<h-1) or yy<-100 or yy>h+300:continue
            if kind=='car':
                width=max(2,self.car_scale(dz-camera_distance)*CAR_WIDTH*w/2)
                yy-=obj.get('jump',0)*h/200*CAMERA_DISTANCE/dz
                wheel_phase=obj.get('z',p.z+dz-camera_distance)/12 if obj.get('speed',p.speed)>2 else None
                self.car(s,xx+scale*256*obj['x']*w/2,yy,width,obj['color'],obj.get('steer',0),wheel_phase=wheel_phase)
            elif kind=='gate':
                height=half*.7;post=max(1,half*.05);color=(35,165,83) if obj['index']==122 else (212,219,222)
                for side in (-1,1):pg.draw.rect(s,color,(xx+side*half-post/2,yy-height,post,height))
                pg.draw.rect(s,color,(xx-half-post/2,yy-height,2*half+post,max(2,half*.17)))
                banner=self.sprite(obj['index'],max(2,half*1.8))
                if banner:s.blit(banner,(int(xx-banner.get_width()/2),int(yy-height)))
            else:
                src=self.sprite(obj['index'],max(2,scale*obj['width']*w/2))
                if src:s.blit(src,(int(xx+half*obj['x']-src.get_width()/2),int(yy-src.get_height())))
        # Player car, foreground and speed lines.
        car_y=h*.98+math.sin(self.t*40)*p.speed/MAX_SPEED*.5-getattr(p,'jump',0)*h/200
        if getattr(p,'jump',0)>1:pg.draw.ellipse(s,(12,15,18),(w*.43,h*.97,w*.14,max(2,h*.015)))
        self.car(s,w*.5,car_y,FOCAL/(CAMERA_DISTANCE*FORWARD_SCALE)*CAR_WIDTH*w/2,COLORS[p.i],p.steer,self.controls(p.i)[2]>.2,p.z/12 if p.speed>2 else None)
        if p.hit>0:
            pg.draw.rect(s,(255,107,92),(2,2,w-4,h-4),max(2,int(p.hit*9)))
        if self.course==7:self.storm_rain(s)
        if show_hud:self.hud(s,p)
        if getattr(p,'checkpoint_flash',0)>0:
            # Local to the player who crossed; two short green/white flashes.
            age=CHECKPOINT_FLASH_DURATION-p.checkpoint_flash
            if int(age/.18)%2==0:
                flash=pg.Surface((w,h),pg.SRCALPHA);flash.fill((210,255,224,90));s.blit(flash,(0,0))
        label=self.start_label(p)
        if show_hud and label:
            self.text(s,label,w/2,h*.42,int(h*.13),bold=True,anchor='center')
        elif p.finished or p.dnf:
            self.text(s,'FINISH' if p.finished else 'TIME OUT',w/2,h*.40,int(h*.09),COLORS[p.i],True,'center')

    def hud(self,s,p):
        w,h=s.get_size(); k=min(w/960,h/537)
        overlay=pg.Surface((w,int(h*.13)),pg.SRCALPHA); overlay.fill((12,19,32,195)); s.blit(overlay,(0,0))
        pg.draw.rect(s,(205,214,225),(17*k,12*k,52*k,38*k),width=1,border_radius=3)
        pg.draw.rect(s,COLORS[p.i],(20*k,15*k,46*k,32*k),border_radius=3)
        self.text(s,f'P{p.i+1}',43*k,31*k,int(22*k),(245,245,245) if p.i in (1,3) else (12,16,23),True,'center')
        self.text(s,THEMES[self.course]['name'],82*k,17*k,int(20*k),bold=True)
        self.text(s,f'CHECKPOINT {p.checkpoint} / {len(self.original.gates)+1}',82*k,40*k,int(13*k),(159,180,195))
        if self.time_limit:
            self.text(s,f'{p.remaining:04.1f}',w-25*k,10*k,int(36*k),(255,109,99) if p.remaining<10 else (238,242,241),True,'topright')
            self.text(s,'TIME LEFT',w-25*k,48*k,int(12*k),(166,185,198),anchor='topright')
        else:
            self.text(s,'FREE DRIVE',w-25*k,15*k,int(22*k),bold=True,anchor='topright')
            self.text(s,'NO TIME LIMIT',w-25*k,44*k,int(12*k),(166,185,198),anchor='topright')
        bx=22*k; by=h-53*k; bw=210*k
        pg.draw.rect(s,(19,28,42),(bx,by,bw,8*k),border_radius=3)
        pg.draw.rect(s,COLORS[p.i],(bx,by,bw*clamp(p.z/LENGTH,0,1),8*k),border_radius=3)
        self.text(s,f'{max(0,p.z)/10000:.1f} / {LENGTH/10000:.1f} KM',bx,by+16*k,int(13*k))
        self.text(s,f'{int(getattr(p,"raw_speed",p.speed*65536/(50*SEG))*6/256*1.609344):03}',w-28*k,h-85*k,int(53*k),bold=True,anchor='topright')
        self.text(s,f"KM/H    G{getattr(p,'gear',1)}",w-30*k,h-29*k,int(13*k),(166,185,198),anchor='topright')
        if p.turbo_ticks:
            self.text(s,'TURBO!',w-28*k,h-110*k,int(23*k),(255,122,84),True,'topright')
        # Opponent progress markers.
        for d in self.drivers[:self.players]:
            pg.draw.circle(s,COLORS[d.i],(int(bx+bw*clamp(d.z/LENGTH,0,1)),int(by+4*k)),max(2,int(4*k)))

    def menu(self):
        s=self.canvas; s.fill((10,17,29))
        # Live art panel.
        preview=pg.Surface((1030,1080)); fake=Driver(0); fake.z=(self.t*500+16000)%LENGTH; fake.speed=700; fake.x=0
        self.view(preview,fake,False); s.blit(preview,(890,0))
        veil=pg.Surface((1030,1080),pg.SRCALPHA); veil.fill((6,15,29,75)); s.blit(veil,(890,0))
        pg.draw.rect(s,(10,17,29),(0,0,890,1080))
        self.text(s,'AMIGA HD v3.8 / FOUR PLAYERS',74,62,18,(98,133,155))
        self.text(s,'LOTUS 2',68,132,108,bold=True)
        self.text(s,'A M I G A   /   F O U R   P L A Y E R S',75,260,25,(62,224,213))
        self.text(s,'One road. Four rivals.',75,326,36,bold=True)
        self.text(s,'Local split screen  |  Analog control  |  1920 x 1080',75,382,22,(153,175,192))
        options=[('RACE', 'ENTER / A  -  Start engines'),('PLAYERS',f'{self.players}  /  local split screen'),('COURSE',THEMES[self.course]['name']),('DEAD ZONE',f'{self.dead:.0%}'),('SOUND','OFF' if self.muted else 'ON')]
        for i,(label,value) in enumerate(options):
            y=458+i*79; active=i==self.selection
            pg.draw.rect(s,(24,45,59) if active else (15,25,39),(68,y,747,68),border_radius=8)
            if active: pg.draw.rect(s,(62,224,213),(68,y,4,68),border_radius=2)
            self.text(s,label,91,y+21,21,(62,224,213) if active else (171,188,201),True)
            self.text(s,value,785,y+22,19,anchor='topright')
        self.text(s,f'CONTROLLERS  {len(self.pads)+len(self.joys)} / 4   |   Connect pads, then press a button',75,888,19,(153,175,192))
        for i in range(4):
            c=UI_COLORS[i]; x=75+i*182; name=f'PAD {i+1}' if i<len(self.pads)+len(self.joys) else ['ARROWS','W A S D','I J K L','NUM 8 4 5 6'][i]
            self.text(s,f'P{i+1}  {name}',x,934,17,c)
            self.text(s,['WHITE','BLACK','RED','BLUE'][i],x,959,15,c)
        self.text(s,'PAD: LEFT STICK / RT GAS / LT BRAKE',75,991,16,(153,175,192))
        self.text(s,'UP/DOWN  Select    LEFT/RIGHT  Change    F11  Fullscreen    ESC  Quit',75,1020,17,(114,141,163))
        self.text(s,'MAGNETIC FIELDS / 1991',1845,992,24,(255,255,255),True,'topright')

    def render(self):
        if self.state=='menu': self.menu()
        elif self.state=='results': self.results()
        else:
            self.canvas.fill((8,13,22))
            if self.players==1:
                layouts=[(0,0,W,H)]
            elif self.players==2:
                layouts=[(0,0,W//2-3,H),(W//2+3,0,W//2-3,H)]
            else:
                layouts=[(0,0,957,537),(963,0,957,537),(0,543,957,537),(963,543,957,537)]
            for p,rect in zip(self.drivers,layouts):self.view(self.canvas.subsurface(rect),self.render_driver(p))
            if self.paused:
                veil=pg.Surface((W,H),pg.SRCALPHA); veil.fill((7,13,24,205)); self.canvas.blit(veil,(0,0))
                self.text(self.canvas,'PAUSED',W/2,420,85,bold=True,anchor='center')
                self.text(self.canvas,'P / START  Resume     R  Restart     ESC  Menu',W/2,530,28,anchor='center')
                self.text(self.canvas,'Analog: left stick | RT accelerate | LT brake | A/B fallback',W/2,590,24,(62,224,213),anchor='center')
        size=self.screen.get_size(); ratio=min(size[0]/W,size[1]/H); out=(int(W*ratio),int(H*ratio)); self.screen.fill((0,0,0))
        img=self.canvas if out==(W,H) else pg.transform.smoothscale(self.canvas,out)
        self.screen.blit(img,((size[0]-out[0])//2,(size[1]-out[1])//2)); pg.display.flip()

    def results(self):
        s=self.canvas; s.fill((10,17,29)); self.text(s,'LOTUS 2 / HD',100,70,25,(62,224,213),True)
        self.text(s,'RACE COMPLETE',95,155,80,bold=True)
        self.text(s,THEMES[self.course]['name']+'  /  FINAL CLASSIFICATION',100,260,24,(153,175,192))
        order=sorted(self.drivers[:self.players],key=lambda p:(not p.finished,p.finish_time if p.finished else -p.z))
        for rank,p in enumerate(order):
            y=350+rank*130; pg.draw.rect(s,(20,33,48),(95,y,1730,105),border_radius=12)
            self.text(s,f'{rank+1:02}',125,y+25,45,UI_COLORS[p.i],True)
            self.text(s,f'PLAYER {p.i+1}',260,y+29,36,bold=True)
            self.text(s,f'{p.finish_time:06.2f} s' if p.finished else f'TIME OUT  /  {p.z/LENGTH:.0%}',1770,y+32,32,UI_COLORS[p.i],anchor='topright')
        if self.next_course is not None:
            remaining=max(0,math.ceil(4-self.results_timer))
            self.text(s,f'NEXT: {COURSES[self.next_course]}  /  {remaining}',100,910,32,(62,224,213),True)
        self.text(s,'ENTER / A  Next course     ESC / B  Menu' if self.next_course is not None else 'ENTER / A  Race again     ESC / B  Menu',100,985,26,(153,175,192))

    def adjust(self,direction):
        if self.selection==1:self.players=[1,2,4][([1,2,4].index(self.players)+direction)%3]
        elif self.selection==2:self.course=(self.course+direction)%8; self.build_track(); self.sky_cache={}
        elif self.selection==3:self.dead=round(clamp(self.dead+direction*.02,.02,.4),2)
        elif self.selection==4:
            self.muted=not self.muted
            self.apply_audio_volume()

    def action(self,key):
        if key==pg.K_F11:
            self.fullscreen=not self.fullscreen; self.screen=pg.display.set_mode((W,H),pg.FULLSCREEN if self.fullscreen else pg.RESIZABLE); return
        if key==pg.K_m:
            self.muted=not self.muted
            self.apply_audio_volume()
        if key==pg.K_F2 and self.state=='race':
            if pg.mixer.get_init():
                self.music_on=not self.music_on
                if self.music_on:self.play_music(MENU_MUSIC)
                else:pg.mixer.music.stop()
        if self.state=='menu':
            if key==pg.K_ESCAPE:self.running=False
            elif key in (pg.K_UP,pg.K_DOWN):self.selection=(self.selection+(1 if key==pg.K_DOWN else -1))%5
            elif key in (pg.K_LEFT,pg.K_RIGHT):self.adjust(1 if key==pg.K_RIGHT else -1)
            elif key==pg.K_RETURN:
                if self.selection==0:self.start()
                else:self.adjust(1)
        elif self.state=='race':
            if key in (pg.K_p,pg.K_RETURN):
                self.paused=not self.paused
                self.apply_audio_volume()
            elif key==pg.K_r:self.start()
            elif key==pg.K_ESCAPE:self.state='menu'; self.stop_driving_audio(); self.play_music(MENU_MUSIC)
        else:
            if key==pg.K_RETURN:
                if self.next_course is not None:self.course=self.next_course
                self.start()
            elif key==pg.K_ESCAPE:self.state='menu'; self.channel and self.channel.stop(); self.play_music(MENU_MUSIC)

    def run(self,frames=0,screenshot=None):
        count=0
        while self.running:
            dt=min(self.clock.tick(60)/1000.,.25)
            for e in pg.event.get():
                if e.type==pg.QUIT:self.running=False
                elif e.type==pg.KEYDOWN:self.action(e.key)
                elif e.type in (pg.JOYDEVICEADDED,pg.JOYDEVICEREMOVED):self.scan_pads()
                elif e.type==getattr(pg,'WINDOWFOCUSLOST',-1) and self.state=='race': self.paused=True
                elif e.type==pg.CONTROLLERBUTTONDOWN:
                    mapping={pg.CONTROLLER_BUTTON_DPAD_UP:pg.K_UP,pg.CONTROLLER_BUTTON_DPAD_DOWN:pg.K_DOWN,pg.CONTROLLER_BUTTON_DPAD_LEFT:pg.K_LEFT,pg.CONTROLLER_BUTTON_DPAD_RIGHT:pg.K_RIGHT,pg.CONTROLLER_BUTTON_A:pg.K_RETURN,pg.CONTROLLER_BUTTON_B:pg.K_ESCAPE,pg.CONTROLLER_BUTTON_START:pg.K_RETURN}
                    if self.state!='race' or e.button==pg.CONTROLLER_BUTTON_START:
                        if e.button in mapping:self.action(mapping[e.button])
            self.update(dt); self.render(); count+=1
            if frames and count>=frames:break
        if screenshot:pg.image.save(self.canvas,screenshot)
        if not self.headless:
            try:
                self.settings_path.parent.mkdir(parents=True,exist_ok=True); self.settings_path.write_text(json.dumps({'deadzone':self.dead,'muted':self.muted}))
            except OSError:pass
        pg.quit()

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('--headless',action='store_true'); ap.add_argument('--frames',type=int,default=0); ap.add_argument('--screenshot'); ap.add_argument('--race',action='store_true'); args=ap.parse_args()
    if args.headless:os.environ['SDL_VIDEODRIVER']='dummy'; os.environ['SDL_AUDIODRIVER']='dummy'
    game=Game(args.headless)
    if args.race:
        game.start(); game.countdown=0
        for p in game.drivers:p.z=16000+p.i*250; p.speed=700; game.original.reset_for_test(p.i,z=p.z,speed=5000)
    game.run(args.frames,args.screenshot)

if __name__=='__main__':main()
