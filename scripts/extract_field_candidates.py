#!/usr/bin/env python3
"""Collect BSTR references to recovered field names; candidates, not bindings."""
import csv,json,re,struct
from pathlib import Path
import pefile
ROOT=Path(__file__).resolve().parents[1]
p=pefile.PE(str(ROOT/'analysis/program/PCTran.exe'));raw=p.__data__;base=p.OPTIONAL_HEADER.ImageBase
names=list(dict.fromkeys([*next(csv.reader((ROOT/'analysis/data/ListData/ICThermoData.csv').open())),*next(csv.reader((ROOT/'analysis/data/ListData/BasicData.csv').open())), 'TIME']))
lines=(ROOT/'analysis/rea/all-native.asm').read_text().splitlines()
references={}
for index,line in enumerate(lines):
    for address in re.findall(r'\b0x([0-9a-f]+)\b',line): references.setdefault(int(address,16),[]).append(index)
items=[]
for name in names:
    encoded=name.encode('utf-16le');start=0
    while (offset:=raw.find(encoded,start))>=0:
        start=offset+len(encoded)
        if offset<4 or struct.unpack_from('<I',raw,offset-4)[0]!=len(encoded):continue
        address=base+p.get_rva_from_offset(offset)
        refs=[]
        for index in references.get(address,[]):
            following=lines[index:index+100]
            stores=[line.strip() for line in following if re.search(r'\bfstp\s+DWORD PTR ds:0x54',line)]
            refs.append({'instruction':lines[index].strip(),'following_direct_single_stores':stores,'assembly_context':following})
        items.append({'field_name':name,'bstr_va':hex(address),'references':refs})
path=ROOT/'analysis/rea/field-candidates.json';path.write_text(json.dumps({'scope':'BSTR references and nearby stores only; data-flow, field identity and unit conversion unverified','items':items},indent=2)+'\n')
for item in items:print(item['field_name'],item['bstr_va'],len(item['references']),[r['following_direct_single_stores'] for r in item['references']])
