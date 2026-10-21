#!/usr/bin/env python3
"""Original thermal mode-0 driving and native A/B caller bindings, then independently
executed original loop numerical bodies. Includes native B-count FpI2 and shared
event-8 pointer. Explicit 53-bit x87; excludes external model and GUI callbacks.
"""
import copy,struct
from native_math_oracle import PE,BASE
from native_variant_runtime import NativeVariantRuntime
from thermal_modes_oracle import execute as driving
from loop_transfer_oracle import execute as loop
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
RUNTIME=NativeVariantRuntime()

def execute(q):
 g=copy.deepcopy(q['globals']);s=g['singles'];ints=g['integers'];c=q['controls']
 assert ints['0x54bec8']==0
 vals=driving(dict(normal={'g'+a[2:]:s[a] for a in ['0x54b558','0x54b120','0x54b41c','0x54b330','0x54b550','0x54b498','0x54b6fc']},fault_flag=c['fault_flag'],model_mode=ints['0x54bec8'],prior_limit=s['0x54b190'],prior_modifier=s['0x54ba68'],external={}))['expected']
 s.update(vals);outputs=[]
 for side,start,stop in [('A',0x51ff5c,0x51fffd),('B',0x520002,0x5200d4)]:
  u,_=RUNTIME.machine(capture_trace=False);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f)
  for a,v in s.items():u.mem_write(int(a,16),struct.pack('<f',v))
  for a,v in ints.items():u.mem_write(int(a,16),struct.pack('<h',v))
  u.mem_write(0x54b5f8,struct.pack('<I',0x10008000));u.mem_write(0x10008020,struct.pack('<f',c['failure_time']));u.mem_write(0x40122c,struct.pack('<I',RUNTIME.exports['msvbvm60.dll','__vbaFpI2']))
  u.emu_start(start,stop,count=1000);assert u.reg_read(UC_X86_REG_EIP)==stop
  sp=u.reg_read(UC_X86_REG_ESP);args=struct.unpack('<29I',u.mem_read(sp,116));inp={}
  for i,p in enumerate(args):
   offset=8+i*4
   if offset in [8,0x28,0x34]:continue
   if offset not in [0x54,0x78]:assert hex(p) in (ints if offset==0x64 else s),hex(p)
   inp[f'p{offset:02x}']=struct.unpack('<h' if offset in [0x64,0x78] else '<f',u.mem_read(p,2 if offset in [0x64,0x78] else 4))[0]
  inp['g54b768']=s['0x54b768'];out=loop(inp)['expected'];outputs.append(out)
  if side=='A':vals['0x54b510']=struct.unpack('<f',u.mem_read(0x54b510,4))[0];s.update(vals)
  for name in ['p08','p28','p34','p3c']:
   address=hex(args[(int(name[1:],16)-8)//4]);s[address]=out[name];vals[address]=out[name]
 return dict(singles=vals,loops=outputs)
