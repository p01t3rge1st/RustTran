#!/usr/bin/env python3
"""Original-slice composition of device/reference producers, RCP switching/flows,
relief, both SGs, primary controls/balance, stream derivatives and integration.
Independent native machines exchange scalars. Thermal-transfer/feedwater/event
producers remain explicit. This is not an original-application trajectory.
"""
import copy,json,hashlib
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_devices_step_fixtures.json').read_text())['cases'];pump=json.loads((ROOT/'analysis/rcp_control_fixtures.json').read_text())['cases'];cases=[]
 for i,c in enumerate(base):
  q=copy.deepcopy(c['inputs']);p=pump[i*23]['inputs'];g=q['globals']
  for a,v in p['globals']['singles'].items():g['singles'].setdefault(a,v)
  g['integers'].update(p['globals']['integers']);q['controls']['rcp']=p['controls']
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/recovered_rcp_step_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'RCP-connected steps')
