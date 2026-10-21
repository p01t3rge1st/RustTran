#!/usr/bin/env python3
"""Composed original primary frame and original heater numeric paths.
Heater sees the updated phase level; explicit upstream control signal and COM
inputs replace unrecovered spray/UI region. No whole-plant/GUI validation.
"""
import json
from native_math_oracle import ROOT
from primary_core_oracle import execute
cases=[]
for i,c in enumerate(json.loads((ROOT/'analysis/primary_core_fixtures.json').read_text())['cases']):
 q=c['inputs'];q['globals']['singles'].pop('0x54b6dc',None)
 q['globals']['singles'].update(dict(zip(['0x54b6d0','0x54b6d4','0x54b1e4','0x54b1e8','0x54b1e0','0x54b1ec','0x54b200','0x54b1d0'],[[1800.,2000.,2100.,2200.][i%4],.5,2100.,1900.,10000.,2000.,20000.,[.2,.5][i%2]])))
 q['heater_controls']=dict(proportional_manual=bool(i&1),backup_manual=bool(i&2),proportional_percent=50,backup_percent=25)
 cases.append(dict(inputs=q,**execute(q)))
(ROOT/'analysis/primary_heaters_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n')
print(len(cases),'composed primary/heater cases')
