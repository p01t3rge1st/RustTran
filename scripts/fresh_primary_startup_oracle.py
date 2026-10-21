#!/usr/bin/env python3
"""GUI/CLI primary startup backend: 110 model/operating-point combinations.
Uses authenticated model conversions and original loop-reference outputs;
original new-start state/inventory and pressure/level-control slices execute
in one machine. Explicit fresh-start scope, no full-plant or GUI trajectory.
"""
import json
from native_math_oracle import ROOT
from fresh_primary_oracle import execute
models={}
for c in json.loads((ROOT/'analysis/model_seed_fixtures.json').read_text())['cases']:
 if not c['curve']:models.setdefault(c['set'],{})[c['target']]=c['expected']
cases=[]
for c in json.loads((ROOT/'analysis/loop_reference_fixtures.json').read_text())['cases']:
 m=models[c['model']];q={('g'+a[2:]):m[a] for a in ['0x54b1a4','0x54b19c','0x54b124','0x54b1a0','0x54b154','0x54b128','0x54b1a8']}
 q.update({('g'+a[2:]):c['expected'][a] for a in ['0x54b740','0x54b744','0x54b758']})
 cases.append(dict(inputs=dict(model=c['model'],ic=c['ic']),expected=execute(q,True,True)))
(ROOT/'analysis/fresh_primary_startup_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n');print(len(cases),'GUI/CLI primary startup cases')
