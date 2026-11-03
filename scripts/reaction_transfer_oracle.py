#!/usr/bin/env python3
"""Continuous original post-model transfer0x51f8c6–0x51fc92. Original branch,
powers, Single histories, clamp and transfer accumulation; upstream Double model
state supplied. PowerR8 executes installer DLL with53-bit CW/scratch errno;
FP helpers store/reload, sqrt bridges x87. No model0x526b40, COM or Windows run.
"""
import copy,hashlib,json,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from native_power_runtime import power
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000)
 u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EDI,0);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for a,v in q['globals']['singles'].items():u.mem_write(int(a,16),struct.pack('<f',v))
 c=q['inputs'];u.mem_write(0x54bd04,struct.pack('<I',0x20008000));u.mem_write(0x20008038,struct.pack('<d',c['node_fraction']));u.mem_write(0x54bd20,struct.pack('<I',0x20008100));u.mem_write(0x20008138,struct.pack('<d',c['node_temperature']))
 for a,v in zip([0x54bd48,0x54bd40,0x54bd50,0x54bd58],c['material_masses']):u.mem_write(a,struct.pack('<d',v))
 u.mem_write(0x54c020,struct.pack('<d',c.get('pi',struct.unpack('<d',struct.pack('<Q',0x400921fb54442d11))[0])))
 for pointer,dest,code in [(0x4010b4,0x20000000,b'\xdd\x1d'+struct.pack('<I',0x20000200)+b'\xdd\x05'+struct.pack('<I',0x20000200)+b'\xc3'),(0x401228,0x20000020,b'\xdd\x44\x24\x04\xd9\xfa\xc2\x08\x00')]:u.mem_write(pointer,struct.pack('<I',dest));u.mem_write(dest,code)
 u.mem_write(0x4011f4,struct.pack('<I',0x20000040))
 active=False;positive=True;transfer=False
 def hook(u,a,size,data):
  nonlocal active,positive,transfer
  if a in [0x524628,0x40471c]:raise ValueError(f'native reaction transfer error {a:#x}')
  if a==0x51f8e0:active=True
  if a==0x51fa1c:positive=False
  if a==0x51fb5a:transfer=True
  if a==0x20000040:
   sp=u.reg_read(UC_X86_REG_ESP);base,exponent=struct.unpack('<dd',u.mem_read(sp+4,16));v=power(base,exponent);u.mem_write(0x20000220,struct.pack('<d',v));u.mem_write(0x20000060,b'\xdd\x05'+struct.pack('<I',0x20000220)+b'\xc2\x10\x00');u.reg_write(UC_X86_REG_EIP,0x20000060)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x51f8c6,0x51fc92,count=5000);assert u.reg_read(UC_X86_REG_EIP)==0x51fc92
 writes=([0x54bfe4,0x54bfd0,0x54bfd4,0x54bfcc,0x54bfe8,0x54bfb4]+([0x54bfd8,0x54bfbc] if transfer else [])) if active else []
 return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in writes},active=active,positive_temperature_difference=positive if active else False,transfer_active=transfer)
def base():
 vals={0x54b32c:2.205,0x54b304:1.8,0x54b300:32.,0x54c010:459.67,0x54bfe8:1500.,0x54bff4:struct.unpack('<f',struct.pack('<I',0x2b05fb6a))[0],0x54bff0:struct.unpack('<f',struct.pack('<I',0x3d48b439))[0],0x54b414:.1,0x54bfcc:1.,0x54bfec:struct.unpack('<f',struct.pack('<I',0x3983126f))[0],0x54bff8:struct.unpack('<f',struct.pack('<I',0x3e9eb852))[0],0x54bfc4:150.,0x54b2b0:1600.,0x54bfc8:100.,0x54bfc0:struct.unpack('<f',struct.pack('<I',0x44153333))[0],0x54bfbc:5.,0x54bfb4:7.}
 return dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={}),inputs=dict(node_fraction=.1,material_masses=[100.,200.,50.,25.],node_temperature=1000.,pi=struct.unpack('<d',struct.pack('<Q',0x400921fb54442d11))[0]))
def main():
 cases=[];errors=[]
 for i in range(192):
  q=base();s=q['globals']['singles'];c=q['inputs'];c['node_fraction']=[.009999999999999998,.01,.010000000000000002,.1,1.,-.1][i%6]
  c['node_temperature']=[600.,815.5555771603892,1000.,1500.][i//6%4]
  s['0x54b2b0']=[1400.,1628.,1629.,1630.][i//24%4];s['0x54b414']=f32([.0001,.1][i//96]);s['0x54bfcc']=f32([0.,.1,10.][i%3])
  cases.append(dict(inputs=q,expected=execute(q)))
 # Around zero temperature difference and clamp entry using original producer results.
 for old in [1000.,1500.,2000.]:
  for delta in [-.001,-.0001,0.,.0001,.001]:
   q=base();q['globals']['singles']['0x54bfe8']=old;q['inputs']['node_temperature']=(old+delta-32.)/q['globals']['singles']['0x54b304']
   try:expected=execute(q)
   except ValueError as e:
    if not str(e).startswith('native reaction transfer error'):raise
    errors.append(dict(inputs=q,native_error=str(e)));continue
   cases.append(dict(inputs=q,expected=expected))
 out=ROOT/'analysis/reaction_transfer_fixtures.json';out.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),dll_sha256=hashlib.sha256((ROOT/'analysis/program/msvbvm60.dll').read_bytes()).hexdigest(),cases=cases,error_cases=errors),indent=2)+'\n');print(len(cases),'native reaction-transfer cases;',sum(c['expected']['active'] for c in cases),'active;',sum(c['expected']['transfer_active'] for c in cases),'transfers;',len(errors),'native singular cases')
if __name__=='__main__':main()
