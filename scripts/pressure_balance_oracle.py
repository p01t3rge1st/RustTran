#!/usr/bin/env python3
"""Native balance 0x50cc88–0x50ce63 with modeled __vbaFpR4 rounding only.
Earlier component outputs are injected. Not a complete plant step.
"""
import json,random,struct,hashlib
from native_math_oracle import PE,BASE,EXE,ROOT
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP
rng=random.Random(20261016)
fields={'g54b650':0x54b650,'g54b64c':0x54b64c,'g54b7f0':0x54b7f0,'g54b688':0x54b688,'g54b65c':0x54b65c,'g54b658':0x54b658,'local_98':-0x98,'local_88':-0x88,'local_a4':-0xa4,'g54bad8':0x54bad8,'g54b4a0':0x54b4a0,'g54b6a8':0x54b6a8,'local_ac':-0xac,'g54b6c4':0x54b6c4,'g54b4ac':0x54b4ac,'g54b4a4':0x54b4a4,'g54b654':0x54b654,'g54b1a0':0x54b1a0,'g54b19c':0x54b19c,'g54b70c':0x54b70c}
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
cases=[]
for index in range(100):
    inputs={name:f32(rng.uniform(.1,100)) for name in fields};inputs['g54b688']=f32(rng.uniform(0,1));inputs['g54b4a0']=f32(rng.choice([.5,.999,1.]));inputs['g54b4a4']=f32(rng.choice([-1.,0.,1.]))
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x1000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000)
    for name,offset in fields.items():uc.mem_write(frame+offset if offset<0 else offset,struct.pack('<f',inputs[name]))
    uc.mem_write(0x54b000,struct.pack('<I',0));uc.mem_write(0x4010ac,struct.pack('<I',0x20000000))
    uc.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3')
    uc.emu_start(0x50cc88,0x50ce6d,count=1000)
    assert uc.reg_read(UC_X86_REG_EIP)==0x50ce6d
    expected={name:struct.unpack('<f',uc.mem_read(addr,4))[0] for name,addr in [('g54b77c',0x54b77c),('g54b774',0x54b774)]}
    cases.append({'inputs':inputs,'expected':expected})
path=ROOT/'analysis/pressure_balance_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261016,'cases':cases},indent=2)+'\n');print(f'{len(cases)} native pressure-balance cases. {path}')
