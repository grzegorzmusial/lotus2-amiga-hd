"""Regression for the visible sideways jump at camera segment boundaries."""
import os,json
from pathlib import Path
os.environ['SDL_VIDEODRIVER']='dummy';os.environ['SDL_AUDIODRIVER']='dummy'
from game import *

def main():
    g=Game(True);g.players=1;g.start();g.countdown=0
    p=g.drivers[0];p.x=0;p.steer=0;p.speed=500;p.jump=0
    surface=pg.Surface((957,537));calls=[];results=[]
    g.car=lambda s,x,y,size,*args,**kwargs:calls.append((x,y,size))
    for course in range(8):
        g.course=course;g.build_track();g.scenery_bins=[[] for _ in range(N)]
        for boundary in range(1,N-25):
            if not any(g.curves[max(0,boundary-1):boundary+2]):continue
            g.traffic=[dict(z=(boundary+6)*SEG,x=0,color=(220,40,30))]
            samples=[]
            for epsilon in (-.00001,.00001):
                p.z=(boundary+CAMERA_DISTANCE/SEG+epsilon)*SEG
                calls.clear();g.view(surface,p,False)
                if len(calls)==2:samples.append(calls[0])
            if len(samples)==2:
                jump=abs(samples[1][0]-samples[0][0])
                assert jump<.01,(course,boundary,jump)
                results.append(dict(course=course+1,boundary=boundary,sideways_pixels=jump))
    assert len(results)>100
    report=dict(version='v3.1',tested_boundaries=len(results),courses=8,max_sideways_pixels=max(r['sideways_pixels'] for r in results),threshold_pixels=.01,
                previous_v3_jump_pixels=15.8252,method='Fixed lateral player position; project one rival six records ahead immediately before and after each curved camera-segment boundary.',physics_changed=False,results=results)
    (Path(__file__).parent/'corner-continuity-verification.json').write_text(json.dumps(report,indent=2))
    print(json.dumps({k:v for k,v in report.items() if k!='results'},indent=2));pg.quit()

if __name__=='__main__':main()
