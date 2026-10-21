#!/usr/bin/env python3
"""Continuous original 0x510901-0x511907 supply/injection/recirculation body.
Native coordinator pushes authenticate globals, separate caller/callee frames.
Stateful COM mode/pump/exchanger/level properties supplied; log formatting and
post-numeric error UI excluded. Original seven-point curve independently runs.
Single-round FpR4 bridge and explicit 53-bit x87. Not Windows plant trajectories.
"""
import copy,hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from injection_curve_oracle import execute as curve
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
ARGS=[0x54b494,0x54b1c4,0x54b4e8,0x54ba20,0x54b454,0x54b40c,0x54b6e0,0x54b694,0x54b160,None,0x54ba38,0x54b548,0x54ba40,0x54b414]
OUTPUTS=[0x54ba20,0x54b454,0x54b6e0,0x54ba38,0x54b2e8,0x54ba40,0x54b72c]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x20000)
 frame=0x10010000;u.reg_write(UC_X86_REG_EBP,0x10018000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.reg_write(UC_X86_REG_ESI,0)
 for k,v in q['globals']['singles'].items():u.mem_write(int(k,16),struct.pack('<f',v))
 for k,v in q['globals']['integers'].items():u.mem_write(int(k,16),struct.pack('<h',v))
 u.mem_write(0x10017fd8,struct.pack('<f',123.))
 u.emu_start(0x51d40e,0x51d411,count=1);assert struct.unpack('<f',u.mem_read(0x10017fd8,4))[0]==0.
 u.emu_start(0x51df57,0x51df9c,count=100);assert u.reg_read(UC_X86_REG_EIP)==0x51df9c;args=struct.unpack('<14I',u.mem_read(u.reg_read(UC_X86_REG_ESP),56))
 assert list(args)==[0x10017fd8 if a is None else a for a in ARGS]
 for i,p in enumerate(args):
  if i!=9:assert hex(p) in (q['globals']['integers'] if i==2 else q['globals']['singles']),hex(p)
  u.mem_write(frame+8+i*4,struct.pack('<I',p))
 for a in OUTPUTS:assert hex(a) in q['globals']['singles'],hex(a)
 u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.mem_write(0x54b000,bytes(4));c=copy.deepcopy(q['controls']);activated=False;level_written=False
 props={(0x51c,15):c['mode'],(0x520,0,0):c['exchanger_percent'],(0x440,15):0.}
 for i in range(2):props[0x518,i,5]=c['pump_percent'][i];props[0x518,i,4]=c['pump_manual'][i]
 objects={};vtable=0x20001000;form=0x20002000;u.mem_write(form,struct.pack('<I',vtable));u.mem_write(0x54b024,struct.pack('<I',form))
 def obj(tag):
  if tag not in objects:
   p=0x20003000+len(objects)*16;objects[tag]=p;u.mem_write(p,struct.pack('<I',vtable))
  return objects[tag]
 methods={}
 for off in [0x40,0x518,0x51c,0x520,0x440]:
  p=0x20004000+len(methods)*16;methods[p]=off;u.mem_write(vtable+off,struct.pack('<I',p))
 imports={}
 for off in [0x1094,0x1134,0x1264,0x11a0,0x10b0,0x1048,0x1040,0x1280,0x102c]:
  p=0x20005000+len(imports)*16;imports[p]=off;u.mem_write(0x400000+off,struct.pack('<I',p))
 u.mem_write(0x4010ac,struct.pack('<I',0x20006000));u.mem_write(0x20006000,b'\xd9\x1d'+struct.pack('<I',0x20006100)+b'\xd9\x05'+struct.pack('<I',0x20006100)+b'\xc3')
 def read32(p):return struct.unpack('<I',u.mem_read(p,4))[0]
 def single(p):return struct.unpack('<f',u.mem_read(p,4))[0]
 def hook(u,a,size,d):
  nonlocal activated,level_written
  def jump(p):u.reg_write(UC_X86_REG_EIP,p)
  if a==0x51099f:activated=True
  if a==0x511768:jump(0x511907);return # log text after numeric and level writes
  if a==0x5124e0:
   sp=u.reg_read(UC_X86_REG_ESP);value=curve(q['curve']['pressure'],q['curve']['flow'],single(read32(sp+4)));u.mem_write(0x20006200,struct.pack('<f',value));u.mem_write(0x20006300,b'\xd9\x05'+struct.pack('<I',0x20006200)+b'\xc2\x0c\x00');jump(0x20006300);return
  if a not in imports and a not in methods:
   if not (BASE<=a<BASE+PE.OPTIONAL_HEADER.SizeOfImage or 0x20006000<=a<=0x2000600c or 0x20006300<=a<=0x20006306):raise RuntimeError(f'unknown supply target {a:#x}')
   return
  sp=u.reg_read(UC_X86_REG_ESP);arg=lambda i:read32(sp+4+i*4)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax&0xffffffff);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);jump(read32(sp))
  def tag(p):return next(t for t,v in objects.items() if v==p)
  if a in methods:
   off=methods[a]
   if off!=0x40:ret(1,obj((off,)));return
   collection=tag(arg(0))[0];index=arg(1);assert collection in [0x518,0x520];u.mem_write(arg(2),struct.pack('<I',obj((collection,index))));ret(3);return
  off=imports[a]
  if off==0x1094:u.mem_write(arg(0),struct.pack('<I',arg(1)));ret(2,arg(1))
  elif off==0x1134:
   dest,ob,prop,count=[arg(i) for i in range(4)];assert count==0;v=props[(*tag(ob),prop&255)];u.mem_write(dest,struct.pack('<H6xh6x',11 if isinstance(v,bool) else 2,-1 if v is True else int(v)));ret(0,dest)
  elif off==0x1264:
   key=(*tag(arg(0)),arg(1)&255);assert key in props;vt=arg(2)&0xffff;assert vt in [2,4,11];value=single(sp+20) if vt==4 else struct.unpack('<h',u.mem_read(sp+20,2))[0];props[key]=bool(value) if vt==11 else value
   if key==(0x440,15):level_written=True
   ret(6)
  elif off in [0x11a0,0x10b0]:
   v=struct.unpack('<h',u.mem_read(arg(0)+8,2))[0];ret(1,(-1 if v else 0) if off==0x10b0 else v)
  else:ret(0)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x510901,0x511907,count=20000);assert u.reg_read(UC_X86_REG_EIP)==0x511907
 c.update(mode=props[0x51c,15],pump_percent=[props[0x518,i,5] for i in range(2)],pump_manual=[props[0x518,i,4] for i in range(2)],exchanger_percent=props[0x520,0,0])
 return dict(singles={hex(a):single(a) for a in OUTPUTS},integers={'0x54b4e8':struct.unpack('<h',u.mem_read(0x54b4e8,2))[0]},controls=c,return_flow=single(args[9]),level_command=props[0x440,15] if level_written else None,activated=activated)
