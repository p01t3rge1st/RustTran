#!/usr/bin/env python3
"""Execute original PI numerical branch 0x5122d8–0x512372 without math mocks.
Stops before original COM/error reporting. Inputs are supplied; no dispatcher.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EDI,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(inputs, precision=None):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_EDI,0)
    if precision is not None:
        from unicorn.x86_const import UC_X86_REG_FPCW
        uc.reg_write(UC_X86_REG_FPCW,precision)
    names=['measured','target','proportional_band','output','previous_error','gain','integral_time','step','lower','upper'];pointers={name:0x20001000+i*16 for i,name in enumerate(names)}
    for i,name in enumerate(names):uc.mem_write(frame+8+i*4,struct.pack('<I',pointers[name]));uc.mem_write(pointers[name],struct.pack('<f',inputs[name]))
    uc.mem_write(0x54b000,struct.pack('<I',0));uc.emu_start(0x5122d8,0x512372,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==0x512372
    return {name:struct.unpack('<f',uc.mem_read(pointers[name],4))[0] for name in ['output','previous_error']}
if __name__=='__main__':
    rng=random.Random(20261024);cases=[]
    for i in range(300):
        inputs={name:f32(value) for name,value in dict(measured=rng.uniform(-1000,3000),target=rng.uniform(-1000,3000),proportional_band=rng.uniform(.1,100),output=rng.uniform(-50,150),previous_error=rng.uniform(-10,10),gain=rng.uniform(.01,20),integral_time=rng.uniform(.1,100),step=rng.choice([0,.1,.5,1]),lower=0,upper=100).items()}
        if i<9:inputs.update(measured=0.,target=0.,previous_error=0.,output=[-1,0,1,99,100,101][i%6])
        cases.append({'inputs':inputs,'expected':execute(inputs)})
    path=ROOT/'analysis/controller_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261024,'cases':cases},indent=2)+'\n');print(f'{len(cases)} native PI controller cases. {path}')
