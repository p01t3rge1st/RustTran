#!/usr/bin/env python3
"""Original external-model Double initializer 0x52624b-0x5269d2.
Also executes original 0x4ce082-0x4ce0ae and 0x4ce3a8-0x4ce3d4 model
conversions, and fresh temperature stores 0x51ba2d-0x51baa3.
All scalar/array arithmetic and loops run as original x86 with x87 53-bit.
Only the known zero Double Variant move is bridged; COM/UI after 0x5269d2 excluded.
"""
import hashlib,json,random,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import *
POINTERS=[0x54bbec,0x54bc08,0x54bc24,0x54bc40,0x54bc5c,0x54bc78,0x54bc94,0x54bcb0,0x54bccc,0x54bce8,0x54bd04,0x54bf70,0x54bd20]
DOUBLES=[0x54bd30,0x54bd40,0x54bd60,0x54bd68,0x54bd9c,0x54bdc4,0x54be3c,0x54be44,0x54be4c,0x54be54,0x54be5c,0x54be64,0x54be6c,0x54be74,0x54be7c,0x54be84,0x54bf0c,0x54bf24,0x54bd70,0x54bdfc,0x54be04,0x54be0c,0x54bdb4,0x54bdcc,0x54bf2c,0x54bec0,0x54bedc,0x54bee4,0x54bf34,0x54bf50,0x54bf44,0x54bdf4,0x54bf7c]
FLAGS=[0x54bd2c,0x54be8c,0x54be8e,0x54bec8]
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x40000);frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EDI,0);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for a,v in q['globals']['singles'].items():u.mem_write(int(a,16),struct.pack('<f',v))
 for a,v in q['model_doubles'].items():u.mem_write(int(a,16),struct.pack('<d',v))
 pointers={a:0x10020000+i*128 for i,a in enumerate(POINTERS)}
 for a,ptr in pointers.items():u.mem_write(a,struct.pack('<I',ptr));u.mem_write(ptr,b'\xa5'*64)
 def hook(m,a,size,_):
  if a==0x52688a:
   assert struct.unpack('<I',m.mem_read(frame-0x44,4))[0]==5
   assert m.mem_read(frame-0x3c,8)==bytes(8)
   m.mem_write(0x54be14,bytes(m.mem_read(frame-0x44,16)));m.reg_write(UC_X86_REG_EIP,0x526890)
 u.hook_add(UC_HOOK_CODE,hook)
 for start,stop in [(0x4ce082,0x4ce0ae),(0x4ce3a8,0x4ce3d4),(0x52624b,0x5269d2),(0x51ba2d,0x51baa3)]:
  u.emu_start(start,stop,count=100000);assert u.reg_read(UC_X86_REG_EIP)==stop,hex(u.reg_read(UC_X86_REG_EIP))
 return dict(doubles={hex(a):struct.unpack('<d',u.mem_read(a,8))[0] for a in DOUBLES},singles={'0x54bd78':struct.unpack('<f',u.mem_read(0x54bd78,4))[0]},integers={hex(a):struct.unpack('<h',u.mem_read(a,2))[0] for a in FLAGS},arrays={hex(a):list(struct.unpack('<8d',u.mem_read(pointers[a],64))) for a in POINTERS[:-1]},temperatures=list(struct.unpack('<2d',u.mem_read(pointers[0x54bd20]+0x30,16))),zero_variant=dict(vartype=struct.unpack('<H',u.mem_read(0x54be14,2))[0],value=struct.unpack('<d',u.mem_read(0x54be14+8,8))[0]))
if __name__=='__main__':
 rng=random.Random(526200);cases=[];f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
 for i in range(240):
  singles={hex(a):f32(v) for a,v in {0x54b1b0:rng.uniform(1,1e7),0x54bfa4:rng.uniform(0,1000),0x54b548:rng.uniform(32,650),0x54b310:f32(3.281),0x54b32c:f32(2.205),0x54b300:32.,0x54b304:f32(1.8)}.items()}
  doubles={hex(a):rng.uniform(1,1e6) for a in [0x54bd38,0x54bd48,0x54bd50,0x54bd58]}
  q=dict(globals=dict(singles=singles,integers={}),model_doubles=doubles);cases.append(dict(inputs=q,expected=execute(q)))
 out=dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases);(ROOT/'analysis/alternate_init_fixtures.json').write_text(json.dumps(out,indent=2)+'\n');print(len(cases),'continuous native Double/array initialization cases')
