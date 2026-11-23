"""Start words, moving tires, passing scale, HD backdrops, smooth bend entry."""
import os,json
from pathlib import Path
os.environ['SDL_VIDEODRIVER']='dummy';os.environ['SDL_AUDIODRIVER']='dummy'
from game import *

def main():
    checks=[]
    def check(name,value):
        assert value,name
        checks.append(name)
    g=Game(True);g.players=1;g.start();p=g.drivers[0]
    labels=[]
    for remaining,elapsed in [(3,0),(1.5,0),(0,.1),(0,1)]:
        g.countdown=remaining;p.elapsed=elapsed;labels.append(g.start_label(p))
    check('visual countdown is MARKS, SET, GO and then clears',labels==['MARKS','SET','GO!',None])
    tire_frames=[pg.surfarray.array3d(g.sprite(126,192,4,COLORS[0],phase)) for phase in range(4)]
    check('four moving tire phases produce four different images',len({a.tobytes() for a in tire_frames})==4)
    check('wheel animation leaves the upper car body unchanged',all(np.array_equal(a[:,:90],tire_frames[0][:,:90]) for a in tire_frames[1:]))
    black_frames=[pg.surfarray.array3d(g.sprite(126,192,4,COLORS[1],phase)) for phase in range(4)]
    check('black livery also animates tires without repainting the body',not np.array_equal(black_frames[0],black_frames[1]) and all(np.array_equal(a[:,:90],black_frames[0][:,:90]) for a in black_frames[1:]))
    draw=g.car;calls=[];g.car=lambda *args,**kw:calls.append((args,kw))
    g.countdown=0;p.elapsed=2;p.z=20*SEG;p.x=0;p.steer=0;p.jump=0;p.previous=None
    g.scenery_bins=[[] for _ in range(N)];g.track_gates=[];pane=pg.Surface((957,537))
    for relative in (PASSING_DISTANCE,0,-10):
        p.speed=500;g.traffic=[dict(z=p.z+relative,x=.65,color=(40,180,55),speed=500)]
        calls.clear();g.view(pane,p,False)
        check(f'passing rival at relative depth {relative} has player width',len(calls)==2 and abs(calls[0][0][3]-calls[1][0][3])<.01)
    g.traffic=[];p.speed=0;calls.clear();g.view(pane,p,False)
    check('stopped player uses static tires',calls[-1][0][-1] is None)
    p.speed=500;calls.clear();g.view(pane,p,False)
    check('moving player selects tire phase from distance',calls[-1][0][-1]==p.z/12)
    g.car=draw
    bg_sizes=[]
    for course in range(8):
        img=pg.image.load(str(ASSETS/f'hd-background-{course}.png'));bg_sizes.append(img.get_size())
        g.course=course;g.sky_cache={};bg=g.background(1920,1080)
        check(f'course {course+1} has new detailed art and Full HD output',img.get_width()>=1600 and img.get_height()>=900 and bg.get_size()==(1920,1080))
    # Compare entry jerk using exactly the same recovered dynamics and isolated
    # straight-to-bend test. Only the adapter's corner entry ramp differs.
    entries=[]
    for smooth in (False,True):
        c=OriginalCore(0,time_limit=False,smooth_corner_entry=smooth)
        for i in range(10):c.long(c.g-0x3e46+i*12,60*65536)
        for i in range(25,50):c.u.mem_write(c.g-0x1e78+i*16+2,b'\0'*8)
        c.reset_for_test(0,z=(32-.06)*SEG,x=0,speed=4500)
        deltas=[];previous=c.state(0)['x']
        for _ in range(25):
            s=c.step(0,0,1,0);deltas.append(s['x']-previous);previous=s['x']
        jerk=max(abs(b-a) for a,b in zip(deltas,deltas[1:]));entries.append(dict(smoothing=smooth,max_tick_jerk=jerk,lateral_steps=deltas))
    check('bend-entry lateral jerk is reduced by more than half',entries[1]['max_tick_jerk']<entries[0]['max_tick_jerk']*.5)
    g.course=0;g.start();p=g.drivers[0]
    p.previous=(p.z,0,0,0,0);p.x=.1
    samples=[]
    for a in (0,.25,.5,.75,.999):
        g.sim_accum=a*.02;samples.append(g.render_driver(p).x)
    check('render interpolation fills the gaps between 50Hz physics ticks',all(abs(x-.1*a)<1e-8 for x,a in zip(samples,(0,.25,.5,.75,.999))))
    check('interpolation never changes the native physical position',p.x==.1)
    g.players=4;g.start();g.render();pg.image.save(g.canvas,str(Path(__file__).parent/'start-marks-v34.png'))
    result=dict(version='v3.4',passed=len(checks),checks=checks,background_source_sizes=bg_sizes,framebuffer=[W,H],corner_entry=entries,
        limitations=['Art sources from image_gen are 1672x941, composed and smoothly resampled into the 1920x1080 game view.','Corner entry is intentionally ramped by the adapter; this differs from unmodified Amiga dynamics.'])
    (Path(__file__).parent/'v34-verification.json').write_text(json.dumps(result,indent=2));print(json.dumps({k:v for k,v in result.items() if k!='corner_entry'},indent=2));print('entry jerk:',[r['max_tick_jerk'] for r in entries]);pg.quit()

if __name__=='__main__':main()
