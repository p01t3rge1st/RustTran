#!/usr/bin/env python3
"""Original upstream primary exchange 0x50b10f–0x50b3ff.
Includes original DELP/property prefixes, native Single stores and pump flags.
Properties use modeled VB numeric helpers; caller x87 precision is 53 bits.
No COM input extraction, event dispatcher or whole-plant integration.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from saturated_balance_oracle import delta
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for k,v in q.items():
  if k.startswith('g'):u.mem_write(int(k.replace('g','0x'),16),struct.pack('<h' if k in ['g54b4e2','g54b4e4'] else '<f',v))
 u.mem_write(frame-0x110,struct.pack('<H6xI4x',0x4004,0x54b684));u.mem_write(0x54b630,struct.pack('<I',0x20002000));u.mem_write(0x20002000,struct.pack('<h',q['fault_flag']));u.mem_write(0x54b614,struct.pack('<I',0x20002100));u.mem_write(0x20002100,struct.pack('<2f',*q['pump_contributions']));calls=[]
 def hook(machine,a,size,_):
  if a in [0x49a3f0,0x49beb0,0x49bf00]:
   esp=machine.reg_read(UC_X86_REG_ESP);ptr=struct.unpack('<I',machine.mem_read(esp+4,4))[0]
   if a==0x49a3f0:ptr=struct.unpack('<I',machine.mem_read(ptr+8,4))[0]
   value=struct.unpack('<f',machine.mem_read(ptr,4))[0];out=delta(value) if a==0x49a3f0 else property_value(a,value);calls.append(dict(address=hex(a),input=value,output=out));machine.mem_write(0x20000200,struct.pack('<f',out));machine.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x50b10f,0x50b3ff,count=4000);assert u.reg_read(UC_X86_REG_EIP)==0x50b3ff
 out={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b6e4,0x54b6e8,0x54bab0,0x54b678,0x54bad8]};out['trace']={name:struct.unpack('<f',u.mem_read(frame+offset,4))[0] for name,offset in [('local_84',-0x84),('local_78',-0x78),('local_b0',-0xb0),('high',-0x60),('low',-0x7c),('delta',-0x64)]};return dict(expected=out,property_calls=calls)
if __name__=='__main__':
 rng=random.Random(20261106);cases=[]
 for i in range(300):
  q={k:f32(v) for k,v in dict(g54b684=rng.uniform(100,2500),g54b730=rng.uniform(.1,10),g54b67c=rng.uniform(-1e6,1e6),g54b680=rng.uniform(-1e6,1e6),g54b530=rng.uniform(100,20000),g54b534=rng.uniform(100,20000),g54b734=rng.uniform(100,1000),g54b134=rng.uniform(0,30),g54b120=rng.uniform(1,5000),g54ba68=rng.uniform(0,150),g54b330=948.0555419921875,g54b6e0=rng.uniform(0,1e5),g54b724=rng.uniform(1000,1500),g54b728=rng.uniform(100,800),g54b688=rng.uniform(0,1),g54b720=rng.uniform(0,2),g54b71c=rng.uniform(-1,1),g54b64c=rng.uniform(.01,.04),g54b650=rng.uniform(.1,10),g54b334=.185).items()};q.update(g54b4e2=[0,1,2][i%3],g54b4e4=[0,1,2][(i//3)%3],fault_flag=[-1,0,1][i%3],pump_contributions=[f32(rng.uniform(0,5000)),f32(rng.uniform(0,5000))]);cases.append(dict(inputs=q,**execute(q)))
 path=ROOT/'analysis/primary_exchange_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'upstream primary exchange cases')
