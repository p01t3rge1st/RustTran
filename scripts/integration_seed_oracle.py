#!/usr/bin/env python3
"""Restore integrator inputs from independently checked IC loader values.
Execute the original X -> 0x54b688 alias instructions. Two unbound state values
and previous derivatives are explicit supplied inputs; they are not inferred
from BSS defaults or claimed to be a complete original initialization.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
if __name__=='__main__':
    rng=random.Random(20261030);source=json.loads((ROOT/'analysis/field_conversion_fixtures.json').read_text())['seed_cases'];states=json.loads((ROOT/'analysis/integration_states.json').read_text())['states'];groups={};cases=[]
    for c in source:groups.setdefault(c['ic'],{})[c['target']]=c['expected']
    for ic,globals in groups.items():
        extra=dict(g54bba0=f32(rng.uniform(-1000,1000)),g54bf98=f32(rng.uniform(0,5000)));previous=[f32(rng.uniform(-1,1)) for _ in range(14)]
        uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image())
        for address,value in globals.items():uc.mem_write(int(address,16),struct.pack('<f',value))
        for name,value in extra.items():uc.mem_write(int(name[1:],16),struct.pack('<f',value))
        uc.emu_start(0x51c0f8,0x51c0fe,count=1);assert uc.reg_read(UC_X86_REG_EIP)==0x51c0fe
        uc.emu_start(0x51c12e,0x51c134,count=1);assert uc.reg_read(UC_X86_REG_EIP)==0x51c134
        values=[struct.unpack('<f',uc.mem_read(s['state_va'],4))[0] for s in states]
        cases.append(dict(ic=ic,extra=extra,previous_derivatives=previous,expected_values=values,copied_state=globals['0x54b4f0'],inputs=dict(ic=ic,extra=extra,previous_derivatives=previous),expected=dict(values=values,previous_derivatives=previous,copied_state=globals['0x54b4f0'])))
    path=ROOT/'analysis/integration_seed_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'cases':cases},indent=2)+'\n');print(f'{len(cases)} IC restoration cases. {path}')
