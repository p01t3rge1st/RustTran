#!/usr/bin/env python3
"""Original primary inventory/coefficient slices 0x50b46b–0x50b4e8 and 0x50b50c–0x50b5ae.
GUI command is an explicit signed-I16 input; the upstream volume slope is
supplied. Numerical slices execute original x86, explicit x87 53-bit precision.
No COM extraction, full balance dispatcher or plant trajectory.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EAX,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_EAX,q['command_percent']&0xffff);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4));u.mem_write(frame-0x84,struct.pack('<f',q['local_84']))
 for k,v in q.items():
  if k.startswith('g'):u.mem_write(int(k.replace('g','0x'),16),struct.pack('<f',v))
 for start,stop in [(0x50b46b,0x50b4e8),(0x50b50c,0x50b5ae)]:u.emu_start(start,stop,count=1000);assert u.reg_read(UC_X86_REG_EIP)==stop
 get=lambda o:struct.unpack('<f',u.mem_read(frame+o,4))[0]
 return dict(g54bb38=struct.unpack('<f',u.mem_read(0x54bb38,4))[0],local_ac=get(-0xac),local_24=get(-0x24),local_30=get(-0x30),local_3c=get(-0x3c),local_48=get(-0x48))
if __name__=='__main__':
 rng=random.Random(20261110);cases=[]
 for i in range(300):
  q={k:f32(v) for k,v in dict(g54b6d8=rng.uniform(0,1000),g54b6c8=rng.uniform(0,1000),g54b6a4=rng.uniform(0,1000),g54b6cc=rng.uniform(0,1000),g54b6b0=rng.uniform(0,1000),g54b6c4=rng.uniform(0,5000),g54b4ac=rng.uniform(-1000,1000),g54b414=rng.choice([0,.1,.5,1]),g54bb38=rng.uniform(100,1e6),g54b70c=rng.uniform(-1,1),g54b4a8=rng.uniform(1,1e4),g54b334=.185,g54b730=rng.uniform(.1,10),g54b2f8=rng.uniform(1,1e4),g54b1ac=rng.uniform(.1,10),local_84=rng.uniform(-.01,.01)).items()};q['command_percent']=[0,50,100][i%3] if i<30 else rng.randint(0,100);cases.append(dict(inputs=q,expected=execute(q)))
 path=ROOT/'analysis/primary_inventory_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'primary inventory cases')
