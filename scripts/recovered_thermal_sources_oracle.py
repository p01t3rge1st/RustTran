#!/usr/bin/env python3
"""Eight native-slice thermal/hydrogen + containment updates and two sixteen-update
chains. Current event4 flag/time overrides fallback controls; ignition time is
retained in the shared schedule. Explicit upstream reaction state/limit curve,
not original IC startup or a continuous Windows application scenario.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from containment_thermal_oracle import base
from recovered_primary_step_oracle import execute as step
from recovered_session_oracle import execute as session,f32
if __name__=='__main__':
 source=json.loads((ROOT/'analysis/recovered_containment_step_fixtures.json').read_text())['cases'];steps=[];chains=[]
 for i in range(8):
  q=copy.deepcopy(source[i]['inputs']);b=base();s=q['globals']['singles'];c=q['controls']
  for a,v in b['globals']['singles'].items():s.setdefault(a,v)
  q['globals']['integers']['0x54bfa8']=[0,1,1,-1,2,0,1,0][i]
  s['0x54bd78']=f32([.2,.1,.00001,.1,.1,.2,.1,.1][i]);c['clock']=f32(20.*i);c['step']=f32(.0001)
  control=b['controls'];control['burn_time']=f32(c['clock']-.001);c['containment_thermal']=control
  if c.get('event_schedule') is not None:
   c['event_schedule']['flags'][4]=1;c['event_schedule']['times'][4]=f32(c['clock']-.002)
   control['burn_flag']=0;control['burn_time']=f32(c['clock']+1.)  # conflicting copies
  steps.append(dict(inputs=q,expected=step(q)))
 for i in [0,5]:
  q=dict(session=copy.deepcopy(steps[i]['inputs']),steps=16);expected=session(q)
  assert all(0<=o['singles']['0x54b40c']<=300 for o in expected['steps'])
  assert expected['steps'][0]['containment_thermal']['ignited']
  assert any(o['containment_thermal']['burned'] for o in expected['steps'])
  assert any(o['containment_thermal']['extinguished'] for o in expected['steps'])
  chains.append(dict(inputs=q,expected=expected))
 for name,cases in [('recovered_thermal_sources_step',steps),('recovered_thermal_sources_session',chains)]:
  (ROOT/f'analysis/{name}_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n')
 print(len(steps),'composed thermal/hydrogen steps and',len(chains),'sixteen-update chains')
