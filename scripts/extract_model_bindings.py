#!/usr/bin/env python3
"""Recover straight scalar BasicData read/conversion/store chains from assembly."""
import csv,json,re,struct
from native_math_oracle import ROOT,EXE
path=ROOT/'analysis/rea/seed-bindings.json';constants=json.loads(path.read_text())['constants']
source=json.loads((ROOT/'analysis/rea/field-candidates.json').read_text())['items'];selectors={i['bstr_va'] for i in source}
# Original initializer 0x51c326–0x51c41d: 3413000 / 3600, stored as Single.
from native_math_oracle import PE,BASE
numerator=struct.unpack('<f',PE.get_data(0x40395c-BASE,4))[0]
denominator=struct.unpack('<f',PE.get_data(0x403958-BASE,4))[0]
value=struct.unpack('<f',struct.pack('<f',numerator/denominator))[0]
constants['0x54b330']={'bits':struct.unpack('<I',struct.pack('<f',value))[0],'value':value,'instruction':'0x51c326 FDIV literals -> 0x51c41d FSTP 0x54b330','source_literals':['0x40395c','0x403958']}
fields=next(csv.reader((ROOT/'analysis/data/ListData/BasicData.csv').open()))[2:];bindings=[];pending=[]
for field in fields:
    item=next((i for i in source if i['field_name']==field),None)
    refs=[r for r in item['references'] if 0x4c7340<=int(r['instruction'].split(':')[0],16)<0x4ce910] if item else []
    if len(refs)!=1:pending.append({'field':field,'reason':'indexed/indirect field getter or nonunique scalar selector'});continue
    curve_match=re.fullmatch(r'(PH|WH|PL|WL)\(([1-7])\)',field)
    lines=refs[0]['assembly_context'];end=next((i for i,l in enumerate(lines) if (re.search(r'fstp\s+DWORD PTR \[ecx(?:\+0x[0-9a-f]+)?\]',l) if curve_match else re.search(r'fstp\s+(?:DWORD|QWORD) PTR ds:0x54',l))),None)
    if end is None:pending.append({'field':field,'reason':'no direct Single store'});continue
    ctx=lines[:end+1]
    names=[m[1] for l in ctx if (m:=re.search(r'mov\s+ecx,(0x4[0-9a-f]+)',l)) and m[1] in selectors]
    if names!=[item['bstr_va']]:pending.append({'field':field,'reason':'ambiguous field read/store chain'});continue
    numeric_ctx=ctx[:next(i for i,l in enumerate(ctx) if 'call' in l and '0x401130' in l)+1] if curve_match else ctx
    reads=[(i,m[1]) for i,l in enumerate(numeric_ctx) if (m:=re.search(r'mov\s+\w+,(?:DWORD PTR )?ds:(0x54b[0-9a-f]+)',l))]
    if len(reads)>2 or any(addr not in constants for i,addr in reads):pending.append({'field':field,'reason':'unresolved conversion operands'});continue
    if reads:
        start=int(ctx[reads[0][0]].strip().split(':')[0],16);factor=constants[reads[0][1]]['value'];offset=constants[reads[1][1]]['value'] if len(reads)>1 else 0
        divide=any('call' in l and '0x40117c' in l for l in ctx);mode='temperature' if offset else 'divide' if divide else 'multiply'
    else:
        if not ('call' in ctx[-2] and ('0x401130' in ctx[-2] or '0x4011f0' in ctx[-2])):pending.append({'field':field,'reason':'nonstandard numeric conversion'});continue
        start=int(ctx[-2].strip().split(':')[0],16);factor=1;offset=0;mode='single'
    store=ctx[-1]
    if curve_match:
        base=next(re.search(r'mov\s+ecx,DWORD PTR ds:(0x54[0-9a-f]+)',line)[1] for line in reversed(ctx[:-1]) if re.search(r'mov\s+ecx,DWORD PTR ds:(0x54[0-9a-f]+)',line))
        suffix=re.search(r'\[ecx(?:\+(0x[0-9a-f]+))?\]',store)[1]
        index=(int(suffix,16) if suffix else 0)//4
        assert index==int(curve_match[2])-1,(field,index)
        target=base
        stop=int(store.strip().split(':')[0],16)+len(store.split('\t')[1].split())
    else:
        target=re.search(r'ds:(0x54[0-9a-f]+)',store)[1];index=0;stop=int(store.strip().split(':')[0],16)+6
    bindings.append({'field':field,'target':target,'start':hex(start),'stop':hex(stop),'mode':mode,'factor':factor,'offset':offset,'curve':curve_match[1] if curve_match else '', 'index':index,'output_bits':64 if 'QWORD' in store else 32,'assembly_context':ctx})
# MDB REAL fields are Single-valued Variants; preserve their intermediate rounding.
schema=(ROOT/'analysis/data/ListData/schema.sql').read_text().split('CREATE TABLE IF NOT EXISTS "basicdata"',1)[1].split(');',1)[0]
types=dict(re.findall(r'"([^"\n]+)"\s+(DOUBLE PRECISION|REAL|INTEGER)',schema))
for binding in bindings:binding['source_type']=types[binding['field'].lower()]
(ROOT/'analysis/rea/model-bindings.json').write_text(json.dumps({'constants':constants,'bindings':bindings,'pending':pending},indent=2)+'\n')
for b in bindings:print(b['field'],b['target'],b['mode'],b['factor'],b['offset'],b['source_type'])
print(f'BasicData: {len(bindings)}/{len(fields)} scalar fields recovered, {len(pending)} pending.')
