#!/usr/bin/env python3
"""Execute original 0x49c1e0 volume wrapper, modeling callee return/cleanup.
Property results come from independently executed original VFLD/INTP prefixes.
"""
import hashlib,json,random,struct
from vessel_oracle import property_value
from native_math_oracle import PE,BASE,EXE,ROOT
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_ESP,UC_X86_REG_EIP
rng=random.Random(20261018);cases=[]
inputs=[(p,t) for p in [1,14.7,70,158.2,265,500,2200,3000] for t in [60,220,300,680]]+[(rng.uniform(1,3000),rng.uniform(60,680)) for _ in range(64)]
for p,t in inputs:
    p,t=[struct.unpack('<f',struct.pack('<f',v))[0] for v in [p,t]]
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x1000)
    stack=0x1001f000;uc.mem_write(stack,struct.pack('<III',0x20000f00,0x20000100,0x20000110));uc.mem_write(0x20000100,struct.pack('<f',p));uc.mem_write(0x20000110,struct.pack('<f',t));uc.reg_write(UC_X86_REG_ESP,stack)
    def hook(machine,address,size,_):
        if address==0x49c21c:machine.emu_stop();return
        if address in [0x49bde0,0x49bf00]:
            esp=machine.reg_read(UC_X86_REG_ESP);pointer=struct.unpack('<I',machine.mem_read(esp+4,4))[0];value=struct.unpack('<f',machine.mem_read(pointer,4))[0]
            result=property_value(address,value);machine.mem_write(0x20000200,struct.pack('<f',result));machine.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x49c1e0,0x49c21d,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==0x49c21c
    expected=struct.unpack('<f',uc.mem_read(stack+8,4))[0];cases.append({'pressure':p,'temperature':t,'expected':expected})
path=ROOT/'analysis/liquid_volume_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261018,'cases':cases},indent=2)+'\n');print(f'{len(cases)} original liquid-volume wrapper cases. {path}')
