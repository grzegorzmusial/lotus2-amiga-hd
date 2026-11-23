"""Playability regressions: real-time pacing, analog range and native contacts."""
import os,time,json,struct
from pathlib import Path
os.environ['SDL_VIDEODRIVER']='dummy';os.environ['SDL_AUDIODRIVER']='dummy'
import pygame as pg
import numpy as np
from amiga_core import OriginalCore,ASSETS
from game import Game,COLORS,SEG,N

def main():
    checks=[]
    def check(name,condition):
        assert condition,name
        checks.append(name)
    def keep_traffic_away(c):
        for i in range(10):c.long(c.g-0x3e46+i*12,60*65536)
    steering=[]
    for value in (0,.25,.5,.75,1):
        c=OriginalCore(0);keep_traffic_away(c)
        for _ in range(40):state=c.step(0,value,1,0)
        steering.append(state['lean'])
    check('quarter/half/three-quarter stick retain distinct steering',steering==[0,8,16,24,32])
    c=OriginalCore(0);keep_traffic_away(c)
    for _ in range(40):c.step(0,1,1,0)
    for _ in range(33):s=c.step(0,0,1,0)
    check('released stick returns steering to center',s['lean']==0)
    for label,entry in [('tree',0x77fd4),('rival',0x78442)]:
        states=[]
        for contact in (True,False):
            c=OriginalCore(0);keep_traffic_away(c);car=c.cars[0]
            c.reset_for_test(0,z=(20-.0625)*SEG,x=0 if contact else 1,speed=5000)
            if label=='tree':c.u.mem_write(c.g-0x1e78+20*16+2,bytes([130,0]))
            else:
                c.long(c.g-0x3e46,20*65536);c.word(c.g-0x3e46+4,0);c.word(c.g-0x3e46+6,3000)
            c.call(entry,car);states.append((c.rw(car+14),c.rw(car+28,True),list(c.events)))
        check(f'original {label} collision reduces speed and pushes car',states[0][0]<5000 and states[0][1]!=0 and bool(states[0][2]))
        check(f'{label} near miss has no collision',states[1]==(5000,0,[]))
    c=OriginalCore(0);keep_traffic_away(c)
    c.reset_for_test(0,z=20*SEG,x=0,speed=5000);c.reset_for_test(1,z=(20+.05)*SEG,x=0,speed=3000)
    c.collide_players(0,1)
    check('local human contact uses native linked-player impact',c.rw(c.cars[0]+14)<5000 and c.state(0)['z']<20*SEG)
    c=OriginalCore(0);before=c.traffic()
    for _ in range(100):c.tick_traffic()
    after=c.traffic()
    check('ten original AI cars accelerate and advance',len(after)==10 and all(b['z']>a['z'] and b['speed']>0 for a,b in zip(before,after)))
    g=Game(True)
    class TestPad:
        def get_axis(self,axis):
            return {pg.CONTROLLER_AXIS_LEFTX:16384,pg.CONTROLLER_AXIS_TRIGGERRIGHT:8192,pg.CONTROLLER_AXIS_TRIGGERLEFT:24576}.get(axis,0)
        def get_button(self,button):return False
    attached=g.pads;g.pads=[TestPad()]
    turn,gas,brake=g.controls(0)
    check('SDL pad left stick maps to proportional steering',.42<turn<.44)
    check('SDL right and left triggers preserve independent analog levels',.24<gas<.26 and .74<brake<.76)
    g.pads=attached;g.start();g.countdown=0;g.players=1
    inputs=[(0,1,0)]
    for _ in range(10):g.update(.1,inputs)
    check('simulation catches up ten 100ms frames without slowing time',abs(g.drivers[0].elapsed-1)<.021)
    g.state='race';g.players=4
    frames=[]
    for course in range(8):
        g.course=course;g.start();g.countdown=0;g.players=4
        # Exercise every course beyond the first bend, not only a startup frame.
        for tick in range(400):
            g.update(.02,[(.25 if 100<tick<120 else 0,1,0)]*4)
        check(f'course {course+1} runs eight seconds with native collisions/AI',all(p.elapsed>7.9 for p in g.drivers))
        g.render()
        if course in (0,3,7):pg.image.save(g.canvas,str(Path(__file__).parent/f'v2-course-{course+1}.png'))
    g.course=0;g.start();g.countdown=0
    # Warm caches before measuring frame pacing; no artificial frame limiter.
    for _ in range(10):g.update(1/60,[(0,1,0)]*4);g.render()
    for _ in range(180):
        start=time.perf_counter();g.update(1/60,[(0,1,0)]*4);g.render();frames.append(time.perf_counter()-start)
    ms=np.array(frames)*1000;fps=1000/ms.mean()
    check('four-player Full HD mean frame time stays below 16.7ms',ms.mean()<16.7)
    check('four-player Full HD 95th percentile stays below 25ms',np.percentile(ms,95)<25)
    images=[g.sprite(126,210,4,color) for color in COLORS]
    dominant=[]
    for img in images:
        pix=pg.surfarray.array3d(img);dominant.append(tuple(pix.reshape(-1,3).sum(axis=0)))
    check('four body-color sprites are distinct',len(set(dominant))==4)
    check('red and blue body variants preserve requested hue',dominant[2][0]>dominant[2][2] and dominant[3][2]>dominant[3][0])
    g.state='menu';g.render();pg.image.save(g.canvas,str(Path(__file__).parent/'menu-v2.png'))
    result=dict(passed=len(checks),checks=checks,analog_lean_at_0_25_50_75_100_percent=steering,
                performance=dict(mean_ms=round(ms.mean(),2),p95_ms=round(float(np.percentile(ms,95)),2),unlimited_fps=round(fps,1),players=4,resolution=[1920,1080],frames=180,mode='offscreen software rendering'),
                physical_pads=len(g.pads)+len(g.joys),limitations=['No physical pad was connected.','Native routines and telemetry were compared to PUAE; the HD renderer has not been proven pixel-equivalent.'])
    (Path(__file__).parent/'playability-verification.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2));pg.quit()

if __name__=='__main__':main()
