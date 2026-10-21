#!/usr/bin/env python3
"""Original coordinator 0x51dfdd–0x51e09f: gated source sum and phase fluxes.
Native step helper executes; critical-flow callee independently executes its
original numerical prefix/table interpolation. No source equipment dispatcher.
"""
import json,random,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from relief_oracle import critical
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x1000);u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for n,v in q.items():u.mem_write(int(n[1:],16),struct.pack('<f',v))
 u.mem_write(0x4010ac,struct.pack('<I',0x20000020));u.mem_write(0x20000020,b'\xd9\x1d'+struct.pack('<I',0x20000300)+b'\xd9\x05'+struct.pack('<I',0x20000300)+b'\xc3')
 def hook(u,a,size,data):
  if a==0x49b3a0:
   esp=u.reg_read(UC_X86_REG_ESP);pp,fp=struct.unpack('<2I',u.mem_read(esp+4,8));p=struct.unpack('<f',u.mem_read(pp,4))[0];phase=struct.unpack('<h',u.mem_read(fp,2))[0]
   value=critical(p,phase);u.mem_write(0x20000200,struct.pack('<f',value));u.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x08\x00');u.reg_write(UC_X86_REG_EIP,0x20000000)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x51dfdd,0x51e09f,count=2000);assert u.reg_read(UC_X86_REG_EIP)==0x51e09f
 return {hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b6c4,0x54ba44,0x54ba48]}
if __name__=='__main__':
 rng=random.Random(20261022);cases=[]
 for i in range(300):
  q={k:f32(v) for k,v in dict(g54b6e0=[9.999999,10.,10.000001][i%3] if i<90 else rng.uniform(0,100),g54ba20=rng.uniform(0,1000),g54ba1c=rng.uniform(0,100),g54b804=rng.uniform(0,100),g54ba28=rng.uniform(0,100),g54b494=rng.uniform(100,2600)).items()};cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/primary_sources_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'coordinator primary-source cases')
