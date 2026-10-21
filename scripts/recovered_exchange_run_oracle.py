#!/usr/bin/env python3
"""Four three-update history chains with both original SG exchanges computing
all six derivatives on each update, plus original primary/relief/stream/
integration slices. Explicit remaining cached transfer/device/event inputs.
These are recovered numerical chains, not whole-plant/application traces.
"""
import copy,json
from native_math_oracle import ROOT
from recovered_primary_step_oracle import execute
cases=[]
for c in json.loads((ROOT/'analysis/recovered_exchange_step_fixtures.json').read_text())['cases'][:4]:
 initial=copy.deepcopy(c['inputs']['globals']);g=copy.deepcopy(initial);ctl=copy.deepcopy(c['inputs']['controls']);updates=[];steps=[]
 for clock in [99.75,99.875,100.]:
  ctl['clock']=clock;ctl['step']=.125;updates.append(copy.deepcopy(ctl));out=execute(dict(globals=g,controls=ctl));steps.append(out)
  g['singles'].update(out['singles']);g['integers'].update(out['integers']);ctl['tail_control_state']=out['relief_tail']['control_state']
 cases.append(dict(inputs=dict(globals=initial,updates=updates),expected=dict(steps=steps,globals=g)))
(ROOT/'analysis/recovered_exchange_run_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n');print(len(cases),'three-update chains with computed SG exchanges')
