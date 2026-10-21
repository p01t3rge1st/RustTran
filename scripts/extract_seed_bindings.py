#!/usr/bin/env python3
"""Extract reviewed IC field read/store chains and native conversion constants.
The COM field retrieval is established by BSTR and call-chain inspection;
subsequent numeric conversion blocks can be executed independently.
"""
import hashlib,json,re,struct
from native_math_oracle import ROOT,EXE,PE,BASE
import csv
fields=next(csv.reader((ROOT/'analysis/data/ListData/ICThermoData.csv').open()))[2:]
source=json.loads((ROOT/'analysis/rea/field-candidates.json').read_text())['items']
constants={}
assembly=(ROOT/'analysis/rea/all-native.asm').read_text().splitlines()
for line in assembly:
    m=re.search(r'^\s*([0-9a-f]+):.*mov\s+DWORD PTR ds:(0x54b[0-9a-f]+),(0x[0-9a-f]+)',line)
    if m and 0x51c340<=int(m[1],16)<=0x51c410:
        constants[m[2]]={'bits':int(m[3],16),'value':struct.unpack('<f',struct.pack('<I',int(m[3],16)))[0],'instruction':line.strip()}
result=[]; pending=[]
known_selectors={item["bstr_va"] for item in source}
for field in fields:
    item=next((i for i in source if i['field_name']==field),None)
    if not item or not item['references']:pending.append({'field':field,'reason':'no field-name reference located'});continue
    ref=item['references'][0];lines=ref['assembly_context']
    ref_va=int(ref['instruction'].split(':')[0],16)
    if not 0x4afbc0<=ref_va<0x4bab2a:pending.append({'field':field,'reason':'first reference outside the IC loader'});continue
    stop=next((i for i,line in enumerate(lines) if re.search(r'\bfstp\s+DWORD PTR ds:0x54',line)),None)
    if stop is None:pending.append({'field':field,'reason':'integer/control binding requires separate recovery'});continue
    context=lines[:stop+1]
    selectors=[m[1] for line in context if (m:=re.search(r'mov\s+ecx,(0x4[0-9a-f]+)',line)) and m[1] in known_selectors]
    if selectors!=[item['bstr_va']]:pending.append({'field':field,'reason':'ambiguous field selector before store'});continue
    store=context[-1];target=re.search(r'ds:(0x54[0-9a-f]+)',store)[1];va=int(store.strip().split(':')[0],16)
    reads=[(i,re.search(r'\bmov\s+\w+,(?:DWORD PTR )?ds:(0x54b[0-9a-f]+)',line)) for i,line in enumerate(context)]
    reads=[(i,m[1]) for i,m in reads if m]
    if reads:
        if reads[0][1] not in constants:raise RuntimeError((field,reads))
        start=int(context[reads[0][0]].strip().split(':')[0],16)
        factor=constants[reads[0][1]]['value'];offset=constants[reads[1][1]]['value'] if len(reads)>1 else 0
        divide=any('call' in line and '0x40117c' in line for line in context)
        mode='temperature' if offset else 'divide' if divide else 'multiply'
    else:
        start=int(context[-2].strip().split(':')[0],16);factor=1.;offset=0.;mode='single'
        assert 'call' in context[-2] and '0x401130' in context[-2]
    result.append({'field':field,'target':target,'start':hex(start),'stop':hex(va+6),'mode':mode,'factor':factor,'offset':offset,'bstr_va':item['bstr_va'],'assembly_context':context})
path=ROOT/'analysis/rea/seed-bindings.json';path.write_text(json.dumps({'scope':'IC loader numeric field-to-global conversions; not complete initialization','original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'constants':constants,'bindings':result,'pending':pending},indent=2)+'\n')
for r in result:print(r['field'],r['target'],r['mode'],r['factor'],r['offset'])

print(f'IC scalar fields: {len(result)}/{len(fields)} recovered; {len(pending)} pending.')
