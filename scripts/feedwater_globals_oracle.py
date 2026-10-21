#!/usr/bin/env python3
"""Original SG gain/capacity prefixes plus PI branch through authenticated A/B pointers.
Gain 0x5089f0–0x508a10 and capacity 0x508a1e–0x508a3a execute original x86.
Original PI/partition body is independently executed; explicit fault/phase inputs.
53-bit x87 precision; full SG flow control, UI and event dispatch excluded.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from feedwater_pi_oracle import execute as controller
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_FPCW,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
if __name__=='__main__':
 rng=random.Random(20261109);bindings=json.loads((ROOT/'analysis/steam_generator_fixtures.json').read_text())['caller_bindings'];cases=[]
 for i in range(180):
  side=i%2;addresses={int(a['ebp_offset'],16):a['pointer'] for a in bindings[side]['arguments']};q={k:f32(v) for k,v in dict(pressure=rng.uniform(10,2500),target=rng.uniform(10,2500),pressure_band=rng.uniform(1,1000),step=rng.choice([0,.1,.5,1]),output=rng.uniform(-15000,15000),previous_error=rng.uniform(-10,10),scale=rng.uniform(1,10000),ratio=rng.uniform(-1,1),heat_a=rng.uniform(-10000,10000),heat_b=rng.uniform(10001,20000)).items()};q.update(fault_flag=[-1,0,1][i%3],phase_flag=[-1,0,1,2][i%4]);g={addresses[o]:q[n] for n,o in [('pressure',8),('target',0x34),('pressure_band',0x4c),('step',0xc),('output',0x90),('previous_error',0x84),('scale',0x1c),('ratio',0x28),('heat_a',0x94),('heat_b',0x98)]};g.update({'0x54b208':f32(rng.uniform(.001,.1)),'0x54b18c':f32(rng.uniform(.01,3)),addresses[0xa4]:f32([1/3,2/3][side]),addresses[0x38]:f32(rng.choice([0,.5,1]))})
  u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
  for a,v in g.items():u.mem_write(int(a,16),struct.pack('<f',v))
  for o in [0x1c,0xa4,0x38]:u.mem_write(frame+o,struct.pack('<I',int(addresses[o],16)))
  for start,stop in [(0x5089f0,0x508a10),(0x508a1e,0x508a3a)]:u.emu_start(start,stop,count=300);assert u.reg_read(UC_X86_REG_EIP)==stop
  q['gain']=struct.unpack('<f',u.mem_read(frame-0x34,4))[0];q['capacity']=struct.unpack('<f',u.mem_read(frame-0x28,4))[0]
  request=dict(model='1',ic='1',extra_singles=g,stages=[dict(kind='feedwater_pi',side=['A','B'][side],fault_flag=q['fault_flag'],phase_flag=q['phase_flag'])]);cases.append(dict(inputs=request,**controller(q)))
 path=ROOT/'analysis/feedwater_globals_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'shared SG controller cases')
