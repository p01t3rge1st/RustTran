#!/usr/bin/env python3
"""Execute SG outflow limit/heat correction 0x50a7ed–0x50a8a6 in original x86.
Earlier flow contributions and enthalpies are injected. No arithmetic helpers
or complete steam-generator, control or event dispatcher are modeled.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESI,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(inputs):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame)
    pointers={offset:0x20001000+i*16 for i,offset in enumerate(range(8,0xb0,4))}
    for offset,pointer in pointers.items():uc.mem_write(frame+offset,struct.pack('<I',pointer))
    fields={'base_flow':0xa0,'additional_flow':0xa8,'external_flow':0xac,'inventory':0x78,'step':0x0c,'phase_flag':0x9c,'discharge_enthalpy':0x6c,'heat_a':0x94,'heat_b':0x98}
    for name,offset in fields.items():uc.mem_write(pointers[offset],struct.pack('<h' if name=='phase_flag' else '<f',inputs[name]))
    uc.reg_write(UC_X86_REG_ESI,pointers[0xa0]);uc.mem_write(0x54b714,struct.pack('<f',inputs['feed_enthalpy']));uc.mem_write(0x54b000,struct.pack('<I',0))
    uc.emu_start(0x50a7ed,0x50a8a6,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==0x50a8a6
    return {name:struct.unpack('<f',uc.mem_read(pointers[offset],4))[0] for name,offset in [('flow',0x68),('base_flow',0xa0),('additional_flow',0xa8),('heat_a',0x94),('heat_b',0x98)]}|{'feed_enthalpy':struct.unpack('<f',uc.mem_read(0x54b718,4))[0]}
if __name__=='__main__':
    rng=random.Random(20261027);cases=[]
    for i in range(240):
        inputs={name:f32(value) for name,value in dict(base_flow=rng.uniform(-100,2000),additional_flow=rng.uniform(-100,200),external_flow=rng.uniform(-100,200),inventory=rng.uniform(1,1000),step=rng.choice([.1,.5,1]),discharge_enthalpy=rng.uniform(800,1200),feed_enthalpy=rng.uniform(100,700),heat_a=rng.uniform(-100000,100000),heat_b=rng.uniform(-100000,100000)).items()};inputs['phase_flag']=rng.choice([-1,0,1,2])
        if i<9:inputs.update(base_flow=f32([99.999,100,100.001][i%3]),additional_flow=0.,external_flow=0.,inventory=100.,step=1.)
        cases.append({'inputs':inputs,'expected':execute(inputs)})
    path=ROOT/'analysis/steam_outflow_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261027,'cases':cases},indent=2)+'\n');print(f'{len(cases)} original SG outflow-limit cases. {path}')
