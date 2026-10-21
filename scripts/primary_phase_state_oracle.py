#!/usr/bin/env python3
"""Original phase-state preparation 0x50b60f–0x50bae2, exits at 0x50bde7.
Includes >1/<0 mixture branches, pressure floor and saturation entry flags.
EBX=0, ESI=1 and CX=phase flag come from the preceding native volume block.
53-bit x87; no flow preparation, COM/error handlers or complete dispatcher.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EBX,UC_X86_REG_ESI,UC_X86_REG_ECX,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_EBX,0);u.reg_write(UC_X86_REG_ESI,1);u.reg_write(UC_X86_REG_ECX,q['g54b4d8']);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for name,v in q.items():
  if name.startswith('g'):u.mem_write(int(name.replace('g','0x'),16),struct.pack('<h' if name in ['g54b4d6','g54b4d8'] else '<f',v))
 u.mem_write(frame-0xac,struct.pack('<f',q['local_ac']));u.mem_map(0x20000000,0x1000);u.mem_write(0x4010ac,struct.pack('<I',0x20000000));u.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3')
 def hook(machine,a,size,_):
  if a==0x50bde7:machine.emu_stop()
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x50b60f,0x50bae2,count=3000);stop=u.reg_read(UC_X86_REG_EIP);assert stop in [0x50bde7,0x50bae2]
 out={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b688,0x54b4a4,0x54b7ec,0x54b4a8,0x54bb38,0x54b7f0,0x54b494]};out.update({hex(a):struct.unpack('<h',u.mem_read(a,2))[0] for a in [0x54b4d6,0x54b4d8]});out["continue_flow_preparation"]=stop==0x50bae2;return dict(expected=out,exit_va=hex(stop))
if __name__=='__main__':
 rng=random.Random(20261113);cases=[]
 for i in range(640):
  sat=f32(rng.uniform(100,2500));q={k:f32(v) for k,v in dict(g54b688=[-.01,-0.,0,.5,1,1.000001][i%6] if i<120 else rng.uniform(-.1,1.1),g54b4a4=rng.uniform(100,10000),g54b19c=rng.uniform(10000,50000),g54b1a0=rng.uniform(10000,50000),g54b7ec=rng.uniform(0,1),g54b4a8=rng.uniform(100,10000),g54bb38=rng.uniform(1e6,2e6),g54b7f0=rng.uniform(1e6,2e6),g54b654=rng.uniform(.01,.03),g54b650=rng.uniform(.1,10),g54b64c=rng.uniform(.01,.03),g54b4a0=[-.01,0,.01][i%3],g54b4ac=rng.uniform(-1000,1000),g54b6c4=rng.uniform(0,1000),g54b6a8=rng.uniform(0,1000),g54b414=rng.choice([0,.1,.5,1]),g54b494=sat+[-.001,0,.001][i%3],g54b544=sat-1,g54b684=sat,local_ac=rng.uniform(0,1000)).items()};q.update(g54b4d6=(i//2)%2,g54b4d8=i%2);cases.append(dict(inputs=q,**execute(q)))
 path=ROOT/'analysis/primary_phase_state_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'primary phase-state cases')
