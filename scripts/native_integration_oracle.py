#!/usr/bin/env python3
"""Original coordinator integration 0x523f3b–0x52454f, including all native
state constraints, alias and timed-event gate. EBX=Single(1) is loaded by
the original 0x523d48 instruction before entering the integration slice. Each EULER call independently
executes the original prefix and numeric VB6/OLEAUT32 arithmetic; byref helper
storage remains modeled. Explicit complete state/history/derivative inputs.
No preceding plant derivative dispatcher, original Windows or GUI execution.
"""
import json,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE,emulate
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EIP,UC_X86_REG_ESP,UC_X86_REG_EBP,UC_X86_REG_FPCW
states=json.loads((ROOT/'analysis/integration_states.json').read_text())['states']
# Binding order is independently recovered in integration_states.json.
def execute(q):
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.mem_map(0x10000000,0x20000);u.mem_map(0x20000000,0x1000);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_EBP,0x10010000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for n,v in q['globals']['singles'].items():u.mem_write(int(n,16),struct.pack('<f',v))
 u.mem_write(0x54b5f8,struct.pack('<I',0x10002000));u.mem_write(0x10002008,struct.pack('<f',q['activation_time']))
 u.mem_write(0x4010ac,struct.pack('<I',0x20000020));u.mem_write(0x20000020,b'\xd9\x1d'+struct.pack('<I',0x20000300)+b'\xd9\x05'+struct.pack('<I',0x20000300)+b'\xc3');u.mem_write(0x20000000,b'\xc2\x10\x00');calls=[]
 def hook(u,a,size,data):
  if a==0x49a830:
   esp=u.reg_read(UC_X86_REG_ESP);variants=struct.unpack('<4I',u.mem_read(esp+4,16));pointers=[]
   for vp in variants:
    assert struct.unpack('<H',u.mem_read(vp,2))[0]==0x4004;pointers.append(struct.unpack('<I',u.mem_read(vp+8,4))[0])
   values=[struct.unpack('<f',u.mem_read(p,4))[0] for p in pointers]
   result=emulate('EULER',values,single_byref=True,native_runtime=True)
   for p,v in zip(pointers,result['post_arguments']):u.mem_write(p,struct.pack('<f',v))
   calls.append([hex(p) for p in pointers]);u.reg_write(UC_X86_REG_EIP,0x20000000)
 u.hook_add(UC_HOOK_CODE,hook);u.emu_start(0x523d48,0x523d4d,count=1);u.emu_start(0x523f3b,0x52454f,count=20000);assert u.reg_read(UC_X86_REG_EIP)==0x52454f;assert len(calls)==14
 addresses=[s['state_va'] for s in states]+[s['previous_derivative_va'] for s in states]+[0x54b4f0,0x54bba4]
 return dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in addresses})
if __name__=='__main__':
 source=json.loads((ROOT/'analysis/integration_fixtures.json').read_text())['cases'];cases=[]
 for i,c in enumerate(source[:36]):
  singles={}
  for s,v,p,d in zip(states,c['values'],c['previous'],c['derivatives']):singles.update({hex(s['state_va']):v,hex(s['previous_derivative_va']):p,hex(s['new_derivative_va']):d})
  singles.update({'0x54b414':c['step'],'0x54b544':c['pressure_floor'],'0x54b40c':[99.,100.,101.][i%3],'0x54bb50':2.5})
  q=dict(globals=dict(singles=singles,integers={}),activation_time=100.);cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/native_integration_fixtures.json').write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'native coordinator integration cases')
