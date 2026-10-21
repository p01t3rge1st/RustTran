#!/usr/bin/env python3
"""Original new-start primary state and inventory 0x51b357–0x51b6cf
in one machine/frame. Explicit earlier reference inputs, original property
prefixes, Single store/reload for FpR4. Not full initializer or IC restore.
"""
import json
from native_math_oracle import ROOT
from fresh_primary_oracle import execute
cases=[]
for i,c in enumerate(json.loads((ROOT/'analysis/fresh_primary_fixtures.json').read_text())['cases']):
 q=c['inputs'];q['g54b758']=[500.,550.,570.,588.,620.][i%5]
 extras=dict(g54b154=.699999988079071,g54b128=588.,g54b1a8=550.)
 cases.append(dict(inputs=dict(primary=q,**extras),expected=execute(q|extras,True)))
(ROOT/'analysis/fresh_primary_inventory_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n');print(len(cases),'connected fresh primary/inventory cases')
