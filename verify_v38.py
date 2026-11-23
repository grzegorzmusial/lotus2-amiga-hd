"""Visible wheel rotation and original Storm sound/visual regressions."""
import json
import os
from pathlib import Path

os.environ['SDL_VIDEODRIVER']='dummy'
os.environ['SDL_AUDIODRIVER']='dummy'
from game import *


def main():
    checks=[]

    def check(name,value):
        assert value,name
        checks.append(name)

    game=Game(True)
    differences=[]
    for frame in range(9):
        poses=[pg.surfarray.array3d(game.sprite(126,192,frame,COLORS[0],phase)) for phase in range(8)]
        changed=[int(np.count_nonzero(np.any(pose!=poses[0],axis=2))) for pose in poses[1:]]
        differences.append(min(changed))
        check(f'rolling tires remain visible at in-game size in pose {frame}',min(changed)>100)
        check(f'tire animation preserves the upper body in pose {frame}',
              all(np.array_equal(pose[:,:int(pose.shape[1]*.75)],poses[0][:,:int(poses[0].shape[1]*.75)]) for pose in poses))
    check('HD wheel animation contains eight distinct phases',
          len({game.sprite(126,192,4,COLORS[0],phase).get_buffer().raw for phase in range(8)})==8)
    calls=[]
    draw_car=game.car
    game.car=lambda *args,**kwargs:calls.append((args,kwargs))
    game.players=1
    game.start()
    game.countdown=0
    game.traffic=[]
    driver=game.drivers[0]
    driver.previous=None
    driver.elapsed=1
    driver.z=30*SEG
    driver.x=0
    driver.speed=0
    game.view(pg.Surface((957,537)),driver,False)
    check('stopped car uses a still wheel texture',calls[-1][0][-1] is None)
    driver.speed=900
    driver.z+=17
    game.view(pg.Surface((957,537)),driver,False)
    check('moving car selects its wheel phase from distance travelled',calls[-1][0][-1]==driver.z/12)
    game.car=draw_car

    game.course=7
    game.start()
    check('Storm starts the recovered looping rain sample',game.rain_channel.get_busy() and game.rain_channel.get_sound()==game.rain_sound)
    check('rain source is the original asset 81',game.rain_sound.get_raw()==game.original_sound(81).get_raw())
    check('thunder source is original asset 109 with the original pitch',game.thunder_sound.get_raw()==game.original_sound(109).get_raw() and 2.27<game.thunder_sound.get_length()<2.28)
    game.weather_time=4.69
    game.update(.04)
    check('lightning triggers original thunder',game.thunder_channel.get_busy() and game.thunder_channel.get_sound()==game.thunder_sound and game.last_thunder_cycle==0)
    game.thunder_channel.stop()
    game.update(.14)
    check('second flash does not restart the same thunder sound',not game.thunder_channel.get_busy() and game.last_thunder_cycle==0)
    game.muted=True
    game.apply_audio_volume()
    check('mute silences rain and thunder',game.rain_channel.get_volume()==game.thunder_channel.get_volume()==0)
    game.muted=False
    game.paused=True
    game.apply_audio_volume()
    check('pause silences rain and thunder',game.rain_channel.get_volume()==game.thunder_channel.get_volume()==0)
    game.paused=False
    game.apply_audio_volume()
    check('resuming restores rain volume',game.rain_channel.get_volume()>.7)
    game.action(pg.K_ESCAPE)
    check('leaving Storm stops both weather channels',not game.rain_channel.get_busy() and not game.thunder_channel.get_busy())
    game.course=0
    game.start()
    check('other courses have no Storm rain sound',not game.rain_channel.get_busy())
    game.course=7
    game.start()
    pane=pg.Surface((957,537))
    pane.fill((0,0,0))
    game.weather_time=1
    game.storm_rain(pane)
    first=pg.surfarray.array3d(pane)
    coverage=float(np.mean(first.max(axis=2)>35))
    check('downpour is clearly visible across the viewport',coverage>.025)
    pane.fill((0,0,0))
    game.weather_time=1+1/60
    game.storm_rain(pane)
    check('rain moves every rendered frame',np.count_nonzero(np.any(first!=pg.surfarray.array3d(pane),axis=2))>10000)
    result=dict(version='v3.8',passed=len(checks),checks=checks,wheel_changed_pixels_at_192px=differences,rain_pixel_coverage=coverage,
                original_audio=dict(rain=81,thunder=109,code_addresses=['0x73252','0x73690']))
    Path(__file__).with_name('v38-verification.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(result,indent=2))
    pg.quit()


if __name__=='__main__':
    main()
