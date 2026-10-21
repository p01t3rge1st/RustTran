#!/usr/bin/env python3
"""Original primary post-balance stores 0x50d113–0x50d137 and
0x50d1be–0x50d1f8: exchange trace, level percent, temperature floor and
negative level-percent floor. COM display calls between slices omitted.
"""
import json,random,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
rng=random.Random(20261017);cases=[]
for i in range(320):
 q=dict(liquid_level=f32([-.01,0,.9,1][i%4] if i<40 else rng.uniform(-.1,1.1)),coolant_temperature=f32([99,100,101][i%3] if i<40 else rng.uniform(50,700)),minimum_temperature=100.,local_78=f32(rng.uniform(-1000,1000)))
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x2000);frame=0x10001000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_FPCW,0x027f)
 for n,a in [('liquid_level',0x54b4a0),('coolant_temperature',0x54b498),('minimum_temperature',0x54b160),('local_78',frame-0x78)]:u.mem_write(a,struct.pack('<f',q[n]))
 for a,b in [(0x50d113,0x50d137),(0x50d1be,0x50d1f8)]:u.emu_start(a,b,count=100)
 cases.append(dict(inputs=q,expected={n:struct.unpack('<f',u.mem_read(a,4))[0] for n,a in [('exchange_state',0x54b738),('spray_level_percent',0x54b6c0),('coolant_temperature',0x54b498)]}))
(ROOT/'analysis/primary_control_feedback_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'primary feedback cases')
