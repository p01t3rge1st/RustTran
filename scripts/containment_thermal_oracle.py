#!/usr/bin/env python3
"""Native thermal source0x51fc92–0x51fd6c and hydrogen0x52059e–0x520986.
All arithmetic/threshold/delay/latch/state branches execute original instructions.
Only log formatting0x5206e1–0x52086a is skipped; color setter HRESULT is modeled,
callbacks excluded. Original PowerR8 executes DLL code (CW0x027f); seven-point
wrapper executes and INTP uses independent native prefixes with explicit curves.
Upstream reaction state and curve loading remain supplied, not Windows scenarios.
"""
import copy,hashlib,json,struct
from functools import lru_cache
from native_math_oracle import ROOT,PE,BASE,EXE,emulate
from native_power_runtime import power
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
@lru_cache(maxsize=1)
def original_curve():
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000);u.reg_write(UC_X86_REG_ESP,0x1001f000)
 u.mem_write(0x54c038,struct.pack('<I',0x20008000));u.mem_write(0x54c054,struct.pack('<I',0x20008100))
 # Authenticate the last EBX/EDI assignments, not guessed register values.
 u.emu_start(0x51c98a,0x51c98f,count=1);u.emu_start(0x51c998,0x51c99d,count=1)
 u.emu_start(0x51d2df,0x51d3c6,count=100)
 return dict(gauge_pressure=list(struct.unpack('<7f',u.mem_read(0x20008000,28))),limit_percent=list(struct.unpack('<7f',u.mem_read(0x20008100,28))))
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000)
 frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f)
 def wr(a,v):u.mem_write(a,struct.pack('<f',v))
 def r32(a):return struct.unpack('<I',u.mem_read(a,4))[0]
 for a,v in q['globals']['singles'].items():wr(int(a,16),v)
 u.mem_write(0x54bfa8,struct.pack('<h',q['globals']['integers']['0x54bfa8']))
 u.mem_write(0x54b000,bytes(4));c=copy.deepcopy(q['controls']);u.mem_write(0x54b630,struct.pack('<I',0x20008000));u.mem_write(0x20008008,struct.pack('<h',c['burn_flag']))
 u.mem_write(0x54b5f8,struct.pack('<I',0x20008100));wr(0x20008110,c['burn_time'])
 for addr,code in [(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000200)+b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc3')]:u.mem_write(addr,code)
 u.mem_write(0x4010ac,struct.pack('<I',0x20000000));u.mem_write(0x4011f4,struct.pack('<I',0x20000020))
 form=0x20002000;vtable=0x20001000;u.mem_write(form,struct.pack('<I',vtable));u.mem_write(0x54b024,struct.pack('<I',form));u.mem_write(vtable+0x64,struct.pack('<I',0x20004000))
 ignited=False;extinguished=False;burned=False;curve_calls=0;color_calls=[]
 def hook(u,a,size,data):
  nonlocal ignited,extinguished,burned,curve_calls
  if a in [0x524628,0x40471c]:raise ValueError(f'native thermal arithmetic failure {a:#x}')
  if a==0x52087b:ignited=True
  if a==0x5208dc:extinguished=True
  if a==0x52094e:burned=True
  if a==0x5206e1:u.reg_write(UC_X86_REG_EIP,0x52086a);return
  sp=u.reg_read(UC_X86_REG_ESP)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);u.reg_write(UC_X86_REG_EIP,r32(sp))
  if a==0x20004000:color_calls.append(r32(sp+8));ret(2);return
  if a==0x20000020:
   base,exponent=struct.unpack('<dd',u.mem_read(sp+4,16));assert base==30.48 and exponent==3.
   u.mem_write(0x20000220,struct.pack('<d',power(base,exponent)));u.mem_write(0x20000040,b'\xdd\x05'+struct.pack('<I',0x20000220)+b'\xc2\x10\x00');u.reg_write(UC_X86_REG_EIP,0x20000040);return
  if a==0x49b430:
   xp,yp,n,query,out=struct.unpack('<5I',u.mem_read(sp+4,20));assert r32(xp)==0x54c02c and r32(yp)==0x54c048
   assert struct.unpack('<h',u.mem_read(n,2))[0]==7
   v=struct.unpack('<f',u.mem_read(query,4))[0];curve=c['hydrogen_curve'];value=emulate('INTP',dict(x=curve['gauge_pressure'],y=curve['limit_percent'],query=v))['output'];wr(out,value);curve_calls+=1;ret(5);return
 u.hook_add(UC_HOOK_CODE,hook)
 u.emu_start(0x51fc92,0x51fd6c,count=3000);assert u.reg_read(UC_X86_REG_EIP)==0x51fd6c
 u.emu_start(0x52059e,0x520986,count=5000);assert u.reg_read(UC_X86_REG_EIP)==0x520986 and curve_calls==1
 writes=[0x54bfb8,0x54bae4,0x54bfac]+([0x54bfb0] if ignited else [])+([0x54b754] if extinguished or burned else [])+([0x54bd78] if burned else [])
 c['burn_time']=struct.unpack('<f',u.mem_read(0x20008110,4))[0]
 return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in writes},integers={'0x54bfa8':struct.unpack('<h',u.mem_read(0x54bfa8,2))[0]},controls=c,ignited=ignited,extinguished=extinguished,burned=burned)
