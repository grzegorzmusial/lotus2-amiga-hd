import os,time,json,struct,hashlib
os.environ['SDL_VIDEODRIVER']='dummy';os.environ['SDL_AUDIODRIVER']='dummy'
from pathlib import Path
import pygame as pg
from amiga_core import OriginalCore,ASSETS,COURSES
from game import Game,LENGTH,SEG

def main():
    checks=[]
    def check(name,ok):
        assert ok,name
        checks.append(name)
    core=OriginalCore(0)
    check('original forest checkpoint positions and bonuses',core.gates==[(212,35),(378,50),(608,48),(804,50)])
    resident=(ASSETS/'resident.bin').read_bytes()
    check('executed car routine is original m68k bytes',bytes(core.u.mem_read(0x7871c,0x2e8))==resident[0x7871c:0x78a04])
    for _ in range(500):full=core.step(0,0,1,0)
    check('original automatic gearbox accelerates through five gears',full['gear']==5 and full['raw_speed']>4500)
    core2=OriginalCore(0)
    for _ in range(500):half=core2.step(0,0,.5,0)
    check('partial analog throttle changes original engine response',half['raw_speed']<full['raw_speed'])
    core.reset_for_test(1,speed=4500);core.word(core.cars[1]+0x28,4);coast=core.step(1,0,0,0)
    core.reset_for_test(2,speed=4500);core.word(core.cars[2]+0x28,4);brake=core.step(2,0,0,1)
    check('original brake reduces speed more than coasting',brake['raw_speed']<coast['raw_speed'])
    straight=OriginalCore(0);turn=OriginalCore(0)
    for _ in range(50):s0=straight.step(0,0,1,0);st=turn.step(0,.5,1,0)
    check('analog pulse steering drives original inertia',st['x']>s0['x']+.01 and 0<st['lean']<=32)
    core=OriginalCore(0);core.reset_for_test(0,z=212*SEG,speed=2000);core.word(core.cars[0]+0x20,40)
    before=core.state(0)['timer'];gate=core.step(0,0,0,0)
    check('original checkpoint routine awards 35 seconds',34.9<gate['timer']-before<35.1)
    once=core.step(0,0,0,0)
    check('checkpoint bonus is not repeatedly awarded',once['timer']<gate['timer'])
    start=time.perf_counter()
    for _ in range(50):core.step(0,0,1,0)
    check('original 50 Hz timer advances by one second',abs(core.state(0)['timer']-(once['timer']-1))<.03)
    core.reset_for_test(0,x=1.5,speed=5000);off=core.step(0,0,1,0)
    check('original boundary and surface routines stay bounded',abs(off['x'])<1.6)
    manifest=json.loads((Path(__file__).parent/'analysis/music-sources.json').read_text())
    for song in manifest:
        b=(ASSETS/f"{song['name']}.mod").read_bytes();pat=1084+(max(b[952:1080])+1)*1024
        lengths=[int.from_bytes(b[42+n*30:44+n*30],'big')*2 for n in range(31)]
        check(f"MOD {song['name']} has exact pattern/sample lengths",len(b)==pat+sum(lengths))
        cursor=pat
        for sample in song['sample_sources']:
            raw=(ASSETS/f"{sample['asset']:03}.bin").read_bytes()
            assert b[cursor:cursor+len(raw)]==raw
            cursor+=len(raw)
    game=Game(True);game.muted=True
    for course in range(8):
        game.course=course;game.start();game.countdown=0;game.traffic=[];game.scenery=[]
        for p in game.drivers:
            game.original.reset_for_test(p.i,z=16000+p.i*300,speed=5000)
        for _ in range(10):game.update(.02,[(0,1,0)]*4)
        check(f'{COURSES[course]} runs recovered routines for four cars',all(p.speed>0 for p in game.drivers))
        for count in (1,2,4):game.players=count;game.render()
        game.players=4;game.render()
        pg.image.save(game.canvas,str(Path(__file__).parent/f'course-{course+1}.png'))
    check('all 24 course/layout combinations render Full HD',game.canvas.get_size()==(1920,1080))
    game.state='race';game.original.reset_for_test(0,z=LENGTH-1,speed=5000)
    game.players=1;game.drivers[0].finished=False;game.drivers[0].dnf=False
    for _ in range(3):game.update(.02,[(0,1,0)])
    check('finish transitions to results',game.state=='results' and game.drivers[0].finished)
    game.start();game.countdown=0;game.original.word(game.original.cars[0]+0x20,0);game.original.word(game.original.cars[0]+0x22,0)
    game.update(.02,[(0,0,0)])
    check('zero remaining time does not end free drive',game.state=='race' and not game.drivers[0].dnf)
    game.action(pg.K_ESCAPE);check('escape returns to menu',game.state=='menu')
    game.course=0;game.players=4;game.build_track();game.render();pg.image.save(game.canvas,str(Path(__file__).parent/'menu.png'))
    pg.mixer.music.load(str(ASSETS/'title.mod'));pg.mixer.music.play();check('original title MOD starts through bundled mixer',pg.mixer.music.get_busy())
    result=dict(passed=len(checks),checks=checks,seconds=round(time.perf_counter()-start,3),physical_controllers=len(game.pads)+len(game.joys),limitations=['No physical gamepad attached.','The HD renderer, analog adapter and four-player contact scheduling are host code; car dynamics, rival AI and impact responses execute original routines.','No complete-frame equivalence against a running Amiga was established.'])
    (Path(__file__).parent/'verification.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2));pg.quit()

if __name__=='__main__':main()
