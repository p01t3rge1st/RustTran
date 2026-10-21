#!/usr/bin/env python3
"""Original new-start branch 0x51b357–0x51b432. EDI=0 is proven by
0x51b00c. Property returns independently execute original numeric prefixes.
Requires explicit upstream loop references; not restored-IC dispatch or full init.
"""
import json,random,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EDI,UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
FLOATS=[0x54b4f4,0x54b40c,0x54b4ac,0x54b4f8,0x54b4a8,0x54b4a4,0x54b498,0x54b49c,0x54b494,0x54b64c,0x54b650]
FLAGS=[0x54b4d0,0x54b4ec,0x54b4d2,0x54b4d4,0x54b4d6,0x54b4d8,0x54b4da,0x54b4e0,0x54b4e6,0x54b4e8]
def execute(q,include_inventory=False,include_control=False,include_steam=False,include_auxiliary=False):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x1000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_EDI,0);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for n,v in q.items():u.mem_write(int(n[1:],16),struct.pack('<f',v))
 def hook(u,a,s,d):
  if a in [0x49bf00,0x49c190,0x49ae10,0x49bde0]:
   esp=u.reg_read(UC_X86_REG_ESP);p=struct.unpack('<I',u.mem_read(esp+4,4))[0];value=struct.unpack('<f',u.mem_read(p,4))[0];result=property_value(a,value)
   u.mem_write(0x20000200,struct.pack('<f',result));u.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');u.reg_write(UC_X86_REG_EIP,0x20000000)
 u.mem_write(0x4010ac,struct.pack('<I',0x20000020));u.mem_write(0x20000020,b'\xd9\x1d'+struct.pack('<I',0x20000300)+b'\xd9\x05'+struct.pack('<I',0x20000300)+b'\xc3')
 if include_steam:
  for a,b in [(0x51b2f7,0x51b2fd),(0x51b303,0x51b351)]:u.emu_start(a,b,count=30)
 u.hook_add(UC_HOOK_CODE,hook);stop=0x51ba28 if include_auxiliary else 0x51b905 if include_steam else 0x51b6cf if include_inventory else 0x51b432;u.emu_start(0x51b357,stop,count=3000);assert u.reg_read(UC_X86_REG_EIP)==stop
 if include_control:
  for a,b in [(0x51b988,0x51b98e),(0x51b9d4,0x51b9da),(0x51c0ec,0x51c0f8),(0x51c10b,0x51c111)]:u.emu_start(a,b,count=20)
 return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in (FLOATS+([0x54b454,0x54b458,0x54b438,0x54b544,0x54b7fc,0x54b804,0x54b800,0x54b540,0x54b574,0x54b53c,0x54b570,0x54b810,0x54b814,0x54b55c,0x54b524,0x54ba40,0x54b808,0x54b550,0x54b554,0x54b80c,0x54b558,0x54b818,0x54b81c,0x54b428] if include_auxiliary else [])+([0x54b6d4,0x54b7ec,0x54b4a0,0x54b4f0,0x54b7f0] if include_inventory else [])+([0x54ba4c,0x54b6c0] if include_control else [])+([0x54b4fc,0x54b500,0x54b50c,0x54b510,0x54b4b0,0x54b67c,0x54b680,0x54b4cc,0x54b4c4,0x54b4c8,0x54b7f4,0x54b7f8,0x54b504,0x54b508,0x54b54c,0x54b548,0x54b538,0x54b528,0x54b52c,0x54b564,0x54b530,0x54b534,0x54b560] if include_steam else [])+([0x54b77c,0x54b770,0x54b784,0x54b774,0x54b788,0x54b2ec,0x54b7d0,0x54b7d4,0x54b7d8,0x54b7dc,0x54b7e0,0x54b7e4,0x54b674,0x54b7e8] if include_steam else []))},integers={hex(a):struct.unpack('<h',u.mem_read(a,2))[0] for a in (FLAGS+([0x54b4ea] if include_steam else []))})
if __name__=='__main__':
 rng=random.Random(20261020);cases=[]
 for i in range(240):
  ratio=f32([0,.5,1][i%3] if i<30 else rng.uniform(0,1))
  q={k:f32(v) for k,v in dict(g54b1a4=rng.uniform(100,1e6),g54b740=ratio,g54b744=1-ratio,g54b19c=rng.uniform(100,10000),g54b124=rng.uniform(100,2600),g54b1a0=rng.uniform(10,1000),g54b758=rng.uniform(100,650)).items()}
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/fresh_primary_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'fresh primary initializer cases')