def base():
 vals={0x54c000:.01,0x54bffc:.02,0x54bfb4:.1,0x54b414:.1,0x54b32c:2.2049999237060547,0x54c004:.5,0x54bd78:.01,0x54b2c0:1000.,0x54b544:26.,0x54b40c:100.,0x54b754:123.,0x54bfb0:17.}
 return dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={'0x54bfa8':0}),controls=dict(burn_flag=1,burn_time=50.,hydrogen_curve=copy.deepcopy(original_curve())))
def main():
 cases=[]
 for i in range(320):
  q=base();s=q['globals']['singles'];c=q['controls'];j=i%64
  q['globals']['integers']['0x54bfa8']=[0,1,-1,2][j%4];c['burn_flag']=[0,1,-1,2][j//4%4]
  inventory=[0.,.00001,.01,.1,1.][i//64];s['0x54bd78']=f32(inventory)
  c['burn_time']=[0.,99.89999389648438,99.9000015258789,100.][j//16]
  s['0x54c000']=f32([-.2,0.,.3,2.][i%4]);s['0x54bffc']=f32([0.,.1,1.][i//4%3]);s['0x54bfb4']=f32([-.1,0.,1.][i//12%3])
  cases.append(dict(inputs=q,expected=execute(q)))
 # Probe exact concentration and ignition/delay neighbors using native values.
 for inventory in [.001,.01,.1]:
  q=base();q['globals']['singles']['0x54bd78']=f32(inventory);value=execute(q)['singles']['0x54bae4']
  bits=struct.unpack('<I',struct.pack('<f',value))[0]
  for offset in [-1,0,1]:
   z=copy.deepcopy(q);threshold=struct.unpack('<f',struct.pack('<I',bits+offset))[0];z['controls']['hydrogen_curve']['limit_percent']=[threshold]*7;cases.append(dict(inputs=z,expected=execute(z)))
 for delta in [-1,0,1]:
  q=base();q['globals']['integers']['0x54bfa8']=1;q['globals']['singles']['0x54bd78']=f32(.1);q['controls']['burn_time']=100.
  gate=f32(100.+q['globals']['singles']['0x54b414']);bits=struct.unpack('<I',struct.pack('<f',gate))[0];q['globals']['singles']['0x54b40c']=struct.unpack('<f',struct.pack('<I',bits+delta))[0];cases.append(dict(inputs=q,expected=execute(q)))
 # Volume neighbors around exactly1 percent: below1 extinguishes; equality burns.
 q=base();q['globals']['integers']['0x54bfa8']=1;q['globals']['singles']['0x54bd78']=f32(.1)
 volume=f32((q['globals']['singles']['0x54bd78']*1000./2.*22400.)/power(30.48,3.)*100.)
 bits=struct.unpack('<I',struct.pack('<f',volume))[0]
 for offset in [-1,0,1]:
  z=copy.deepcopy(q);z['globals']['singles']['0x54b2c0']=struct.unpack('<f',struct.pack('<I',bits+offset))[0];cases.append(dict(inputs=z,expected=execute(z)))
 assert any(c['expected']['singles']['0x54bae4']==1. for c in cases[-3:])
 path=ROOT/'analysis/containment_thermal_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cubic_foot_constant_bits='0x40dba7362e90363c',original_curve=original_curve(),cases=cases),indent=2)+'\n');print(len(cases),'native thermal/hydrogen cases;',sum(c['expected']['ignited'] for c in cases),'ignitions;',sum(c['expected']['burned'] for c in cases),'burns')
if __name__=='__main__':main()
