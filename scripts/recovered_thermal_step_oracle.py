#!/usr/bin/env python3
"""Compose original mode-0 thermal driving, native caller bindings and both loop
bodies with recovered device/RCP, SG, balance and 14-state integration slices.
128 cases include shared event binding, 0-300 s clocks, threshold boundaries,
both feedwater activation paths and differing loop counts. Cached heat/level
outputs are deliberately absent. These are composed updates, not GUI scenarios.
"""
import copy,hashlib,json
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute
from thermal_driving_oracle import execute as native_coefficient
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_steam_system_step_fixtures.json').read_text())['cases']
 models=json.loads((ROOT/'analysis/model_seed_fixtures.json').read_text())['cases'];ics=json.loads((ROOT/'analysis/field_conversion_fixtures.json').read_text())['seed_cases'];ints=json.loads((ROOT/'analysis/integer_seed_fixtures.json').read_text())['cases'];refs=json.loads((ROOT/'analysis/loop_reference_fixtures.json').read_text())['cases'];starts=json.loads((ROOT/'analysis/fresh_thermal_startup_fixtures.json').read_text())['cases'];mg={};ig={};kg={};cases=[]
 for x in models:
  if not x['curve']:mg.setdefault(x['set'],{})[x['target']]=x['expected']
 for x in ics:ig.setdefault(x['ic'],{})[x['target']]=x['expected']
 for x in ints:
  if x['bits']==16:kg.setdefault(x['ic'],{})[x['target']]=x['expected']
 checkpoint=ROOT/'analysis/recovered_thermal_step.partial.json'
 if checkpoint.exists():cases=json.loads(checkpoint.read_text())
 for i in range(len(cases),128):
  q=copy.deepcopy(base[i%len(base)]['inputs']);g=q['globals'];s=g['singles'];c=q['controls'];j=i%len(refs);ref=refs[j];seed=mg[ref['model']]|ig[ref['ic']]|ref['expected']|starts[j]['expected']['singles']
  for a,v in seed.items():s.setdefault(a,v)
  for a,v in kg[ref['ic']].items():g['integers'].setdefault(a,v)
  s.update(native_coefficient({'g'+a[2:]:s[a] for a in ['0x54b330','0x54b120','0x54b2a0','0x54b128']},[(0x51b0fe,0x51b132)],[0x54b6fc]));s['0x54b190']=10000.;g['integers']['0x54bec8']=0
  c['clock']=[0.,149.99998474121094,150.,150.00001525878906,299.9999694824219,300.][i%6]
  c['normal_thermal']=dict(fault_flag=[-1,0,1,2][i%4],failure_time=150.)
  if i%2:
   e=dict(flags=[0]*20,delays=[0.]*20,times=[99999.]*20);e['flags'][7]=[-1,0,1,2][(i//2)%4];e['times'][8]=[0.,150.,300.][(i//2)%3];e['times'][6]=150.;e['flags'][8]=[0,-1][(i//2)%2];c['event_schedule']=e;c['normal_thermal'].update(fault_flag=73,failure_time=99999.)
  # Neither copied references nor heat/level results may be supplied as caches.
  for a in ['0x54b510','0x54b67c','0x54b680','0x54b6b8','0x54b6bc','0x54b844','0x54b848']:s.pop(a,None)
  cases.append(dict(inputs=q,expected=execute(q)))
  checkpoint.write_text(json.dumps(cases)+'\n')
  if (i+1)%16==0:print(i+1,'/128 native composed updates',flush=True)
 path=ROOT/'analysis/recovered_thermal_step_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'thermal-connected recovered steps');checkpoint.unlink(missing_ok=True)
