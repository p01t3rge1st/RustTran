#!/usr/bin/env python3
"""Original RCP decision, target selection and flow body 0x5125c4–0x513688.
Native matrix stores execute; array backing is supplied instead of VB allocation.
The two collection 0x48c/field 5 properties are explicit stateful inputs/outputs.
Logging gates 0x54b086/0x54b08c are zero; original numerical instructions run
continuously, with a Single-round bridge. No setter callbacks, error/UI runtime
or full scenario dispatcher. Explicit x87 53-bit reference context.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
ARGS=[0x54b40c,0x54b42c,0x54b430,0x54b860,0x54b654,0x54b740,0x54b744,0x54b12c,0x54b530,0x54b534,0x54ba30,0x54b4e2,0x54b4e4,0x54ba34,0x54b83c,0x54b840,0x54b414,0x54b130]
OUTPUTS=[0x54b42c,0x54b430,0x54b530,0x54b534,0x54ba34,0x54b83c,0x54b840,0x54ba30]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000)
 frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EBX,0);u.reg_write(UC_X86_REG_FPCW,0x027f)
 for k,v in q['globals']['singles'].items():u.mem_write(int(k,16),struct.pack('<f',v))
 for k,v in q['globals']['integers'].items():u.mem_write(int(k,16),struct.pack('<h',v))
 for i,p in enumerate(ARGS):u.mem_write(frame+8+i*4,struct.pack('<I',p))
 u.mem_write(0x54ba30,struct.pack('<f',q['controls']['trip_time']));u.mem_write(0x54b000,bytes(4));u.mem_write(0x54b086,bytes(2));u.mem_write(0x54b08c,bytes(2))
 for offset,p in [(-0x40,0x20000800),(-0x64,0x20000840)]:u.mem_write(frame+offset,struct.pack('<I',p))
 props=q['controls']['pump_percent'].copy();vtable=0x20001000;objects=[0x20002000+i*16 for i in range(4)]
 for p in objects:u.mem_write(p,struct.pack('<I',vtable))
 u.mem_write(0x54b024,struct.pack('<I',objects[0]));methods={}
 for off in [0x48c,0x40]:
  p=0x20003000+len(methods)*16;methods[p]=off;u.mem_write(vtable+off,struct.pack('<I',p))
 imports={}
 for off in [0x1094,0x1134,0x1264,0x11a0,0x1048,0x1040,0x1280,0x102c]:
  p=0x20004000+len(imports)*16;imports[p]=off;u.mem_write(0x400000+off,struct.pack('<I',p))
 u.mem_write(0x4010ac,struct.pack('<I',0x20005000));u.mem_write(0x20005000,b'\xd9\x1d'+struct.pack('<I',0x20005100)+b'\xd9\x05'+struct.pack('<I',0x20005100)+b'\xc3')
 def read32(p):return struct.unpack('<I',u.mem_read(p,4))[0]
 def hook(u,a,size,d):
  if a not in methods and a not in imports:
   if not (BASE<=a<BASE+PE.OPTIONAL_HEADER.SizeOfImage or 0x20005000<=a<=0x2000500c):raise RuntimeError(f'Unknown RCP runtime target {a:#x}')
   return
  sp=u.reg_read(UC_X86_REG_ESP);arg=lambda i:read32(sp+4+i*4)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax&0xffffffff);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);u.reg_write(UC_X86_REG_EIP,read32(sp))
  if a in methods:
   if methods[a]==0x48c:assert arg(0)==objects[0];ret(1,objects[1])
   else:
    assert arg(0)==objects[1] and arg(1)<2;u.mem_write(arg(2),struct.pack('<I',objects[2+arg(1)]));ret(3)
   return
  off=imports[a]
  if off==0x1094:u.mem_write(arg(0),struct.pack('<I',arg(1)));ret(2,arg(1))
  elif off==0x1134:
   dest,ob,prop,count=[arg(i) for i in range(4)];assert prop==0x68030005 and count==0;v=props[objects.index(ob)-2];u.mem_write(dest,struct.pack('<H6xh6x',2,v));ret(0,dest)
  elif off==0x1264:
   assert arg(1)==0x68030005 and arg(2)&0xffff==2;props[objects.index(arg(0))-2]=struct.unpack('<h',u.mem_read(sp+20,2))[0];ret(6)
  elif off==0x11a0:ret(1,struct.unpack('<h',u.mem_read(arg(0)+8,2))[0])
  else:ret(0)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x5125c4,0x513688,count=20000);assert u.reg_read(UC_X86_REG_EIP)==0x513688
 get=lambda p:struct.unpack('<f',u.mem_read(p,4))[0]
 return dict(singles={hex(a):get(a) for a in OUTPUTS},integers={hex(a):struct.unpack('<h',u.mem_read(a,2))[0] for a in [0x54b4e2,0x54b4e4]},pump_percent=props,normalized_flow=[get(frame-0x28),get(frame-0x2c)],selected_time_constant_a=get(frame-0x84))
if __name__=='__main__':
 rng=random.Random(20261020);cases=[]
 for i in range(768):
  g={0x54b40c:[9.99999905,10.,10.00000095,300.][i%4],0x54b42c:[5.,10.,20.][(i//4)%3],0x54b430:[5.,10.,20.][(i//12)%3],0x54b860:.02,0x54b654:.018,0x54b740:1/3,0x54b744:2/3,0x54b12c:10000.,0x54b530:rng.uniform(-100,10000),0x54b534:rng.uniform(-100,10000),0x54ba34:[0.,.5,1.,1.01][(i//9)%4],0x54b83c:[4.,120.,-10.,100.][i%4],0x54b840:[4.,-10.,120.,100.][i%4],0x54b414:[0.,.1,.5][i%3],0x54b130:10.}
  q=dict(globals=dict(singles={hex(a):f32(v) for a,v in g.items()},integers={'0x54b4e2':(i//27)%2,'0x54b4e4':(i//54)%2}),controls=dict(trip_time=10.,pump_percent=[[0,0],[100,100],[0,100],[100,0],[50,50]][(i//108)%5]))
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/rcp_control_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'RCP decision/flow cases')
