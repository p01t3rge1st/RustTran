#!/usr/bin/env python3
"""Native-slice composition including current accumulator activation/discharge
before source sum, both normal thermal loops, SGs, balance and integration.
64 updates cover retained flow, active discharge, exact activation thresholds,
manual valve closure/inhibition and 0-300 s clocks. Not Windows GUI trajectories.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_thermal_step_fixtures.json').read_text())['cases'];cases=[]
 checkpoint=ROOT/'analysis/recovered_accumulator_step.partial.json'
 if checkpoint.exists():cases=json.loads(checkpoint.read_text())
 for i in range(len(cases),64):
  q=copy.deepcopy(base[i*2]['inputs']);g=q['globals'];s=g['singles'];p=s['0x54b494'];s.update({'0x54b1b8':p+[-1.,0.,1.][i%3],'0x54b540':p+100.,'0x54b804':.5,'0x54b570':[.5,1.,100.,1000.][(i//4)%4],'0x54b574':500.,'0x54b1c0':1.,'0x54b458':299.})
  s['0x54b708']=s['0x54b570']+s['0x54b574'];g['integers']['0x54b4e6']=[0,1,-1,2][(i//3)%4]
  q['controls']['accumulator']=[dict(opening=[0,25,100,-1][i%4],inhibited=bool(i%2)),dict(opening=[100,0,50,0][i%4],inhibited=bool((i//2)%2))]
  cases.append(dict(inputs=q,expected=execute(q)));checkpoint.write_text(json.dumps(cases)+'\n')
  if (i+1)%16==0:print(i+1,'/64 accumulator-connected updates',flush=True)
 path=ROOT/'analysis/recovered_accumulator_step_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');checkpoint.unlink(missing_ok=True);print(len(cases),'accumulator-connected recovered updates')
