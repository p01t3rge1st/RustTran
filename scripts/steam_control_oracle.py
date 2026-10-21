#!/usr/bin/env python3
"""Original SG initial control prefix 0x5089f0–0x509213 continuously executed.
Original HGAS/PI prefixes and installer PowerR8 execute independently. Only
explicit stateful COM properties and Single-round/runtime bridges replace UI.
The SG selector is derived from the native A/B caller constants, not guessed
phase state. Later feedwater/valve automation is outside this prefix.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from steam_generator_oracle import bindings
from native_power_runtime import power
from vessel_oracle import property_value
from controller_oracle import execute as pi
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
BINDINGS=bindings()
OUTPUT_OFFSETS=[0x20,0x30,0x6c,0x84,0x88,0x90,0xa8]
FLOAT_OFFSETS=[8,0xc,0x10,0x14,0x1c,0x20,0x24,0x28,0x2c,0x30,0x34,0x38,0x4c,0x64,0x68,0x84,0x88,0x90,0x94,0x98,0xa4,0xa8]
INT_OFFSETS=[0x3c,0x40,0x48,0x8c]

def execute(q):
 side=0 if q['side']=='A' else 1;addresses=[int(a['pointer'],16) for a in BINDINGS[side]['arguments']]
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x20000)
 frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EBX,0);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for k,v in q['globals']['singles'].items():u.mem_write(int(k,16),struct.pack('<f',v))
 for k,v in q['globals']['integers'].items():u.mem_write(int(k,16),struct.pack('<h',v))
 for i,p in enumerate(addresses):u.mem_write(frame+8+4*i,struct.pack('<I',p))
 u.mem_write(addresses[(0x18-8)//4],struct.pack('<f',q['controls']['failure_time']));u.mem_write(addresses[(0x9c-8)//4],struct.pack('<h',side))
 u.mem_write(0x54b630,struct.pack('<I',0x20007000));u.mem_write(0x20007010,struct.pack('<h',q['controls']['fault_flag']))
 fault_selected=q['controls']['fault_selected'];vtable=0x20001000;objs=[0x20002000+i*16 for i in range(4)]
 for p in objs:u.mem_write(p,struct.pack('<I',vtable))
 u.mem_write(0x54b024,struct.pack('<I',objs[0]));methods={}
 for off in [0x5ac,0x548,0x40]:
  p=0x20003000+len(methods)*16;methods[p]=off;u.mem_write(vtable+off,struct.pack('<I',p))
 imports={}
 for off in [0x1094,0x1134,0x1264,0x11a0,0x10b0,0x1048,0x1040,0x1280,0x102c]:
  p=0x20004000+len(imports)*16;imports[p]=off;u.mem_write(0x400000+off,struct.pack('<I',p))
 u.mem_write(0x4010ac,struct.pack('<I',0x20005000));u.mem_write(0x20005000,b'\xd9\x1d'+struct.pack('<I',0x20005100)+b'\xd9\x05'+struct.pack('<I',0x20005100)+b'\xc3')
 u.mem_write(0x4011f4,struct.pack('<I',0x20005020))
 def read32(p):return struct.unpack('<I',u.mem_read(p,4))[0]
 def single(p):return struct.unpack('<f',u.mem_read(p,4))[0]
 def bridge(result,single_result,argc):
  p=0x20005200;u.mem_write(p,struct.pack('<f' if single_result else '<d',result));u.mem_write(0x20005300,(b'\xd9\x05' if single_result else b'\xdd\x05')+struct.pack('<I',p)+b'\xc2'+struct.pack('<H',argc*4));u.reg_write(UC_X86_REG_EIP,0x20005300)
 def hook(u,a,size,d):
  nonlocal fault_selected
  if a==0x49ae10:
   sp=u.reg_read(UC_X86_REG_ESP);bridge(property_value(a,single(read32(sp+4))),True,1);return
  if a==0x512290:
   sp=u.reg_read(UC_X86_REG_ESP);ps=[read32(sp+4+i*4) for i in range(10)];names=['measured','target','proportional_band','output','previous_error','gain','integral_time','step','lower','upper'];out=pi(dict(zip(names,map(single,ps))),0x027f)
   for i,n in [(3,'output'),(4,'previous_error')]:u.mem_write(ps[i],struct.pack('<f',out[n]))
   u.mem_write(0x20005300,b'\xc2\x28\x00');u.reg_write(UC_X86_REG_EIP,0x20005300);return
  if a==0x20005020:
   sp=u.reg_read(UC_X86_REG_ESP);b,e=struct.unpack('<2d',u.mem_read(sp+4,16));bridge(power(b,e),False,4);return
  if a not in methods and a not in imports:
   if not (BASE<=a<BASE+PE.OPTIONAL_HEADER.SizeOfImage or 0x20005000<=a<=0x2000500c or 0x20005300<=a<=0x20005306):raise RuntimeError(f'Unknown SG prefix target {a:#x}')
   return
  sp=u.reg_read(UC_X86_REG_ESP);arg=lambda i:read32(sp+4+4*i)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax&0xffffffff);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);u.reg_write(UC_X86_REG_EIP,read32(sp))
  if a in methods:
   off=methods[a]
   if off==0x5ac:ret(1,objs[1])
   elif off==0x548:ret(1,objs[3])
   else:assert arg(0)==objs[1] and arg(1)&0xffff==side;u.mem_write(arg(2),struct.pack('<I',objs[2]));ret(3)
   return
  off=imports[a]
  if off==0x1094:u.mem_write(arg(0),struct.pack('<I',arg(1)));ret(2,arg(1))
  elif off==0x1134:
   dest,ob,prop,count=[arg(i) for i in range(4)];assert count==0
   if ob==objs[2]:assert prop==0x68030009;vt,value=2,q['controls']['feedwater_percent']
   else:assert ob==objs[3] and prop==0x68030005;vt,value=11,-1 if fault_selected else 0
   u.mem_write(dest,struct.pack('<H6xh6x',vt,value));ret(0,dest)
  elif off==0x1264:assert arg(0)==objs[3] and arg(1)==0x68030005 and arg(2)&0xffff==11;fault_selected=bool(struct.unpack('<h',u.mem_read(sp+20,2))[0]);ret(6)
  elif off in [0x11a0,0x10b0]:
   v=struct.unpack('<h',u.mem_read(arg(0)+8,2))[0];ret(1,(-1 if v else 0) if off==0x10b0 else v)
  else:ret(0)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x5089f0,0x509213,count=10000);assert u.reg_read(UC_X86_REG_EIP)==0x509213
 return dict(singles={hex(addresses[(off-8)//4]):single(addresses[(off-8)//4]) for off in OUTPUT_OFFSETS},fault_selected=fault_selected,trace={n:single(frame+o) for n,o in [('gain',-0x34),('capacity',-0x28),('maximum_feedwater',-0x24),('level_error',-0x38)]})
if __name__=='__main__':
 rng=random.Random(20261020);cases=[]
 for i in range(960):
  side=i%2;addresses=[int(a['pointer'],16) for a in BINDINGS[side]['arguments']]
  vals={8:rng.uniform(100,1800),0xc:[0.,.1,1.][i%3],0x10:50.,0x14:[0.,10.,69.99999,70.,70.00001,150.,300.][(i//2)%7],0x1c:1000.,0x20:rng.uniform(-100,1500),0x24:.5,0x28:.8,0x2c:[.2,.5,.9][(i//7)%3],0x30:10.,0x34:900.,0x38:1.,0x4c:1000.,0x64:rng.uniform(.1,.9),0x68:rng.uniform(0,1200),0x84:rng.uniform(-1,1),0x88:rng.uniform(-1,1),0x90:rng.uniform(-100,100),0x94:100.,0x98:200.,0xa4:1/3 if side==0 else 2/3,0xa8:0.}
  s={hex(addresses[(o-8)//4]):f32(v) for o,v in vals.items()};s.update({'0x54b208':1.,'0x54b18c':.2,'0x54b184':.1,'0x54b20c':.5,'0x54b194':1.})
  ints={hex(addresses[(o-8)//4]):v for o,v in {0x3c:[0,1][(i//11)%2],0x40:[0,1][(i//5)%2],0x48:[0,1][(i//3)%2],0x8c:[0,1,2][(i//13)%3]}.items()}
  q=dict(globals=dict(singles=s,integers=ints),side='A' if side==0 else 'B',controls=dict(failure_time=100.,fault_flag=[0,-1,1][(i//17)%3],fault_selected=bool(i&32),feedwater_percent=[0,50,100][(i//19)%3]));cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/steam_control_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'SG control-prefix cases')
