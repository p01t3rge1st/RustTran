#!/usr/bin/env python3
"""Eight native-slice post-model transfer/source/containment steps and two
sixteen-step chains. Double node state explicit; current BFB4 and heat histories
feed existing thermal/hydrogen and balance. Not whole alternate model/Windows.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from reaction_transfer_oracle import base
from recovered_primary_step_oracle import execute as step
from recovered_session_oracle import execute as session,f32
if __name__=='__main__':
 source=json.loads((ROOT/'analysis/recovered_thermal_sources_step_fixtures.json').read_text())['cases'];steps=[];chains=[]
 for i in range(8):
  q=copy.deepcopy(source[i]['inputs']);b=base();s=q['globals']['singles'];c=q['controls']
  for a,v in b['globals']['singles'].items():s.setdefault(a,v)
  # Authenticated Single source state is supplied, not fresh whole-plant proof.
  for a in ['0x54bfe8','0x54bfcc','0x54bfec','0x54bff8','0x54bfc4','0x54bfc8','0x54bfc0','0x54bfbc','0x54bff0','0x54bff4','0x54c010']:s[a]=b['globals']['singles'][a]
  s['0x54b2b0']=f32([1400.,1600.,1628.,1630.][i%4]);s['0x54bfb4']=f32(123.)  # stale value must be overwritten when active
  inputs=b['inputs'];inputs['node_fraction']=[.1,.01,.10000000000000002,.5][i%4];c['reaction_transfer']=inputs
  steps.append(dict(inputs=q,expected=step(q)))
 for i in [0,7]:
  q=dict(session=copy.deepcopy(steps[i]['inputs']),steps=16);expected=session(q)
  assert all(0<=o['singles']['0x54b40c']<=300 for o in expected['steps'])
  chains.append(dict(inputs=q,expected=expected))
 for name,cases in [('recovered_reaction_step',steps),('recovered_reaction_session',chains)]:
  (ROOT/f'analysis/{name}_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n')
 print(len(steps),'composed reaction steps and',len(chains),'sixteen-update chains')
