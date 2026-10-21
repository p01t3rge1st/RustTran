#!/usr/bin/env python3
"""Execute accumulator numeric gates, flow and depletion in original x86.
COM object/variant cleanup is skipped. COM valve reads are replaced by supplied signed-I16 values; their checked sum is
injected after UI reads. Square root executes x87 FSQRT. VB6 power is modeled
with Python libm; Windows FPU context and event/UI paths are outside this test.
"""
import hashlib,json,math,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(inputs):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000)
    names=['system_pressure','trigger_pressure','activation','gas_pressure','flow','water_volume','step','gas_volume','total_volume','coefficient']
    pointers={name:0x20001000+i*16 for i,name in enumerate(names)}
    for i,name in enumerate(names):
        uc.mem_write(frame+8+i*4,struct.pack('<I',pointers[name]));uc.mem_write(pointers[name],struct.pack('<h' if name=='activation' else '<f',inputs.get(name,0)))
    uc.mem_write(0x54b000,struct.pack('<I',0))
    uc.mem_write(0x401228,struct.pack('<I',0x20000000))
    uc.mem_write(0x20000000,b'\xdd\x44\x24\x04\xd9\xfa\xc2\x08\x00')
    uc.mem_write(0x4011f4,struct.pack('<I',0x20000020))
    trace=[]
    def hook(machine,address,size,_):
        trace.append(hex(address))
        if address==0x511f0e:
            valve_sum=inputs['valve_a']+inputs['valve_b']
            if not -32768<=valve_sum<=32767:raise ValueError('I16 valve sum overflow')
            machine.mem_write(frame-0xac,struct.pack('<d',valve_sum));machine.reg_write(UC_X86_REG_EIP,0x511fe7)
        elif address==0x512026:
            machine.reg_write(UC_X86_REG_EIP,0x512051)
        elif address==0x20000020:
            esp=machine.reg_read(UC_X86_REG_ESP);base,exponent=struct.unpack('<dd',machine.mem_read(esp+4,16));value=math.pow(base,exponent)
            machine.mem_write(0x20000200,struct.pack('<d',value));machine.mem_write(0x20000040,b'\xdd\x05'+struct.pack('<I',0x20000200)+b'\xc2\x10\x00');machine.reg_write(UC_X86_REG_EIP,0x20000040)
    uc.hook_add(UC_HOOK_CODE,hook)
    try:uc.emu_start(0x511e9a,0x5120f9,count=1000)
    except Exception:
        print(trace[-15:]);raise
    assert uc.reg_read(UC_X86_REG_EIP)==0x5120f9
    return {name:struct.unpack('<f',uc.mem_read(pointers[name],4))[0] for name in ['gas_pressure','flow','water_volume','gas_volume']}
def main():
    rng=random.Random(20261020);cases=[]
    for i in range(200):
        water=f32(rng.uniform(2,1000));gas=f32(rng.uniform(100,1000));pressure=f32(rng.uniform(50,800))
        inputs=dict(system_pressure=f32(pressure-rng.uniform(1,100)),activation=1,gas_pressure=pressure,flow=f32(rng.uniform(0,10)),water_volume=water,step=f32(rng.choice([0,.1,.5,1])),gas_volume=gas,total_volume=f32(water+gas),coefficient=f32(rng.uniform(.01,2)),valve_a=rng.choice([0,25,50,100]),valve_b=rng.choice([0,25,50,100]))
        if i<12:
            inputs['activation']=[0,1,2][i%3]
            inputs['water_volume']=[.999,1.,1.001][i//3%3]
            inputs['system_pressure']=f32(pressure+[-1,0,1][i//4])
        if i>=190:
            inputs['valve_a']=-100;inputs['valve_b']=50
        inputs={k:f32(v) if isinstance(v,float) else v for k,v in inputs.items()}
        cases.append({'inputs':inputs,'expected':execute(inputs)})
    path=ROOT/'analysis/accumulator_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261020,'cases':cases},indent=2)+'\n');print(f'{len(cases)} accumulator numeric cases. {path}')
if __name__=='__main__':main()
