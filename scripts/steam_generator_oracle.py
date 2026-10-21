#!/usr/bin/env python3
"""Original steam-generator final exchange/derivative block 0x50ac2e–0x50ad65.
Upstream flows/properties are supplied. The full numerical saturated balance
callee executes independently in Unicorn (see saturated_balance_oracle).
Neither complete steam-generator routine nor original UI/dispatch is replayed.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from saturated_balance_oracle import execute as saturated
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(inputs):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000)
    pointers={offset:0x20001000+i*16 for i,offset in enumerate(range(8,0xb0,4))}
    for offset,pointer in pointers.items():uc.mem_write(frame+offset,struct.pack('<I',pointer))
    names={'pressure':8,'inflow_a':0x20,'inflow_b':0x50,'outflow':0x68,'fraction':0x60,'volume':0x80,'share':0xa4,'heat_a':0x94,'heat_b':0x98,'phase_flag':0x9c}
    for name,offset in names.items():uc.mem_write(pointers[offset],struct.pack('<h' if name=='phase_flag' else '<f',inputs[name]))
    for name,address in [('enthalpy_a',0x54b718),('enthalpy_b',0x54b734),('pressure_floor',0x54b544),('pressure_work',0x54b334)]:uc.mem_write(address,struct.pack('<f',inputs[name]))
    uc.mem_write(0x54b000,struct.pack('<I',0));children=[]
    def hook(machine,address,size,_):
        if address==0x501e60:
            esp=machine.reg_read(UC_X86_REG_ESP);args=struct.unpack('<9I',machine.mem_read(esp+4,36))
            values=[struct.unpack('<f',machine.mem_read(pointer,4))[0] for pointer in args]
            child_input=dict(zip(['fraction','pressure','inflow','inflow_enthalpy','outflow','heat','volume'],values[2:]));child_input['pressure_work']=inputs['pressure_work']
            child=saturated(child_input);children.append({'inputs':child_input,**child})
            for pointer,name in zip(args[:2],['fraction_derivative','pressure_derivative']):machine.mem_write(pointer,struct.pack('<f',child['expected'][name]))
            machine.mem_write(0x20000000,b'\xc2\x24\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x50ac2e,0x50ad65,count=2000);assert uc.reg_read(UC_X86_REG_EIP)==0x50ad65 and len(children)==1
    outputs={name:struct.unpack('<f',uc.mem_read(pointers[offset],4))[0] for name,offset in [('pressure',8),('outflow',0x68),('fraction_derivative',0x74),('pressure_derivative',0x70),('inventory_derivative',0x58)]}
    return {'expected':outputs,'native_child':children[0]}
def bindings():
    # Execute ONLY the push sequence before each original call to recover order.
    result=[]
    for loop,start,stop in [('A',0x520ec2,0x520fa0),('B',0x520fc5,0x5210b1)]:
        uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000)
        frame=0x10010000;stack=0x1001f000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,stack);uc.mem_write(0x54b5f8,struct.pack('<I',0x20000000))
        uc.emu_start(start,stop,count=2000);esp=uc.reg_read(UC_X86_REG_ESP);assert uc.reg_read(UC_X86_REG_EIP)==stop
        args=struct.unpack('<'+'I'*((stack-esp)//4),uc.mem_read(esp,stack-esp))
        result.append({'loop':loop,'call_va':hex(stop),'arguments':[{'number':i+1,'ebp_offset':hex(8+4*i),'pointer':hex(pointer)} for i,pointer in enumerate(args)]})
    return result
if __name__=='__main__':
    rng=random.Random(20261023);cases=[]
    for i in range(160):
        pressure=f32(rng.uniform(100,2800));floor=f32(pressure+rng.choice([-10,0,10]))
        inputs=dict(pressure=pressure,pressure_floor=floor,fraction=f32(rng.uniform(0,1)),inflow_a=f32(rng.uniform(0,1000)),inflow_b=f32(rng.uniform(0,1000)),enthalpy_a=f32(rng.uniform(100,800)),enthalpy_b=f32(rng.uniform(100,800)),outflow=f32(rng.uniform(0,1000)),volume=f32(rng.uniform(100,10000)),share=f32(rng.choice([1/3,2/3])),heat_a=f32(rng.uniform(-100000,100000)),heat_b=f32(rng.uniform(-100000,100000)),phase_flag=rng.choice([-1,0,1,2]),pressure_work=f32(.185))
        cases.append({'inputs':inputs,**execute(inputs)})
    evidence=bindings();out=ROOT/'analysis/steam_generator_fixtures.json';out.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261023,'cases':cases,'caller_bindings':evidence},indent=2)+'\n');print(f'{len(cases)} steam-generator exchange cases. {out}')
