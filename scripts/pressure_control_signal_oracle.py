#!/usr/bin/env python3
"""Original coordinator 0x51e0c7–0x51e0d9: shared pressure-control signal.
The upstream pressure adjustment remains explicit; no fault dispatcher replay.
"""
import json,random,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
rng=random.Random(20261015);cases=[]
for i in range(300):
 q=dict(pressure=f32(rng.uniform(100,2600)),pressure_adjustment=f32(0 if i<30 else rng.uniform(-500,500)))
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_FPCW,0x027f)
 for n,a in [('pressure',0x54b494),('pressure_adjustment',0x54ba4c)]:u.mem_write(a,struct.pack('<f',q[n]))
 u.emu_start(0x51e0c7,0x51e0d9,count=20)
 cases.append(dict(inputs=q,expected=dict(signal=struct.unpack('<f',u.mem_read(0x54b6d0,4))[0])))
(ROOT/'analysis/pressure_control_signal_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n')
print(len(cases),'pressure-control signal cases')
