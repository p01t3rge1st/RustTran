#!/usr/bin/env python3
"""Original SG bounded PI/heat-partition branch 0x5090ba–0x509213.
Original PI callee numeric prefix runs independently. Inputs include the
upstream capacity/gain and explicit fault/phase flags; no COM or dispatcher.
Caller and callee use explicit x87 53-bit precision.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from controller_oracle import execute as pi
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 offsets={'pressure':8,'target':0x34,'pressure_band':0x4c,'output':0x90,'previous_error':0x84,'step':0xc,'scale':0x1c,'ratio':0x28,'heat_a':0x94,'heat_b':0x98,'phase_flag':0x9c}
 ptrs={offset:0x20001000+offset*4 for offset in range(8,0xb0,4)}
 for offset,ptr in ptrs.items():u.mem_write(frame+offset,struct.pack('<I',ptr))
 for name,offset in offsets.items():u.mem_write(ptrs[offset],struct.pack('<h' if name=='phase_flag' else '<f',q[name]))
 u.mem_write(frame-0x28,struct.pack('<f',q['capacity']));u.mem_write(frame-0x34,struct.pack('<f',q['gain']));u.mem_write(0x54b630,struct.pack('<I',0x20002000));u.mem_write(0x20002010,struct.pack('<h',q['fault_flag']));children=[]
 def hook(machine,a,size,_):
  if a==0x512290:
   esp=machine.reg_read(UC_X86_REG_ESP);args=struct.unpack('<10I',machine.mem_read(esp+4,40));names=['measured','target','proportional_band','output','previous_error','gain','integral_time','step','lower','upper'];child={n:struct.unpack('<f',machine.mem_read(p,4))[0] for n,p in zip(names,args)};out=pi(child,precision=0x027f);children.append(child)
   for index,n in [(3,'output'),(4,'previous_error')]:machine.mem_write(args[index],struct.pack('<f',out[n]))
   machine.mem_write(0x20000000,b'\xc2\x28\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x5090ba,0x509213,count=3000);assert u.reg_read(UC_X86_REG_EIP)==0x509213 and len(children)==1
 return dict(expected={n:struct.unpack('<f',u.mem_read(ptrs[o],4))[0] for n,o in [('output',0x90),('previous_error',0x84),('heat_partition',0xa8)]},native_pi=children[0])
if __name__=='__main__':
 rng=random.Random(20261105);cases=[]
 for i in range(350):
  q={k:f32(v) for k,v in dict(pressure=rng.uniform(10,2500),target=rng.uniform(10,2500),pressure_band=rng.uniform(1,1000),capacity=rng.uniform(1,10000),gain=rng.uniform(.01,100),step=rng.choice([0,.1,.5,1]),output=rng.uniform(-15000,15000),previous_error=rng.uniform(-10,10),scale=rng.uniform(1,10000),ratio=rng.uniform(-1,1),heat_a=rng.uniform(-10000,10000),heat_b=rng.uniform(10001,20000)).items()};q.update(fault_flag=[-1,0,1][i%3],phase_flag=[-1,0,1,2][i%4]);cases.append(dict(inputs=q,**execute(q)))
 path=ROOT/'analysis/feedwater_pi_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'SG feedwater PI cases')
