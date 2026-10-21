#!/usr/bin/env python3
"""Execute accumulator activation/latch and valve decisions in original x86.
COM/I16/Boolean reads are supplied; UI writes are captured as integer commands.
Object/variant cleanup is bypassed. Native comparisons, latch/time writes,
Boolean decision instructions and opening=100 assignments execute unchanged.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EDI,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_EAX
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(inputs):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000);uc.reg_write(UC_X86_REG_EDI,0)
    for offset,name,kind in [(8,'system_pressure','f'),(12,'trigger_pressure','f'),(16,'activation','h'),(48,'clock','f')]:
        pointer=0x20001000+offset;uc.mem_write(frame+offset,struct.pack('<I',pointer));uc.mem_write(pointer,struct.pack('<'+kind,inputs[name]))
    uc.mem_write(0x54b458,struct.pack('<f',inputs['event_time']));valves=[dict(v) for v in inputs['valves']];activated=False
    def jump(machine,address):machine.reg_write(UC_X86_REG_EIP,address)
    def read_valve(machine,index,address):machine.reg_write(UC_X86_REG_EAX,valves[index]['opening'] & 0xffff);jump(machine,address)
    def hook(machine,address,size,_):
        nonlocal activated
        if address==0x511b9d:activated=True;read_valve(machine,0,0x511c37)
        elif address==0x511c42:machine.reg_write(UC_X86_REG_EAX,0xffff if valves[0]['inhibited'] else 0);jump(machine,0x511c5d)
        elif address==0x511c61:jump(machine,0x511c8c)
        elif address==0x511ca4:valves[0]['opening']=struct.unpack('<h',machine.mem_read(frame-0x54,2))[0];jump(machine,0x511d21)
        elif address==0x511d21:read_valve(machine,1,0x511db2)
        elif address==0x511dbd:machine.reg_write(UC_X86_REG_EAX,0xffff if valves[1]['inhibited'] else 0);jump(machine,0x511dd8)
        elif address==0x511ddc:jump(machine,0x511e07)
        elif address==0x511e20:valves[1]['opening']=struct.unpack('<h',machine.mem_read(frame-0x54,2))[0];jump(machine,0x511e9a)
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x511b60,0x511e9a,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==0x511e9a
    return dict(activation=struct.unpack('<h',uc.mem_read(0x20001010,2))[0],event_time=struct.unpack('<f',uc.mem_read(0x54b458,4))[0],valves=valves,activated=activated)
if __name__=='__main__':
    rng=random.Random(20261025);cases=[]
    for i in range(240):
        pressure=f32(rng.uniform(1,2300));trigger=f32(pressure+rng.choice([-1,0,1]))
        inputs=dict(system_pressure=pressure,trigger_pressure=trigger,activation=rng.choice([-1,0,1,2]),clock=f32(rng.uniform(0,300)),event_time=f32(rng.uniform(0,300)),valves=[dict(opening=rng.choice([-1,0,1,50,100]),inhibited=rng.choice([False,True])) for _ in range(2)])
        cases.append({'inputs':inputs,'expected':execute(inputs)})
    path=ROOT/'analysis/activation_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261025,'cases':cases},indent=2)+'\n');print(f'{len(cases)} activation cases. {path}')
