#!/usr/bin/env python3
"""Execute full numerical branch 0x501eba–0x502304 of saturated vessel balance.
Original property callees run through independently emulated numeric prefixes;
INTP uses recovered native tables. DELP Variant helpers and property runtime
helpers are modeled. No COM/error handling or Windows floating-point context.
"""
import hashlib,json,random,struct
from functools import lru_cache
from native_math_oracle import ROOT,PE,BASE,EXE,emulate
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
@lru_cache(maxsize=4096)
def delta(pressure):return emulate('DELP',[pressure],single_byref=True)['output']
def execute(inputs):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000)
    names=['fraction_derivative','pressure_derivative','fraction','pressure','inflow','inflow_enthalpy','outflow','heat','volume']
    pointers={name:0x20001000+i*16 for i,name in enumerate(names)}
    for i,name in enumerate(names):uc.mem_write(frame+8+i*4,struct.pack('<I',pointers[name]));uc.mem_write(pointers[name],struct.pack('<f',inputs.get(name,0)))
    uc.mem_write(0x54b000,struct.pack('<I',0));uc.mem_write(0x54b334,struct.pack('<f',inputs['pressure_work']))
    calls=[]
    def hook(machine,address,size,_):
        if address in [0x49a3f0,0x49c190,0x49bf00,0x49ae10,0x49ab70]:
            esp=machine.reg_read(UC_X86_REG_ESP);pointer=struct.unpack('<I',machine.mem_read(esp+4,4))[0]
            if address==0x49a3f0:
                assert struct.unpack('<H',machine.mem_read(pointer,2))[0]==0x4004
                pointer=struct.unpack('<I',machine.mem_read(pointer+8,4))[0]
            pressure=struct.unpack('<f',machine.mem_read(pointer,4))[0];value=delta(pressure) if address==0x49a3f0 else property_value(address,pressure)
            calls.append({'address':hex(address),'input':pressure,'output':value})
            machine.mem_write(0x20000200,struct.pack('<f',value));machine.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x501eba,0x502304,count=4000);assert uc.reg_read(UC_X86_REG_EIP)==0x502304
    output={name:struct.unpack('<f',uc.mem_read(pointers[name],4))[0] for name in names[:2]}
    trace={name:struct.unpack('<f',uc.mem_read(frame+offset,4))[0] for name,offset in [('delta',-0x30),('dhg',-0x20),('dvg',-0x60),('dhf',-0x54),('dvf',-0x48),('mass',-0x44),('enthalpy',-0x3c),('a',-0x2c),('b',-0x34),('c',-0x40),('d',-0x50),('e',-0x5c),('f',-0x58)]}
    return {'expected':output,'trace':trace,'property_calls':calls}
def main():
    rng=random.Random(20261022);cases=[]
    pressures=[5,9.999,10,10.001,99.999,100,100.001,220,264.999,265,265.001,500,1000,2200,2800]
    samples=[(p,f) for p in pressures for f in [0,.01,.1,.5,.99,1]]+[(rng.uniform(5,2800),rng.uniform(0,1)) for _ in range(150)]
    for p,fraction in samples:
        inputs={name:f32(value) for name,value in dict(pressure=p,fraction=fraction,inflow=rng.uniform(-100,1000),inflow_enthalpy=rng.uniform(100,1200),outflow=rng.uniform(-100,1000),heat=rng.uniform(-100000,100000),volume=rng.uniform(100,10000),pressure_work=.185).items()}
        cases.append({'inputs':inputs,**execute(inputs)})
    deltas=[{'pressure':f32(p),'expected':delta(f32(p))} for p in [0,1,5,9.999,10,10.001,99.999,100,100.001,1000]]
    out=ROOT/'analysis/saturated_balance_fixtures.json';out.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261022,'cases':cases,'delta_cases':deltas},indent=2)+'\n');print(f'{len(cases)} saturated-balance cases. {out}')
if __name__=='__main__':main()
