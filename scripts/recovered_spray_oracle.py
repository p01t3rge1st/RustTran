#!/usr/bin/env python3
"""Eight native-slice composed steps and two four-step spray sessions.
Shared supply mode, primary auxiliary command and fan exchanger are bound from
preceding producers. Explicit source/thermal state; not full Windows scenarios.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute as step
from recovered_session_oracle import execute as session,f32
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_fans_step_fixtures.json').read_text())['cases'];spray=json.loads((ROOT/'analysis/containment_spray_fixtures.json').read_text())['cases'];steps=[];chains=[]
 for i in range(8):
  q=copy.deepcopy(base[i*4]['inputs']);s=copy.deepcopy(spray[i*7]['inputs'])
  for k,v in s['globals']['singles'].items():q['globals']['singles'].setdefault(k,v)
  q['globals']['singles']['0x54b448']=f32(q['controls']['clock']+[-.25,.25][i%2])
  q['globals']['integers'].update(s['globals']['integers']);q['controls']['containment_spray']=s['controls']
  q['controls']['containment_spray'].update(mode=-1,auxiliary_percent=-1,exchanger_percent=-1)
  steps.append(dict(inputs=q,expected=step(q)))
 for i in [0,3]:
  q=dict(session=copy.deepcopy(steps[i]['inputs']),steps=4);q['session']['controls']['step']=f32(.0001)
  old=q['session']['controls']['clock'];clock=f32(min(old,299.999));q['session']['controls']['clock']=clock
  q['session']['globals']['singles']['0x54b448']=f32(q['session']['globals']['singles']['0x54b448']+clock-old)
  expected=session(q);assert all(0<=s['singles']['0x54b40c']<=300 for s in expected['steps']);chains.append(dict(inputs=q,expected=expected))
 for name,cases in [('recovered_spray_step',steps),('recovered_spray_session',chains)]:
  (ROOT/f'analysis/{name}_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n')
 print(len(steps),'composed steps and',len(chains),'native spray chains')
