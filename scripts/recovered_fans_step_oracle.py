#!/usr/bin/env python3
"""32 native-slice composed steps with late containment fan heat/activation
before stream balance and integration. Existing primary, supply, accumulator,
SG and integration references execute original slices. Explicit containment
pressure/temperature and controls; not complete containment or Windows runs.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute
if __name__=='__main__':
 source=json.loads((ROOT/'analysis/recovered_supply_step_fixtures.json').read_text())['cases'];fans=json.loads((ROOT/'analysis/containment_fans_fixtures.json').read_text())['cases'];cases=[]
 for i in range(32):
  q=copy.deepcopy(source[i]['inputs']);f=copy.deepcopy(fans[(i*17)%720]['inputs'])
  for a,v in f['globals']['singles'].items():
   if a!='0x54b40c':q['globals']['singles'][a]=v
  q['globals']['singles']['0x54b450']=q['controls']['clock']+[-.25,0.,.25][i%3]
  q['controls']['containment_fans']=f['controls'];cases.append(dict(inputs=q,expected=execute(q)))
  if (i+1)%8==0:print(i+1,'/32 native fan-connected steps',flush=True)
 (ROOT/'analysis/recovered_fans_step_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n')
