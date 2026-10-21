#!/usr/bin/env python3
"""Original spray numeric selector 0x50099b–0x500a3c and caller control/flow
0x50c5e7–0x50ca84 in Unicorn. COM inputs explicit, writes captured, cleanup
skipped; actual numeric comparisons, pump gate and flow arithmetic executed.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EIP,UC_X86_REG_EAX,UC_X86_REG_EBX,UC_X86_REG_ESI,UC_X86_REG_EDI,UC_X86_REG_ESP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,frame-0x1000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4));out={};state={'percent':q['spray_percent']}
 for n,a in [('signal',0x54b6d0),('lower_threshold',0x54b1d8),('upper_threshold',0x54b1dc),('interlock_signal',0x54b6c0),('spray_capacity',0x54b1d4),('auxiliary_capacity',0x54ba28)]:u.mem_write(a,struct.pack('<f',q[n]))
 for n,a in [('pump_a',0x54b4e2),('pump_b',0x54b4e4)]:u.mem_write(a,struct.pack('<h',q[n]))
 for offset,a in [(0xc,0x54b6d0),(0x10,0x54b1d8),(0x14,0x54b1dc),(0x18,0x54b6ec)]:u.mem_write(frame+offset,struct.pack('<I',a))
 def jump(a):u.reg_write(UC_X86_REG_EIP,a)
 def hook(u,a,size,data):
  if a in (0x5009bc,0x5009ec,0x500a2e,0x50c6b6,0x49be86,0x50ca6a):jump(a+6)
  elif a==0x50c60a:u.reg_write(UC_X86_REG_EAX,state['percent'] & 0xffff);jump(0x50c66f)
  elif a==0x50c6eb:
   changed=u.reg_read(UC_X86_REG_EDI)!=0;u.reg_write(UC_X86_REG_ESI,0xffff if changed and not q['spray_manual'] else 0);jump(0x50c79c)
  elif a==0x50c7c7:state['percent']=struct.unpack('<h',u.mem_read(frame-0x108,2))[0];jump(0x50c865)
  elif a==0x50c865:jump(0x50c8c3)
  elif a==0x50c91a:u.reg_write(UC_X86_REG_EAX,state['percent'] & 0xffff);jump(0x50c98e)
  elif a==0x50c9c5:u.reg_write(UC_X86_REG_EAX,q['auxiliary_percent'] & 0xffff);jump(0x50c9ce)
  elif a==0x50ca27:jump(0x50ca64)
 u.hook_add(UC_HOOK_CODE,hook)
 u.emu_start(0x50099b,0x500a3c,count=1000);assert u.reg_read(UC_X86_REG_EIP)==0x500a3c
 # Selector return Variant is discarded by caller; retain numeric value as trace.
 tag=struct.unpack('<I',u.mem_read(frame-0x40,4))[0]
 out['selector_value']=float(struct.unpack('<i' if tag==2 else '<f',u.mem_read(frame-0x38,4))[0])
 u.reg_write(UC_X86_REG_EBX,0)
 u.emu_start(0x50c5e7,0x50ca84,count=10000);assert u.reg_read(UC_X86_REG_EIP)==0x50ca84
 out.update(spray_command=struct.unpack('<h',u.mem_read(0x54b6ec,2))[0],spray_percent=state['percent'],spray_flow=struct.unpack('<f',u.mem_read(0x54b6d8,4))[0],spray_active=u.reg_read(UC_X86_REG_EAX)!=0)
 return out
if __name__=='__main__':
 rng=random.Random(20261014);cases=[]
 for i in range(640):
  q=dict(signal=[1800,1900,2000,2100,2200][i%5],lower_threshold=1900,upper_threshold=2100,interlock_signal=[89,90,91][(i//5)%3],pump_a=(i//15)%2,pump_b=(i//30)%2,spray_manual=bool((i//60)%2),spray_percent=[0,1,50,99,100][(i//120)%5],auxiliary_percent=[0,25,100][i%3],spray_capacity=rng.uniform(0,1000),auxiliary_capacity=rng.uniform(0,1000))
  q={n:f32(v) if isinstance(v,(float,int)) and n not in ['pump_a','pump_b','spray_percent','auxiliary_percent'] and not isinstance(v,bool) else v for n,v in q.items()};cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/spray_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'spray cases')
