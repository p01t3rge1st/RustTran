#!/usr/bin/env python3
"""Restored controls and native event-array bindings feed recovered RCP/SG/primary
and integrator slices. Restored state is explicit input to the update; this does
not load a full saved file or run the original application/whole coordinator.
"""
import copy,json,hashlib
from native_math_oracle import ROOT,EXE
from restored_controls_oracle import execute as restore
from recovered_primary_step_oracle import execute
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_steam_system_step_fixtures.json').read_text())['cases'];rest=json.loads((ROOT/'analysis/restored_controls_fixtures.json').read_text())['cases'];cases=[]
 for i,c in enumerate(base):
  q=copy.deepcopy(c['inputs']);r=copy.deepcopy(rest[i*12]['inputs']);r['globals']=copy.deepcopy(q['globals'])
  for a,v in rest[i*12]['inputs']['globals']['singles'].items():r['globals']['singles'].setdefault(a,v)
  r['globals']['singles']['0x54b418']=q['controls']['clock'];r['globals']['integers']['0x54b080']=0
  # Vary the exact special SG mode independently of the chosen source case.
  r['events']['flags'][8]=[-1,0,1,2][i%4]
  restored=restore(r);q['globals']=copy.deepcopy(r['globals']);q['globals']['singles'].update(restored['singles']);q['controls']['event_schedule']=restored['events']
  q['controls']['rcp']['trip_time']=99999.;q['controls']['steam_controls'].update(failure_time=99999.,fault_flag=73);q['controls']['steam_valves']['fault_flags']=[42,43]
  cases.append(dict(inputs=q,expected=execute(q),restore_inputs=r,restoration=restored))
 (ROOT/'analysis/recovered_restored_event_step_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'restored-event-connected cases')
