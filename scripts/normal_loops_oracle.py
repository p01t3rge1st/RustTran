#!/usr/bin/env python3
"""Composed original numeric slices: thermal coefficient, normal driving and both loops.
All 110 model/IC combinations at clocks 0, 150, 300 seconds. Explicitly normal
branch; no dispatcher or whole-plant integration. Reuses independent original
reference prefixes, original call-pointer evidence and original DLL power.
"""
import json,hashlib
from native_math_oracle import ROOT,EXE
from thermal_driving_oracle import execute
from loop_transfer_oracle import execute as loop
models=json.loads((ROOT/'analysis/model_seed_fixtures.json').read_text())['cases'];ics=json.loads((ROOT/'analysis/field_conversion_fixtures.json').read_text())['seed_cases'];ints=json.loads((ROOT/'analysis/integer_seed_fixtures.json').read_text())['cases'];mg={};ig={};kg={}
for c in models:
 if not c['curve']:mg.setdefault(c['set'],{})[c['target']]=c['expected']
for c in ics:ig.setdefault(c['ic'],{})[c['target']]=c['expected']
for c in ints:kg.setdefault(c['ic'],{})[c['target']]=c['expected']
bindings=json.loads((ROOT/'analysis/loop_transfer_bindings.json').read_text())['caller_bindings'];refs=json.loads((ROOT/'analysis/loop_reference_fixtures.json').read_text())['cases'];cases=[]
for ref in refs:
 for clock in [0.,150.,300.]:
  g=mg[ref['model']]|ig[ref['ic']]|ref['expected'];g['0x54b330']=948.0555419921875;g['0x54b40c']=clock
  init_inputs={'g'+a[2:]:g[a] for a in ['0x54b330','0x54b120','0x54b2a0','0x54b128']}
  g.update(execute(init_inputs,[(0x51b0fe,0x51b132)],[0x54b6fc]))
  inputs={'g'+a[2:]:g[a] for a in ['0x54b558','0x54b120','0x54b41c','0x54b330','0x54b550','0x54b498','0x54b6fc']}
  g.update(execute(inputs,[(0x51f476,0x51f4f2),(0x51f654,0x51f6c3),(0x51f6c3,0x51f6fb)],[0x54ba54,0x54ba64,0x54ba68,0x54b554,0x54bad4,0x54b56c]));outputs=[]
  for side,call in enumerate(bindings):
   args={}
   for i,arg in enumerate(call['arguments']):
    offset=8+i*4;name=f'p{offset:02x}'
    if offset in [8,0x28,0x34]:continue
    if offset==0x54:value=[150.,300.][side]
    elif offset==0x78:value=kg[ref['ic']]['0x54b4de'] if side==0 else round(g['0x54b204']-kg[ref['ic']]['0x54b4de'])
    elif offset==0x64:value=kg[ref['ic']][arg['pointer']]
    else:value=g[arg['pointer']]
    args[name]=value
   args['g54b768']=g['0x54b768'];out=loop(args)['expected'];outputs.append(out)
   for name in ['p08','p28','p34','p3c']:g[call['arguments'][(int(name[1:],16)-8)//4]['pointer']]=out[name]
  cases.append(dict(inputs=dict(model=ref['model'],ic=ref['ic'],clock=clock,failure_times=[150.,300.]),expected=outputs,coefficient=g['0x54b6fc']))
path=ROOT/'analysis/normal_loops_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'composed normal-loop cases')
