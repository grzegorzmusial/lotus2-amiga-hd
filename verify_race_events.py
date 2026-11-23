"""Regressions for engine pitch, collision sounds, checkpoints and logs."""
import os,json,wave
from pathlib import Path
os.environ['SDL_VIDEODRIVER']='dummy';os.environ['SDL_AUDIODRIVER']='dummy'
from game import *

def main():
    checks=[]
    def check(name,value):
        assert value,name
        checks.append(name)
    g=Game(True);g.players=1;g.start();g.countdown=0
    a=g.engine_chunk(0,1000);b=g.engine_chunk(0,1000)
    check('engine PCM preserves its phase between consecutive chunks',a.get_raw()!=b.get_raw())
    check('engine chunks have correct stereo duration',abs(a.get_length()-.04)<.0001)
    # Measured original code uses period 1035 at 1000 RPM, 207 at 5000 RPM.
    phases=[]
    for rpm in (1000,5000):
        g.engine_phases[0]=0;g.engine_chunk(0,rpm);phases.append(g.engine_phases[0])
    check('engine sample advances five times faster at 5000 than at 1000 RPM',abs(phases[1]/phases[0]-5)<.001)
    codes=[];g.play_effect=lambda code:codes.append(code)
    def isolate():
        for i in range(10):g.original.long(g.original.g-0x3e46+i*12,60*65536)
    isolate();g.original.reset_for_test(0,z=(20-.0625)*SEG,x=0,speed=5000)
    g.original.long(g.original.g-0x3e46,20*65536);g.original.word(g.original.g-0x3e46+4,0);g.original.word(g.original.g-0x3e46+6,3000)
    g.update(.02,[(0,1,0)])
    check('rear-end collision selects original sample 98',98 in codes)
    g.start();g.countdown=0;codes.clear();isolate()
    g.original.reset_for_test(0,z=(20-.0625)*SEG,x=0,speed=5000)
    g.original.u.mem_write(g.original.g-0x1e78+20*16+2,bytes([130,0]))
    g.update(.02,[(0,1,0)])
    check('tree collision selects its distinct original sample 105',105 in codes)
    g.start();g.countdown=0;isolate();spoken=[];g.announce=lambda sound:spoken.append(sound)
    # A real original time-bonus pickup used to be mistaken for a checkpoint.
    g.original.reset_for_test(0,z=(20-.0625)*SEG,x=0,speed=3000)
    g.original.word(g.original.cars[0]+0x20,30);g.drivers[0].remaining=30
    g.original.u.mem_write(g.original.g-0x1e78+20*16+2,bytes([119,0]))
    g.update(.02,[(0,1,0)])
    check('original time pickup really increases remaining time',g.drivers[0].remaining>32)
    check('time pickup never says checkpoint',not spoken)
    g.start();g.countdown=0;isolate();spoken.clear()
    g.original.reset_for_test(0,z=212*SEG,x=-.25,speed=2000);g.original.word(g.original.cars[0]+0x20,40);g.drivers[0].remaining=40
    g.update(.02,[(0,1,0)])
    check('real native checkpoint says checkpoint once',len(spoken)==1 and 212 in g.drivers[0].passed_gates)
    for _ in range(5):g.update(.02,[(0,1,0)])
    check('remaining under checkpoint does not repeat the voice',len(spoken)==1)
    check('all original checkpoints have visible gates at their real positions',all(any(abs(gate['z']-i*SEG)<.01 and gate['index']==122 for gate in g.track_gates) for i,_ in g.original.gates))
    g.original.reset_for_test(0,z=210.7*SEG,x=-.25,speed=3000);g.drivers[0].z=210.7*SEG;g.render()
    pg.image.save(g.canvas,str(Path(__file__).parent/'checkpoint-v32.png'))
    g.start();g.countdown=0;isolate();p=g.drivers[0]
    g.original.reset_for_test(0,z=(428-.1)*SEG,x=.5,speed=4000)
    g.update(.02,[(0,1,0)]);check('original Forest log starts a native jump',g.original.state(0)['airborne'] and p.jump>0)
    apex=0;airborne=[]
    for _ in range(100):
        g.update(.02,[(0,1,0)]);apex=max(apex,p.jump);airborne.append(g.original.state(0)['airborne'])
        if p.jump>70 and not (Path(__file__).parent/'log-jump-v32.png').exists():
            g.render();pg.image.save(g.canvas,str(Path(__file__).parent/'log-jump-v32.png'))
    check('log jump has an apex and returns to the ground',apex>50 and not airborne[-1])
    calls=[];g.car=lambda s,x,y,size,*args,**kwargs:calls.append(y)
    p.z=440*SEG;p.x=0;p.steer=0;g.traffic=[];g.scenery_bins=[[] for _ in range(N)];g.track_gates=[]
    heights=[]
    for jump in (0,60):
        p.jump=jump;calls.clear();g.view(pg.Surface((957,537)),p,False);heights.append(calls[-1])
    check('positive native jump moves car UP on screen',heights[1]<heights[0]-100)
    # Listen to native sample 96 with continuous phase and a simulated upshift.
    g.drivers[0].engine_sample=96;g.engine_phases[0]=0
    with wave.open(str(Path(__file__).parent/'engine-v32.wav'),'wb') as w:
        w.setnchannels(2);w.setsampwidth(2);w.setframerate(pg.mixer.get_init()[0])
        for rpm in list(np.linspace(1000,7000,75))+list(np.linspace(4000,6500,50)):
            w.writeframes(g.engine_chunk(0,rpm).get_raw())
    result=dict(version='v3.2',passed=len(checks),checks=checks,engine_period_formula='max(124, 0xFCC3A // native_RPM)',jump_apex=apex,
                source_assets=dict(engine=[96,97],rear_collision=98,tree_collision=105,skid=108),limitations=['Host mixes the original samples; the complete Paula chip and its analog filter are not emulated.'])
    (Path(__file__).parent/'race-events-verification.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2));pg.quit()

if __name__=='__main__':main()
