#!/usr/bin/env python3
"""Compare original x86 helper instructions with the packaged RustTran CLI.
Not an end-to-end test of the Windows application or reactor transient engine.
Run using .tools/python/bin/python scripts/compare_numeric.py.
"""
import argparse, csv, hashlib, json, math, random, struct, subprocess
from comparison_html import render_html
from pathlib import Path
from native_math_oracle import emulate, EXE, PE, BASE
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--rust-cli',type=Path,default=ROOT/'dist/rusttran-linux-x86_64/rusttran-cli')
p.add_argument('--output',type=Path,default=ROOT/'analysis/comparison')
a=p.parse_args(); binary=a.rust_cli.resolve(); a.output.mkdir(parents=True,exist_ok=True)
def ordered(value):
    bits=struct.unpack('<I',struct.pack('<f',value))[0]
    return (~bits & 0xffffffff) if bits & 0x80000000 else bits | 0x80000000
# All time inputs remain in 0–300 s. Seeded samples are reproducible.
rng=random.Random(20261013)
times=sorted(set([*range(0,301,5), 0.001, 0.1, 1, 9.999999, 10.000001, 149.999, 150.001, *[round(rng.uniform(0,300),6) for _ in range(25)]]))
cases=[('DECAY',[t]) for t in times]
for function, thresholds in [('HFLD',[0x401ad8]),('HGAS',[0x401bb0,0x401b68]),('VFLD',[0x401bb0])]:
    pressures=[0.1,1,10,14.7,30,70,100,158.2,220,500,1000,2200,3000]
    for address in thresholds:
        bits=struct.unpack('<I',PE.get_data(address-BASE,4))[0]
        pressures += [struct.unpack('<f',struct.pack('<I',bits+offset))[0] for offset in [-1,0,1]]
    pressures += [round(rng.uniform(1,3000),6) for _ in range(15)]
    cases += [(function,[value]) for value in sorted(set(pressures))]
bits=struct.unpack('<I',struct.pack('<f',220))[0]
temperatures=[32,100,*[struct.unpack('<f',struct.pack('<I',bits+offset))[0] for offset in [-1,0,1]],300,500,680]
cases += [('HLIQ',[pressure,temp]) for pressure in [14.7,100,500,2200] for temp in temperatures]
# Isolated integrator cases; time steps also never exceed 300 s.
cases += [('EULER',values) for values in [[1,1,2,3],[2,1,2,3],[10,1,2,3],[0.0001,0,1,0],[1,2,2,3],[1,3.002,2,3],[1,3.003,2,3],[1,10,2,3],[-0.5,1,2,3],[0,0,1,10],[1,1,0,3],[1,1,300,3]]]
cases += [('EULER',[round(rng.uniform(-10,10),6),round(rng.uniform(-10,10),6),round(rng.uniform(0.01,10),6),round(rng.uniform(-100,100),6)]) for _ in range(20)]
rows=[]; evidence=[]
for number,(function,inputs) in enumerate(cases,1):
    original=emulate(function,inputs); evidence.append(original)
    completed=subprocess.run([str(binary),'math',function,*map(str,inputs)],check=True,capture_output=True,text=True)
    response=json.loads(completed.stdout)
    actual=response['state' if function=='EULER' else 'value']; expected=original['output']
    absolute=abs(actual-expected); relative=absolute/max(abs(expected),1e-300)
    ulp=abs(ordered(actual)-ordered(expected)) if function not in ('HLIQ','EULER') else None
    tolerance=max(1,abs(expected))*(1e-7 if function=='EULER' else 1e-10)
    passed=math.isfinite(actual) and (absolute<=tolerance if function in ('HLIQ','EULER') else ulp<=2)
    previous_matches=response.get('previous_derivative')==original['post_arguments'][1] if function=='EULER' else None
    if function=='EULER': passed=passed and previous_matches
    row={'test':number,'function':function,'inputs':json.dumps(inputs),'original_x86':expected,'rusttran':actual,'absolute_difference':absolute,'relative_difference':relative,'float32_ulp':ulp,'previous_derivative_matches':previous_matches,'result':'PASS' if passed else 'FAIL'}
    rows.append(row)
    print(f"{number:02d} {function:5s} {str(inputs):24s} PCTran-x86={expected:.12g} RustTran={actual:.12g} difference={absolute:.3g} {row['result']}")
with (a.output/'results.csv').open('w',newline='') as stream:
    writer=csv.DictWriter(stream,fieldnames=rows[0].keys());writer.writeheader();writer.writerows(rows)
limitations=['Original numerical prefixes run in Unicorn with modeled VB6 numeric helpers; not the full Windows application or original MSVBVM60 runtime.', 'DECAY times are inputs to an isolated decay correlation, not simulated reactor trajectories.', 'Full 0–300 s scenario comparisons are unavailable: RustTran transient engine is incomplete.', 'Property helper inputs use original units (pressure psia, temperature degF); no metric conversion.']
report={'scope':'Numerical helper comparison only','time_range_seconds':[0,300],'decay_time_points':len(times),'random_seed':20261013,'passed':sum(r['result']=='PASS' for r in rows),'total':len(rows),'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'rust_cli_sha256':hashlib.sha256(binary.read_bytes()).hexdigest(),'limitations':limitations,'results':rows,'original_execution_evidence':evidence}
(a.output/'results.json').write_text(json.dumps(report,indent=2)+'\n')
lines=['# RustTran / PCTran numerical helper comparison','',f"Result: {report['passed']}/{len(rows)} passed.",'',*['- '+item for item in limitations],'','Acceptance: at most 2 float32 ULP for DECAY/HFLD/HGAS/VFLD; HLIQ absolute error <= max(1, abs(reference)) × 1e-10; EULER <= max(1, abs(reference)) × 1e-7 and exact previous derivative update.','','| Test | Function | Inputs | Original x86 | RustTran | Absolute difference | Result |','|---:|---|---|---:|---:|---:|---|']
for r in rows: lines.append(f"| {r['test']} | {r['function']} | {r['inputs']} | {r['original_x86']:.12g} | {r['rusttran']:.12g} | {r['absolute_difference']:.3g} | {r['result']} |")
(a.output/'REPORT.md').write_text('\n'.join(lines)+'\n')
render_html(report, a.output/'results.html')
print(f"\nResult: {report['passed']}/{len(rows)} passed. Report: {a.output/'REPORT.md'}")
raise SystemExit(0 if report['passed']==len(rows) else 1)
