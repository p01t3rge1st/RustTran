#!/usr/bin/env python3
"""Continuous original containment balance 0x5233c5–0x523f36 and numeric vessel
callee. Explicit array/Double/COM sources, independent native property prefixes,
x87 53-bit; VB Single helper and sqrt bridged numerically. No full Windows run.
"""
import hashlib,json,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
WRITES=[0x54c358,0x54c35c,0x54b660,0x54b664,0x54bb2c,0x54bb30,0x54bb34,0x54b544,0x54bb40,0x54bb44,0x54c060,0x54bb48,0x54bb4c,0x54bb50,0x54bb54,0x54bb58,0x54bb5c,0x54bb60,0x54bb28,0x54b674,0x54b4b8,0x54b74c]
VESSEL_ARGS=[0x54b544,0x54b800,0x54b548,0x54b54c,0x54bb58,0x54bb60,0x54bb5c,0x54bb28,0x54b2c0,0x54b2bc,0x54b160]
def feedback(g):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_FPCW,0x027f)
 for a in [0x54b2f8,0x54b2d8,0x54bb08,0x54b2d4,0x54b74c,0x54b548]:u.mem_write(a,struct.pack('<f',g['singles'][hex(a)]))
 for start,stop in [(0x5232ee,0x523306),(0x523310,0x523312),(0x523326,0x523332),(0x52333f,0x523345),(0x523352,0x523358)]:u.emu_start(start,stop,count=100)
 return {hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54bb0c,0x54bb10]}
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0,4096);u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x20000)
 frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f)
 def wr(a,v):u.mem_write(a,struct.pack('<f',v))
 def r32(a):return struct.unpack('<I',u.mem_read(a,4))[0]
 c=q['inputs']
 for a,v in q['globals']['singles'].items():wr(int(a,16),v)
 wr(frame-0x34,c['outlet_temperature'])
 u.mem_write(0x54bf7c,struct.pack('<d',c['gas_source']));u.mem_write(0x54bdf4,struct.pack('<d',c['heat_source']))
 u.mem_write(0x54b614,struct.pack('<I',0x20008000));wr(0x2000803c,c['fault_level'])
 u.mem_write(0x54b5f8,struct.pack('<I',0x20008100))
 for i,v in enumerate(c['event_times']):wr(0x20008108+i*4,v)
 u.mem_write(0x54b000,bytes(4))
 # Single rounding helper executes actual fstp/fld; sqrt executes x87 fsqrt.
 for address,code in [(0x20006000,b'\xd9\x1d'+struct.pack('<I',0x20006200)+b'\xd9\x05'+struct.pack('<I',0x20006200)+b'\xc3'),(0x20006020,b'\xdd\x44\x24\x04\xd9\xfa\xc2\x08\x00'),(0x20006040,b'\xc2\x04\x00')]:u.mem_write(address,code)
 for a,v in [(0x4010ac,0x20006000),(0x401228,0x20006020),(0x401090,0x20006040)]:u.mem_write(a,struct.pack('<I',v))
 props={(0x4a4,0,9):c['auxiliary_percent'],(0x530,0,9):c['vent_percent']};objects={};vtable=0x20001000;form=0x20002000;u.mem_write(form,struct.pack('<I',vtable));u.mem_write(0x54b024,struct.pack('<I',form))
 def obj(tag):
  if tag not in objects:
   p=0x20003000+len(objects)*16;objects[tag]=p;u.mem_write(p,struct.pack('<I',vtable))
  return objects[tag]
 methods={}
 for off in [0x40,0x4a4,0x530]:
  p=0x20004000+len(methods)*16;methods[p]=off;u.mem_write(vtable+off,struct.pack('<I',p))
 imports={}
 for off in [0x1094,0x1134,0x11a0,0x1048,0x102c]:
  p=0x20005000+len(imports)*16;imports[p]=off;u.mem_write(BASE+off,struct.pack('<I',p))
 u.reg_write(UC_X86_REG_ESI,next(a for a,off in imports.items() if off==0x1094))
 called=False;iterations=0
 def hook(u,a,size,data):
  nonlocal called,iterations
  if a in [0x524628,0x40471c,0x501e4e]:raise ValueError(f'native balance arithmetic failure {a:#x}')
  if a==0x5011b0:
   called=True;sp=u.reg_read(UC_X86_REG_ESP);assert [r32(sp+4+i*4) for i in range(11)]==VESSEL_ARGS
  if a==0x50164c:iterations+=1
  if a==0x501ca0:
   # Numerical body complete, before its UI tail: execute the callee epilogue
   # for this cdecl frame without its unported COM/error-reporting tail.
   ebp=u.reg_read(UC_X86_REG_EBP);u.reg_write(UC_X86_REG_ESP,ebp);u.reg_write(UC_X86_REG_EBP,r32(ebp));u.reg_write(UC_X86_REG_ESP,ebp+4)
   u.mem_write(0x20006100,b'\xc2\x2c\x00');u.reg_write(UC_X86_REG_EIP,0x20006100);return
  if a in [0x49ab70,0x49ae10,0x49bf00,0x49bde0,0x49beb0,0x49c190,0x49be30]:
   sp=u.reg_read(UC_X86_REG_ESP);v=struct.unpack('<f',u.mem_read(r32(sp+4),4))[0];wr(0x20006300,property_value(a,v));u.mem_write(0x20006310,b'\xd9\x05'+struct.pack('<I',0x20006300)+b'\xc2\x04\x00');u.reg_write(UC_X86_REG_EIP,0x20006310);return
  if a not in imports and a not in methods:return
  sp=u.reg_read(UC_X86_REG_ESP);arg=lambda i:r32(sp+4+i*4)
  def ret(n,eax=0):u.reg_write(UC_X86_REG_EAX,eax&0xffffffff);u.reg_write(UC_X86_REG_ESP,sp+4+n*4);u.reg_write(UC_X86_REG_EIP,r32(sp))
  if a in methods:
   off=methods[a]
   if off!=0x40:ret(1,obj((off,)));return
   collection=next(t for t,p in objects.items() if p==arg(0))[0];u.mem_write(arg(2),struct.pack('<I',obj((collection,arg(1)))));ret(3);return
  off=imports[a]
  if off==0x1094:u.mem_write(arg(0),struct.pack('<I',arg(1)));ret(2,arg(1))
  elif off==0x1134:
   tag=next(t for t,p in objects.items() if p==arg(1));assert arg(3)==0;v=props[(*tag,arg(2)&255)];u.mem_write(arg(0),struct.pack('<H6xh6x',2,v));ret(0,arg(0))
  elif off==0x11a0:ret(1,struct.unpack('<h',u.mem_read(arg(0)+8,2))[0])
  elif off==0x1048:ret(0)
  elif off==0x102c:ret(0)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x5233c5,0x523f36,count=150000)
 assert u.reg_read(UC_X86_REG_EIP)==0x523f36
 writes=WRITES+([0x54b800,0x54b548,0x54b54c] if called else [])
 return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in writes},vessel_called=called,vessel_iterations=iterations)
