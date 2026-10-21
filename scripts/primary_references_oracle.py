#!/usr/bin/env python3
"""Original reference arithmetic and level floor 0x51dd7b–0x51de6c.
Checkbox decisions are explicit; only UI access/cleanup is bypassed.
The original multiply/divide/add/stores and floor comparisons execute.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_FPCW,0x027f)
 for a,v in q['globals']['singles'].items():u.mem_write(int(a,16),struct.pack('<f',v))
 u.mem_write(0x54b000,bytes(4))
 def hook(u,a,s,d):
  if a==0x51dd9d:u.reg_write(UC_X86_REG_EIP,0x51ddf3 if q['controls']['level_automatic'] else 0x51de49)
  elif a==0x51de4f:u.reg_write(UC_X86_REG_EIP,a+6)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x51dd7b if q['controls']['temperature_automatic'] else 0x51dd9d,0x51de6c,count=500);assert u.reg_read(UC_X86_REG_EIP)==0x51de6c
 return {hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b75c,0x54b6d4]}
if __name__=='__main__':
 rng=random.Random(20261020);cases=[]
 for i in range(320):
  vals={0x54b850:rng.uniform(1,100),0x54b818:[0.,.5,1.,1.1][i%4],0x54b1a8:500.,0x54b154:.5,0x54b75c:rng.uniform(480,620),0x54b6d4:[.26999998,.27,.27000004,.5][i%4]}
  q=dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={}),controls=dict(temperature_automatic=bool(i&1),level_automatic=bool(i&2)))
  cases.append(dict(inputs=dict(model='1',ic='1',extra_singles=q['globals']['singles'],stages=[dict(kind='primary_references',controls=q['controls'])]),expected=execute(q)))
 (ROOT/'analysis/primary_references_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'dynamic reference cases')
