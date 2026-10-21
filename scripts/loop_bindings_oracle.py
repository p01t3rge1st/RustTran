#!/usr/bin/env python3
"""Execute original push sequences for both calls to 0x505370.
Separately execute original loop-B count subtraction and VB6 FpI2 conversion
with explicit 53-bit x87 context. Does not execute the plant coordinator.
"""
import json,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from native_variant_runtime import NativeVariantRuntime
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
result=[]
for side,start,stop in [('A',0x51ff5c,0x51fffd),('B',0x520037,0x5200d4)]:
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);frame=0x10010000;stack=0x1001f000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,stack);uc.mem_write(0x54b5f8,struct.pack('<I',0x20000000))
    uc.emu_start(start,stop,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==stop;esp=uc.reg_read(UC_X86_REG_ESP);args=struct.unpack('<29I',uc.mem_read(esp,116));assert stack-esp==116
    result.append(dict(side=side,call_va=hex(stop),arguments=[dict(number=i+1,ebp_offset=hex(8+4*i),pointer=hex(value)) for i,value in enumerate(args)]))
runtime=NativeVariantRuntime();counts=[]
for total,a in [(3.,1),(3.,2),(2.,1),(1.,0),(2.5,1),(3.5,1),(3.,-1)]:
    uc,_=runtime.machine(capture_trace=False);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000);uc.reg_write(UC_X86_REG_FPCW,0x027f);uc.mem_write(0x54b4de,struct.pack('<h',a));uc.mem_write(0x54b204,struct.pack('<f',total));uc.mem_write(0x40122c,struct.pack('<I',runtime.exports['msvbvm60.dll','__vbaFpI2']))
    uc.emu_start(0x520002,0x520043,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==0x520043
    counts.append(dict(total=total,a=a,expected=struct.unpack('<h',uc.mem_read(frame-0x14c,2))[0]))
path=ROOT/'analysis/loop_transfer_bindings.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'caller_bindings':result,'loop_b_count_cases':counts},indent=2)+'\n');print(f'2 native caller bindings, {len(counts)} original FpI2 count cases. {path}')
