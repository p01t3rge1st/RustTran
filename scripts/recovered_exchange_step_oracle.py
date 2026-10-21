#!/usr/bin/env python3
"""Recovered numerical update with BOTH original SG exchange blocks producing
all six SG derivatives. Sources, relief/tail, primary control/balance, stream
and integration use independent original numeric slices as documented.
Upstream transfer/control/device producers are explicit cached boundaries;
this is not the full original coordinator or a whole-plant scenario.
"""
import copy,json
from native_math_oracle import ROOT
from recovered_primary_step_oracle import execute
from steam_generator_oracle import bindings
sg=json.loads((ROOT/'analysis/steam_generator_fixtures.json').read_text())['cases'];bind=bindings();cases=[]
for i,c in enumerate(json.loads((ROOT/'analysis/recovered_primary_step_fixtures.json').read_text())['cases']):
 q=copy.deepcopy(c['inputs']);g=q['globals']['singles'];ctl=q['controls'];ctl.pop('steam_derivatives');ctl['steam_phase_flags']=[sg[2*i]['inputs']['phase_flag'],sg[2*i+1]['inputs']['phase_flag']]
 common=sg[2*i]['inputs'];g.update({'0x54b718':common['enthalpy_a'],'0x54b734':common['enthalpy_b'],'0x54b188':common['volume'],'0x54b67c':common['heat_a'],'0x54b680':common['heat_b']})
 for k,b in enumerate(bind):
  x=sg[2*i+k]['inputs'];args=[int(a['pointer'],16) for a in b['arguments']]
  for offset,name in [(8,'pressure'),(0x60,'fraction'),(0x20,'inflow_a'),(0x50,'inflow_b'),(0x68,'outflow')]:g[hex(args[(offset-8)//4])]=x[name]
 g['0x54b740']=0.3333333432674408;g['0x54b744']=0.6666666865348816
 cases.append(dict(inputs=q,expected=execute(q)))
(ROOT/'analysis/recovered_exchange_step_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n');print(len(cases),'numerical updates with both SG exchanges')
