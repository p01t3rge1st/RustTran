#!/usr/bin/env python3
"""Execute native constant initialization and two loop startup heat assignments.
0x51c310–0x51c42d and 0x51b4ab–0x51b4fb execute original x87/constant stores;
model power, extra heat and loop shares are injected. No numeric helpers.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_ESP,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def machine():
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.reg_write(UC_X86_REG_ESP,0x1001f000);uc.mem_write(0x54b000,struct.pack('<I',0));return uc
uc=machine();uc.emu_start(0x51c310,0x51c42d,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==0x51c42d
constants={hex(a):struct.unpack('<f',uc.mem_read(a,4))[0] for a in [0x54b70c,0x54b2fc,0x54b300,0x54b304,0x54b308,0x54b310,0x54b320,0x54b324,0x54b32c,0x54b330,0x54b334]}
def execute(inputs):
    uc=machine()
    for name,value in inputs.items():uc.mem_write(int(name[1:],16),struct.pack('<f',value))
    uc.mem_write(0x54b330,struct.pack('<f',constants['0x54b330']));uc.emu_start(0x51b4ab,0x51b4fb,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==0x51b4fb
    return {name:struct.unpack('<f',uc.mem_read(int(name[1:],16),4))[0] for name in ['g54b67c','g54b680']}
if __name__=='__main__':
    rng=random.Random(20261029);cases=[]
    for i in range(200):
        inputs=dict(g54b120=f32(rng.uniform(0,4000)),g54b134=f32(rng.uniform(-100,100)),g54b740=f32(rng.uniform(0,1)),g54b744=f32(rng.uniform(0,1)))
        cases.append({'inputs':inputs,'expected':execute(inputs)})
    path=ROOT/'analysis/startup_heat_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261029,'constants':constants,'cases':cases},indent=2)+'\n');print(f'{len(cases)} loop heat cases; heat factor={constants["0x54b330"]} (bits={struct.unpack("<I",struct.pack("<f",constants["0x54b330"]))[0]:08x}). {path}')
