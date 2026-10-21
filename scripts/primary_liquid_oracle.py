#!/usr/bin/env python3
"""Original PSAT/VLIQ/HLIQ property preparation for primary P/T states.
VLIQ wrapper executes original x86 with independent property prefixes; HLIQ
executes its original numeric prefix with numeric VB helpers, then a Single
store. Explicit 53-bit precision for VLIQ; not a full coordinator execution.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE,emulate
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(p,t):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000);stack=0x1001f000;u.reg_write(UC_X86_REG_ESP,stack);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(stack,struct.pack('<III',0x20000f00,0x20000100,0x20000110));u.mem_write(0x20000100,struct.pack('<f',p));u.mem_write(0x20000110,struct.pack('<f',t));u.mem_write(0x54b000,bytes(4))
 def hook(machine,a,size,_):
  if a in [0x49bde0,0x49bf00]:
   esp=machine.reg_read(UC_X86_REG_ESP);ptr=struct.unpack('<I',machine.mem_read(esp+4,4))[0];value=struct.unpack('<f',machine.mem_read(ptr,4))[0];out=property_value(a,value);machine.mem_write(0x20000200,struct.pack('<f',out));machine.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x49c1e0,0x49c21c,count=2000);assert u.reg_read(UC_X86_REG_EIP)==0x49c21c
 volume=struct.unpack('<f',u.mem_read(stack+8,4))[0];return {'0x54b684':property_value(0x49bde0,t),'0x54b654':volume,'0x54b734':f32(emulate('HLIQ',[p,t])['output'])}
if __name__=='__main__':
 rng=random.Random(20261108);pairs=[(p,t) for p in [1,14.7,265,2200] for t in [60,219.999,220,220.001,680]]+[(rng.uniform(1,3000),rng.uniform(60,680)) for _ in range(180)];cases=[]
 for p,t in pairs:p,t=f32(p),f32(t);cases.append(dict(inputs=dict(pressure=p,temperature=t),expected=execute(p,t)))
 path=ROOT/'analysis/primary_liquid_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'primary liquid property cases')
