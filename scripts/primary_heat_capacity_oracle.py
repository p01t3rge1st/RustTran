#!/usr/bin/env python3
"""Original primary TLIQ/heat-capacity/HLIQ prefix 0x50afe4–0x50b0fb.
The original Variant subtraction/division and conversion execute installer DLLs.
HLIQ callees use independently executed original numeric prefixes. Variant
storage is reset by original frame initialization 0x50af5c–0x50afdc.
Explicit x87 53-bit precision; no COM/event or complete plant replay.
"""
import json,struct,random,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE,emulate
from native_variant_runtime import NativeVariantRuntime
from vessel_oracle import property_value
from unicorn import UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_EAX,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
runtime=NativeVariantRuntime()
def execute(q):
 u,_=runtime.machine(capture_trace=False);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4));u.mem_write(0x54b494,struct.pack('<f',q['pressure']));u.mem_write(0x54b49c,struct.pack('<f',q['temperature']))
 for library in PE.DIRECTORY_ENTRY_IMPORT:
  for entry in library.imports:
   if entry.name and entry.name.decode() in ['__vbaVarSub','__vbaVarDiv','__vbaR4Var','__vbaFreeVarList','__vbaFreeVar']:u.mem_write(entry.address,struct.pack('<I',runtime.exports['msvbvm60.dll',entry.name.decode()]))
 calls=[]
 def hook(machine,a,size,_):
  if a==0x49beb0:
   esp=machine.reg_read(UC_X86_REG_ESP);ptr=struct.unpack('<I',machine.mem_read(esp+4,4))[0];p=struct.unpack('<f',machine.mem_read(ptr,4))[0];out=property_value(a,p);machine.mem_write(0x20000200,struct.pack('<f',out));machine.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
  elif a==0x49b140:
   esp=machine.reg_read(UC_X86_REG_ESP);outp,pp,tp=struct.unpack('<3I',machine.mem_read(esp+4,12));p=struct.unpack('<f',machine.mem_read(pp,4))[0];t=struct.unpack('<f',machine.mem_read(tp,4))[0];child=emulate('HLIQ',[p,t]);vt=child['post_arguments']['output_variant_type'];value=child['output'];runtime.write_variant(machine,outp,vt,value);calls.append(dict(pressure=p,temperature=t,variant_type=vt,output=value));machine.reg_write(UC_X86_REG_EAX,outp);machine.mem_write(0x20000020,b'\xc2\x0c\x00');machine.reg_write(UC_X86_REG_EIP,0x20000020)
 u.hook_add(UC_HOOK_CODE,hook)
 for start,stop in [(0x50af5c,0x50afdc),(0x50afe4,0x50b0fb)]:u.emu_start(start,stop,count=30000);assert u.reg_read(UC_X86_REG_EIP)==stop
 return dict(expected={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b690,0x54b730,0x54b734]},enthalpy_calls=calls)
if __name__=='__main__':
 rng=random.Random(20261115);values=[60,218,218.0001,219.9999,220,220.0001,221.9999,222,222.0001,680]+[rng.uniform(60,680) for _ in range(230)];cases=[]
 for t in values:q=dict(pressure=f32(rng.uniform(1,3000)),temperature=f32(t));cases.append(dict(inputs=q,**execute(q)))
 path=ROOT/'analysis/primary_heat_capacity_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'primary heat capacity cases')
