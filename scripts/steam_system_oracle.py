#!/usr/bin/env python3
"""Continuous SG numerical/control body 0x5089f0-0x50ad65, or auxiliary branch
0x50a8a6-0x50ac31. Original HGAS, PI, saturated and DLL power execute independently;
only known runtime bridges and explicit stateful COM replace UI/runtime access.
No application initialization, scheduler, COM callbacks or Windows trajectory.
"""
import copy,hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from steam_generator_oracle import bindings
from native_power_runtime import power
from vessel_oracle import property_value
from controller_oracle import execute as pi
from saturated_balance_oracle import execute as saturated
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
BINDINGS=bindings()

def execute(q, aux_only=False):
 c=copy.deepcopy(q['controls']['valves']) if not aux_only else {};side=0 if q['side']=='A' else 1
 initial=q['controls']['initial'] if not aux_only else None
 auxiliary=q['auxiliary_percent'] if aux_only else q['controls']['auxiliary_percent']
 selected=initial['fault_selected'] if initial else False
 addresses=[int(a['pointer'],16) for a in BINDINGS[side]['arguments']]
 if not aux_only:
  required=[8,0xc,0x10,0x14,0x1c,0x20,0x24,0x28,0x2c,0x30,0x34,0x38,0x4c,0x50,0x5c,0x60,0x64,0x68,0x78,0x80,0x84,0x88,0x90,0x94,0x98,0xa4]
  for off in required:assert hex(addresses[(off-8)//4]) in q['globals']['singles'],hex(addresses[(off-8)//4])
  for a in [0x54b208,0x54b18c,0x54b184,0x54b20c,0x54b194,0x54b58c,0x54b164,0x54b2ac,0x54b168,0x54b2a8,0x54bf84,0x54b714,0x54bb50,0x54bb54,0x54b72c,0x54b734,0x54b544,0x54b334,0x54b4fc]:assert hex(a) in q['globals']['singles'],hex(a)
  for off in [0x3c,0x40,0x44,0x48,0x8c]:assert hex(addresses[(off-8)//4]) in q['globals']['integers']
 # Caller locals must not alias this separately emulated callee's frame locals.
 for i,p in enumerate(addresses):
  if 0x10000000<=p<0x10020000:addresses[i]=0x20020000+i*16
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x30000)
 frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for k,v in q['globals']['singles'].items():u.mem_write(int(k,16),struct.pack('<f',v))
 for k,v in q['globals']['integers'].items():u.mem_write(int(k,16),struct.pack('<h',v))
 for i,p in enumerate(addresses):u.mem_write(frame+8+4*i,struct.pack('<I',p))
 u.mem_write(addresses[(0x7c-8)//4],struct.pack('<f',c.get('shutdown_time',99999.)));u.mem_write(addresses[(0x9c-8)//4],struct.pack('<h',side))
 if side and not aux_only:u.mem_write(addresses[(0xac-8)//4],struct.pack('<f',-q['globals']['singles']['0x54bf84']))
 u.mem_write(0x54b630,struct.pack('<I',0x20000100));u.mem_write(0x20000104,struct.pack('<2h',*c.get('fault_flags',[0,0])))
 if initial:
  u.mem_write(addresses[(0x18-8)//4],struct.pack('<f',initial['failure_time']));u.mem_write(0x20000110,struct.pack('<h',initial['fault_flag']))
 form=0x20001000;vtable=0x20002000;u.mem_write(0x54b024,struct.pack('<I',form));u.mem_write(form,struct.pack('<I',vtable));methods={};collections={};objects={}
 for j,(off,name,count) in enumerate([(0x530,'main',2),(0x5ac,'feedwater',4),(0x588,'safety',4),(0x4f8,'turbine_percent',1)]):
  target=0x20009000+j*16;methods[target]=name;u.mem_write(vtable+off,struct.pack('<I',target));obj=0x20003000+j*16;collections[obj]=name;u.mem_write(obj,struct.pack('<I',0x20004000))
  for k in range(count):
   ob=0x20005000+j*256+k*16;objects[ob]=(name,k);u.mem_write(ob,struct.pack('<I',0x20004000))
 methods[0x20009040]='fault_selected';u.mem_write(vtable+0x548,struct.pack('<I',0x20009040));objects[0x20006000]=('fault_selected',0);u.mem_write(0x20006000,struct.pack('<I',0x20004000))
 u.mem_write(0x20004040,struct.pack('<I',0x20009080))
 imports={}
 for j,off in enumerate([0x1094,0x1134,0x11a0,0x10b0,0x1264,0x1048,0x1040,0x1280,0x102c]):
  target=0x2000a000+j*16;imports[target]=off;u.mem_write(0x400000+off,struct.pack('<I',target))
 u.mem_write(0x4010ac,struct.pack('<I',0x2000b000));u.mem_write(0x2000b000,b'\xd9\x1d'+struct.pack('<I',0x2000b100)+b'\xd9\x05'+struct.pack('<I',0x2000b100)+b'\xc3')
 u.reg_write(UC_X86_REG_EBX,0x2000a010 if aux_only else 0);u.reg_write(UC_X86_REG_EDI,0x2000a020)
 u.mem_write(0x4011f4,struct.pack('<I',0x2000b200))
 def bridge(result,is_single,argc):
  p=0x2000b400;u.mem_write(p,struct.pack('<f' if is_single else '<d',result));u.mem_write(0x2000b300,(b'\xd9\x05' if is_single else b'\xdd\x05')+struct.pack('<I',p)+b'\xc2'+struct.pack('<H',argc*4));u.reg_write(UC_X86_REG_EIP,0x2000b300)
 def r32(p):return struct.unpack('<I',u.mem_read(p,4))[0]
 def i16(p):return struct.unpack('<h',u.mem_read(p,2))[0]
 def single(p):return struct.unpack('<f',u.mem_read(p,4))[0]
 trail=[]
 def hook(u,a,size,d):
  nonlocal selected
  trail.append(hex(a));trail[:]=trail[-12:]
  sp=u.reg_read(UC_X86_REG_ESP);arg=lambda i:r32(sp+4+4*i)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax&0xffffffff);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);u.reg_write(UC_X86_REG_EIP,r32(sp))
  if a==0x49ae10:bridge(property_value(a,single(arg(0))),True,1);return
  if a==0x512290:
   ps=[arg(i) for i in range(10)];names=['measured','target','proportional_band','output','previous_error','gain','integral_time','step','lower','upper'];out=pi(dict(zip(names,map(single,ps))),0x027f)
   for i,n in [(3,'output'),(4,'previous_error')]:u.mem_write(ps[i],struct.pack('<f',out[n]))
   ret(10);return
  if a==0x2000b200:
   b,e=struct.unpack('<2d',u.mem_read(sp+4,16));bridge(power(b,e),False,4);return
  if a==0x501e60:
   ps=[arg(i) for i in range(9)];values=[single(p) for p in ps];inp=dict(zip(['fraction','pressure','inflow','inflow_enthalpy','outflow','heat','volume'],values[2:]));inp['pressure_work']=q['globals']['singles']['0x54b334'];out=saturated(inp)['expected']
   for p,n in zip(ps[:2],['fraction_derivative','pressure_derivative']):u.mem_write(p,struct.pack('<f',out[n]))
   ret(9);return
  if a in methods:ret(1,0x20006000 if methods[a]=='fault_selected' else next(ob for ob,name in collections.items() if name==methods[a]));return
  if a==0x20009080:
   name=collections[arg(0)];index=arg(1)&0xffff;ob=next(ob for ob,pair in objects.items() if pair==(name,index));u.mem_write(arg(2),struct.pack('<I',ob));ret(3);return
  if a in imports:
   off=imports[a]
   if off==0x1094:u.mem_write(arg(0),struct.pack('<I',arg(1)));ret(2,arg(1))
   elif off==0x1134:
    dest,ob,prop,count=[arg(i) for i in range(4)];assert count==0;name,index=objects[ob]
    if prop==0x68030005:assert name=='fault_selected';vt,value=11,-1 if selected else 0
    elif prop==0x68030009:vt,value=2,(auxiliary[index-2] if name=='feedwater' and index>=2 else c[name] if name=='turbine_percent' else c[name][index]['percent'])
    else:assert prop==0x68030008 and name!='turbine_percent';vt,value=11,-1 if c[name][index]['manual'] else 0
    u.mem_write(dest,struct.pack('<H6xh6x',vt,value));ret(0,dest)
   elif off in [0x11a0,0x10b0]:v=i16(arg(0)+8);ret(1,(-1 if v else 0) if off==0x10b0 else v)
   elif off==0x1264:
    name,index=objects[arg(0)]
    if name=='fault_selected':assert arg(1)==0x68030005 and arg(2)&0xffff==11;selected=bool(i16(sp+20))
    else:assert arg(1)==0x68030009 and arg(2)==2;c[name][index]['percent']=i16(sp+20)
    ret(6)
   else:ret(0)
   return
  if not (BASE<=a<BASE+PE.OPTIONAL_HEADER.SizeOfImage or 0x2000b000<=a<=0x2000b00c or 0x2000b300<=a<=0x2000b306):raise RuntimeError(f'Unknown SG valves target {a:#x}')
 u.hook_add(UC_HOOK_CODE,hook)
 start,stop=(0x50a8a6,0x50ac31) if aux_only else (0x5089f0,0x50ad65)
 if aux_only:u.reg_write(UC_X86_REG_ESI,addresses[(0x68-8)//4])
 try:u.emu_start(start,stop,count=30000)
 except Exception as e:raise RuntimeError(f"SG body failed at {u.reg_read(UC_X86_REG_EIP):#x}; trail {trail}") from e
 assert u.reg_read(UC_X86_REG_EIP)==stop
 active=q['globals']['integers']['0x54b4d2']==1 or q['globals']['integers']['0x54b4d4']==1
 if aux_only:return dict(singles=({hex(addresses[(o-8)//4]):single(addresses[(o-8)//4]) for o in [0x20,0x88]}|{'0x54b718':single(0x54b718)}) if active else {},active=active)
 offsets=[0x20,0x30,0x6c,0x84,0x88,0x90,0xa8,0x68,0xa0,0x94,0x98,8,0x74,0x70,0x58]
 return dict(singles={hex(addresses[(o-8)//4]):single(addresses[(o-8)//4]) for o in offsets}|{'0x54b718':single(0x54b718)},fault_selected=selected,valve_controls=c,auxiliary_active=active)
