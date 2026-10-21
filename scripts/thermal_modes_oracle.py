#!/usr/bin/env python3
"""Original thermal branch selection and external/normal bodies 0x51f4f2–0x51f6fb.
Includes flag conditions and retention when the external threshold is not met.
External decay heat uses the original routine with original DLL Exp/Sqr.
Explicit x87 53-bit precision; no whole-plant events or COM/error handling.
"""
import json,random,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE
from thermal_driving_oracle import execute as common
from decay_heat_oracle import execute as decay
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x10000);u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for k,v in q['normal'].items():u.mem_write(int(k.replace('g','0x'),16),struct.pack('<f',v))
 u.mem_write(0x54b630,struct.pack('<I',0x20001000));u.mem_write(0x2000100e,struct.pack('<h',q['fault_flag']));u.mem_write(0x54bec8,struct.pack('<h',q['model_mode']));u.mem_write(0x54b190,struct.pack('<f',q['prior_limit']));u.mem_write(0x54ba68,struct.pack('<f',q['prior_modifier']))
 for k,v in q['external'].items():u.mem_write(int(k.replace('g','0x'),16),struct.pack('<f' if k in ['g54b300','g54b304'] else '<d',v))
 calls=[]
 def hook(machine,a,size,_):
  if a==0x52cbc0:
   esp=machine.reg_read(UC_X86_REG_ESP);ptr=struct.unpack('<I',machine.mem_read(esp+4,4))[0];t=struct.unpack('<d',machine.mem_read(ptr,8))[0];p=struct.unpack('<f',machine.mem_read(0x54b120,4))[0];heat=decay(t,p)[0]['heat'];calls.append(dict(time=t,power=p,heat=heat));machine.mem_write(0x20000200,struct.pack('<d',heat));machine.mem_write(0x20000000,b'\xdd\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x51f4f2,0x51f6fb,count=5000);assert u.reg_read(UC_X86_REG_EIP)==0x51f6fb
 outputs={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54ba68,0x54b554,0x54bad4,0x54b56c,0x54b190]};base=common(q['normal'],[(0x51f476,0x51f4f2)],[0x54ba54,0x54ba64]);base.update(outputs)
 if calls:base['0x54ba64']=struct.unpack('<f',u.mem_read(0x54ba64,4))[0]
 return dict(expected=base,decay_calls=calls)
if __name__=='__main__':
 rng=random.Random(20261104);cases=[]
 for i in range(400):
  normal={k:f32(v) for k,v in dict(g54b558=rng.uniform(0,1.5),g54b120=rng.uniform(1,5000),g54b41c=rng.uniform(0,1),g54b330=948.0555419921875,g54b550=rng.uniform(100,1500),g54b498=rng.uniform(100,1500),g54b6fc=rng.uniform(0,200000)).items()}
  external=dict(g54bf44=[.999999,1.,1.000001][i%3] if i<60 else rng.uniform(0,1e6),g54beb0=rng.uniform(1,1000),g54beb8=[0.,150.,300.,10000.,60000.][i%5],g54bdfc=rng.uniform(-1,3),g54be04=rng.uniform(-1,3),g54b300=f32(rng.uniform(0,100)),g54b304=f32(rng.uniform(1,1000)))
  q=dict(normal=normal,fault_flag=[-1,0,0,0,1][i%5],model_mode=[0,1,2,-1][i%4],prior_limit=f32(rng.uniform(1,10000)),prior_modifier=f32(rng.uniform(-100,100)),external=external);cases.append(dict(inputs=q,**execute(q)))
 path=ROOT/'analysis/thermal_modes_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'thermal-mode cases')
