#!/usr/bin/env python3
"""Find direct global derivative writes in native assembly.
Nearest preceding REA procedure labels are candidates, not body ownership.
Indirect pointer stores require subsequent data-flow analysis.
"""
import bisect,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
procs=json.loads((ROOT/'analysis/rea/procedures.json').read_text())['result']['structuredContent']['normalized_result']
entries=sorted((int(p['address'],16),p['value']) for p in procs if not p['procedure']['external'])
starts=[p[0] for p in entries]
states=json.loads((ROOT/'analysis/integration_states.json').read_text())['states']
targets={hex(p['new_derivative_va']):p['index'] for p in states}
assembly=subprocess.run(['objdump','-d','-Mintel',str(ROOT/'analysis/program/PCTran.exe')],check=True,capture_output=True,text=True).stdout
rows=[]
for line in assembly.splitlines():
    for addr,index in targets.items():
        if re.search(r'\b(fstp|fst|mov)\s+DWORD PTR ds:'+addr+r'(?:\s|,|$)',line):
            va=int(line.strip().split(':')[0],16);owner=entries[bisect.bisect_right(starts,va)-1]
            rows.append({'index':index,'derivative_va':addr,'instruction_va':hex(va),'nearest_preceding_procedure':hex(owner[0]),'instruction':line.strip()})
path=ROOT/'analysis/rea/derivative-writers.json';path.write_text(json.dumps(rows,indent=2)+'\n')
print(f'{len(rows)} direct writes. {path}')
