"""Regressions for passing, HD cars, Storm weather and course continuation."""
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
    game.players=1
    game.start()
    game.countdown=0
    core=game.original
    core.reset_for_test(0,50*SEG,-.5,7510)
    core.word(core.cars[0]+0x28,4)
    core.word(core.cars[0]+0xbc,500)
    core.u.mem_write(core.g-0x1e78+40*16,b'\0'*(40*16))
    for i in range(10):
        core.long(core.g-0x3e46+i*12,int((50*SEG+180-i*400)/SEG*65536))
    core.word(core.g-0x3e46+4,128)
    game.traffic=core.traffic()
    game.previous_traffic=[dict(car) for car in game.traffic]
    game.drivers[0].z=core.state(0)['z']
    game.drivers[0].x=core.state(0)['x']
    game.drivers[0].previous=None
    smooth=[]
    unsmoothed=[]
    for _ in range(85):
        game.update(1/60,[(0,1,0)])
        player=game.render_driver(game.drivers[0])
        smooth.append(game.render_traffic()[0]['z']-player.z)
        unsmoothed.append(game.traffic[0]['z']-player.z)
    smooth_jerk=float(np.std(np.diff(smooth,n=2)))
    raw_jerk=float(np.std(np.diff(unsmoothed,n=2)))
    check('opponent interpolation reduces uneven movement at 176 mph',smooth_jerk<raw_jerk*.3)
    check('fast overtake crosses from in front to behind',smooth[0]>0 and smooth[-1]<0)
    native=game.original.traffic()
    game.render_traffic()
    check('drawing opponents leaves their native positions unchanged',native==game.original.traffic())
    game.previous_traffic=[dict(index=0,z=64*SEG-3,x=0)]
    game.traffic=[dict(index=0,z=3,x=.1)]
    game.sim_accum=.01
    sampled=game.render_traffic()[0]
    check('traffic ring wraps through its boundary without a long sweep',abs(sampled['z']-64*SEG)<.001 and abs(sampled['x']-.05)<.001)

    # The old rear cutoff erased the top of a rival still visible alongside.
    player=game.drivers[0]
    player.previous=None
    player.z=40*SEG
    player.x=0
    player.steer=0
    player.jump=0
    game.track_gates=[]
    game.scenery_bins=[[] for _ in range(N)]
    calls=[]
    draw_car=game.car
    game.car=lambda *args,**kwargs:calls.append(args)
    game.traffic=[dict(z=player.z-24,x=.65,color=(220,30,30),speed=600)]
    game.view(pg.Surface((957,1080)),player,False)
    check('rival remains visible after the previous rear cutoff',len(calls)==2)
    game.car=draw_car
    for frame in range(9):
        sprite=pg.image.load(str(ASSETS/f'hd-car-{frame}.png'))
        check(f'car pose {frame} has detailed transparent artwork',
              sprite.get_width()>=512 and sprite.get_height()==312 and sprite.get_at((0,0)).a==0)
    liveries=[game.sprite(126,320,4,color).get_buffer().raw for color in COLORS]
    check('all four HD player liveries are distinct',len(set(liveries))==4)
    check('player 1 uses arrows and player 2 uses WASD',
          KEYS[0]==(pg.K_LEFT,pg.K_RIGHT,pg.K_UP,pg.K_DOWN) and KEYS[1]==(pg.K_a,pg.K_d,pg.K_w,pg.K_s))

    game.course=7
    game.start()
    game.countdown=0
    pane=pg.Surface((957,537))
    driver=game.drivers[0]
    driver.elapsed=1
    driver.z=190*SEG
    rain=[]
    skies=[]
    for seconds in (1,2):
        game.weather_time=seconds
        pane.fill((0,0,0))
        game.storm_rain(pane)
        rain.append(pg.surfarray.array3d(pane))
        game.storm_sky(pane)
        skies.append(pg.surfarray.array3d(pane))
    check('rain falls between frames',not np.array_equal(rain[0],rain[1]))
    check('cloud layer moves between frames',not np.array_equal(skies[0],skies[1]))
    game.weather_time=4.72
    check('Storm lightning illuminates the sky',game.lightning()>.5)
    game.weather_time=5
    check('lightning clears after the strike',game.lightning()==0)
    game.paused=True
    game.update(.2)
    check('pausing freezes the weather animation',game.weather_time==5)

    # Exercise the normal finish path for Night, with two local racers.
    game.players=2
    game.course=1
    game.start()
    game.countdown=0
    for i in range(2):
        core=game.original
        core.reset_for_test(i,LENGTH+1,(-.3,.3)[i],3000)
        core.word(core.cars[i]+0x20,99)
    game.update(.02,[(0,1,0)]*2)
    check('finishing Night queues Fog while the application stays running',
          game.state=='results' and game.next_course==2 and game.running)
    game.update(3.9)
    check('results remain visible briefly before advancing',game.state=='results')
    game.update(.2)
    check('next course starts automatically with both players and start voices',
          game.state=='race' and game.course==2 and game.players==2 and game.countdown==3)
    check('course continuation clears finish and turbo state',
          all(not p.finished and p.turbo_ticks==0 and p.elapsed==0 for p in game.drivers))
    game.course=6
    game.start()
    game.state='results'
    game.next_course=7
    game.action(pg.K_RETURN)
    check('Enter can advance immediately to the queued course',game.course==7 and game.state=='race')
    game.players=1
    game.countdown=0
    game.original.reset_for_test(0,LENGTH+1,0,3000)
    game.update(.02,[(0,1,0)])
    check('last course ends at final results',game.state=='results' and game.next_course is None)
    result=dict(version='v3.7',passed=len(checks),checks=checks,
                passing_second_difference_std=dict(previous=raw_jerk,interpolated=smooth_jerk))
    Path(__file__).with_name('v37-verification.json').write_text(json.dumps(result,indent=2))
    print(json.dumps(result,indent=2))
    pg.quit()


if __name__=='__main__':
    main()
