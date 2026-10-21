#!/usr/bin/env python3
"""Sixteen eight-update stateful native-slice chains including the late primary
thermal feedback and its histories. Explicit restored histories, synthetic
component states, 0.0001 s steps and 0-300 s clocks; not full Windows scenarios.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from recovered_session_oracle import execute
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_session_fixtures.json').read_text())['cases'];cases=[];checkpoint=ROOT/'analysis/recovered_transport_session.partial.json'
 if checkpoint.exists():cases=json.loads(checkpoint.read_text())
 for i in range(len(cases),16):
  q=copy.deepcopy(base[i%12]['inputs']);q['session']['controls']['loop_transport']=True
  for a,v in [('0x54bab4',550.),('0x54bab8',551.),('0x54babc',500.),('0x54bac0',501.)]:q['session']['globals']['singles'][a]=v
  cases.append(dict(inputs=q,expected=execute(q)));checkpoint.write_text(json.dumps(cases)+'\n');print(i+1,'/16 native transport-feedback chains',flush=True)
 path=ROOT/'analysis/recovered_transport_session_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');checkpoint.unlink(missing_ok=True);print(len(cases),'thermal transport session chains')
