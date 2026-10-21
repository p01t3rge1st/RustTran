#!/usr/bin/env python3
"""Composed original pressure signal, primary core/control slices and original
post-balance feedback in the original primary frame. Upstream model/cached
states explicit; no integration, GUI or whole-plant trajectory validation.
"""
import json
from native_math_oracle import ROOT
from primary_core_oracle import execute
cases=[]
for i,c in enumerate(json.loads((ROOT/'analysis/primary_controls_fixtures.json').read_text())['cases']):
 q=c['inputs'];q['globals']['singles'].update({'0x54ba4c':[0.,100.,-100.][i%3],'0x54b160':100.})
 cases.append(dict(inputs=q,**execute(q,True)))
(ROOT/'analysis/primary_control_cycle_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n');print(len(cases),'connected primary control-cycle cases')
