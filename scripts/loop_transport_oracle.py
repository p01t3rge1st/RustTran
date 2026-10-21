#!/usr/bin/env python3
"""Continuously execute original late primary thermal feedback 0x50d1f8-0x50d867.
All arithmetic, negative-flow branches, clamps, time constants and histories run
unchanged. Only FpR4 uses a Single-round bridge; explicit 53-bit x87 context.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
INPUTS=[0x54b6c0,0x54b19c,0x54b6ac,0x54b1a0,0x54b6e4,0x54b6e8,0x54b498,0x54b6b8,0x54b6bc,0x54b690,0x54b530,0x54b534,0x54b740,0x54b744,0x54b12c,0x54b40c,0x54b418,0x54b414]
HISTORY=[0x54bab4,0x54bab8,0x54babc,0x54bac0]
OUTPUTS=[0x54ba34,0x54b694,0x54b698,0x54b69c,0x54b6a0]+HISTORY
def execute(q):
 s=q['globals']['singles']
 for a in INPUTS:assert hex(a) in s,hex(a)
 if s['0x54b40c']>s['0x54b418']:
  for a in HISTORY:assert hex(a) in s,hex(a)
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,4096);u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for a,v in s.items():u.mem_write(int(a,16),struct.pack('<f',v))
 u.mem_write(0x4010ac,struct.pack('<I',0x20000000));u.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3')
 u.emu_start(0x50d1f8,0x50d867,count=4000);assert u.reg_read(UC_X86_REG_EIP)==0x50d867
 return {hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in OUTPUTS}
if __name__=='__main__':
 rng=random.Random(20261021);cases=[]
 for i in range(640):
  vals={0x54b6c0:rng.uniform(0,100),0x54b19c:1000.,0x54b6ac:rng.uniform(100,2000),0x54b1a0:2000.,0x54b6e4:rng.uniform(-300,300),0x54b6e8:rng.uniform(-300,300),0x54b498:rng.uniform(200,700),0x54b6b8:rng.uniform(200,700),0x54b6bc:rng.uniform(200,700),0x54b690:rng.uniform(400,1000),0x54b530:[-100.,-.001,.001,100.,1000.][i%5],0x54b534:[-100.,-.001,.001,100.,1000.][(i//5)%5],0x54b740:1/3,0x54b744:2/3,0x54b12c:1000.,0x54b40c:[0.,149.99998474121094,150.,150.00001525878906,300.][(i//25)%5],0x54b418:150.,0x54b414:[.0001,.1,1.][i%3]}
  vals.update({a:rng.uniform(200,700) for a in HISTORY});s={hex(a):f32(v) for a,v in vals.items()};q=dict(globals=dict(singles=s,integers={}));inp=dict(model='1',ic='1',extra_singles=s,stages=[dict(kind='loop_transport')]);cases.append(dict(inputs=inp,expected=execute(q)))
 (ROOT/'analysis/loop_transport_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'native thermal feedback cases')
