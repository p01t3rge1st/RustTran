#!/usr/bin/env python3
"""96 native-slice composed updates adding complete recovered supply modes before
accumulator, source sum, normal loops, SGs, primary balance and integration.
Source state/COM controls explicit; remaining plant/Windows GUI dispatch excluded.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_accumulator_step_fixtures.json').read_text())['cases'];sup=json.loads((ROOT/'analysis/supply_system_fixtures.json').read_text())['cases'];cases=[]
 checkpoint=ROOT/'analysis/recovered_supply_step.partial.json'
 if checkpoint.exists():cases=json.loads(checkpoint.read_text())
 for i in range(len(cases),96):
  q=copy.deepcopy(base[i%64]['inputs']);p=copy.deepcopy(sup[(i*11)%960]['inputs']);s=q['globals']['singles']
  for a,v in p['globals']['singles'].items():s.setdefault(a,v)
  q['globals']['integers'].update(p['globals']['integers']);s['0x54ba40']=[3999.999755859375,4000.,8000.][i%3];s['0x54b2fc']=(s['0x54b494']+[-1.,0.,1.][i%3])/30.
  q['controls']['supply']=dict(controls=p['controls'],curve=p['curve']);q['controls']['supply']['controls']['mode']=[0,1,2,3][i%4]
  cases.append(dict(inputs=q,expected=execute(q)));checkpoint.write_text(json.dumps(cases)+'\n')
  if (i+1)%16==0:print(i+1,'/96 supply-connected updates',flush=True)
 path=ROOT/'analysis/recovered_supply_step_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');checkpoint.unlink(missing_ok=True);print(len(cases),'supply-connected updates')
