#!/usr/bin/env python3
"""Compose authenticated model/IC conversion, loop-reference, fresh thermal,
control-history and Double/array initializer outputs for all 110 source pairs.
Uses original-slice fixtures and independently executes original history and
Double bodies. This is recovered fresh state, not full startup/restore dispatch.
"""
import hashlib,json
from native_math_oracle import ROOT,EXE
from alternate_init_oracle import execute as alternate
from startup_clock_oracle import execute as clock
from fresh_control_history_oracle import execute as history
read=lambda name:json.loads((ROOT/f'analysis/{name}_fixtures.json').read_text())['cases']
models={};doubles={};conditions={};flags={}
for c in read('model_seed'):
 if not c['curve']:
  (doubles if c['output_bits']==64 else models).setdefault(c['set'],{})[c['target']]=c['expected']
for c in json.loads((ROOT/'analysis/field_conversion_fixtures.json').read_text())['seed_cases']:conditions.setdefault(c['ic'],{})[c['target']]=c['expected']
for c in read('integer_seed'):flags.setdefault(c['ic'],{})[c['target']]=c['expected']
references={(c['model'],c['ic']):c['expected'] for c in read('loop_reference')}
cases=[]
for i,c in enumerate(read('fresh_thermal_startup')):
 model,ic=c['inputs']['model'],c['inputs']['ic'];g=dict(singles=models[model]|conditions[ic]|references[model,ic]|c['expected']['singles'],integers=flags[ic]|c['expected']['integers']);alt=alternate(dict(globals=g,model_doubles=doubles[model]));g['integers'].update(clock(g['singles']['0x54b414']));g['singles'].update(alt['singles']);g['integers'].update(alt['integers']);fault=[0,-1,1,2][i%4];g['singles'].update(history(dict(globals=g,fault_flag=fault)));g['singles']['0x54b688']=g['singles']['0x54b4f0'];cases.append(dict(inputs=dict(model=model,ic=ic,fault_flag=fault),expected=dict(globals=g,alternate=alt,model_doubles=doubles[model])))
(ROOT/'analysis/fresh_initialized_state_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'composed source-backed fresh state cases')
