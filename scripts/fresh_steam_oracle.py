#!/usr/bin/env python3
"""Original fresh SG level/phase initialization 0x51b6cf–0x51b806.
Original numerical instructions, earlier model/reference globals explicit.
No full initializer, GUI/COM or error-runtime replay. x87 53-bit precision.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_FPCW,UC_X86_REG_EIP,UC_X86_REG_ESP
FLOATS=[0x54b4cc,0x54b4c4,0x54b4c8,0x54b7f4,0x54b7f8,0x54b504,0x54b508]
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x2000);u.reg_write(UC_X86_REG_ESP,0x10001000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for n,v in q.items():u.mem_write(int(n[1:],16),struct.pack('<f',v))
 u.emu_start(0x51b6cf,0x51b806,count=1000);assert u.reg_read(UC_X86_REG_EIP)==0x51b806
 return {hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in FLOATS}
if __name__=='__main__':
 rng=random.Random(20261020);cases=[]
 for i in range(320):
  q={k:f32(v) for k,v in dict(g54b1cc=rng.uniform(1,30),g54b214=rng.uniform(10,300),g54b768=rng.uniform(.01,.04),g54b1a4=rng.uniform(100,100000),g54b1f8=rng.uniform(1,30),g54b188=rng.uniform(100,5000),g54b76c=rng.uniform(.1,10)).items()}
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/fresh_steam_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'fresh SG level/phase cases')
