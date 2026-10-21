#!/usr/bin/env python3
"""Original final primary mass/energy correction 0x50cbac–0x50cc88.
Upstream locals and heat source are explicit; original x86 with 53-bit precision.
No preceding heater/UI control or complete balance/plant dispatcher.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for n,v in q.items():
  if n.startswith('g'):u.mem_write(int(n.replace('g','0x'),16),struct.pack('<f',v))
 for n,o in [('local_88',-0x88),('local_a4',-0xa4),('local_8c',-0x8c)]:u.mem_write(frame+o,struct.pack('<f',q[n]))
 u.emu_start(0x50cbac,0x50cc88,count=1000);assert u.reg_read(UC_X86_REG_EIP)==0x50cc88
 return {n:struct.unpack('<f',u.mem_read(frame+o,4))[0] for n,o in [('local_6c',-0x6c),('local_88',-0x88),('local_a4',-0xa4)]}
if __name__=='__main__':
 rng=random.Random(20261116);cases=[]
 for i in range(240):
  q={k:f32(v) for k,v in dict(g54b6e4=rng.uniform(-100,100),g54b730=rng.uniform(.1,10),g54b734=rng.uniform(100,1000),g54b688=rng.uniform(0,1),g54b64c=rng.uniform(.01,.04),g54b650=rng.uniform(.1,10),g54b6d8=0 if i<12 else rng.uniform(0,1000),g54b7f0=rng.uniform(100,1e6),g54b6dc=0 if i<12 else rng.uniform(-1e6,1e6),local_88=rng.uniform(-100,100),local_a4=rng.uniform(-100,100),local_8c=rng.uniform(100,1500)).items()};cases.append(dict(inputs=q,expected=execute(q)))
 path=ROOT/'analysis/primary_correction_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'primary correction cases')
