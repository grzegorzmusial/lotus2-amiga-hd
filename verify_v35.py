"""Check the original Storm pickup and Night tunnel through the game adapter."""
import json
import os
from pathlib import Path

os.environ['SDL_VIDEODRIVER']='dummy'
os.environ['SDL_AUDIODRIVER']='dummy'
from game import Game, SEG, W, H, pg, np
from amiga_core import OriginalCore, TURBO_BUTTON, TURBO_VOICE, TUNNEL_ENTRANCE, TUNNEL_EXIT


def park_traffic(core):
    for i in range(10):
        core.long(core.g-0x3e46+i*12,1000*65536)


def main():
    checks=[]

    def check(name,condition):
        assert condition,name
        checks.append(name)

    game=Game(True)
    game.course=7
    game.players=2
    game.start()
    game.countdown=0
    buttons=[item for item in game.scenery if item['index']==TURBO_BUTTON]
    check('five original Storm buttons are drawable',len(buttons)==5 and all(item['visible'] for item in buttons))
    check('Storm buttons are in the original records',[item['z']/SEG for item in buttons]==[190,501,827.5,887,925.75])
    core=game.original
    park_traffic(core)
    heard=[]
    announce=game.announce
    game.announce=lambda sound:heard.append(sound)
    game.original.reset_for_test(0,(190-.06)*SEG,0,6000)
    game.original.reset_for_test(1,(190-.06)*SEG,.5,6000)
    game.update(.02,[(0,1,0)]*2)
    check('driving onto the center button activates the original boost',game.drivers[0].turbo_ticks==499)
    check('driving past the button in another lane leaves boost inactive',game.drivers[1].turbo_ticks==0)
    check('pickup dispatches the recovered 93 voice sample',heard==[game.turbo_sound] and heard[0].get_raw()==game.original_sound(TURBO_VOICE).get_raw())
    check('the original voice has the expected sample length',.69<game.turbo_sound.get_length()<.70)
    for _ in range(7):
        game.update(.02,[(0,1,0)]*2)
    check('the voice plays once while crossing a button',len(heard)==1)
    game.original.reset_for_test(1,(190-.06)*SEG,0,6000)
    game.update(.02,[(0,1,0)]*2)
    check('another local player can trigger the same button independently',
          game.drivers[1].turbo_ticks==499 and game.drivers[0].turbo_ticks<499 and len(heard)==2)
    game.announce=announce

    for item in buttons:
        core=OriginalCore(7,time_limit=False)
        park_traffic(core)
        core.reset_for_test(0,item['z']-.06*SEG,item['x'],6000)
        state=core.step(0,0,1,0)
        check(f'original pickup at record {item["z"]/SEG:g} fires the turbo voice',
              state['turbo_ticks']==499 and TURBO_VOICE in state['effects'])

    # Keep a controlled straight clear of traffic and roadside obstacles to
    # compare maximum speeds and observe expiration without a crash.
    maxima=[]
    for boost in (0,500):
        core=OriginalCore(7,time_limit=False)
        park_traffic(core)
        core.u.mem_write(core.g-0x1e78,b'\0'*(80*16))
        core.reset_for_test(0,5*SEG,0,6000)
        core.word(core.cars[0]+0x28,4)
        core.word(core.cars[0]+0xbc,boost)
        states=[core.step(0,0,1,0) for _ in range(510)]
        maxima.append(max(state['raw_speed'] for state in states))
        if boost:
            check('turbo counts down on the original 50 Hz simulation',states[498]['turbo_ticks']==1 and states[499]['turbo_ticks']==0)
            check('normal acceleration curve resumes after expiration',states[509]['raw_speed']<maxima[-1])
    check('the native boost raises top speed on the controlled straight',maxima==[6572,7749])

    game.course=1
    game.players=1
    game.start()
    game.countdown=0
    game.traffic=[]
    core=game.original
    entrances=[i for i,r in enumerate(core.records) if r[2]==TUNNEL_ENTRANCE]
    exits=[i for i,r in enumerate(core.records) if r[2]==TUNNEL_EXIT]
    check('Night reads 34 paired tunnel markers',len(entrances)==len(exits)==34)
    check('every interior spans exactly its original entrance up to its exit',
          all(on==any(a<=i<b for a,b in zip(entrances,exits)) for i,on in enumerate(game.tunnel_sections)))
    check('first Night tunnel starts at 276 and ends at 282',(entrances[0],exits[0])==(276,282))
    driver=game.drivers[0]
    driver.x=0
    driver.elapsed=3
    driver.speed=900
    frames=[]
    for record in (274,276.95,283):
        driver.z=record*SEG
        game.view(game.canvas,driver,show_hud=False)
        frames.append(pg.surfarray.array3d(game.canvas))
    ceiling=(13,14,16)
    check('going indoors fills the near top of the view with the tunnel ceiling',
          np.all(frames[1][W//2,15]==ceiling) and not np.all(frames[0][W//2,15]==ceiling))
    check('a tunnel interior shows its ceiling lamps',np.any(np.all(frames[1]==(215,213,201),axis=2)))
    check('night sky returns after the exit',not np.any(np.all(frames[2][:,:H//3]==ceiling,axis=2)))
    game.players=4
    game.start()
    game.countdown=0
    for index,driver in enumerate(game.drivers):
        driver.z=(276.95 if index%2 else 274)*SEG
        driver.x=0
        driver.elapsed=3
        driver.previous=None
    game.render()
    check('four local views can be inside and outside independently',
          game.canvas.get_at((3*W//4,H//5))[:3]==ceiling!=game.canvas.get_at((W//4,H//5))[:3])
    result=dict(version='v3.5',passed=len(checks),checks=checks,night_tunnels=list(zip(entrances,exits)),
                storm_buttons=[item['z']/SEG for item in buttons],top_speed_raw=maxima)
    Path(__file__).with_name('v35-verification.json').write_text(json.dumps(result,indent=2))
    print(f'{len(checks)} checks passed')
    pg.quit()


if __name__=='__main__':
    main()
