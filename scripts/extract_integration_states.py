#!/usr/bin/env python3
"""Recover EULER global byref variant operands from the core native call sites."""
from pathlib import Path
import struct,json,hashlib
b=Path('analysis/program/PCTran.exe').read_bytes();base=0x400000;start=0x123f3b;end=0x12454f;last=start;states=[]
semantics={0x54b494:('primary-system pressure','high','REA core lines298-305 passes this to pressure-to-volume,HFLD,HGAS,VFLD; pressure differences at1351,1374'),0x54b4fc:('paired subsystem pressure A','medium','REA core line1374 forms primary pressure minus this; component identity unproven'),0x54b500:('paired subsystem pressure B','medium','REA core line1351 forms primary pressure minus this; component identity unproven'),0x54b504:('bounded fraction A; component unresolved','medium','native post-call clamp max1 at52417f..52419a'),0x54b508:('bounded fraction B; component unresolved','medium','native post-call clamp max1 at5241f5..524210'),0x54b4f4:('nonnegative paired state A; component unresolved','low','native post-call clamp min0 at524382 onward'),0x54b4f8:('nonnegative paired state B; component unresolved','low','native post-call clamp min0 at5243a4 onward')}
for o in range(start,end-4):
 if b[o]!=0xe8 or o+5+struct.unpack_from('<i',b,o+1)[0]!=0x9a830:continue
 vals=[];evidence=[]
 for slot,disp in [('state','e0feffff'),('previous_derivative','00ffffff'),('new_derivative','10ffffff')]:
  p=b.rfind(bytes.fromhex('c785'+disp),last,o);assert p>=last
  value=struct.unpack_from('<I',b,p+6)[0];vals.append(value);evidence.append(dict(role=slot,instruction_va=base+p,instruction_hex=b[p:p+10].hex(),global_va=value))
 state,previous,new=vals;candidate,strength,reason=semantics.get(state,('unresolved integrated state','unresolved','no source field name established'))
 states.append(dict(index=len(states)+1,call_va=base+o,state_va=state,new_derivative_va=new,previous_derivative_va=previous,step_va=0x54b414,variant_type=0x4004,variable_candidate=candidate,semantic_evidence_strength=strength,semantic_evidence=reason,address_mapping_evidence_strength='exact native operands',operand_evidence=evidence))
 last=o+5
assert len(states)==14
result=dict(binary_sha256=hashlib.sha256(b).hexdigest(),core_entry_va=0x51d3d0,euler_entry_va=0x49a830,step_va=0x54b414,variant_type_description='VT_BYREF | VT_R4 (0x4004)',call_argument_order=['new_derivative_variant','previous_derivative_variant','step_variant','state_variant'],common_step_evidence=dict(instruction_va=0x523f5a,instruction_hex=b[0x123f5a:0x123f5f].hex(),description='EDI=0x54b414; every call stores EDI into step variant payload atEBP-0x110'),states=states,core_preintegration_helper_va=0x4fa8e0,source_evidence='analysis/rea/0x51d3d0.c and analysis/core_integration_disassembly.txt')
Path('analysis/integration_states.json').write_text(json.dumps(result,indent=2)+'\n')
for q in states:print(q['index'],hex(q['state_va']),hex(q['new_derivative_va']),hex(q['previous_derivative_va']))
