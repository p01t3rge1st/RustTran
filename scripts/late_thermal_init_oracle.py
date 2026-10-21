#!/usr/bin/env python3
"""Late numerical initializer slices 0x51bde6-0x51bf00, 0x51c014-0x51c1e4.
No external Double model, COM controls, UI-array reset or restored/event dispatch.
Original PSAT, VLIQ and HLIQ children execute independently with explicit x87
53-bit precision; known VB conversion/cleanup bridges only.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE,emulate
from primary_liquid_oracle import execute as liquid
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
OUTPUTS=[0x54b848,0x54b838,0x54b83c,0x54b840,0x54b844,0x54b84c,0x54b808,0x54b850,0x54b854,0x54b860,0x54b6c0,0x54b688,0x54b72c,0x54b870,0x54b684,0x54b654,0x54bb3c,0x54bb38,0x54b9f8,0x54b9fc,0x54ba0c,0x54ba10,0x54ba14,0x54ba18,0x54b858,0x54b864,0x54b868,0x54b86c]
REQUIRED=[0x54b204,0x54b12c,0x54b740,0x54b744,0x54b1f8,0x54b1cc,0x54b494,0x54b49c,0x54b1a0,0x54b518,0x54b4b0,0x54b530,0x54b534,0x54b514,0x54b2a0,0x54b1a8,0x54b41c,0x54b128,0x54b768,0x54b1a4,0x54b4cc,0x54b124,0x54b4a0,0x54b4f0,0x54b160,0x54b464]
def execute(q):
 g=q['globals'];s=g['singles'];assert all(hex(a) in s for a in REQUIRED)
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000);u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EDI,0);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for a,v in s.items():u.mem_write(int(a,16),struct.pack('<f',v))
 for a,v in g['integers'].items():u.mem_write(int(a,16),struct.pack('<h',v))
 def read32(p):return struct.unpack('<I',u.mem_read(p,4))[0]
 def single(p):return struct.unpack('<f',u.mem_read(p,4))[0]
 def hook(u,a,size,d):
  sp=u.reg_read(UC_X86_REG_ESP)
  def ret(n):u.reg_write(UC_X86_REG_ESP,sp+4+4*n);u.reg_write(UC_X86_REG_EIP,read32(sp))
  def bridge(v,n):u.mem_write(0x20000200,struct.pack('<f',v));u.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2'+struct.pack('<H',4*n));u.reg_write(UC_X86_REG_EIP,0x20000000)
  if a==0x49c1e0:
   p,t=[single(read32(sp+4+i*4)) for i in range(2)];bridge(liquid(p,t)['0x54b654'],2)
  elif a==0x49b140:
   dest,p,t=[read32(sp+4+i*4) for i in range(3)];v=emulate('HLIQ',[single(p),single(t)])['output'];u.mem_write(dest,struct.pack('<H6xd',5,v));ret(3)
  elif a==0x49bde0:bridge(property_value(a,single(read32(sp+4))),1)
  elif a==0x20000040:
   p=read32(sp+4);bridge(struct.unpack('<d',u.mem_read(p+8,8))[0],1)
  elif a==0x20000050:ret(0)
  elif not (BASE<=a<BASE+PE.OPTIONAL_HEADER.SizeOfImage or 0x20000000<=a<=0x20000006):raise RuntimeError(f'Unknown late init target {a:#x}')
 u.mem_write(0x401130,struct.pack('<I',0x20000040));u.mem_write(0x40102c,struct.pack('<I',0x20000050));u.hook_add(UC_HOOK_CODE,hook)
 for start,stop in [(0x51bde6,0x51bf00),(0x51c014,0x51c1e4)]:
  u.reg_write(UC_X86_REG_ESP,0x1001f000);u.emu_start(start,stop,count=2000);assert u.reg_read(UC_X86_REG_EIP)==stop
 return dict(singles={hex(a):single(a) for a in OUTPUTS},integers={hex(a):struct.unpack('<h',u.mem_read(a,2))[0] for a in [0x54b85c,0x54c01c,0x54c01e]})
if __name__=='__main__':
 rng=random.Random(20261023);cases=[]
 for i in range(320):
  vals={0x54b204:3.,0x54b12c:10000.,0x54b740:1/3,0x54b744:2/3,0x54b1f8:.7,0x54b1cc:.1,0x54b494:rng.uniform(100,2500),0x54b49c:rng.uniform(100,600),0x54b1a0:rng.uniform(10,1000),0x54b518:rng.uniform(0,1),0x54b4b0:rng.uniform(1,100),0x54b530:rng.uniform(0,10000),0x54b534:rng.uniform(0,20000),0x54b514:rng.uniform(0,1),0x54b2a0:600.,0x54b1a8:400.,0x54b41c:[0.,.5,1.,1.1][i%4],0x54b128:650.,0x54b768:.02,0x54b1a4:100000.,0x54b4cc:100.,0x54b124:2200.,0x54b4a0:rng.uniform(.1,.9),0x54b4f0:rng.uniform(0,1),0x54b160:[100.,220.,220.0001,500.][i%4],0x54b464:rng.uniform(0,1)}
  q=dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={}));cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/late_thermal_init_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'late thermal initializer cases')