def base():
 vals={0x54bb20:property_value(0x49bde0,200.),0x54b2bc:1000.,0x54b2c0:1000.,0x54b54c:.1,0x54b544:26.,0x54b548:200.,0x54b800:14.7,0x54b2dc:0.,0x54c064:.2,0x54b40c:100.,0x54b41c:0.,0x54b538:1.,0x54ba70:1.,0x54b4fc:100.,0x54b4c0:10.,0x54b414:1.,0x54b6a4:0.,0x54bf9c:0.,0x54bb14:0.,0x54ba24:0.,0x54b32c:1.,0x54bb1c:168.,0x54b738:300.,0x54ba90:400.,0x54b73c:500.,0x54b750:0.,0x54bb0c:0.,0x54b754:0.,0x54b330:1.,0x54bfb8:0.,0x54b160:60.,0x54b334:.185,0x54bb10:200.}
 return dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={}),inputs=dict(outlet_temperature=100.,fault_level=0.,event_times=[100.,100.],auxiliary_percent=0,vent_percent=0,gas_source=0.,heat_source=0.))
def main():
 import copy
 cases=[]
 for i in range(144):
  q=base();s=q['globals']['singles'];c=q['inputs'];group=i//24;j=i%24
  if group==0:
   s['0x54b6a4']=[-3.,-2.000000238418579,-2.,-1.0000001192092896,-1.,0.,1.,1.0000001192092896,2.,2.000000238418579,3.,10.][j%12]
   s['0x54bb14']=[0.,5.,5.000000476837158,20.][j//6]
  elif group==1:
   s['0x54b41c']=[.001,.01,.1][j%3];s['0x54b4fc']=[20.,26.,100.][j//3%3];c['event_times']=[[100.,100.],[100.00000762939453,100.],[100.,100.00000762939453],[99.99999237060547,99.99999237060547]][j//6];c['vent_percent']=[-1,0,25,100][j%4]
  elif group==2:
   c['fault_level']=[0.,.01,.1,-.001][j%4];c['auxiliary_percent']=[-1,0,100][j//4%3];s['0x54b544']=[14.,14.7,14.700000762939453,26.][j//6]
  elif group==3:
   c['gas_source']=[-3.,-2.,-1.9999999,0.,2.,3.][j%6];s['0x54b750']=[-1.0000001192092896,-1.,1.,1.0000001192092896][j//6]
  elif group==4:
   s['0x54b6a4']=[0.,1.,3.,10.][j%4];c['heat_source']=[-1234.567891,0.,1234.567891][j//4%3];c['gas_source']=.0123456789123;s['0x54bfb8']=20.;s['0x54b754']=30.;s['0x54bb0c']=300.
  else:
   t=[100.,300.,500.][j%3];s['0x54b548']=t;s['0x54bb20']=property_value(0x49bde0,t);s['0x54b544']=f32(s['0x54bb20']+14.7);s['0x54b54c']=[0.,.01,.1,.5][j//3%4];s['0x54b6a4']=[0.,3.][j//12];s['0x54b750']=500.
  s.update({a:f32(v) for a,v in s.items()});cases.append(dict(inputs=q,expected=execute(q)))
 out=ROOT/'analysis/containment_balance_fixtures.json';out.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'native containment balance/vessel cases;',sum(c['expected']['vessel_called'] for c in cases),'vessel calls')
if __name__=='__main__':main()
