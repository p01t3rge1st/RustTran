#!/usr/bin/env python3
"""Original fresh cached-state initialization 0x51b905–0x51ba28.
EDI=0 is established by 0x51b00c. The pending PSAT argument is the pointer
pushed by 0x51b820; its native numerical prefix runs independently. Stops
before external-model initializer 0x526200; no full Reset/restore execution.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_ESP,UC_X86_REG_EDI,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
OUTPUTS=[0x54b454,0x54b458,0x54b438,0x54b544,0x54b7fc,0x54b804,0x54b800,0x54b540,0x54b574,0x54b53c,0x54b570,0x54b810,0x54b814,0x54b55c,0x54b524,0x54ba4c,0x54ba40,0x54b808,0x54b550,0x54b554,0x54b80c,0x54b558,0x54b818,0x54b81c,0x54b428]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,4096);u.reg_write(UC_X86_REG_EDI,0);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4));sp=0x1001f000;u.mem_write(sp,struct.pack('<I',0x54b548));u.reg_write(UC_X86_REG_ESP,sp)
 for a,v in q['globals']['singles'].items():u.mem_write(int(a,16),struct.pack('<f',v))
 def hook(u,a,s,d):
  if a==0x49bde0:
   sp=u.reg_read(UC_X86_REG_ESP);p=struct.unpack('<I',u.mem_read(sp+4,4))[0];assert p==0x54b548
   v=struct.unpack('<f',u.mem_read(p,4))[0];u.mem_write(0x20000200,struct.pack('<f',property_value(a,v)));u.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');u.reg_write(UC_X86_REG_EIP,0x20000000)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x51b905,0x51ba28,count=500);assert u.reg_read(UC_X86_REG_EIP)==0x51ba28
 return {hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in OUTPUTS}
if __name__=='__main__':
 rng=random.Random(20261020);cases=[]
 for i in range(320):
  vals={0x54b41c:[0.,.5,1.,1.1][i%4],0x54b2b4:rng.uniform(14,25),0x54b548:rng.uniform(100,400),0x54b2a0:rng.uniform(500,650),0x54b1a8:rng.uniform(400,500),0x54b1b8:rng.uniform(100,1000),0x54bfa4:rng.uniform(0,100),0x54b220:rng.uniform(10,1000),0x54b1bc:rng.uniform(10,1000),0x54b124:rng.uniform(1500,2500),0x54b57c:rng.uniform(100,10000)}
  q=dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={}),stages=[dict(kind='fresh_auxiliary_init')]);cases.append(dict(inputs=dict(model='1',ic='1',extra_singles=q['globals']['singles'],stages=q['stages']),expected=execute(q)))
 (ROOT/'analysis/fresh_auxiliary_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'fresh auxiliary state cases')
