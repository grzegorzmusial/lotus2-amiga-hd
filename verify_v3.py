"""Perspective/contact regressions found by comparing real Amiga frames."""
import os,json,math
from pathlib import Path
os.environ['SDL_VIDEODRIVER']='dummy';os.environ['SDL_AUDIODRIVER']='dummy'
from game import *

def main():
    checks=[]
    def check(name,value):
        assert value,name
        checks.append(name)
    g=Game(True);g.players=1;g.start();g.countdown=0;p=g.drivers[0]
    g.scenery_bins=[[] for _ in range(N)]
    p.z=20*SEG;p.x=0;p.steer=0;p.speed=600;p.jump=0
    g.traffic=[dict(z=p.z,x=.6,color=(220,40,30))]
    calls=[];draw=g.car
    g.car=lambda surface,x,y,size,color,*args,**kwargs:calls.append(dict(x=x,y=y,width=size))
    g.view(pg.Surface((957,537)),p,False)
    check('adjacent car and player at equal depth have equal projected width',len(calls)==2 and abs(calls[0]['width']-calls[1]['width'])<.01)
    check('adjacent car stands on the same ground plane as the player',abs(calls[0]['y']-537*.98)<.01)
    widths=[];ys=[]
    for distance in (2*SEG,SEG,.5*SEG,.125*SEG,0):
        calls.clear();g.traffic[0]['z']=p.z+distance;g.view(pg.Surface((957,537)),p,False)
        widths.append(calls[0]['width']);ys.append(calls[0]['y'])
    check('approaching car grows continuously and holds player size while passing',all(a<=b for a,b in zip(widths,widths[1:])) and widths[-1]==widths[-2])
    check('approaching car moves down toward the contact plane',all(a<b for a,b in zip(ys,ys[1:])))
    # Closest AI in actual original frame 400: z=19.488 vs player=17.97977.
    # Its observed sprite is about 12 pixels wide on a 320px native game image.
    expected=g.car_scale((19.488-17.979766845703125)*SEG)*CAR_WIDTH*320/2
    check('frame-400 rival scale matches the observed original within 2 native pixels',abs(expected-12)<2)
    g.car=draw
    silhouettes=[]
    for lean in (-1,0,1):
        surface=pg.Surface((500,250),pg.SRCALPHA)
        g.car(surface,250,230,180,COLORS[0],lean)
        silhouettes.append(surface.get_bounding_rect().height)
    check('steering poses preserve car height instead of shrinking the body',max(silhouettes)-min(silhouettes)<=2)
    for steer in (-1,1):
        c=OriginalCore(0)
        for i in range(10):c.long(c.g-0x3e46+i*12,60*65536)
        c.reset_for_test(0,z=20*SEG,x=0,speed=4000)
        for _ in range(25):state=c.step(0,steer,1,0)
        check(f'original steering moves car in requested direction {steer}',state['x']*steer>.05)
    values=[]
    for brake in (0,.01):
        c=OriginalCore(0)
        for i in range(10):c.long(c.g-0x3e46+i*12,60*65536)
        c.reset_for_test(0,z=20*SEG,speed=4000)
        for _ in range(10):state=c.step(0,0,0,brake)
        values.append(state['raw_speed'])
    check('sub-deadzone trigger noise never adds acceleration',values[0]==values[1])
    c=OriginalCore(0)
    initial=[c.state(i) for i in range(4)]
    check('four human cars start on distinct nonoverlapping lanes',all(abs(a['x']-b['x'])>=.25 for i,a in enumerate(initial) for b in initial[i+1:]))
    check('all human cars start behind the AI grid',all(a['z']<=min(t['z'] for t in c.traffic()) for a in initial))
    # A collision may fire again after leaving contact, rather than becoming
    # permanently disabled or penalizing every frame of the same overlap.
    for i in range(10):c.long(c.g-0x3e46+i*12,60*65536)
    def impact():
        c.reset_for_test(0,z=20*SEG,x=0,speed=5000)
        c.long(c.g-0x3e46,20*65536);c.word(c.g-0x3e46+4,0);c.word(c.g-0x3e46+6,3000)
        return c.step(0,0,1,0)
    first=impact()
    c.long(c.g-0x3e46,60*65536);c.step(0,0,1,0)
    second=impact()
    check('native rival collision re-arms after separating',98 in first['effects'] and 98 in second['effects'] and second['raw_speed']<5000)
    # Full timed drive includes the first bend and a second steering input.
    g.players=4;g.course=0;g.start();g.countdown=0
    for t in range(1000):
        steer=-.35 if 620<=t<655 else (.35 if 880<=t<910 else 0)
        g.update(.02,[(steer,1,.3 if 820<=t<840 else 0)]*4)
        if t in (499,699,999):g.render()
    check('four-player twenty-second drive preserves real simulation time',all(abs(p.elapsed-20)<.025 for p in g.drivers))
    check('four-player drive keeps native car states finite and bounded',all(math.isfinite(p.x) and abs(p.x)<4 and p.z>4*SEG for p in g.drivers))
    g.render();pg.image.save(g.canvas,str(Path(__file__).parent/'v3-four-players.png'))
    result=dict(passed=len(checks),checks=checks,frame400_rival_width_native_pixels=round(expected,2),same_depth_width_ratio=1.,physics='Recovered Amiga routines; proportional analog adapter and local four-player scheduling',limitations=['No physical pad attached.','Remaining full-game and renderer differences are documented in README.md.'])
    (Path(__file__).parent/'v3-verification.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2));pg.quit()

if __name__=='__main__':main()
