#!/usr/bin/env python3
"""Execute pressurizer startup inventory branch 0x51b4fb–0x51b6cf.
Model/state operands and earlier specific volumes are injected. Original x87
arithmetic and branch/store order execute unchanged; __vbaFpR4 uses a Single
store/reload shim. Full initializer/UI and Windows FPU context are excluded.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_ESP,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(inputs):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    uc.reg_write(UC_X86_REG_ESP,0x1001f000);uc.mem_write(0x54b000,struct.pack('<I',0))
    for name,value in inputs.items():uc.mem_write(int(name[1:],16),struct.pack('<f',value))
    uc.mem_write(0x4010ac,struct.pack('<I',0x20000000));uc.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3')
    uc.emu_start(0x51b4fb,0x51b6cf,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==0x51b6cf
    return {name:struct.unpack('<f',uc.mem_read(int(name[1:],16),4))[0] for name in ['g54b6d4','g54b7ec','g54b4a0','g54b4f0','g54b7f0']}
if __name__=='__main__':
    rng=random.Random(20261028);cases=[]
    for i in range(240):
        inputs=dict(g54b154=f32(rng.uniform(.4,.9)),g54b128=f32(588),g54b1a8=f32(550),g54b498=f32(rng.uniform(500,620)),g54b64c=f32(rng.uniform(.01,.02)),g54b650=f32(rng.uniform(.1,30)),g54b4a4=f32(rng.uniform(100,10000)))
        if i<12:inputs.update(g54b498=f32([549.999,550,550.001,587.999,588,588.001][i%6]))
        cases.append({'inputs':inputs,'expected':execute(inputs)})
    path=ROOT/'analysis/pressurizer_init_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261028,'cases':cases},indent=2)+'\n');print(f'{len(cases)} startup inventory cases. {path}')
