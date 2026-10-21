#!/usr/bin/env python3
"""Execute two original RCP flow-update blocks, not their UI/event dispatcher.
Earlier normalized flow and time constants are injected. Models only __vbaFpR4.
"""
import hashlib,json,random,struct
from native_math_oracle import PE,BASE,EXE,ROOT
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP
rng=random.Random(20261017)
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
cases=[]
for loop,start,stop,local,output in [('A',0x512c7a,0x512da6,-0x28,8),('B',0x5133f9,0x513520,-0x2c,9)]:
    samples=[(target+delta,target) for target in [4,120,-10,100] for delta in [-1.001,-1,-.999,0,.999,1,1.001]]+[(rng.uniform(-20,140),rng.choice([4,120,-10,100])) for _ in range(72)]
    for normalized,target in samples:
        inputs={'normalized_flow':f32(normalized),'target':f32(target),'step':f32(rng.choice([0,.1,.5,1])),'time_constant':f32(rng.choice([2,10,30])),'base_flow':f32(rng.uniform(1,20000)),'loop_share':f32(rng.choice([1/3,2/3])),'volume_factor':f32(rng.uniform(.001,.02)),'specific_volume':f32(rng.uniform(.001,.02)),'void_fraction':f32(rng.uniform(0,.99))}
        uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
        frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000)
        pointers=[0x20001000+i*16 for i in range(18)]
        for i,pointer in enumerate(pointers):uc.mem_write(frame+8+i*4,struct.pack('<I',pointer))
        indices={'target':14 if loop=='A' else 15,'step':16,'time_constant':17,'base_flow':7,'loop_share':5 if loop=='A' else 6,'volume_factor':3,'specific_volume':4,'void_fraction':13}
        for name,i in indices.items():uc.mem_write(pointers[i],struct.pack('<f',inputs[name]))
        uc.mem_write(frame+local,struct.pack('<f',inputs['normalized_flow']));uc.mem_write(frame-0x84,struct.pack('<f',inputs['time_constant']))
        uc.mem_write(0x54b000,struct.pack('<I',0));uc.mem_write(0x4010ac,struct.pack('<I',0x20000000));uc.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3')
        uc.emu_start(start,stop,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==stop
        expected={'normalized_flow':struct.unpack('<f',uc.mem_read(frame+local,4))[0],'flow':struct.unpack('<f',uc.mem_read(pointers[output],4))[0]}
        cases.append({'loop':loop,'inputs':inputs,'expected':expected})
path=ROOT/'analysis/pump_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261017,'cases':cases},indent=2)+'\n');print(f'{len(cases)} native RCP flow-update cases. {path}')
