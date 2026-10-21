#!/usr/bin/env python3
"""Execute numeric solver 0x5011b0, stop before COM/error reporting.
Original control flow and arithmetic execute in Unicorn. Property callees use
independent native numerical prefixes and INTP with recovered tables. VB6
OnError and Single-rounding helpers are modeled; no Windows runtime.
"""
import hashlib,json,struct
from functools import lru_cache
from native_math_oracle import PE,BASE,EXE,ROOT,emulate
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_ESP,UC_X86_REG_EIP
TABLES={a['name']:a['values'] for a in json.loads((ROOT/'analysis/property_tables.json').read_text())['arrays']}
@lru_cache(maxsize=8192)
def property_value(address,value):
    functions={0x49ab70:'HFLD',0x49ae10:'HGAS',0x49bf00:'VFLD'}
    if address in functions:return emulate(functions[address],[value])['output']
    pairs={0x49bde0:('saturation_temperature','saturation_pressure_44'),0x49beb0:('saturation_pressure_44','saturation_temperature'),0x49c190:('saturation_pressure_68','saturated_vapor_specific_volume'),0x49be30:('saturated_vapor_specific_volume','saturation_pressure_68')}
    x,y=pairs[address]
    return emulate('INTP',{'x':TABLES[x],'y':TABLES[y],'query':value})['output']
def execute(values,work_coefficient):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0,4096);uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    pointers=[0x20001000+i*16 for i in range(11)]
    for pointer,value in zip(pointers,values):uc.mem_write(pointer,struct.pack('<f',value))
    stack=0x1001f000;uc.mem_write(stack,struct.pack('<12I',0x2000f000,*pointers));uc.reg_write(UC_X86_REG_ESP,stack)
    uc.mem_write(0x54b000,struct.pack('<I',0));uc.mem_write(0x54b334,struct.pack('<f',work_coefficient))
    # Original __vbaFpR4 rounds ST0 through a Single store/reload.
    uc.mem_write(0x4010ac,struct.pack('<I',0x20000000));uc.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3')
    uc.mem_write(0x401090,struct.pack('<I',0x20000020));uc.mem_write(0x20000020,b'\xc2\x04\x00')
    calls=[];iterations=[]
    def hook(machine,address,size,_):
        if address==0x50164c:
            from unicorn.x86_const import UC_X86_REG_EBP
            frame=machine.reg_read(UC_X86_REG_EBP)
            iterations.append({name:struct.unpack('<f',machine.mem_read(frame+offset,4))[0] for name,offset in [('low_temperature',-0x7c),('upper_temperature',-0x84),('low_error',-0x50),('upper_error',-0x58),('energy',-0x40),('mass',-0x94)]})
        if address in [0x501ca0,0x501e4e]:machine.emu_stop();return
        if address in [0x49ab70,0x49ae10,0x49bf00,0x49bde0,0x49beb0,0x49c190,0x49be30]:
            esp=machine.reg_read(UC_X86_REG_ESP);pointer=struct.unpack('<I',machine.mem_read(esp+4,4))[0];value=struct.unpack('<f',machine.mem_read(pointer,4))[0]
            result=property_value(address,value);calls.append({'address':hex(address),'input':value,'output':result})
            machine.mem_write(0x20000200,struct.pack('<f',result));machine.mem_write(0x20000040,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000040)
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x5011b0,0x501ca1,count=250000)
    stop=uc.reg_read(UC_X86_REG_EIP)
    if stop!=0x501ca0:raise RuntimeError(f'native solver stopped at {stop:#x}, iterations={len(iterations)}')
    return {'outputs':[struct.unpack('<f',uc.mem_read(pointer,4))[0] for pointer in pointers[:4]],'iterations':len(iterations),'iteration_trace':iterations,'property_calls':calls}
def main():
    cases=[]
    for temperature in [100,200,300,500]:
        psat=property_value(0x49bde0,temperature)
        for level in [0,.01,.1,.5]:
            for change,gas_delta,loss in [(0,0,0),(1,0,0),(-1,0,0),(0,.01,0),(0,-.01,0),(0,0,500),(0,0,-500)]:
                values=[psat+14.7,0,temperature,level,change,300,gas_delta,loss,1000,1000,60]
                result=execute(values,.185)
                cases.append({'parameters':values,'work_coefficient':.185,**result})
    path=ROOT/'analysis/vessel_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'cases':cases},indent=2)+'\n');print(f'{len(cases)} native vessel-solver cases. {path}')
if __name__=='__main__':main()
