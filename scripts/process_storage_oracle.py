#!/usr/bin/env python3
"""Loader-mapped original PE bytes BEFORE application initialization: previous
Single derivatives, two integrated accumulators and two flow-history fields.
These are process-birth storage values, not proof of application fresh-start,
restored-IC or Reset semantics. No program instructions execute in this check.
"""
import json,hashlib,struct
from native_math_oracle import ROOT,PE,BASE,EXE
states=json.loads((ROOT/'analysis/integration_states.json').read_text())['states']
addresses=[x['previous_derivative_va'] for x in states]+[0x54bba0,0x54bf98,0x54b6d8,0x54bf9c]
image=PE.get_memory_mapped_image();values={};evidence=[]
for a in addresses:
 rva=a-BASE;raw=image[rva:rva+4];assert len(raw)==4
 section=next(s for s in PE.sections if s.VirtualAddress<=rva<s.VirtualAddress+max(s.Misc_VirtualSize,s.SizeOfRawData))
 values[hex(a)]=struct.unpack('<f',raw)[0]
 evidence.append(dict(address=hex(a),bytes=raw.hex(),section=section.Name.rstrip(b'\0').decode(),virtual_zero_fill=rva-section.VirtualAddress>=section.SizeOfRawData))
assert all(v==0. for v in values.values())
q=dict(model='1',ic='1',stages=[dict(kind='new_process_storage')])
(ROOT/'analysis/process_storage_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),evidence=evidence,cases=[dict(inputs=q,expected=values)]),indent=2)+'\n');print(len(values),'original loader storage fields')
