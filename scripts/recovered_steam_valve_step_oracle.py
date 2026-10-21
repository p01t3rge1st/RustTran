#!/usr/bin/env python3
"""Composed native slices with both SG initial controls, device/valve automation,
outflow limitation and primary/integration updates. Auxiliary feedwater stage
0x50a8a6-0x50ac31 and remaining plant dispatch are explicit boundaries.
"""
import copy,json,hashlib
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_steam_control_step_fixtures.json').read_text())['cases'];sg=json.loads((ROOT/'analysis/steam_valves_fixtures.json').read_text())['cases'];cases=[]
 for i,c in enumerate(base):
  q=copy.deepcopy(c['inputs']);g=q['globals']
  for j in [0,1]:
   template=sg[i*30+j]['inputs']
   for a,v in template['globals']['singles'].items():g['singles'].setdefault(a,v)
  q['controls']['steam_valves']=copy.deepcopy(sg[i*30]['inputs']['controls'])
  for a in ['0x54b874','0x54b878']:g['singles'].pop(a,None)
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/recovered_steam_valve_step_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'SG-valve-connected steps')
