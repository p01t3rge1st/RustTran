#!/usr/bin/env python3
"""Original-slice composition: reference updates, device automation/charging PI/
injection curve, pressure properties, relief, both SGs, primary balance/controls,
stream derivatives and integration. Original machines exchange shared scalars;
remaining event, thermal and feedwater producers are explicit. No full trajectory.
"""
import copy,json,hashlib
from native_math_oracle import ROOT
from recovered_primary_step_oracle import execute
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_exchange_step_fixtures.json').read_text())['cases'];dev=json.loads((ROOT/'analysis/primary_devices_fixtures.json').read_text())['cases'];refs=json.loads((ROOT/'analysis/primary_references_fixtures.json').read_text())['cases'];cases=[]
 for i,c in enumerate(base):
  q=copy.deepcopy(c['inputs']);g=q['globals'];d=dev[i*29]['inputs'];r=refs[i]['inputs'];s=g['singles']
  for a,v in d['globals']['singles'].items():s.setdefault(a,v)
  for a,v in d['globals']['integers'].items():g['integers'].setdefault(a,v)
  for a,v in r['extra_singles'].items():s.setdefault(a,v)
  q['controls']['devices']=dict(controls=d['controls'],curve=d['curve']);q['controls']['references']=r['stages'][0]['controls']
  # Force the two newly calculated source fields to be required from the producer.
  for a in ['0x54ba1c','0x54ba28']:s.pop(a,None)
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/recovered_devices_step_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256((ROOT/"analysis/program/PCTran.exe").read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'device-connected numerical steps')
