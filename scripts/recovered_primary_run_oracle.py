#!/usr/bin/env python3
"""Eight explicit-input three-update history chains of recovered numerical
slices. Properties are refreshed; external SG derivatives and remaining source
inputs are held/supplied as documented. Boundary clocks 99.75/99.875/100.
Not PCTran whole-application trajectories or a complete coupled plant model.
"""
import copy,json
from native_math_oracle import ROOT
from recovered_primary_step_oracle import execute
cases=[]
for i,c in enumerate(json.loads((ROOT/'analysis/recovered_primary_step_fixtures.json').read_text())['cases'][:8]):
 initial=copy.deepcopy(c['inputs']['globals']);g=copy.deepcopy(initial);controls=copy.deepcopy(c['inputs']['controls']);steps=[];updates=[]
 for clock in [99.75,99.875,100.]:
  controls['clock']=clock;controls['step']=.125;updates.append(copy.deepcopy(controls));out=execute(dict(globals=g,controls=controls));steps.append(out)
  g['singles'].update(out['singles']);g['integers'].update(out['integers']);controls['tail_control_state']=out['relief_tail']['control_state']
 cases.append(dict(inputs=dict(globals=initial,updates=updates),expected=dict(steps=steps,globals=g)))
(ROOT/'analysis/recovered_primary_run_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n');print(len(cases),'three-update recovered history chains')
