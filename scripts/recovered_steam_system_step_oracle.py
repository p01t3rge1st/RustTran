#!/usr/bin/env python3
"""Composed native plant slices with all recovered SG control/numerical stages,
including auxiliary feedwater and both activation/skip branches.
Remaining plant/source/initialization/event inputs are explicit, not GUI runs.
"""
import copy,json,hashlib
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_steam_valve_step_fixtures.json').read_text())['cases'];cases=[]
 for i,c in enumerate(base):
  q=copy.deepcopy(c['inputs']);g=q['globals'];g['singles'].update({'0x54ba7c':1000.,'0x54b72c':350.})
  g['integers']['0x54b4d2']=[0,1][i%2];g['integers']['0x54b4d4']=[0,1][(i//2)%2]
  q['controls']['steam_auxiliary_percent']=[[0,0],[0,100],[100,0],[50,100],[100,50]][(i//4)%5]
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/recovered_steam_system_step_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'SG-system-connected steps')
