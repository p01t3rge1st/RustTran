#!/usr/bin/env python3
"""Original containment fan cooling 0x503564–0x503cf2, with caller operands
from 0x523383–0x5233c0. All threshold decisions, two automatic fan commands,
four signed I16 fan values, intermediate Single rounding and final heat run
as original x86. Only text/log formatting 0x5035a0–0x50373f is skipped; COM
properties are explicit state and callbacks/UI/error handling are excluded.
x87 precision is explicitly 53 bits; this is not a Windows plant trajectory.
"""
import copy, hashlib, json, random, struct
from native_math_oracle import ROOT, PE, BASE, EXE
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
ARGS=[0x54b544,0x54b2c4,0x54b40c,0x54b450,0x54b750,0x54b160,0x54b2d0,0x54b2cc,0x54b548]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x20000)
 frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f)
 for a,v in q['globals']['singles'].items():u.mem_write(int(a,16),struct.pack('<f',v))
 for a in ARGS:
  if a!=0x54b750:assert hex(a) in q['globals']['singles'],hex(a)
 # The preceding source instruction leaves a scalar on the x87 stack. Its
 # value is unrelated to these argument pushes; load zero for the caller's
 # already-audited BA24 store, then execute all nine original pushes.
 u.mem_write(0x20000000,b'\xd9\xee');u.emu_start(0x20000000,0x20000002,count=1)
 u.emu_start(0x523383,0x5233c0,count=100);assert u.reg_read(UC_X86_REG_EIP)==0x5233c0
 args=struct.unpack('<9I',u.mem_read(u.reg_read(UC_X86_REG_ESP),36));assert list(args)==ARGS
 for i,p in enumerate(args):u.mem_write(frame+8+4*i,struct.pack('<I',p))
 u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EBX,0);u.reg_write(UC_X86_REG_ESI,0);u.mem_write(0x54b000,bytes(4))
 c=copy.deepcopy(q['controls']);props={(0x554,0,0):c['exchanger_percent']}
 for i in range(4):props[0x494,i,7]=c['fan_percent'][i];props[0x494,i,6]=c['fan_manual'][i]
 objects={};vtable=0x20001000;form=0x20002000;u.mem_write(form,struct.pack('<I',vtable));u.mem_write(0x54b024,struct.pack('<I',form))
 def obj(tag):
  if tag not in objects:
   p=0x20003000+len(objects)*16;objects[tag]=p;u.mem_write(p,struct.pack('<I',vtable))
  return objects[tag]
 methods={}
 for off in [0x40,0x494,0x554]:
  p=0x20004000+len(methods)*16;methods[p]=off;u.mem_write(vtable+off,struct.pack('<I',p))
 imports={}
 for off in [0x1094,0x1134,0x11a0,0x10b0,0x1264,0x1048,0x1040]:
  p=0x20005000+len(imports)*16;imports[p]=off;u.mem_write(BASE+off,struct.pack('<I',p))
 activated=False
 def read32(p):return struct.unpack('<I',u.mem_read(p,4))[0]
 def tag(p):return next(t for t,v in objects.items() if v==p)
 def hook(u,a,size,data):
  nonlocal activated
  if a==0x50359c:activated=True
  if a==0x5035a0:u.reg_write(UC_X86_REG_EIP,0x50373f);return
  if a in [0x503f39,0x503f3e,0x40471c]:raise ValueError(f'native fan arithmetic error {a:#x}')
  if a not in imports and a not in methods:return
  sp=u.reg_read(UC_X86_REG_ESP);arg=lambda i:read32(sp+4+i*4)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax&0xffffffff);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);u.reg_write(UC_X86_REG_EIP,read32(sp))
  if a in methods:
   off=methods[a]
   if off!=0x40:ret(1,obj((off,)));return
   collection=tag(arg(0))[0];assert collection in [0x494,0x554];u.mem_write(arg(2),struct.pack('<I',obj((collection,arg(1)))));ret(3);return
  off=imports[a]
  if off==0x1094:u.mem_write(arg(0),struct.pack('<I',arg(1)));ret(2,arg(1))
  elif off==0x1134:
   assert arg(3)==0;v=props[(*tag(arg(1)),arg(2)&255)];u.mem_write(arg(0),struct.pack('<H6xh6x',11 if isinstance(v,bool) else 2,-1 if v is True else int(v)));ret(0,arg(0))
  elif off in [0x11a0,0x10b0]:
   v=struct.unpack('<h',u.mem_read(arg(0)+8,2))[0];ret(1,(-1 if v else 0) if off==0x10b0 else v)
  elif off==0x1264:
   key=(*tag(arg(0)),arg(1)&255);assert key[0]==0x494 and key[1] in [0,1] and key[2]==7 and arg(2)==2
   props[key]=struct.unpack('<h',u.mem_read(sp+20,2))[0];ret(6)
  else:ret(0)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x503564,0x503cf2,count=8000);assert u.reg_read(UC_X86_REG_EIP)==0x503cf2
 c['fan_percent']=[props[0x494,i,7] for i in range(4)]
 return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b450,0x54b750]},controls=c,activated=activated)
if __name__=='__main__':
 rng=random.Random(20261103);cases=[]
 for i in range(720):
  p=[19.999998092651367,20.,20.000001907348633,50.][i%4];time=[0.,99.99999237060547,100.,100.00000762939453,300.][i//4%5]
  vals={0x54b544:p,0x54b2c4:20.,0x54b40c:time,0x54b450:100.,0x54b160:70.,0x54b2d0:350.,0x54b2cc:[0.,1000.,-10.,10000.][i//7%4],0x54b548:[50.,70.,350.,rng.uniform(70,800)][i//3%4]}
  controls=dict(fan_percent=[[0,0,0,0],[0,50,100,0],[100,0,-1,101],[25,75,10,30]][i//5%4],fan_manual=[bool((i//20)&(1<<n)) for n in range(4)],exchanger_percent=[-1,0,1,50,100,110][i//11%6])
  q=dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={}),controls=controls);cases.append(dict(inputs=q,expected=execute(q)))
 out=ROOT/'analysis/containment_fans_fixtures.json';out.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'native containment fan cooling cases')
