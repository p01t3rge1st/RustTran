#!/usr/bin/env python3
"""Original spray 0x50252b–0x5032be and 16 caller pointers 0x523306–0x523378.
Only text sections 0x502a4a–0x502bf0 and 0x502e60–0x502fac are skipped.
COM properties are explicit; PSAT/HFLD execute independent original prefixes.
No setter callbacks/error UI/full containment dispatcher. x87 is 53-bit.
"""
import copy,hashlib,json,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
ARGS=[0x54bb14,0x54b548,0x54b448,0x54b40c,0x54b294,0x54b298,-0x34,-0x2c,0x54bb1c,0x54b544,0x54b486,0x54bb20,0x54b2c8,0x54bb24,0x54b160,0x54ba20]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x20000)
 frame=0x10010000;caller=0x10018000;u.reg_write(UC_X86_REG_EBP,caller);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f)
 for a,v in q['globals']['singles'].items():u.mem_write(int(a,16),struct.pack('<f',v))
 for a in [0x54b548,0x54b448,0x54b40c,0x54b294,0x54b298,0x54b544,0x54b2c8,0x54b160,0x54b72c]:assert hex(a) in q['globals']['singles'],hex(a)
 u.mem_write(0x54b486,struct.pack('<h',q['globals']['integers']['0x54b486']))
 # Two unrelated x87 terms precede the argument pushes. They only feed the
 # separately unported BB0C store, not any spray argument.
 u.mem_write(0x20000000,b'\xd9\xee\xd9\xee');u.emu_start(0x20000000,0x20000004,count=2)
 u.mem_write(0x54b000,bytes(4));u.emu_start(0x523306,0x523378,count=100)
 assert u.reg_read(UC_X86_REG_EIP)==0x523378
 args=struct.unpack('<16I',u.mem_read(u.reg_read(UC_X86_REG_ESP),64))
 assert list(args)==[caller+a if isinstance(a,int) and a<0 else a for a in ARGS]
 for i,p in enumerate(args):u.mem_write(frame+8+4*i,struct.pack('<I',p))
 u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EBX,0)
 c=copy.deepcopy(q['controls']);props={(0x4a4,0,9):c['auxiliary_percent'],(0x4f4,0,8):c['isolation_manual'],(0x4f4,0,9):c['isolation_percent'],(0x51c,15):c['mode'],(0x554,0,0):c['exchanger_percent']}
 for i in range(2):props[0x55c,i,5]=c['pump_percent'][i];props[0x55c,i,4]=c['pump_manual'][i]
 objects={};vtable=0x20001000;form=0x20002000;u.mem_write(form,struct.pack('<I',vtable));u.mem_write(0x54b024,struct.pack('<I',form))
 def obj(tag):
  if tag not in objects:
   p=0x20003000+len(objects)*16;objects[tag]=p;u.mem_write(p,struct.pack('<I',vtable))
  return objects[tag]
 methods={}
 for off in [0x40,0x4a4,0x4f4,0x55c,0x51c,0x554]:
  p=0x20004000+len(methods)*16;methods[p]=off;u.mem_write(vtable+off,struct.pack('<I',p))
 imports={}
 for off in [0x1094,0x1134,0x11a0,0x10b0,0x1264,0x1048,0x1040,0x1280,0x102c]:
  p=0x20005000+len(imports)*16;imports[p]=off;u.mem_write(BASE+off,struct.pack('<I',p))
 activated=False;latched=False
 def read32(p):return struct.unpack('<I',u.mem_read(p,4))[0]
 def tag(p):return next(t for t,v in objects.items() if v==p)
 def hook(u,a,size,data):
  nonlocal activated,latched
  if a==0x50258d:activated=True
  if a==0x502e51:latched=True
  if a==0x502a4a:u.reg_write(UC_X86_REG_EIP,0x502bf0);return
  if a==0x502e60:u.reg_write(UC_X86_REG_EIP,0x502fac);return
  if a in [0x50349d,0x5034a2,0x40471c]:raise ValueError(f'native spray arithmetic error {a:#x}')
  if a in [0x49bde0,0x49ab70]:
   sp=u.reg_read(UC_X86_REG_ESP);value=struct.unpack('<f',u.mem_read(read32(sp+4),4))[0]
   result=property_value(a,value);u.mem_write(0x20006200,struct.pack('<f',result))
   u.mem_write(0x20006300,b'\xd9\x05'+struct.pack('<I',0x20006200)+b'\xc2\x04\x00');u.reg_write(UC_X86_REG_EIP,0x20006300);return
  if a not in imports and a not in methods:return
  sp=u.reg_read(UC_X86_REG_ESP);arg=lambda i:read32(sp+4+i*4)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax&0xffffffff);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);u.reg_write(UC_X86_REG_EIP,read32(sp))
  if a in methods:
   off=methods[a]
   if off!=0x40:ret(1,obj((off,)));return
   collection=tag(arg(0))[0];assert collection in [0x4a4,0x4f4,0x55c,0x554];u.mem_write(arg(2),struct.pack('<I',obj((collection,arg(1)))));ret(3);return
  off=imports[a]
  if off==0x1094:u.mem_write(arg(0),struct.pack('<I',arg(1)));ret(2,arg(1))
  elif off==0x1134:
   assert arg(3)==0;v=props[(*tag(arg(1)),arg(2)&255)];u.mem_write(arg(0),struct.pack('<H6xh6x',11 if isinstance(v,bool) else 2,-1 if v is True else int(v)));ret(0,arg(0))
  elif off in [0x11a0,0x10b0]:
   v=struct.unpack('<h',u.mem_read(arg(0)+8,2))[0];ret(1,(-1 if v else 0) if off==0x10b0 else v)
  elif off==0x1264:
   key=(*tag(arg(0)),arg(1)&255);assert key in [(0x4f4,0,9),(0x55c,0,5),(0x55c,1,5)] and arg(2)==2
   props[key]=struct.unpack('<h',u.mem_read(sp+20,2))[0];ret(6)
  else:ret(0)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x50252b,0x5032be,count=10000);assert u.reg_read(UC_X86_REG_EIP)==0x5032be
 c['pump_percent']=[props[0x55c,i,5] for i in range(2)];c['isolation_percent']=props[0x4f4,0,9]
 return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54bb14,0x54bb1c,0x54bb20,0x54bb24,0x54b448]},integers={'0x54b486':struct.unpack('<h',u.mem_read(0x54b486,2))[0]},controls=c,outlet_temperature=struct.unpack('<f',u.mem_read(args[6],4))[0],return_flow=struct.unpack('<f',u.mem_read(args[7],4))[0],auto_activated=activated,pump_latched=latched)
if __name__=='__main__':
 cases=[]
 for i in range(192):
  vals={0x54b548:[100.,300.,500.][i%3],0x54b448:100.,0x54b40c:[99.99999237060547,100.,100.00000762939453,300.][i//3%4],0x54b294:20.,0x54b298:[0.,17.,200.][i//5%3],0x54b544:[19.999998092651367,20.,20.000001907348633][i//4%3],0x54b2c8:[0.,1000.,-100.][i//7%3],0x54b160:70.,0x54b72c:[50.,200.,400.][i//11%3]}
  c=dict(auxiliary_percent=[0,99,100,101][i%4],isolation_manual=bool((i//4)&1),isolation_percent=75,pump_percent=[[0,0],[100,0],[25,75],[-1,50]][i//3%4],pump_manual=[bool(i&2),bool(i&4)],mode=[0,1,2,-1][i//5%4],exchanger_percent=[0,25,100,-1][i//7%4])
  q=dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={'0x54b486':[0,1,-1,2][i//9%4]}),controls=c)
  cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/containment_spray_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'native spray cases')
