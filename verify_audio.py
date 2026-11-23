"""Check original Paula periods, mono/stereo conversion and in-race MOD."""
import os,json,wave
from pathlib import Path
os.environ['SDL_VIDEODRIVER']='dummy';os.environ['SDL_AUDIODRIVER']='dummy'
from game import *

def main():
    checks=[];durations=[]
    def check(name,value):
        assert value,name
        checks.append(name)
    g=Game(True)
    for rate,channels in [(22050,1),(22050,2),(44100,2),(48000,2)]:
        pg.mixer.quit();pg.mixer.init(rate,-16,channels,allowedchanges=0)
        for index in (88,89,90,91):
            b=(ASSETS/f'{index:03}.bin').read_bytes();length=int.from_bytes(b[:2],'big')*2;period=int.from_bytes(b[2:4],'big')
            expected=length*period/3546895;sound=g.original_sound(index)
            actual=sound.get_length()
            check(f'voice {index} duration matches original period at {rate}Hz/{channels}ch',abs(actual-expected)<2/rate)
            pcm=np.frombuffer(sound.get_raw(),np.int16).reshape(-1,channels)
            if channels==2:check(f'voice {index} has identical left/right PCM at {rate}Hz',np.array_equal(pcm[:,0],pcm[:,1]))
            if rate==44100:durations.append(dict(asset=index,name={88:'marks',89:'set',90:'go',91:'checkpoint'}[index],period=period,duration_seconds=actual,original_expected_seconds=expected))
    pg.mixer.quit();pg.mixer.init(44100,-16,2,allowedchanges=0);g.audio()
    g.start();check('original title MOD starts automatically in the race',pg.mixer.music.get_busy())
    check('race music is quieter than spoken announcements',.20<pg.mixer.music.get_volume()<.30 and g.voice.get_volume()==1)
    g.action(pg.K_F2);check('F2 disables race music',not pg.mixer.music.get_busy() and not g.music_on)
    g.start();check('music choice survives race restart',not pg.mixer.music.get_busy())
    g.action(pg.K_F2);check('F2 restores original race music',pg.mixer.music.get_busy() and g.music_on)
    spoken=[];g.announce=lambda sound:spoken.append(sound.get_raw());g.start()
    for _ in range(3):g.update(1.001,[(0,1,0)]*4)
    check('countdown follows original calls 88 Marks, 89 Set, 90 Go',spoken==[g.original_sound(i).get_raw() for i in (88,89,90)])
    g.start();g.countdown=0;spoken.clear()
    for i in range(4):
        g.original.reset_for_test(i,z=212*SEG,x=(-.25,.25,-.6875,.6875)[i],speed=2000)
        g.original.word(g.original.cars[i]+0x20,40);g.drivers[i].remaining=40
    g.update(.02,[(0,1,0)]*4)
    check('four simultaneous checkpoints produce one voice announcement',len(spoken)==1 and spoken[0]==g.check_sound.get_raw())
    # Store a direct listenable reference made from the same mixer-ready PCM.
    with wave.open(str(Path(__file__).parent/'voices-v33.wav'),'wb') as w:
        w.setnchannels(2);w.setsampwidth(2);w.setframerate(44100)
        for index in (88,89,90,91):
            w.writeframes(g.original_sound(index).get_raw());w.writeframes(b'\0'*(44100//3*4))
    result=dict(version='v3.3',passed=len(checks),checks=checks,voices=durations,original_period_clock_hz=3546895,
                fixed_bug='Mono PCM was interpreted as stereo on the actual Windows audio device, halving duration and doubling pitch.',music='Recovered original intro.mod (bootup); menu opening theme and optional race music; F2 toggles it.',mixer=list(pg.mixer.get_init()))
    (Path(__file__).parent/'audio-verification.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2));pg.quit()

if __name__=='__main__':main()
