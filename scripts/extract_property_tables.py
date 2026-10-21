#!/usr/bin/env python3
"""Recover binary32 array initializers using straight-line x86 MOV data flow."""
from pathlib import Path
import hashlib,json,re,struct,subprocess
binary=Path('analysis/program/PCTran.exe');b=binary.read_bytes();base=0x400000
text=subprocess.check_output(['objdump','-d','-Mintel','--start-address=0x51c42d','--stop-address=0x51d2df',str(binary)],text=True)
Path('analysis/property_tables_disassembly.txt').write_text(text)
regs={};tables={p:{} for p in [0x54b380,0x54b39c,0x54b364,0x54b348,0x54b3b8,0x54b3d4,0x54b3f0]}
for line in text.splitlines():
 m=re.match(r'\s*([0-9a-f]+):\s+([0-9a-f ]+)\s+mov\s+(.+)',line)
 if not m:continue
 va=int(m[1],16);operands=m[3];dst,src=operands.split(',',1)
 if re.fullmatch('e(?:ax|bx|cx|dx|si|di|bp)',dst):
  if src.startswith('0x'):regs[dst]=('bits',int(src,16),va)
  elif src.startswith(('DWORD PTR ds:0x','ds:0x')):regs[dst]=('pointer',int(src.split(':')[1],16),va)
  elif src in regs:regs[dst]=regs[src]
  else:regs.pop(dst,None)
  continue
 st=re.fullmatch(r'DWORD PTR \[(e\w+)(?:\+(0x[0-9a-f]+))?\]',dst)
 if not st:continue
 reg=regs.get(st[1]);offset=int(st[2] or '0',16)
 if not reg or reg[0]!='pointer' or reg[1] not in tables:continue
 if src.startswith('0x'):bits=int(src,16);origin=va
 else:
  assert src in regs and regs[src][0]=='bits',(hex(va),src,regs)
  bits,origin=regs[src][1:]
 index=offset//4;assert offset%4==0
 assert index not in tables[reg[1]],(hex(va),index)
 # Instruction length from x86 addressing mode: MOV imm32 or MOV register.
 op=b[va-base];modrm=b[va-base+1];mod=modrm>>6;length=2+(1 if mod==1 else 4 if mod==2 else 0)+(4 if op==0xc7 else 0)
 tables[reg[1]][index]=dict(index=index,value=struct.unpack('<f',struct.pack('<I',bits))[0],bits=f'{bits:08x}',store_va=va,source_va=origin,pointer_load_va=reg[2],instruction_hex=b[va-base:va-base+length].hex())
labels={0x54b380:('saturation_temperature',44,'degrees F (inferred)'),0x54b39c:('saturation_pressure_44',44,'psia (inferred)'),0x54b364:('saturation_pressure_68',68,'psia (inferred)'),0x54b348:('saturated_vapor_specific_volume',68,'ft^3/lb (inferred)'),0x54b3b8:('auxiliary_grid',16,'unresolved'),0x54b3d4:('auxiliary_curve_1',16,'unresolved'),0x54b3f0:('auxiliary_curve_2',16,'unresolved')}
result={'binary':str(binary),'sha256':hashlib.sha256(b).hexdigest(),'initializer_start_va':0x51c42d,'initializer_end_va':0x51d2df,'arrays':[]}
lines=['# Native property tables','', 'Extracted from straight-line native MOV initialization, without executing PCTran. Values preserve original IEEE754 binary32 bit patterns. Array descriptors contain the data-pointer field at +0x0c. Scientific labels and imperial units are inferred from values and callers.','', '| Name | Descriptor VA | Data pointer VA | Count | First | Last |','|---|---|---|---:|---:|---:|']
for ptr,slots in tables.items():
 name,count,units=labels[ptr];assert sorted(slots)==list(range(count)),(hex(ptr),sorted(slots))
 entries=[slots[i] for i in range(count)];arr={'name':name,'descriptor_va':ptr-12,'data_pointer_va':ptr,'count':count,'units':units,'values':[e['value'] for e in entries],'evidence':entries};result['arrays'].append(arr)
 lines.append(f"| {name} | {ptr-12:#x} | {ptr:#x} | {count} | {entries[0]['value']:.9g} | {entries[-1]['value']:.9g} |")
 print(name,count,arr['values'][:3],arr['values'][-3:])
lines+=['','`0x49bde0` interpolates temperature44 → pressure44. `0x49beb0` interpolates pressure44 → temperature44 (TLIQ inference). `0x49be30` interpolates specific-volume68 → pressure68; `0x49c190` interpolates pressure68 → specific-volume68. Directions follow actual INTP argument order confirmed by reverse-order stack pushes and REA pseudocode in analysis/rea/property-wrappers.json. Address 0x49c180 is within VFLD tail/padding, not the inverse wrapper entry. HFLD, HGAS and VFLD themselves use polynomial coefficients, rather than these tables.','', 'Each JSON entry includes initializer instruction VA, data-pointer load VA, source instruction VA, exact store instruction bytes, and float bits. Register constants reused across stores are tracked through MOV instructions. All 272 table slots must be assigned exactly once in index order coverage; missing values fail extraction.','', 'Run `python3 scripts/extract_property_tables.py`. The native initializer disassembly is preserved in `analysis/property_tables_disassembly.txt`.']
result['wrapper_mappings']=[dict(entry_va=0x49bde0,x_descriptor_va=0x54b374,y_descriptor_va=0x54b390),dict(entry_va=0x49beb0,x_descriptor_va=0x54b390,y_descriptor_va=0x54b374,name_candidate='TLIQ'),dict(entry_va=0x49be30,x_descriptor_va=0x54b33c,y_descriptor_va=0x54b358),dict(entry_va=0x49c190,x_descriptor_va=0x54b358,y_descriptor_va=0x54b33c)]
Path('analysis/property_tables.json').write_text(json.dumps(result,indent=2)+'\n');Path('analysis/PROPERTY_TABLES_FINDINGS.md').write_text('\n'.join(lines)+'\n')
