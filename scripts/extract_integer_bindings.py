#!/usr/bin/env python3
"""Recover short/long IC field conversions from native call/store operands."""
import json,re
from native_math_oracle import ROOT
path=ROOT/'analysis/rea/seed-bindings.json';doc=json.loads(path.read_text());source=json.loads((ROOT/'analysis/rea/field-candidates.json').read_text())['items']
result=[];pending=[]
for item in doc['pending']:
    field=item['field'];candidate=next((c for c in source if c['field_name']==field),None)
    if not candidate or not candidate['references']:pending.append(item);continue
    ctx=candidate['references'][0]['assembly_context']
    call=next((i for i,line in enumerate(ctx) if re.search(r'call.*ds:0x401(1a0|20c)',line)),None)
    if call is None:pending.append(item);continue
    tail=ctx[call+1:];store=next((line for line in tail if re.search(r'\bmov\s+ds:0x54[0-9a-f]+,(?:ax|eax)$',line)),None)
    if store is None:pending.append(item);continue
    target=re.search(r'ds:(0x54[0-9a-f]+)',store)[1];bits=16 if store.endswith(',ax') else 32
    start=int(ctx[call].strip().split(':')[0],16);va=int(store.strip().split(':')[0],16)
    result.append({'field':field,'target':target,'bits':bits,'start':hex(start),'stop':hex(va+(6 if bits==16 else 5)),'assembly_context':ctx[:ctx.index(store)+1]})
doc['integer_bindings']=result;doc['pending']=pending;path.write_text(json.dumps(doc,indent=2)+'\n')
print(f'{len(result)} integer bindings; {len(pending)} IC fields pending.')
