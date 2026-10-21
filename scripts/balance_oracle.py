#!/usr/bin/env python3
"""Execute original balance tail directly. No mocked math helpers in this block.
Normal hardware-FPU branch (0x54b000=0); initialization and earlier balances
are supplied inputs, not a complete PCTran simulation.
"""
import json,random,struct,hashlib
from native_math_oracle import PE,BASE,EXE,ROOT
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP
rng=random.Random(20261015)
fields={'local_20':-0x20,'g54b734':0x54b734,'g54b4ac':0x54b4ac,'g54b72c':0x54b72c,'g54b6c4':0x54b6c4,'local_78':-0x78,'local_ac':-0xac,'g54b678':0x54b678,'local_48':-0x48,'g54b774':0x54b774,'local_3c':-0x3c,'local_30':-0x30,'local_24':-0x24,'g54b654':0x54b654,'step':0x54b414}
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
cases=[]
for index in range(100):
    inputs={name:f32(rng.uniform(0.1,100)) for name in fields}
    inputs['g54b774']=f32(rng.uniform(-10,10));inputs['step']=f32(rng.uniform(.01,2))
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame)
    for name,offset in fields.items():uc.mem_write(frame+offset if offset<0 else offset,struct.pack('<f',inputs[name]))
    uc.mem_write(0x54b000,struct.pack('<I',0))
    uc.emu_start(0x50ce6d,0x50cfa4,count=1000)
    expected={name:struct.unpack('<f',uc.mem_read(addr,4))[0] for name,addr in [('g54b770',0x54b770),('g54b784',0x54b784)]}
    cases.append({'inputs':inputs,'expected':expected})
path=ROOT/'analysis/balance_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261015,'cases':cases},indent=2)+'\n');print(f'{len(cases)} direct native balance-tail cases. {path}')
