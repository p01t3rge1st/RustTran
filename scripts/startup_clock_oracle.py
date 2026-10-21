#!/usr/bin/env python3
"""Original 0x51b13c-0x51b174 and 0x51b196 store, including actual
msvbvm60 __vbaR8IntI2 machine code. Checks floor (not nearest rounding),
signed I16 endpoints and Single step values. DLL returns x87 control 0x133f;
subsequent initializer math is outside this isolated comparison.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from native_variant_runtime import NativeVariantRuntime
from unicorn.x86_const import *
runtime=NativeVariantRuntime()
def execute(step):
 u,_=runtime.machine(capture_trace=False);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4));u.mem_write(0x54b414,struct.pack('<f',step));u.mem_write(0x401240,struct.pack('<I',runtime.exports['msvbvm60.dll','__vbaR8IntI2']));u.emu_start(0x51b13c,0x51b174,count=200);assert u.reg_read(UC_X86_REG_EIP)==0x51b174;u.emu_start(0x51b196,0x51b19c,count=2);return {'0x54b700':struct.unpack('<h',u.mem_read(0x54b700,2))[0]}
if __name__=='__main__':
 rng=random.Random(0x51b13c);f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0];values=[0.,.0005,-.0005,.5,.001,1.,-1.,32.767,-32.7675]+[rng.uniform(-32.76,32.76) for _ in range(231)];cases=[]
 for value in values:
  step=f32(value);cases.append(dict(inputs=dict(model='1',ic='1',extra_singles={'0x54b414':step},stages=[dict(kind='startup_clock')]),expected=execute(step)))
 (ROOT/'analysis/startup_clock_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'original clock conversion cases')
