#!/usr/bin/env python3
"""Eight eight-step native-slice chains retain automatic fan properties and
activation timestamps alongside all previously connected controls. Explicit
source states, small supplied steps; not a complete original scenario.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from recovered_session_oracle import execute,f32
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_fans_step_fixtures.json').read_text())['cases'];cases=[]
 for i in range(8):
  session=copy.deepcopy(base[i*4]['inputs']);session['controls']['step']=f32(.0001)
  old=session['controls']['clock'];clock=f32(min(old,299.999))
  session['controls']['clock']=clock
  session['globals']['singles']['0x54b450']=f32(session['globals']['singles']['0x54b450']+clock-old)
  q=dict(session=session,steps=8);expected=execute(q)
  assert all(0.<=step['singles']['0x54b40c']<=300. for step in expected['steps'])
  cases.append(dict(inputs=q,expected=expected));print(i+1,'/8 native fan session chains',flush=True)
 (ROOT/'analysis/recovered_fans_session_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n')
