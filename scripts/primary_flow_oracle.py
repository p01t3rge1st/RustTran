#!/usr/bin/env python3
"""Original primary flow preparation 0x50bae2–0x50bdd9.
Original VB6 rtcSqr executes DLL code at explicit 53-bit precision. Critical
flux uses independently executed original selector/table prefixes. FpR4 is a
Single round shim. Includes low-pressure latch/snapshot/ramp and mixture flow.
No COM, phase-entry branch selection or complete plant/event dispatcher.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from native_variant_runtime import NativeVariantRuntime
from relief_oracle import critical
from unicorn import UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EBX,UC_X86_REG_ESI,UC_X86_REG_EDI,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW,UC_X86_REG_EAX
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
runtime=NativeVariantRuntime()
def execute(q):
 u,_=runtime.machine(capture_trace=False);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EBX,0);u.reg_write(UC_X86_REG_ESI,1);u.reg_write(UC_X86_REG_EDI,2);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for name,v in q.items():u.mem_write(int(name.replace('g','0x'),16),struct.pack('<h' if name=='g54b4ea' else '<f',v))
 u.mem_write(0x401228,struct.pack('<I',runtime.exports['msvbvm60.dll','rtcSqr']));u.mem_write(0x4010ac,struct.pack('<I',0x20000000));u.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3');calls=[]
 def hook(machine,a,size,_):
  if a==0x7342c1e1:
   esp=machine.reg_read(UC_X86_REG_ESP);ret=struct.unpack('<I',machine.mem_read(esp,4))[0];machine.reg_write(UC_X86_REG_EAX,0x20000300);machine.reg_write(UC_X86_REG_ESP,esp+4);machine.reg_write(UC_X86_REG_EIP,ret)
  elif a==0x49b3a0:
   esp=machine.reg_read(UC_X86_REG_ESP);p,f=struct.unpack('<2I',machine.mem_read(esp+4,8));pressure=struct.unpack('<f',machine.mem_read(p,4))[0];phase=struct.unpack('<h',machine.mem_read(f,2))[0];value=critical(pressure,phase);calls.append(dict(pressure=pressure,phase=phase,flux=value));machine.mem_write(0x20000200,struct.pack('<f',value));machine.mem_write(0x20000020,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x08\x00');machine.reg_write(UC_X86_REG_EIP,0x20000020)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x50bae2,0x50bdd9,count=30000);assert u.reg_read(UC_X86_REG_EIP)==0x50bdd9
 out={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b668,0x54b66c,0x54b670,0x54b7f0]};out['0x54b4ea']=struct.unpack('<h',u.mem_read(0x54b4ea,2))[0];out['trace']={n:struct.unpack('<f',u.mem_read(frame+o,4))[0] for n,o in [('local_54',-0x54),('local_40',-0x40),('local_4c',-0x4c),('local_58',-0x58)]};return dict(expected=out,critical_calls=calls)
if __name__=='__main__':
 rng=random.Random(20261114);cases=[]
 for i in range(400):
  floor=f32(rng.uniform(20,1000));margin=f32(rng.uniform(1,200));p=f32(floor+[0,-.01,.01,margin,margin-.01,margin+.01][i%6]) if i<120 else f32(rng.uniform(1,3000));q={k:f32(v) for k,v in dict(g54b494=p,g54b684=rng.uniform(1,3000),g54b64c=rng.uniform(.01,.04),g54bab0=rng.uniform(0,.5),g54b544=floor,g54b2e0=margin,g54b66c=rng.uniform(0,1e4),g54b670=rng.uniform(0,1e4),g54ba34=[0,.5,1][i%3],g54b728=rng.uniform(100,800),g54b724=rng.uniform(1000,1500),g54b4a4=rng.uniform(100,10000),g54b688=rng.uniform(0,1),g54b650=rng.uniform(.1,10)).items()};q['g54b4ea']=i%2;cases.append(dict(inputs=q,**execute(q)))
 path=ROOT/'analysis/primary_flow_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),dll_sha256=hashlib.sha256((ROOT/'analysis/program/msvbvm60.dll').read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'primary flow/latch cases')
