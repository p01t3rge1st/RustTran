#!/usr/bin/env python3
"""Generate native Single-by-reference EULER integration-stage fixtures.
Original EULER prefixes and numeric VB6/OLEAUT32 helpers execute in Unicorn.
OnError, Single FPU rounding and byref storage helpers remain modeled.
Coordinator constraints are supplied from independently recovered instructions,
not executed as a complete native coordinator. No plant derivative model.
"""
import json,random,struct,hashlib
from pathlib import Path
from native_math_oracle import emulate, EXE, ROOT
rng=random.Random(20261014)
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
cases=[]
for index in range(100):
    values=[f32(rng.uniform(-100,200)) for _ in range(14)]
    previous=[f32(rng.uniform(-5,5)) for _ in range(14)]
    derivatives=[f32(rng.uniform(-5,5)) for _ in range(14)]
    step=f32(rng.uniform(0.01,2));floor=f32(rng.uniform(0,160))
    outputs=[emulate('EULER',[d,p,step,v],single_byref=True,native_runtime=True) for d,p,v in zip(derivatives,previous,values)]
    expected=[o['output'] for o in outputs]
    copied=expected[0]
    expected[5]=min(expected[5],1);expected[6]=min(expected[6],1)
    expected[9]=max(expected[9],0);expected[10]=max(expected[10],0)
    if expected[3]<floor:expected[3]=f32(floor+0.1)
    cases.append({'values':values,'previous':previous,'derivatives':derivatives,'step':step,'pressure_floor':floor,'expected':expected,'copied_state':copied,'expected_previous':[o['post_arguments'][1] for o in outputs]})
out=ROOT/'analysis/integration_fixtures.json'
out.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261014,'cases':cases},indent=2)+'\n')
print(f'{len(cases)} integration-stage cases; {len(cases)*14} original EULER prefix executions. {out}')
