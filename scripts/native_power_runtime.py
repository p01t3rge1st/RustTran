#!/usr/bin/env python3
"""Execute original VB6 PowerR8 and its embedded math routine.
Numeric tests use explicit x87 control word 0x027f (53-bit precision,
round-to-nearest). CRT errno lookup at 0x7342c1e1 is replaced by an explicit
scratch errno cell; arithmetic code is not replaced. Unknown system calls
remain fail-closed. This does not prove the original application's FPU setting.
"""
import struct,hashlib,json
from functools import lru_cache
from native_variant_runtime import NativeVariantRuntime,ROOT
from unicorn import UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_EAX,UC_X86_REG_FPCW
RUNTIME=NativeVariantRuntime()
@lru_cache(maxsize=4096)
def power(base,exponent):
    machine,_=RUNTIME.machine(capture_trace=False);machine.reg_write(UC_X86_REG_FPCW,0x027f)
    machine.mem_write(0x1001f000,struct.pack('<Idd',0x20000080,base,exponent));machine.reg_write(UC_X86_REG_ESP,0x1001f000)
    machine.mem_write(0x20000080,b'\xdd\x1d'+struct.pack('<I',0x20000200));errno_calls=0
    def hook(uc,address,size,_):
        nonlocal errno_calls
        if address==0x7342c1e1:
            errno_calls+=1;esp=uc.reg_read(UC_X86_REG_ESP);ret=struct.unpack('<I',uc.mem_read(esp,4))[0]
            uc.reg_write(UC_X86_REG_EAX,0x20000300);uc.reg_write(UC_X86_REG_ESP,esp+4);uc.reg_write(UC_X86_REG_EIP,ret)
    machine.hook_add(UC_HOOK_CODE,hook);machine.emu_start(RUNTIME.exports['msvbvm60.dll','__vbaPowerR8'],0x20000086,count=100000)
    assert machine.reg_read(UC_X86_REG_EIP)==0x20000086
    errno=struct.unpack('<i',machine.mem_read(0x20000300,4))[0]
    if errno!=0:raise RuntimeError(f'Original PowerR8 errno={errno} for {base}, {exponent}')
    return struct.unpack('<d',machine.mem_read(0x20000200,8))[0]
if __name__=='__main__':
    cases=[dict(base=b,exponent=e,output=power(b,e)) for b in [0,1e-6,.1,1,2,10,100] for e in [.8,1.3]]
    out=ROOT/'analysis/native_power_runtime.json';out.write_text(json.dumps({'method':__doc__,'dll_sha256':hashlib.sha256((ROOT/'analysis/program/msvbvm60.dll').read_bytes()).hexdigest(),'fpu_control_word':'0x027f','errno_lookup':'explicit scratch cell','cases':cases},indent=2)+'\n');print(f'{len(cases)} original DLL power cases. {out}')
