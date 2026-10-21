#!/usr/bin/env python3
"""Execute original supply-tank depletion and recirculation trigger arithmetic.
Uses 0x511605–0x51167f inside 0x510850; captures the trigger branch and
0x5116d7–0x51170b level command, bypassing COM mode/indicator writes.
This does not replay the full injection/recirculation dispatcher.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(inputs):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000)
    for offset,name in [(0x38,'volume'),(0x14,'injection_flow'),(0x3c,'step'),(0x20,'recirculation_flow'),(0x30,'other_recirculation_flow')]:
        pointer=0x20001000+offset;uc.mem_write(frame+offset,struct.pack('<I',pointer));uc.mem_write(pointer,struct.pack('<f',inputs.get(name,123)))
    for name,address in [('flow_a',0x54ba1c),('flow_b',0x54bb14),('minimum_volume',0x54b580),('initial_volume',0x54b57c)]:uc.mem_write(address,struct.pack('<f',inputs[name]))
    uc.mem_write(0x54b000,struct.pack('<I',0));triggered=False
    def hook(machine,address,size,_):
        nonlocal triggered
        if address==0x51167f:triggered=True;machine.reg_write(UC_X86_REG_EIP,0x5116d7)
        elif address in [0x511907,0x51170b]:machine.emu_stop()
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x511605,0x511908,count=1000)
    assert uc.reg_read(UC_X86_REG_EIP) in [0x511907,0x51170b]
    out=dict(volume=struct.unpack('<f',uc.mem_read(0x20001038,4))[0],recirculation_required=triggered,recirculation_flow=struct.unpack('<f',uc.mem_read(0x20001020,4))[0],other_recirculation_flow=struct.unpack('<f',uc.mem_read(0x20001030,4))[0],level_command=None)
    if triggered:out['level_command']=struct.unpack('<f',uc.mem_read(frame-0xc0,4))[0]
    return out
if __name__=='__main__':
    rng=random.Random(20261026);cases=[]
    for i in range(200):
        inputs=dict(volume=f32(rng.uniform(0,10000)),injection_flow=f32(rng.uniform(-100,1000)),flow_a=f32(rng.uniform(-100,1000)),flow_b=f32(rng.uniform(-100,1000)),step=f32(rng.choice([0,.1,.5,1])),minimum_volume=f32(4000),initial_volume=f32(10000))
        if i<6:inputs.update(volume=f32([3999.999,4000,4000.001][i%3]),step=0.)
        if i>=190:inputs['volume']=0.;inputs['step']=1.
        cases.append({'inputs':inputs,'expected':execute(inputs)})
    path=ROOT/'analysis/supply_tank_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261026,'cases':cases},indent=2)+'\n');print(f'{len(cases)} supply-tank cases. {path}')
