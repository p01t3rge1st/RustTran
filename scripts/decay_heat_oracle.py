#!/usr/bin/env python3
"""Original alternate decay-heat routine 0x52cbc0 numeric body.
Coefficient arrays are written by original instructions 0x52cc46 onwards.
VB6 rtcExp, rtcSqr and FpI4 execute original DLL code, explicit x87 53-bit
precision with a scratch errno cell. Stops before COM/error reporting.
"""
import json,struct,hashlib,random
from native_math_oracle import ROOT,EXE,PE,BASE
from native_variant_runtime import NativeVariantRuntime
from unicorn import UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EBX,UC_X86_REG_EIP,UC_X86_REG_FPCW,UC_X86_REG_EAX
runtime=NativeVariantRuntime()
def execute(time,power):
 u,_=runtime.machine(capture_trace=False);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_FPCW,0x027f);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EBX,0)
 u.mem_write(frame-0x64,struct.pack('<I',0x20001000));u.mem_write(frame-0x48,struct.pack('<I',0x20001100));u.mem_write(frame+8,struct.pack('<I',0x20001200));u.mem_write(0x20001200,struct.pack('<d',time));u.mem_write(0x54b120,struct.pack('<f',power));u.mem_write(0x54b000,bytes(4))
 for a,name in [(0x401020,'rtcExp'),(0x401228,'rtcSqr'),(0x40123c,'__vbaFpI4')]:u.mem_write(a,struct.pack('<I',runtime.exports['msvbvm60.dll',name]))
 def hook(uc,a,size,_):
  if a==0x7342c1e1:
   esp=uc.reg_read(UC_X86_REG_ESP);ret=struct.unpack('<I',uc.mem_read(esp,4))[0];uc.reg_write(UC_X86_REG_EAX,0x20001300);uc.reg_write(UC_X86_REG_ESP,esp+4);uc.reg_write(UC_X86_REG_EIP,ret)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x52cc46,0x52d12e,count=200000);assert u.reg_read(UC_X86_REG_EIP)==0x52d12e
 return dict(heat=struct.unpack('<d',u.mem_read(frame-0x24,8))[0]),dict(weights=list(struct.unpack('<11d',u.mem_read(0x20001000,88))),rates=list(struct.unpack('<11d',u.mem_read(0x20001100,88))))
if __name__=='__main__':
 rng=random.Random(20261103);times=[0,.001,1,30,150,300,9999.999,10000,10000.001,59999.999,60000,60000.001,1e6,1e8]+[rng.uniform(0,300) for _ in range(286)];cases=[];coeff=None
 for t in times:
  p=struct.unpack('<f',struct.pack('<f',rng.uniform(1,5000)))[0];expected,coeff=execute(t,p);cases.append(dict(inputs=dict(time=t,power=p),expected=expected))
 path=ROOT/'analysis/decay_heat_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),dll_sha256=hashlib.sha256((ROOT/'analysis/program/msvbvm60.dll').read_bytes()).hexdigest(),coefficients=coeff,cases=cases),indent=2)+'\n');print(len(cases),'alternate decay heat cases',coeff)
