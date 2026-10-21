#!/usr/bin/env python3
"""Original fresh feedwater/coolant-share initialization 0x51b806–0x51b905.
HGAS independently executes its original numerical prefix. Explicit model and
reference inputs; no whole initializer, UI or Windows runtime context.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_FPCW,UC_X86_REG_EIP,UC_X86_REG_ESP,UC_X86_REG_EBP,UC_X86_REG_EDI
FLOATS=[0x54b54c,0x54b548,0x54b538,0x54b528,0x54b52c,0x54b564,0x54b530,0x54b534,0x54b560]
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x1000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_EDI,0);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4));u.mem_write(0x1001f000,struct.pack('<I',0x54b764))
 for n,v in q.items():u.mem_write(int(n[1:],16),struct.pack('<f',v))
 def hook(u,a,s,d):
  if a==0x49ae10:
   esp=u.reg_read(UC_X86_REG_ESP);p=struct.unpack('<I',u.mem_read(esp+4,4))[0];value=struct.unpack('<f',u.mem_read(p,4))[0];result=property_value(a,value)
   u.mem_write(0x20000200,struct.pack('<f',result));u.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');u.reg_write(UC_X86_REG_EIP,0x20000000)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x51b806,0x51b905,count=1000);assert u.reg_read(UC_X86_REG_EIP)==0x51b905
 return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in FLOATS},integers={'0x54b4ea':struct.unpack('<h',u.mem_read(0x54b4ea,2))[0]})
if __name__=='__main__':
 rng=random.Random(20261021);cases=[]
 for i in range(300):
  share=f32(rng.uniform(0,1));q={k:f32(v) for k,v in dict(g54b764=rng.uniform(100,2000),g54b134=rng.uniform(0,100),g54b120=rng.uniform(10,4000),g54b330=948.0555419921875,g54b2b8=rng.uniform(0,100),g54b714=rng.uniform(100,500),g54b740=share,g54b744=1-share,g54b41c=[0,.5,1][i%3],g54b12c=rng.uniform(100,10000),g54b2b0=rng.uniform(100,500)).items()};cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/fresh_feedwater_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'fresh feedwater/share cases')
