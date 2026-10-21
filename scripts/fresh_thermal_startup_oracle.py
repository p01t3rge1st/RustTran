#!/usr/bin/env python3
"""Connected fresh primary/SG inventories, heat-transfer coefficient, SG phases,
feedwater and coolant flows: original 0x51b357–0x51ba28 in one frame, including cached auxiliary/tank/thermal states, followed
by reference/level stores. 110 source model/operating-point combinations.
Earlier loop-reference outputs are native fixtures; original property prefixes
are independent. No full plant initialization, integration or GUI trajectories.
"""
import json,hashlib
from native_math_oracle import ROOT,EXE
from late_thermal_init_oracle import execute as late
from thermal_driving_oracle import execute as coefficient
from startup_primitives_oracle import execute as primitive
from fresh_primary_oracle import execute
models={}
for c in json.loads((ROOT/'analysis/model_seed_fixtures.json').read_text())['cases']:
 if not c['curve']:models.setdefault(c['set'],{})[c['target']]=c['expected']
ics={}
for c in json.loads((ROOT/'analysis/field_conversion_fixtures.json').read_text())['seed_cases']:ics.setdefault(c['ic'],{})[c['target']]=c['expected']
cases=[]
for c in json.loads((ROOT/'analysis/loop_reference_fixtures.json').read_text())['cases']:
 merged=models[c['model']]|ics[c['ic']]|c['inputs']|c['expected']|{'0x54b330':948.0555419921875}
 q={'g'+a[2:]:v for a,v in merged.items()}
 out=execute(q,True,True,True,True)
 out['singles'].update(coefficient({'g'+a[2:]:merged[a] for a in ['0x54b330','0x54b120','0x54b2a0','0x54b128']},[(0x51b0fe,0x51b132)],[0x54b6fc]))
 out['singles']['0x54b330']=merged['0x54b330']
 constants=primitive();out['singles'].update(constants['singles']);out['integers'].update(constants['integers']);out['singles'].update(primitive({a:merged[a] for a in ['0x54b470','0x54b46c','0x54b220','0x54b1bc']}))
 post=late(dict(globals=dict(singles=merged|out['singles'],integers=out['integers'])))
 out['singles'].update(post['singles']);out['integers'].update(post['integers'])
 cases.append(dict(inputs=dict(model=c['model'],ic=c['ic']),expected=out))
(ROOT/'analysis/fresh_thermal_startup_fixtures.json').write_text(json.dumps(dict(method=__doc__+" Late numeric initializer slices follow; external-model/COM/history-array/event paths remain excluded.",original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'connected primary/SG startup cases')
