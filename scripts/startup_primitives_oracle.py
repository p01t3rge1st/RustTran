#!/usr/bin/env python3
"""Original scalar startup constants and early geometry stores under 53-bit x87.
The native Double PI store and following property arrays are not exported here;
B700 VB time-conversion flag is explicitly excluded, not filled with a default.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import *
CONSTANTS=[0x54b2f4,0x54b2f8,0x54b2fc,0x54b300,0x54b304,0x54b308,0x54b30c,0x54b310,0x54b314,0x54b318,0x54b31c,0x54b320,0x54b324,0x54b328,0x54b32c,0x54b334,0x54b044,0x54bb08,0x54b330,0x54b70c]
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(values=None):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EDI,0);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 if values is None:
  u.emu_start(0x51c310,0x51c42d,count=1000);assert u.reg_read(UC_X86_REG_EIP)==0x51c42d
  return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in CONSTANTS},integers={'0x54bfa8':struct.unpack('<h',u.mem_read(0x54bfa8,2))[0]})
 for a,v in values.items():u.mem_write(int(a,16),struct.pack('<f',v))
 for a,b in [(0x51b174,0x51b196),(0x51b19c,0x51b1d9)]:u.emu_start(a,b,count=1000);assert u.reg_read(UC_X86_REG_EIP)==b
 return {hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b704,0x54b708,0x54b74c,0x54b750]}
if __name__=='__main__':
 method=__doc__;digest=hashlib.sha256(EXE.read_bytes()).hexdigest();cases=[dict(inputs=dict(model='1',ic='1',stages=[dict(kind='startup_constants')]),expected=execute())]
 (ROOT/'analysis/startup_constants_fixtures.json').write_text(json.dumps(dict(method=method,original_sha256=digest,cases=cases),indent=2)+'\n');cases=[];rng=random.Random(20261021)
 for i in range(320):
  values={hex(a):f32(v) for a,v in {0x54b470:rng.uniform(0,10000),0x54b46c:rng.uniform(.01,1000),0x54b220:rng.uniform(0,10000),0x54b1bc:rng.uniform(0,10000)}.items()};q=dict(model='1',ic='1',extra_singles=values,stages=[dict(kind='startup_geometry')]);cases.append(dict(inputs=q,expected=execute(values)))
 (ROOT/'analysis/startup_geometry_fixtures.json').write_text(json.dumps(dict(method=method,original_sha256=digest,cases=cases),indent=2)+'\n');print('1 native constants / 320 native geometry cases')
