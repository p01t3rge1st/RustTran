#!/usr/bin/env python3
"""Composed original native slices: device/RCP controls, both initial SG control
prefixes with shared timestamp/checkbox in A-then-B order, SG exchange, primary
control/balance and integration. Later SG device/valve/flow production remains
explicit. Not a complete original-application timestep or scenario trajectory.
"""
import copy,json,hashlib
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_rcp_step_fixtures.json').read_text())['cases'];sg=json.loads((ROOT/'analysis/steam_control_fixtures.json').read_text())['cases'];cases=[]
 for i,c in enumerate(base):
  q=copy.deepcopy(c['inputs']);g=q['globals']
  for j in [0,1]:
   template=sg[(i*28+j)%960]['inputs']
   for a,v in template['globals']['singles'].items():g['singles'].setdefault(a,v)
   for a,v in template['globals']['integers'].items():g['integers'].setdefault(a,v)
  q['controls']['steam_phase_flags']=[0,1]
  q['controls']['steam_controls']=dict(failure_time=100.,fault_flag=[0,-1,1][i%3],fault_selected=bool(i&1),feedwater_percent=[100,50])
  for a in ['0x54ba90','0x54ba94']:g['singles'].pop(a,None)
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/recovered_steam_control_step_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'SG-control-connected steps')
