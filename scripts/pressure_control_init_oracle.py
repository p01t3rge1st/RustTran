#!/usr/bin/env python3
"""Original fresh initializer slices: 0x51b988/0x51b9d4 copy model nominal
pressure into control reference; 0x51c0ec–0x51c0f8 and 0x51c10b store level*100.
Explicit prepared model/level inputs; not the whole initialization procedure.
"""
import json,random,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
rng=random.Random(20261016);cases=[]
assert struct.unpack('<f',PE.get_data(0x4028c8-BASE,4))[0]==100.
for i in range(300):
 q=dict(nominal_pressure=f32(rng.uniform(100,2600)),liquid_level=f32([0,.27,.9,1][i%4] if i<40 else rng.uniform(0,1)))
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_FPCW,0x027f)
 for n,a in [('nominal_pressure',0x54b124),('liquid_level',0x54b4a0)]:u.mem_write(a,struct.pack('<f',q[n]))
 for start,end in [(0x51b988,0x51b98e),(0x51b9d4,0x51b9da),(0x51c0ec,0x51c0f8),(0x51c10b,0x51c111)]:u.emu_start(start,end,count=20)
 cases.append(dict(inputs=q,expected={n:struct.unpack('<f',u.mem_read(a,4))[0] for n,a in [('pressure_reference',0x54ba4c),('spray_level_percent',0x54b6c0)]}))
(ROOT/'analysis/pressure_control_init_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n')
print(len(cases),'fresh pressure control initialization cases')
