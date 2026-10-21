#!/usr/bin/env python3
"""Continuously execute original restored-control/event branch 0x51bb14-0x51bbed.
Twenty explicit I16 flags and Single delay/time arrays replace VB array backing.
EDI=0 from original initializer; no snapshot loader, external model or COM/UI.
"""
import copy,hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import *
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
OUTPUTS=[0x54b818,0x54b81c,0x54b40c,0x54b820,0x54bbc8,0x54bfe8,0x54bfcc,0x54bfbc,0x54bbb0,0x54ba9c,0x54baac,0x54b490]
def machine(events):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,4096);u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EDI,0);u.reg_write(UC_X86_REG_FPCW,0x027f)
 for a,p,fmt,values in [(0x54b630,0x20000000,'20h',events['flags']),(0x54b5dc,0x20000100,'20f',events['delays']),(0x54b5f8,0x20000200,'20f',events['times'])]:u.mem_write(a,struct.pack('<I',p));u.mem_write(p,struct.pack('<'+fmt,*values))
 return u

def execute(q):
 for a in [0x54b424,0x54b418,0x54b554,0x54b524,0x54b548,0x54b48c]:assert hex(a) in q['globals']['singles']
 assert '0x54b080' in q['globals']['integers']
 if q['events']['flags'][8]==-1:assert all(hex(a) in q['globals']['singles'] for a in [0x54b560,0x54b564])
 u=machine(q['events'])
 for a,v in q['globals']['singles'].items():u.mem_write(int(a,16),struct.pack('<f',v))
 for a,v in q['globals']['integers'].items():u.mem_write(int(a,16),struct.pack('<h',v))
 u.emu_start(0x51bb14,0x51bbed,count=2000);assert u.reg_read(UC_X86_REG_EIP)==0x51bbed
 events=copy.deepcopy(q['events']);events['times']=list(struct.unpack('<20f',u.mem_read(0x20000200,80)))
 return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in OUTPUTS},events=events)

def bindings(events):
 u=machine(events);u.emu_start(0x51deea,0x51df52,count=100)
 trip=struct.unpack('<f',u.mem_read(0x54ba30,4))[0];steam=[]
 for start,stop in [(0x520ec2,0x520fa0),(0x520fc5,0x5210b1)]:
  u.reg_write(UC_X86_REG_ESP,0x1001f000);u.emu_start(start,stop,count=1000);assert u.reg_read(UC_X86_REG_EIP)==stop
  sp=u.reg_read(UC_X86_REG_ESP);p=struct.unpack('<I',u.mem_read(sp+16,4))[0];steam.append(struct.unpack('<f',u.mem_read(p,4))[0])
 assert steam[0]==steam[1]
 return dict(rcp_trip_time=trip,steam_failure_time=steam[0],steam_fault_flag=struct.unpack('<h',u.mem_read(0x20000010,2))[0],steam_valve_fault_flags=list(struct.unpack('<2h',u.mem_read(0x20000004,4))))
if __name__=='__main__':
 rng=random.Random(20261025);cases=[]
 for i in range(400):
  flags=[rng.choice([0,0,-1,1,2]) for j in range(20)];flags[8]=[-1,0,1,2][i%4]
  e=dict(flags=flags,delays=[f32(rng.uniform(-5,300)) for j in range(20)],times=[f32(rng.uniform(-100,1000)) for j in range(20)])
  vals={0x54b424:rng.uniform(0,1.1),0x54b418:[0.,99.99999,100.,100.00001,300.][i%5],0x54b554:rng.uniform(100,650),0x54b524:rng.uniform(-100,100),0x54b548:rng.uniform(32,600),0x54b560:rng.uniform(-100,1000),0x54b564:rng.uniform(-100,2000),0x54b48c:rng.uniform(0,100)}
  q=dict(globals=dict(singles={hex(a):f32(v) for a,v in vals.items()},integers={'0x54b080':[0,-1,1,2][(i//4)%4]}),events=e);cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/restored_controls_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'restored-control/event cases')
