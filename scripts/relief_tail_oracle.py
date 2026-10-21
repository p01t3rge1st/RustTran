#!/usr/bin/env python3
"""Original post-discharge numeric/UI decision paths 0x5103d3–0x510689.
COM state is explicit and command writes/log-branch selection are captured;
original numerical comparisons and final flow copy execute. No UI/event log.
"""
import json,random,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EIP,UC_X86_REG_EAX,UC_X86_REG_ESP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f)
 for n,a in [('g54bf98',0x54bf98),('g54bf9c',0x54bf9c),('g54b6a8',0x54b6a8)]:u.mem_write(a,struct.pack('<f',q[n]))
 u.mem_write(frame+0x28,struct.pack('<I',0x54b6a8));out=dict(control_state=q['control_state'],opened_event=False)
 def hook(u,a,s,d):
  if a==0x5103fc:out['control_state']=0;u.reg_write(UC_X86_REG_EIP,0x510689)
  elif a==0x510496:u.reg_write(UC_X86_REG_EAX,q['control_state'] & 0xffff);u.reg_write(UC_X86_REG_EIP,0x5104ed)
  elif a==0x510502:u.reg_write(UC_X86_REG_EIP,0x51051e)
  elif a==0x510535:out['control_state']=struct.unpack('<h',u.mem_read(frame-0x78,2))[0];out['opened_event']=True;u.reg_write(UC_X86_REG_EIP,0x51067e)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x5103d3,0x510689,count=1000);assert u.reg_read(UC_X86_REG_EIP)==0x510689
 out['g54bf9c']=struct.unpack('<f',u.mem_read(0x54bf9c,4))[0];return out
if __name__=='__main__':
 rng=random.Random(20261023);cases=[]
 for i in range(240):
  q=dict(g54bf98=f32([4999.9995,5000.,5000.0005][i%3]),g54bf9c=f32([.99999994,1.,1.000000119][(i//3)%3]),g54b6a8=f32(rng.uniform(0,10000)),control_state=[0,1,100,-1][(i//9)%4]);cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/relief_tail_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'post-relief state cases')
