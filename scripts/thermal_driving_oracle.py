#!/usr/bin/env python3
"""Original normal thermal-driving slices; explicit x87 53-bit precision.
No COM, special external-model branch, event dispatch or error handlers.
"""
import json,random,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_FPCW,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(inputs,slices,outputs):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for k,v in inputs.items():u.mem_write(int(k.replace('g','0x'),16),struct.pack('<f',v))
 for start,stop in slices:
  u.emu_start(start,stop,count=500);assert u.reg_read(UC_X86_REG_EIP)==stop
 return {hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in outputs}
if __name__=='__main__':
 rng=random.Random(20261102);cases=[]
 for i in range(320):
  t=f32(rng.uniform(100,1500));dt=[0,-.001,.001,-100,100][i%5] if i<25 else rng.uniform(-300,300)
  inputs=dict(g54b558=f32(rng.uniform(0,1.5)),g54b120=f32(rng.uniform(1,5000)),g54b41c=f32(rng.uniform(0,1)),g54b330=f32(948.0555419921875),g54b550=f32(t+dt),g54b498=t,g54b6fc=f32(rng.uniform(0,200000)))
  expected=execute(inputs,[(0x51f476,0x51f4f2),(0x51f654,0x51f6c3),(0x51f6c3,0x51f6fb)],[0x54ba54,0x54ba64,0x54ba68,0x54b554,0x54bad4,0x54b56c]);cases.append(dict(inputs=inputs,expected=expected))
 path=ROOT/'analysis/thermal_driving_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'normal thermal-driving cases')
