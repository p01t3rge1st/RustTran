#!/usr/bin/env python3
"""Execute primary pressure-property prefix 0x51d9ca–0x51dd2c.
Original property/DELP callees are independently emulated numeric prefixes
with modeled helpers. Caller has explicit 53-bit x87 precision. No COM/plant
coordinator, Windows thread context or original FPU-setting validation.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from vessel_oracle import property_value
from saturated_balance_oracle import delta
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
OUTPUTS=[0x54b650,0x54b64c,0x54b724,0x54b728,0x54b778,0x54b71c,0x54b658,0x54b720,0x54b65c]
def execute(pressure):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    uc.reg_write(UC_X86_REG_EBP,0x10010000);uc.reg_write(UC_X86_REG_ESP,0x1001f000);uc.reg_write(UC_X86_REG_FPCW,0x027f);uc.mem_write(0x54b494,struct.pack('<f',pressure));uc.mem_write(0x54b000,struct.pack('<I',0));calls=[]
    def hook(machine,address,size,_):
        if address in [0x49a3f0,0x49beb0,0x49c190,0x49bf00,0x49ae10,0x49ab70]:
            esp=machine.reg_read(UC_X86_REG_ESP);pointer=struct.unpack('<I',machine.mem_read(esp+4,4))[0]
            if address==0x49a3f0:pointer=struct.unpack('<I',machine.mem_read(pointer+8,4))[0]
            value=struct.unpack('<f',machine.mem_read(pointer,4))[0];result=delta(value) if address==0x49a3f0 else property_value(address,value);calls.append(dict(address=hex(address),input=value,output=result))
            machine.mem_write(0x20000200,struct.pack('<f',result));machine.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x51d9ca,0x51dd2c,count=5000);assert uc.reg_read(UC_X86_REG_EIP)==0x51dd2c
    return dict(expected={hex(a):struct.unpack('<f',uc.mem_read(a,4))[0] for a in OUTPUTS},property_calls=calls)
if __name__=='__main__':
    rng=random.Random(20261101);values=[.1,1,9.999,10,10.001,99.999,100,100.001,264.999,265,265.001,14.7,2200,3000]+[rng.uniform(.1,3200) for _ in range(226)];cases=[]
    for p in values:p=f32(p);cases.append(dict(inputs=dict(pressure=p),**execute(p)))
    path=ROOT/'analysis/primary_properties_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261101,'cases':cases},indent=2)+'\n');print(f'{len(cases)} primary-property cases. {path}')
