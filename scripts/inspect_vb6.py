#!/usr/bin/env python3
"""Read-only VB6 metadata and function-name BSTR cross-reference extractor."""
import argparse, hashlib, json, struct
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('binary',nargs='?',default='analysis/program/PCTran.exe');args=p.parse_args()
b=Path(args.binary).read_bytes();base=0x400000
u=lambda o:struct.unpack_from('<I',b,o)[0]
h=lambda o:struct.unpack_from('<H',b,o)[0]
# PE section mapping avoids treating heap pointers as disk addresses.
pe=u(0x3c);sections=[]
for i in range(h(pe+6)):
 o=pe+24+h(pe+20)+40*i
 sections.append(dict(name=b[o:o+8].rstrip(b'\0').decode(),virtual_size=u(o+8),rva=u(o+12),raw_size=u(o+16),raw=u(o+20)))
def off(va):
 rva=va-base
 for s in sections:
  if s['rva']<=rva<s['rva']+s['raw_size']:return s['raw']+rva-s['rva']
 raise ValueError(hex(va))
def cstr(va):
 o=off(va);return b[o:b.index(b'\0',o)].decode('latin1')
header=b.index(b'VB5!');project=off(u(header+0x30));table=off(u(project+4));array=off(u(table+0x30));objects=[]
for i in range(h(table+0x2a)):
 o=array+48*i;info=off(u(o));count=u(o+28);names=[]
 if u(o+32):
  n=off(u(o+32))
  for j in range(count):
   try:names.append(cstr(u(n+4*j)))
   except ValueError:names.append(None)
 obj=dict(index=i,name=cstr(u(o+24)),descriptor_va=base+o,info_va=u(o),declared_method_count=count,method_names=names,object_type=u(o+40),retained_method_count=h(info+32),method_table_va=u(info+36))
 try:
  m=off(obj['method_table_va']);obj['retained_method_slots']=[u(m+4*j) for j in range(obj['retained_method_count'])]
 except ValueError:obj['method_table_file_backed']=False
 objects.append(obj)
procedures=[]
# These BSTR literals are assigned to current-procedure name during error paths.
for name in ['DECAY','EULER','HFLD','HGAS','HLIQ','INTP','REG','TLIQ','VFLD']:
 needle=name.encode('utf-16le');s=b.find(needle);refs=[];start=0
 while s>=0:
  address=base+s;packed=struct.pack('<I',address);r=0
  while (r:=b.find(packed,r))>=0:
   entry=b.rfind(bytes.fromhex('558bec'),0,r)
   valid=b[entry+6:entry+7]==b'\x68' or b[entry+3:entry+5]==b'\x81\xec'
   refs.append(dict(operand_file_offset=r,instruction_va=base+r-1,nearest_prologue_va=base+entry,prologue_hex=b[entry:entry+32].hex(),prologue_pattern_valid=valid))
   r+=4
  procedures.append(dict(name=name,bstr_va=address,bstr_length=u(s-4),references=refs));s=b.find(needle,s+len(needle))
result=dict(binary=args.binary,sha256=hashlib.sha256(b).hexdigest(),image_base=base,sections=sections,vb_header_file_offset=header,project_data_va=base+project,object_table_va=base+table,object_count=len(objects),objects=objects,named_procedures=procedures,structure_source='https://github.com/williballenthin/python-vb/blob/master/vb/__init__.py')
result['optimized_helpers']=[dict(entry_va=0x49bde0,callee_va=0x49b430,table_count=44,x_descriptor=0x54b374,y_descriptor=0x54b390,mapping='temperature -> pressure'),dict(entry_va=0x49be30,callee_va=0x49b430,table_count=68,x_descriptor=0x54b33c,y_descriptor=0x54b358,mapping='specific volume -> pressure'),dict(entry_va=0x49beb0,callee_va=0x49b430,table_count=44,x_descriptor=0x54b390,y_descriptor=0x54b374,mapping='pressure -> temperature',name_candidate='TLIQ',confidence='semantic inference; no literal xref'),dict(entry_va=0x49c190,callee_va=0x49b430,table_count=68,x_descriptor=0x54b358,y_descriptor=0x54b33c,mapping='pressure -> specific volume'),dict(entry_va=0x49be80,behavior='single precision 0/1 threshold helper')]
Path('analysis/vb6.json').write_text(json.dumps(result,indent=2)+'\n')
lines=['# VB6 metadata findings','',f"Binary SHA256: `{result['sha256']}`.",'',f'VB5! header file offset `{header:#x}`, ProjectData `{base+project:#x}`, ObjectTable `{base+table:#x}`. {len(objects)} objects.','', '## Procedure addresses from name literals','', 'Names below are UTF16 BSTR literals, referenced from code that assigns the current procedure name. Entry addresses are the nearest preceding native VB6 stack-frame prologue; confirm against disassembly before treating these as full signatures.','', '| Name | BSTR VA | Reference instruction | Entry candidate |','|---|---|---|---|']
for q in procedures:
 for r in q['references']:lines.append(f"| {q['name']} | {q['bstr_va']:#x} | {r['instruction_va']:#x} | {r['nearest_prologue_va']:#x} |")
lines+=['','## Objects','', '| Object | Declared methods | Retained names |','|---|---:|---:|']
for o in objects:lines.append(f"| {o['name']} | {o['declared_method_count']} | {len(o['method_names'])} |")
lines+=['','Module method names are absent (`lpMethodNames=0`). Most `ObjectInfo.lpMethods` values are non-file-backed runtime heap pointers and method counts are zero, so a descriptor-only procedure address mapping would be misleading. Form names are retained in public descriptors. Native names above instead use independently observed BSTR references.','', '## Source and reproducibility','', '[python-vb structure definitions](https://github.com/williballenthin/python-vb/blob/master/vb/__init__.py); a snapshot is preserved at `analysis/sources/python-vb-structures.py`.','', 'Run `python3 scripts/inspect_vb6.py`. The extractor reads the executable and writes only analysis artifacts; no target modifications.']
lines += ['', '## Optimized helpers', '', 'TLIQ and REG literals have no absolute references. Actual INTP arguments were confirmed by reverse-order x86 stack pushes and REA pseudocode in analysis/rea/property-wrappers.json. Helper 0x49bde0 interpolates temperature -> pressure (x descriptor 0x54b374, y 0x54b390), and is called by HLIQ before HFLD. Helper 0x49beb0 interpolates pressure -> temperature and is the inferred TLIQ. Helper 0x49be30 interpolates specific volume -> pressure (x 0x54b33c, y 0x54b358); helper 0x49c190 reverses this mapping. Address 0x49c180 is within the preceding VFLD tail jump/padding, not the wrapper entry. Helper 0x49be80 returns a threshold-dependent 0 or 1.']
Path('analysis/VB6_FINDINGS.md').write_text('\n'.join(lines)+'\n')
for q in procedures:print(q['name'],[(hex(r['nearest_prologue_va']),hex(r['instruction_va'])) for r in q['references']])