if __name__=='__main__':
 rng=random.Random(20261021);curves=json.loads((ROOT/'analysis/injection_curve_fixtures.json').read_text())['cases'];cases=[]
 for i in range(960):
  cv=curves[(i%5)*28+14];p=f32([299.9999694824219,300.,300.0000305175781,1500.][i%4]);volume=f32([3999.999755859375,4000.,4000.000244140625,8000.][(i//4)%4]);vals={0x54b494:p,0x54b1c4:[300.,1500.][(i//3)%2],0x54ba20:13.,0x54b454:299.,0x54b40c:[0.,150.,300.][i%3],0x54b6e0:17.,0x54b694:rng.uniform(50,650),0x54b160:50.,0x54ba38:19.,0x54b548:rng.uniform(40,650),0x54ba40:volume,0x54b414:[0.,.1,1.][i%3],0x54b72c:rng.uniform(0,500),0x54b2e8:23.,0x54b2fc:10.,0x54b578:rng.uniform(1,10000),0x54ba1c:rng.uniform(0,100),0x54bb14:rng.uniform(0,100),0x54b580:4000.,0x54b57c:10000.}
  c=dict(mode=[-1,0,1,2,3][(i//16)%5],pump_percent=[[0,0],[100,100],[25,75],[-1,100]][i%4],pump_manual=[bool(i&1),bool(i&2)],exchanger_percent=[-1,0,50,100][(i//2)%4]);q=dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={'0x54b4e8':[-1,0,1,2][(i//5)%4]}),controls=c,curve=dict(pressure=cv['pressure'],flow=cv['flow']));cases.append(dict(inputs=q,expected=execute(q)))
 path=ROOT/'analysis/supply_system_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'continuous supply-system cases')
