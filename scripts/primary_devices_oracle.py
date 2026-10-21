#!/usr/bin/env python3
"""Original 0x50daf4–0x50f476 charging/letdown/injection state decisions.
COM properties are explicit stateful inputs/outputs; colors and four log-building
branches are bypassed after the native decisions. Numeric PI and seven-point
injection curve callees execute independently recovered original x86 slices.
No COM setter event callbacks, error dispatch, GUI or complete plant execution.
"""
import copy, hashlib, json, random, struct
from native_math_oracle import ROOT, PE, BASE, EXE
from controller_oracle import execute as controller
from injection_curve_oracle import execute as curve
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
ARGS=[0x54ba1c,0x54ba28,0x54b494,0x54b158,0x54b40c,0x54b6d4,0x54b4da,0x54b45c,0x54b4e0,0x54ba2c,0x54b414,0x54b4a0,0x54b1d0,0x54b6b0,0x54b16c,0x54b170,0x20008000,0x54b42c,0x54b430]
OUTPUTS=[0x54ba1c,0x54ba28,0x54b6b0,0x54b45c,0x54ba2c]

def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x20000)
 frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f)
 for k,v in q['globals']['singles'].items():u.mem_write(int(k,16),struct.pack('<f',v))
 for k,v in q['globals']['integers'].items():u.mem_write(int(k,16),struct.pack('<h',v))
 for i,p in enumerate(ARGS):u.mem_write(frame+8+i*4,struct.pack('<I',p))
 u.mem_write(ARGS[16],struct.pack('<f',f32(q['controls']['runtime_erl'])));u.mem_write(0x54b000,bytes(4))
 c=copy.deepcopy(q['controls']);events=[]
 # Stateful COM bridge. All collection/index/property combinations are checked.
 props={(0x568,0,9):c['letdown_percent'],(0x568,0,8):c['letdown_manual'],(0x4a4,0,9):c['auxiliary_percent'],(0x4a4,0,8):c['auxiliary_manual']}
 for i in range(3):props[0x56c,i,5]=c['pump_percent'][i];props[0x56c,i,4]=c['pump_manual'][i]
 objects={};vtable=0x20001000;form=0x20002000;u.mem_write(form,struct.pack('<I',vtable));u.mem_write(0x54b024,struct.pack('<I',form))
 def obj(tag):
  if tag not in objects:
   p=0x20003000+len(objects)*16;objects[tag]=p;u.mem_write(p,struct.pack('<I',vtable))
  return objects[tag]
 methods={}
 for off in [0x40,0x6c,0x568,0x56c,0x4a4,0x330,0x334,0x338]:
  p=0x20004000+len(methods)*16;methods[p]=off;u.mem_write(vtable+off,struct.pack('<I',p))
 imports={}
 for off in [0x1094,0x1134,0x1264,0x11a0,0x10b0,0x1048,0x1040,0x1280,0x102c,0x10ac]:
  p=0x20005000+len(imports)*16;imports[p]=off;u.mem_write(0x400000+off,struct.pack('<I',p))
 def read32(p):return struct.unpack('<I',u.mem_read(p,4))[0]
 def single(p):return struct.unpack('<f',u.mem_read(p,4))[0]
 def hook(u,a,size,d):
  def jump(p):u.reg_write(UC_X86_REG_EIP,p)
  # Bypass only message construction after flag/color branches completed.
  logs={0x50ddf3:'low_primary_pressure',0x50df9d:'high_containment_pressure',0x50e15b:'low_steam_pressure',0x50e4ae:'manual_injection'}
  if a in logs:events.append(logs[a]);jump(0x50e585);return
  if a==0x50ef9d:
   sp=u.reg_read(UC_X86_REG_ESP);ptrs=[read32(sp+i*4) for i in range(10)]
   names=['measured','target','proportional_band','output','previous_error','gain','integral_time','step','lower','upper']
   out=controller(dict(zip(names,map(single,ptrs))),0x027f)
   for n,i in [('output',3),('previous_error',4)]:u.mem_write(ptrs[i],struct.pack('<f',out[n]))
   u.reg_write(UC_X86_REG_ESP,sp+40);jump(a+5);return
  if a==0x50f415:
   p=curve(q['curve']['pressure'],q['curve']['flow'],single(0x54b494));u.mem_write(0x20009000,struct.pack('<f',p));u.mem_write(0x20009100,b'\xd9\x05'+struct.pack('<I',0x20009000));u.mem_write(0x20009106,b'\x83\xc4\x0c\xe9'+struct.pack('<i',a+5-(0x20009109+5)));jump(0x20009100);return
  if a not in imports and a not in methods:
   if not (BASE <= a < BASE+PE.OPTIONAL_HEADER.SizeOfImage or 0x20009100 <= a <= 0x20009109):
    raise RuntimeError(f'Unknown original control target {a:#x}')
   return
  sp=u.reg_read(UC_X86_REG_ESP);arg=lambda i:read32(sp+4+i*4)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax&0xffffffff);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);jump(read32(sp))
  def tag(p):return next(t for t,v in objects.items() if v==p)
  if a in methods:
   off=methods[a]
   if off in [0x568,0x56c,0x4a4]:ret(1,obj((off,)));return
   if off in [0x330,0x334,0x338]:ret(1,obj(('color',off)));return
   if off==0x6c:ret(2);return
   if off==0x40:
    collection=tag(arg(0))[0];index=arg(1);assert collection in [0x568,0x56c,0x4a4];u.mem_write(arg(2),struct.pack('<I',obj((collection,index))));ret(3);return
  off=imports[a]
  if off==0x1094:u.mem_write(arg(0),struct.pack('<I',arg(1)));ret(2,arg(1))
  elif off==0x1134:
   dest,ob,prop,count=[arg(i) for i in range(4)];assert count==0;key=(*tag(ob),prop&0xff);v=props[key];u.mem_write(dest,struct.pack('<H6xh6x',11 if isinstance(v,bool) else 2,-1 if v is True else int(v)));ret(0,dest)
  elif off==0x1264:
   ob,prop=arg(0),arg(1);vt=arg(2)&0xffff;assert vt in [2,11];v=struct.unpack('<h',u.mem_read(sp+4+16,2))[0];key=(*tag(ob),prop&0xff);assert key in props;props[key]=bool(v) if vt==11 else v;ret(6)
  elif off in [0x11a0,0x10b0]:
   v=struct.unpack('<h',u.mem_read(arg(0)+8,2))[0];ret(1,(-1 if v else 0) if off==0x10b0 else v)
  elif off in [0x1048,0x1040,0x1280,0x102c]:ret(0)
  elif off==0x10ac:ret(0) # __vbaFpR4 leaves finite ST0 unchanged
  else:raise RuntimeError(hex(off))
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x50daf4,0x50f476,count=20000);assert u.reg_read(UC_X86_REG_EIP)==0x50f476
 c.update(letdown_percent=props[0x568,0,9],letdown_manual=props[0x568,0,8],auxiliary_percent=props[0x4a4,0,9],auxiliary_manual=props[0x4a4,0,8],pump_percent=[props[0x56c,i,5] for i in range(3)],pump_manual=[props[0x56c,i,4] for i in range(3)])
 return dict(singles={f'0x{a:x}':single(a) for a in OUTPUTS},integers={'0x54b4e0':struct.unpack('<h',u.mem_read(0x54b4e0,2))[0]},controls=c,controller_output=single(ARGS[16]),events={x:x in events for x in ['low_primary_pressure','high_containment_pressure','low_steam_pressure','manual_injection']})

