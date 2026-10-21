#!/usr/bin/env python3
"""Execute original stream/volume balance blocks without modeled math helpers.
Contextual component inputs are injected; not an end-to-end plant simulation.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EBX,UC_X86_REG_EIP
rng=random.Random(20261019);cases=[]
f32=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
for kind,start,stop,count in [('stream',0x523dc8,0x523e04,100),('volume',0x50b5ae,0x50b60f,100)]:
    for index in range(count):
        if kind=='stream':inputs={name:f32(rng.uniform(-1000,1000)) for name in ['g54b6a4','g54bb50','g54ba90','g54b738']}
        else:
            inputs={name:f32(rng.uniform(.001,100)) for name in ['g54b654','g54b734','g54b728']};inputs['g54b4ac']=f32(rng.uniform(-100,100)) if index>3 else [-0.,0.,1.,-1.][index];inputs['g54b4d8']=rng.choice([-1,0,1,2])
        uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000)
        frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_EBX,0)
        for name,value in inputs.items():uc.mem_write(int(name[1:],16),struct.pack('<h' if name=='g54b4d8' else '<f',value))
        uc.emu_start(start,stop,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==stop
        outputs={name:struct.unpack('<f',uc.mem_read(int(name[1:],16),4))[0] for name in (['g54b674','g54b4b8'] if kind=='stream' else ['g54b788'])}
        if kind=='volume':outputs['local_20']=struct.unpack('<f',uc.mem_read(frame-0x20,4))[0]
        cases.append({'kind':kind,'inputs':inputs,'expected':outputs})
path=ROOT/'analysis/additional_balance_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261019,'cases':cases},indent=2)+'\n');print(f'{len(cases)} original stream/volume balance cases. {path}')
