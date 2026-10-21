#!/usr/bin/env python3
"""Continuously execute original SG devices/valves/outflow 0x509213–0x50a8a6.
Explicit stateful COM percentages/manual properties replace only UI access.
No original callbacks, error dispatch, later feedwater or final SG exchange.
"""
import copy,hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from steam_generator_oracle import bindings
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
BINDINGS=bindings()

def execute(q):
 c=copy.deepcopy(q['controls']);side=0 if q['side']=='A' else 1
 addresses=[int(a['pointer'],16) for a in BINDINGS[side]['arguments']]
 # Caller locals must not alias this separately emulated callee's frame locals.
 for i,p in enumerate(addresses):
  if 0x10000000<=p<0x10020000:addresses[i]=0x20020000+i*16
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x30000)
 frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for k,v in q['globals']['singles'].items():u.mem_write(int(k,16),struct.pack('<f',v))
 for k,v in q['globals']['integers'].items():u.mem_write(int(k,16),struct.pack('<h',v))
 for i,p in enumerate(addresses):u.mem_write(frame+8+4*i,struct.pack('<I',p))
 u.mem_write(addresses[(0x7c-8)//4],struct.pack('<f',c['shutdown_time']));u.mem_write(addresses[(0x9c-8)//4],struct.pack('<h',side))
 if side:u.mem_write(addresses[(0xac-8)//4],struct.pack('<f',-q['globals']['singles']['0x54bf84']))
 u.mem_write(0x54b630,struct.pack('<I',0x20000100));u.mem_write(0x20000104,struct.pack('<2h',*c['fault_flags']))
 form=0x20001000;vtable=0x20002000;u.mem_write(0x54b024,struct.pack('<I',form));u.mem_write(form,struct.pack('<I',vtable));methods={};collections={};objects={}
 for j,(off,name,count) in enumerate([(0x530,'main',2),(0x5ac,'feedwater',2),(0x588,'safety',4),(0x4f8,'turbine_percent',1)]):
  target=0x20009000+j*16;methods[target]=name;u.mem_write(vtable+off,struct.pack('<I',target));obj=0x20003000+j*16;collections[obj]=name;u.mem_write(obj,struct.pack('<I',0x20004000))
  for k in range(count):
   ob=0x20005000+j*256+k*16;objects[ob]=(name,k);u.mem_write(ob,struct.pack('<I',0x20004000))
 u.mem_write(0x20004040,struct.pack('<I',0x20009080))
 imports={}
 for j,off in enumerate([0x1094,0x1134,0x11a0,0x10b0,0x1264,0x1048,0x1040]):
  target=0x2000a000+j*16;imports[target]=off;u.mem_write(0x400000+off,struct.pack('<I',target))
 u.mem_write(0x4010ac,struct.pack('<I',0x2000b000));u.mem_write(0x2000b000,b'\xd9\x1d'+struct.pack('<I',0x2000b100)+b'\xd9\x05'+struct.pack('<I',0x2000b100)+b'\xc3')
 u.reg_write(UC_X86_REG_EBX,0x2000a010);u.reg_write(UC_X86_REG_EDI,0x2000a020)
 def r32(p):return struct.unpack('<I',u.mem_read(p,4))[0]
 def i16(p):return struct.unpack('<h',u.mem_read(p,2))[0]
 def single(p):return struct.unpack('<f',u.mem_read(p,4))[0]
 def hook(u,a,size,d):
  sp=u.reg_read(UC_X86_REG_ESP);arg=lambda i:r32(sp+4+4*i)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax&0xffffffff);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);u.reg_write(UC_X86_REG_EIP,r32(sp))
  if a in methods:ret(1,next(ob for ob,name in collections.items() if name==methods[a]));return
  if a==0x20009080:
   name=collections[arg(0)];index=arg(1)&0xffff;ob=next(ob for ob,pair in objects.items() if pair==(name,index));u.mem_write(arg(2),struct.pack('<I',ob));ret(3);return
  if a in imports:
   off=imports[a]
   if off==0x1094:u.mem_write(arg(0),struct.pack('<I',arg(1)));ret(2,arg(1))
   elif off==0x1134:
    dest,ob,prop,count=[arg(i) for i in range(4)];assert count==0;name,index=objects[ob]
    if prop==0x68030009:vt,value=2,c[name] if name=='turbine_percent' else c[name][index]['percent']
    else:assert prop==0x68030008 and name!='turbine_percent';vt,value=11,-1 if c[name][index]['manual'] else 0
    u.mem_write(dest,struct.pack('<H6xh6x',vt,value));ret(0,dest)
   elif off in [0x11a0,0x10b0]:v=i16(arg(0)+8);ret(1,(-1 if v else 0) if off==0x10b0 else v)
   elif off==0x1264:
    name,index=objects[arg(0)];assert arg(1)==0x68030009 and arg(2)==2;c[name][index]['percent']=i16(sp+20);ret(6)
   else:ret(0)
   return
  if not (BASE<=a<BASE+PE.OPTIONAL_HEADER.SizeOfImage or 0x2000b000<=a<=0x2000b00c):raise RuntimeError(f'Unknown SG valves target {a:#x}')
 u.hook_add(UC_HOOK_CODE,hook)
 try:u.emu_start(0x509213,0x50a8a6,count=20000)
 except Exception as e:raise RuntimeError(f"SG valve reference failed at {u.reg_read(UC_X86_REG_EIP):#x}, ESP={u.reg_read(UC_X86_REG_ESP):#x}") from e
 assert u.reg_read(UC_X86_REG_EIP)==0x50a8a6
 return dict(singles={hex(addresses[(o-8)//4]):single(addresses[(o-8)//4]) for o in [0x68,0xa0,0xa8,0x94,0x98]}|{'0x54b718':single(0x54b718)},controls=c)

if __name__=='__main__':
 rng=random.Random(20261021);cases=[]
 for i in range(1200):
  side=i%2;addresses=[int(a['pointer'],16) for a in BINDINGS[side]['arguments']]
  pressure=[899.99994,900.,900.00006,969.99994,970.,970.00006,999.99994,1000.,1000.00006,1169.9999,1170.,1170.0001,1199.9999,1200.,1200.0001][(i//2)%15]
  vals={8:pressure,0xc:[.1,.5,1.][i%3],0x14:[99.99999,100.,100.00001,300.][(i//3)%4],0x68:rng.uniform(-100,1000),0x6c:rng.uniform(800,1300),0x78:rng.uniform(.01,2000),0x90:rng.uniform(-100,2000),0x94:rng.uniform(-100000,100000),0x98:rng.uniform(-100000,100000),0xa0:42.,0xa4:1/3 if side==0 else 2/3,0xa8:rng.uniform(-100,1000)}
  s={hex(addresses[(o-8)//4]):f32(v) for o,v in vals.items()};s.update({'0x54b58c':900.,'0x54b164':1000.,'0x54b2ac':1200.,'0x54b168':100.,'0x54b2a8':200.,'0x54bf84':f32(rng.uniform(-100,100)),'0x54b714':300.,'0x54bb50':f32(rng.uniform(-100,100)),'0x54bb54':f32(rng.uniform(-100,100))})
  s.setdefault('0x54b4fc',f32(rng.uniform(800,1300)))
  def control():return dict(percent=rng.choice([0,50,100]),manual=bool(rng.getrandbits(1)))
  c=dict(shutdown_time=100.,fault_flags=[[-1,0],[0,-1],[0,0],[1,1]][(i//5)%4],turbine_percent=[0,50,100][(i//7)%3],main=[control(),control()],feedwater=[control(),control()],safety=[control() for j in range(4)])
  q=dict(globals=dict(singles=s,integers={}),side='A' if side==0 else 'B',controls=c);cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/steam_valves_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'SG valves/outflow cases')