if __name__=='__main__':
 rng=random.Random(20261020);cases=[]
 curves=json.loads((ROOT/'analysis/injection_curve_fixtures.json').read_text())['cases']
 for i in range(640):
  curve_data=curves[(i%5)*28];cv=dict(pressure=curve_data['pressure'],flow=curve_data['flow'])
  vals={0x54ba1c:0.,0x54ba28:0.,0x54b494:[1499.9999,1500.,1500.0001,2400.][i%4],0x54b158:1500.,0x54b40c:[0.,30.,300.][i%3],0x54b6d4:.5,0x54b45c:[0.,30.,301.][(i//3)%3],0x54ba2c:rng.uniform(-1,1),0x54b414:[0.,.1,1.][i%3],0x54b4a0:[.1,.2,.5,.9][(i//4)%4],0x54b1d0:.2,0x54b6b0:0.,0x54b16c:rng.uniform(1,50),0x54b170:rng.uniform(1,100),0x54b6b4:rng.uniform(0,5),0x54b544:[1.,2.,3.][(i//5)%3],0x54b584:2.,0x54b4fc:[799.99994,800.,800.00006][(i//7)%3],0x54b500:[799.99994,800.,800.00006][(i//11)%3],0x54b58c:800.,0x54b590:2200.,0x54b588:.8,0x54b42c:0.,0x54b430:0.}
  c=dict(letdown_percent=[0,50,100][i%3],letdown_manual=bool(i&1),pump_percent=[[0,0,0],[100,100,100],[25,75,50]][i%3],pump_manual=[bool(i&2),bool(i&4),bool(i&8)],auxiliary_percent=100,auxiliary_manual=bool(i&16),runtime_erl=0)
  q=dict(globals=dict(singles={f'0x{a:x}':f32(v) for a,v in vals.items()},integers={'0x54b4e0':[0,1,2,-1][(i//16)%4],'0x54b4da':0}),controls=c,curve=cv)
  cases.append(dict(inputs=q,expected=execute(q)))
 for i in range(320):
  q=copy.deepcopy(cases[i]['inputs']);g=q['globals']['singles'];g.update({'0x54b494':2400.,'0x54b544':1.,'0x54b4fc':900.,'0x54b500':900.,'0x54b4a0':f32([.1,.49999997,.5,.50000006,.9][i%5])});q['globals']['integers']['0x54b4e0']=0;q['controls']['pump_manual'][2]=False;q['controls']['runtime_erl']=[-1,0,1,42][i%4]
  cases.append(dict(inputs=q,expected=execute(q)))
 path=ROOT/'analysis/primary_devices_fixtures.json' ;path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'primary device cases')
