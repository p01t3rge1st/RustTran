#!/usr/bin/env python3
"""Compose original coordinator source/phase-flux prefix and original relief
numerical branch. Native caller addresses are bound explicitly; COM valve
commands are supplied, original automation/event dispatch remains excluded.
"""
import json
from native_math_oracle import ROOT
from primary_sources_oracle import execute as sources
from relief_oracle import execute as relief

def execute(q):
 g=q['globals']['singles'];flags=q['globals']['integers'];v=q['valves']
 p=sources({'g'+a[2:]:g[a] for a in ['0x54b6e0','0x54ba20','0x54ba1c','0x54b804','0x54ba28','0x54b494']})
 r=relief(dict(pressure=g['0x54b494'],porv_area=g['0x54b138'],safety_area=g['0x54b13c'],porv_a=v['porv_a'],porv_b=v['porv_b'],safety_valve=v['safety_valve'],level=g['0x54b4a0'],reset_level=g['0x54b400'],mixture_level=0.9800000190734863,phase_flag=flags['0x54b4d0'],liquid_flux=p['0x54ba48'],vapor_flux=p['0x54ba44'],liquid_enthalpy=g['0x54b728'],vapor_enthalpy=g['0x54b724'],g54b6ac=g['0x54b6ac']))
 return dict(singles=p|{'0x54b408':0.9800000190734863,'0x54b6a8':r['flow'],'0x54b73c':r['enthalpy']},integers={'0x54b4d0':r['phase_flag']})
if __name__=='__main__':
 refs=json.loads((ROOT/'analysis/relief_fixtures.json').read_text())['cases'];srefs=json.loads((ROOT/'analysis/primary_sources_fixtures.json').read_text())['cases'];cases=[]
 for i,c in enumerate(refs):
  r=c['inputs'];s={'0x'+n[1:]:v for n,v in srefs[i]['inputs'].items()};s['0x54b494']=r['pressure']
  for n,a in [('porv_area','0x54b138'),('safety_area','0x54b13c'),('level','0x54b4a0'),('reset_level','0x54b400'),('liquid_enthalpy','0x54b728'),('vapor_enthalpy','0x54b724'),('g54b6ac','0x54b6ac')]:s[a]=r[n]
  q=dict(globals=dict(singles=s,integers={'0x54b4d0':r['phase_flag']}),valves={n:r[n] for n in ['porv_a','porv_b','safety_valve']})
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/primary_relief_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n');print(len(cases),'composed primary-source/relief cases')
