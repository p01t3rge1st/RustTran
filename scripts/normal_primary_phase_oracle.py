#!/usr/bin/env python3
"""Original no-phase-change primary branch 0x50bdd9–0x50c587.
Both phase flags are zero. Covers positive, zero and negative transfer flow;
upstream locals supplied. Explicit 53-bit x87; no COM/dispatcher/property tail.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EBX,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_EBX,0);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for name,v in q.items():
  if name.startswith('g'):u.mem_write(int(name.replace('g','0x'),16),struct.pack('<h' if name in ['g54b4d6','g54b4d8'] else '<f',v))
 for n,o in [('local_20',-0x20),('local_54',-0x54),('local_b0',-0xb0)]:u.mem_write(frame+o,struct.pack('<f',q[n]))
 u.emu_start(0x50bdd9,0x50c587,count=3000);assert u.reg_read(UC_X86_REG_EIP)==0x50c587
 get=lambda o:struct.unpack('<f',u.mem_read(frame+o,4))[0]
 return {'0x54b6a4':struct.unpack('<f',u.mem_read(0x54b6a4,4))[0],'0x54b498':struct.unpack('<f',u.mem_read(0x54b498,4))[0],'0x54b4a0':struct.unpack('<f',u.mem_read(0x54b4a0,4))[0],'trace':{n:get(o) for n,o in [('local_98',-0x98),('local_88',-0x88),('local_a4',-0xa4),('local_8c',-0x8c),('local_38',-0x38)]}}
if __name__=='__main__':
 rng=random.Random(20261111);cases=[]
 for i in range(300):
  q={k:f32(v) for k,v in dict(g54b688=rng.uniform(0,1),g54b728=rng.uniform(100,800),g54b724=rng.uniform(1000,1500),g54b4ac=[-1,0,1][i%3] if i<30 else rng.uniform(-1000,1000),g54b73c=rng.uniform(100,1500),g54b6a8=rng.uniform(0,1000),g54b7f0=rng.uniform(100,1e6),g54b64c=rng.uniform(.01,.04),g54b650=rng.uniform(.1,10),g54b788=rng.uniform(-10,10),g54b334=.185,g54b494=rng.uniform(100,2500),g54b49c=rng.uniform(100,680),g54b7ec=rng.uniform(0,1),g54b4a4=rng.uniform(100,10000),g54b19c=rng.uniform(10000,50000),local_20=rng.uniform(100,1000),local_54=rng.uniform(-1000,1000),local_b0=rng.uniform(-1,1)).items()};q.update(g54b4d6=0,g54b4d8=0);cases.append(dict(inputs=q,expected=execute(q)))
 path=ROOT/'analysis/normal_primary_phase_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'normal primary phase cases')
