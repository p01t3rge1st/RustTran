#!/usr/bin/env python3
"""Original RCP normalization, void cap, asymmetric time constants and both flow updates.
Slices 0x512609–0x5126d3, 0x512c7a–0x512e1d, 0x5133f9–0x513520.
UI trip/restart dispatch is skipped; targets/event-time inputs explicit.
Single round helper modeled; explicit 53-bit x87 caller context.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 ptrs={o:0x20001000+o*4 for o in range(8,0x50,4)}
 for o,p in ptrs.items():u.mem_write(frame+o,struct.pack('<I',p))
 vals={0xc:q['last_change_a'],0x30:q['trip_time'],0x4c:q['time_constant'],0x3c:q['void_fraction'],0x28:q['flows'][0],0x2c:q['flows'][1],0x24:q['base_flow'],0x1c:q['shares'][0],0x20:q['shares'][1],0x18:q['specific_volume'],0x14:q['volume_factor'],0x40:q['targets'][0],0x44:q['targets'][1],0x48:q['step']}
 for o,v in vals.items():u.mem_write(ptrs[o],struct.pack('<f',v))
 u.mem_write(0x4010ac,struct.pack('<I',0x20000000));u.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3')
 for start,stop in [(0x512609,0x5126d3),(0x512c7a,0x512e1d),(0x5133f9,0x513520)]:u.emu_start(start,stop,count=2000);assert u.reg_read(UC_X86_REG_EIP)==stop
 get=lambda p:struct.unpack('<f',u.mem_read(p,4))[0]
 return dict(loops=[dict(normalized_flow=get(frame-0x28),flow=get(ptrs[0x28])),dict(normalized_flow=get(frame-0x2c),flow=get(ptrs[0x2c]))],void_fraction=get(ptrs[0x3c]),selected_time_constant_a=get(frame-0x84))
if __name__=='__main__':
 rng=random.Random(20261107);cases=[]
 for i in range(320):
  q=dict(flows=[f32(rng.uniform(-1000,20000)),f32(rng.uniform(-1000,20000))],targets=[f32(rng.choice([4,120,-10,100])),f32(rng.choice([4,120,-10,100]))],step=f32(rng.choice([0,.1,.5,1])),time_constant=f32(rng.uniform(3,30)),base_flow=f32(rng.uniform(100,20000)),shares=[f32(1/3),f32(2/3)],volume_factor=f32(rng.uniform(.005,.03)),specific_volume=f32(rng.uniform(.005,.03)),void_fraction=f32([0,.9999,1,1.001][i%4] if i<40 else rng.uniform(0,.9)),last_change_a=f32([0,10,20][i%3]),trip_time=f32(10));cases.append(dict(inputs=q,expected=execute(q)))
 path=ROOT/'analysis/pump_pair_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'coupled RCP cases')
