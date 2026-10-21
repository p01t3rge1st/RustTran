#!/usr/bin/env python3
"""Numeric paths of original 0x500bd0. COM reads are explicit inputs;
COM writes are captured, not executed. No complete GUI or plant execution.
"""
import json, struct, random, hashlib
from native_math_oracle import ROOT, PE, BASE, EXE
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP, UC_X86_REG_EIP, UC_X86_REG_EAX, UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
threshold=struct.unpack('<f',PE.get_data(0x403154-BASE,4))[0]
fields=['signal','level','level_setpoint','proportional_off_threshold','proportional_full_threshold','proportional_capacity','backup_signal_threshold','backup_capacity','minimum_level']
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4));out={}
 for i,n in enumerate(fields):
  p=0x10001000+i*4;u.mem_write(p,struct.pack('<f',q[n]));u.mem_write(frame+8+i*4,struct.pack('<I',p))
 def jump(a):u.reg_write(UC_X86_REG_EIP,a)
 def hook(u,a,size,data):
  if a==0x500c36:
   if q['proportional_manual']:
    u.reg_write(UC_X86_REG_EAX,q['proportional_percent'] & 0xffff);out['proportional_percent']=q['proportional_percent'];jump(0x500d7c)
   else:jump(0x500c8e)
  elif a==0x500ca8:out['proportional_percent']=u.reg_read(UC_X86_REG_EAX);jump(0x500ddc)
  elif a==0x500dcb:jump(0x500ddc)
  elif a==0x500ddc:
   if q['backup_manual']:
    u.reg_write(UC_X86_REG_EAX,q['backup_percent'] & 0xffff);out['backup_percent']=q['backup_percent'];jump(0x500f29)
   else:jump(0x500e2c)
  elif a in (0x500e65,0x500e77):jump(a+6)
  elif a==0x500eaf:out['backup_percent']=u.reg_read(UC_X86_REG_EAX);jump(0x50102d)
  elif a==0x500f78:jump(0x50102d)
  elif a==0x500f8b:out.update(proportional_percent=0,backup_percent=0);jump(0x501025)
 u.hook_add(UC_HOOK_CODE,hook)
 u.emu_start(0x500c21,0x501036,count=1000)
 for n,o in [('proportional_heat',-0x24),('backup_heat',-0x28),('total_heat',-0x20)]:out[n]=struct.unpack('<f',u.mem_read(frame+o,4))[0]
 return out
if __name__=='__main__':
 rng=random.Random(20261013);cases=[]
 for i in range(800):
  q=dict(signal=[1800,1900,2000,2100,2200][i%5],level=[.1,.2,.45,.5,.7][(i//4)%5],level_setpoint=.5,proportional_off_threshold=2100,proportional_full_threshold=1900,proportional_capacity=rng.uniform(0,10000),backup_signal_threshold=2000,backup_capacity=rng.uniform(0,20000),minimum_level=.2,proportional_manual=bool(i&1),backup_manual=bool(i&2),proportional_percent=[0,1,50,99,100][i%5],backup_percent=[0,25,75,100][i%4])
  q={n:f32(v) if n in fields else v for n,v in q.items()};cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/heater_fixtures.json').write_text(json.dumps(dict(method=__doc__,level_difference_threshold=threshold,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(threshold,len(cases))
