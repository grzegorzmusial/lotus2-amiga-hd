"""User regressions: bootup theme, authentic countdown, corner squeal, flashes."""
import os,json
from pathlib import Path
os.environ['SDL_VIDEODRIVER']='dummy';os.environ['SDL_AUDIODRIVER']='dummy'
from game import *

def main():
    checks=[]
    def check(name,value):
        assert value,name
        checks.append(name)
    g=Game(True)
    check('menu starts asset 36 bootup rather than asset 38 new',g.current_music==MENU_MUSIC=='intro' and (ASSETS/'intro.mod').read_bytes()[:20].rstrip(b'\0')==b'bootup')
    resident=(ASSETS/'resident.bin').read_bytes()
    original_ids=[]
    for address in (0x73472,0x7347c,0x73486):
        assert resident[address]==0x70
        original_ids.append(resident[address+1])
    check('voice mapping agrees with the three original start instructions',[i for _,i in START_VOICES]==original_ids==[88,89,90])
    spoken=[]
    sounds={g.original_sound(i).get_raw():name for name,i in START_VOICES}
    g.announce=lambda sound:spoken.append(sounds.get(sound.get_raw(),'checkpoint'))
    g.start();check('Marks plays immediately when race countdown starts',spoken==['marks'])
    g.update(1.49,[(0,1,0)]*4);check('Set waits until original 75-tick midpoint',spoken==['marks'])
    g.update(.02,[(0,1,0)]*4);check('Set is the second spoken word',spoken==['marks','set'])
    g.update(1.49,[(0,1,0)]*4);check('Go plays at the end of the countdown',spoken==['marks','set','go'] and g.countdown==0)
    g.action(pg.K_ESCAPE);check('return to menu restores bootup',g.state=='menu' and g.current_music=='intro')
    g.players=1;g.start();g.countdown=0;p=g.drivers[0];p.speed=500;p.skid_volume=1;p.jump=0
    for title,z,steer,jump,expected in [
        ('straight acceleration',20*SEG,.5,0,False),
        ('bend without steering',33*SEG,0,0,False),
        ('grounded turn',33*SEG,.5,0,True),
        ('airborne turn',33*SEG,.5,20,False),
        ('straight after bend',44*SEG,.5,0,False)]:
        p.z=z;p.steer=steer;p.jump=jump;g.update_engine_audio()
        check('tire squeal correct for '+title,g.skid_channel.get_busy()==expected)
    # Only P1 crosses a real native checkpoint; the other viewports stay clear.
    g.players=4;g.start();g.countdown=0;spoken.clear()
    for i in range(10):g.original.long(g.original.g-0x3e46+i*12,60*65536)
    g.original.reset_for_test(0,z=212*SEG,x=-.25,speed=2000)
    g.original.word(g.original.cars[0]+0x20,40)
    g.update(.02,[(0,1,0)]*4)
    check('real checkpoint starts the screen flash',g.drivers[0].checkpoint_flash>0)
    check('other players do not flash for P1 checkpoint',all(d.checkpoint_flash==0 for d in g.drivers[1:]))
    pane=pg.Surface((957,537));g.players=1;p=g.drivers[0]
    p.checkpoint_flash=CHECKPOINT_FLASH_DURATION;g.view(pane,p,False);on=pane.get_at((10,150))
    pg.image.save(pane,str(Path(__file__).parent/'checkpoint-flash-v33.png'))
    p.checkpoint_flash=CHECKPOINT_FLASH_DURATION-.181;g.view(pane,p,False);off=pane.get_at((10,150))
    check('checkpoint visibly alternates a light overlay and normal view',on!=off)
    g.update(.8,[(0,1,0)]);check('checkpoint flash stops on its own',p.checkpoint_flash==0)
    g.start();g.countdown=0;check('game starts with the time limit disabled',not g.time_limit and not g.original.time_limit)
    original_time=g.drivers[0].remaining
    for _ in range(6000):g.update(.02,[(0,0,0)])
    check('two minutes of driving do not consume race time',g.state=='race' and g.drivers[0].remaining==original_time)
    g.original.word(g.original.cars[0]+0x20,0);g.original.word(g.original.cars[0]+0x22,0)
    for _ in range(100):g.update(.02,[(0,1,0)])
    check('zero native clock never ends the race',g.state=='race' and not g.drivers[0].dnf)
    result=dict(version='v3.3',passed=len(checks),checks=checks,music_asset=36,music_module='bootup',original_countdown_ids=original_ids,countdown_seconds=[0,1.5,3],flash_seconds=CHECKPOINT_FLASH_DURATION)
    (Path(__file__).parent/'feedback-verification.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2));pg.quit()

if __name__=='__main__':main()
