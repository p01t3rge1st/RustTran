#!/usr/bin/env python3
"""Eight composed native-slice containment steps and two four-update chains.
Spray/fan producers feed containment balance and equilibrium before stream/plant
integration. Remaining thermal/source/Double/array inputs explicit. No whole
Windows scenario. Uses only small existing fixtures; no giant report rebuild.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from containment_balance_oracle import base
from recovered_primary_step_oracle import execute as step
from recovered_session_oracle import execute as session,f32
if __name__=='__main__':
 sources=json.loads((ROOT/'analysis/recovered_spray_step_fixtures.json').read_text())['cases'];steps=[];chains=[]
 for i in range(8):
  q=copy.deepcopy(sources[i]['inputs']);b=base();s=q['globals']['singles'];c=q['controls']
  for a,v in b['globals']['singles'].items():s.setdefault(a,v)
  # Deliberately supplied synthetic vessel geometry/state, not fresh IC proof.
  for a in ['0x54b2bc','0x54b2c0','0x54b54c','0x54b544','0x54b548','0x54b800','0x54b160','0x54b334']:s[a]=b['globals']['singles'][a]
  s['0x54b2dc']=0.;s['0x54bfb8']=0.;s['0x54b754']=0.;s['0x54bb0c']=100.;s['0x54bb10']=s['0x54b548']
  for a,v in [('0x54b2f8',10.),('0x54b2d8',2.),('0x54bb08',5.),('0x54b2d4',3.),('0x54b74c',0.)]:s.setdefault(a,v)
  c['step']=f32(.0001);inp=b['inputs'];inp.update(auxiliary_percent=-1,outlet_temperature=-1.,event_times=[-1.,-1.],heat_source=123.456789123,gas_source=.0123456789123,vent_percent=[0,100][i%2])
  c['containment_balance']=dict(inputs=inp,other_return_flow=f32([0.,2.][i%2]))
  if i==6:c['supply']=None  # explicit other-return fallback
  if i==7:c['containment_spray']=None  # explicit cached spray boundary
  if i in [1,5]:
   flags=[0]*20;times=[0.]*20
   if c.get('normal_thermal') is not None:flags[7]=c['normal_thermal']['fault_flag']
   if c.get('steam_controls') is not None:flags[8]=c['steam_controls']['fault_flag'];times[8]=c['steam_controls']['failure_time']
   if c.get('steam_valves') is not None:flags[2],flags[3]=c['steam_valves']['fault_flags']
   if c.get('rcp') is not None:times[6]=c['rcp']['trip_time']
   times[2]=c['clock'];times[3]=f32(c['clock']+1.)
   c['event_schedule']=dict(flags=flags,times=times,delays=[0.]*20)
  steps.append(dict(inputs=q,expected=step(q)))
 for i in [0,3]:
  q=dict(session=copy.deepcopy(steps[i]['inputs']),steps=4);expected=session(q)
  assert all(0<=o['singles']['0x54b40c']<=300 for o in expected['steps'])
  chains.append(dict(inputs=q,expected=expected))
 for name,cases in [('recovered_containment_step',steps),('recovered_containment_session',chains)]:
  (ROOT/f'analysis/{name}_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n')
 print(len(steps),'composed containment steps and',len(chains),'stateful chains')
