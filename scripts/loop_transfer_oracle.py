#!/usr/bin/env python3
"""Execute entire loop-transfer numerical body 0x5053b8–0x505873.
Original PowerR8 runs from installer DLL with explicit 53-bit FPU and scratch
errno lookup (native_power_runtime.py). Property returns come from independent
native prefixes; __vbaFpR4 uses a Single round shim. Caller FPU also 0x027f.
No COM/error reporting, Windows thread state or original FPU-setting validation.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from native_power_runtime import power
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_ESI,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(inputs):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000);uc.reg_write(UC_X86_REG_ESI,0);uc.reg_write(UC_X86_REG_FPCW,0x027f)
    pointers={offset:0x20001000+i*16 for i,offset in enumerate(range(8,0x7c,4))}
    for offset,pointer in pointers.items():uc.mem_write(frame+offset,struct.pack('<I',pointer))
    for name,value in inputs.items():
        if name=='g54b768':uc.mem_write(0x54b768,struct.pack('<f',value));continue
        offset=int(name[1:],16);uc.mem_write(pointers[offset],struct.pack('<h' if offset in [0x64,0x78] else '<f',value))
    uc.mem_write(0x54b000,struct.pack('<I',0));uc.mem_write(0x4010ac,struct.pack('<I',0x20000000));uc.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3')
    uc.mem_write(0x4011f4,struct.pack('<I',0x20000020));power_calls=[]
    def hook(machine,address,size,_):
        if address==0x20000020:
            esp=machine.reg_read(UC_X86_REG_ESP);base,exponent=struct.unpack('<dd',machine.mem_read(esp+4,16));value=power(base,exponent);power_calls.append(dict(base=base,exponent=exponent,output=value))
            machine.mem_write(0x20000200,struct.pack('<d',value));machine.mem_write(0x20000040,b'\xdd\x05'+struct.pack('<I',0x20000200)+b'\xc2\x10\x00');machine.reg_write(UC_X86_REG_EIP,0x20000040)
        elif address in [0x49beb0,0x49bf00]:
            esp=machine.reg_read(UC_X86_REG_ESP);pointer=struct.unpack('<I',machine.mem_read(esp+4,4))[0];value=property_value(address,struct.unpack('<f',machine.mem_read(pointer,4))[0]);machine.mem_write(0x20000220,struct.pack('<f',value));machine.mem_write(0x20000060,b'\xd9\x05'+struct.pack('<I',0x20000220)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000060)
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x5053b8,0x505873,count=5000);assert uc.reg_read(UC_X86_REG_EIP)==0x505873
    expected={name:struct.unpack('<f',uc.mem_read(pointers[offset],4))[0] for name,offset in [('p08',8),('p28',0x28),('p34',0x34),('p3c',0x3c)]}
    expected['trace']={name:struct.unpack('<f',uc.mem_read(frame+offset,4))[0] for name,offset in [('primary_coefficient',-0x2c),('secondary_coefficient',-0x28),('effective_coefficient',-0x24),('response_fraction',-0x30)]}
    return dict(expected=expected,power_calls=power_calls)
if __name__=='__main__':
    rng=random.Random(20261031);cases=[]
    for i in range(300):
        inputs={name:f32(value) for name,value in dict(p0c=rng.uniform(70,2500),p10=rng.uniform(1,100),p14=rng.uniform(.1,10),p18=rng.uniform(-20,100),p1c=rng.uniform(100,20000),p20=rng.uniform(-20000,20000),p24=rng.uniform(.01,1),p2c=rng.uniform(-100,3000),p30=rng.choice([1/3,2/3]),p38=rng.uniform(.01,10),p3c=rng.uniform(100,500),p40=rng.uniform(100,500),p44=rng.uniform(.1,10),p48=rng.uniform(.1,10),p4c=rng.uniform(.1,10),p50=rng.uniform(0,300),p54=rng.uniform(0,300),p58=rng.uniform(100,3000),p5c=rng.uniform(-100,100),p60=rng.uniform(0,100),p68=rng.uniform(100,100000),p6c=rng.uniform(200,700),p70=rng.uniform(100,100000),p74=300.,g54b768=rng.uniform(.01,.1)).items()};inputs['p64']=rng.choice([-1,0,1,2]);inputs['p78']=rng.choice([1,2,3])
        if i<12:inputs.update(p3c=f32([299.999,300,300.001][i%3]),p50=0.,p54=0.)
        if i>=290:inputs['p20']=0.;inputs['p2c']=0.;inputs['p5c']=-50.
        cases.append({'inputs':inputs,**execute(inputs)})
    path=ROOT/'analysis/loop_transfer_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'dll_sha256':hashlib.sha256((ROOT/'analysis/program/msvbvm60.dll').read_bytes()).hexdigest(),'fpu_control_word':'0x027f','seed':20261031,'cases':cases},indent=2)+'\n');print(f'{len(cases)} loop-transfer cases. {path}')
