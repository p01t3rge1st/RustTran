#!/usr/bin/env python3
"""Original four supported phase-flag branches 0x50bdd9–0x50c587.
Flag pairs 00/01/10/11, native level thresholds and explicit upstream locals.
Original x86 runs with EBX=0, ESI=1, x87 53-bit precision; no COM/property tail.
No flag-transition decisions before this block or complete plant dispatcher.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EBX,UC_X86_REG_ESI,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_EBX,0);u.reg_write(UC_X86_REG_ESI,1);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for name,v in q.items():
  if name.startswith('g'):u.mem_write(int(name.replace('g','0x'),16),struct.pack('<h' if name in ['g54b4d6','g54b4d8'] else '<f',v))
 for n,o in [('local_20',-0x20),('local_54',-0x54),('local_b0',-0xb0),('local_4c',-0x4c),('local_40',-0x40),('local_58',-0x58),('local_ac',-0xac),('local_78',-0x78)]:u.mem_write(frame+o,struct.pack('<f',q[n]))
 u.emu_start(0x50bdd9,0x50c587,count=3000);assert u.reg_read(UC_X86_REG_EIP)==0x50c587
 out={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b6a4,0x54b498,0x54b49c,0x54b4a0]};out['trace']={n:struct.unpack('<f',u.mem_read(frame+o,4))[0] for n,o in [('local_98',-0x98),('local_88',-0x88),('local_a4',-0xa4),('local_8c',-0x8c),('local_38',-0x38),('local_ac',-0xac),('local_78',-0x78)]};return out
if __name__=='__main__':
 rng=random.Random(20261112);base=json.loads((ROOT/'analysis/normal_primary_phase_fixtures.json').read_text())['cases'];cases=[]
 for i in range(640):
  q=base[i%len(base)]['inputs'].copy();q.update({k:f32(v) for k,v in dict(g54b690=rng.uniform(100,680),g54b734=rng.uniform(100,1000),g54b72c=rng.uniform(100,1000),g54b678=rng.uniform(-1e6,1e6),g54b2f8=rng.uniform(1,10000),g54b1ac=rng.uniform(.1,10),g54b778=rng.uniform(.001,2),g54b6c4=rng.uniform(0,1000),g54b6c8=rng.uniform(0,1000),g54b6cc=rng.uniform(0,1000),g54b6b0=rng.uniform(0,1000),g54b6d8=rng.uniform(0,1000),g54b668=rng.uniform(0,1000),g54b3fc=.2,g54b404=.8,local_4c=rng.uniform(-1000,1000),local_40=rng.uniform(-1000,1000),local_58=rng.uniform(100,1500),local_ac=rng.uniform(-1000,1000),local_78=rng.uniform(100,1500)).items()});q.update(g54b4d6=(i//2)%2,g54b4d8=i%2)
  # Exact threshold and adjacent binary32 tests use a volume ratio of one.
  if i<120:q.update(g54b4a4=1000.,g54b19c=1000.,g54b7ec=f32(1.-[.199999,.2,.200001,.799999,.8,.800001][(i//4)%6]))
  if i<120 and (i//4)%6==1:q["g54b3fc"]=f32(1.-q["g54b7ec"])
  cases.append(dict(inputs=q,expected=execute(q)))
 path=ROOT/'analysis/primary_phase_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'primary phase branch cases')
