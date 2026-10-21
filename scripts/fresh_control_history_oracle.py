#!/usr/bin/env python3
"""Original fresh Single control history/boron/rod stores 0x51baa3-0x51bbed.
EDI=0 follows original startup prologue. Fault input is explicit malfunction
array entry +0x10. No external Double-model, restored branch or event rebasing.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
OUTPUTS=[0x54baa4,0x54baa8,0x54c068,0x54b6f8,0x54bfe8,0x54bfcc,0x54bfbc,0x54bbb0,0x54ba9c,0x54baac,0x54b490]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x20000000,4096);u.reg_write(UC_X86_REG_EDI,0)
 for a,v in q['globals']['singles'].items():u.mem_write(int(a,16),struct.pack('<f',v))
 u.mem_write(0x54b630,struct.pack('<I',0x20000000));u.mem_write(0x20000010,struct.pack('<h',q['fault_flag']));u.emu_start(0x51baa3,0x51bbed,count=100)
 assert u.reg_read(UC_X86_REG_EIP)==0x51bbed
 return {hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in OUTPUTS}
if __name__=='__main__':
 rng=random.Random(20261024);cases=[]
 for i in range(320):
  q=dict(globals=dict(singles={hex(a):f32(v) for a,v in {0x54c06c:rng.uniform(0,3000),0x54b524:rng.uniform(-100,100),0x54b548:rng.uniform(32,600),0x54b560:rng.uniform(-100,1000),0x54b564:rng.uniform(-100,2000),0x54b48c:rng.uniform(0,100)}.items()},integers={}),fault_flag=[-1,0,1,2][i%4]);cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/fresh_control_history_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'fresh control-history cases')
