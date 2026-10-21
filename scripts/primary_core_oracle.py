#!/usr/bin/env python3
"""Connected original primary numerical slices, one x86 machine/frame.
Executes initialization, thermal preparation, exchange, inventory, volume,
phase-state/flow/phase branches, late volume properties, corrections and five
final derivatives. GUI command, cached upstream globals and heater heat are
explicit. Heater/UI region 0x50c5ac–0x50cbac is omitted, not approximated.
Original DLL Variant arithmetic and sqrt; property prefixes modeled as noted
in their oracles. Cached saturation pressures in these cases are limited to 100–2600 psia to
keep the volume-slope denominator nonzero. Explicit 53-bit x87; no full plant/Windows event execution.
"""
import json,struct,hashlib
from native_math_oracle import ROOT,PE,BASE,EXE,emulate
from native_variant_runtime import NativeVariantRuntime
from vessel_oracle import property_value
from saturated_balance_oracle import delta
from relief_oracle import critical
from unicorn import UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EBX,UC_X86_REG_EIP,UC_X86_REG_EAX,UC_X86_REG_FPCW
runtime=NativeVariantRuntime()
OUTPUTS=[0x54b690,0x54b730,0x54b734,0x54b6e4,0x54b6e8,0x54bab0,0x54b678,0x54bad8,0x54bb38,0x54b788,0x54b688,0x54b4a4,0x54b7ec,0x54b4a8,0x54b7f0,0x54b494,0x54b668,0x54b66c,0x54b670,0x54b6a4,0x54b498,0x54b49c,0x54b4a0,0x54b684,0x54b654,0x54b77c,0x54b774,0x54b770,0x54b784]
def execute(q,control_cycle=False,capture_commands=False):
 u,_=runtime.machine(capture_trace=False);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());frame=0x10010000;u.reg_write(UC_X86_REG_EBP,frame);u.reg_write(UC_X86_REG_ESP,0x1001f000);u.reg_write(UC_X86_REG_FPCW,0x027f);u.mem_write(0x54b000,bytes(4))
 for a,v in q['globals']['singles'].items():u.mem_write(int(a,16),struct.pack('<f',v))
 for a,v in q['globals']['integers'].items():u.mem_write(int(a,16),struct.pack('<h',v))
 u.mem_write(0x54b630,struct.pack('<I',0x20001000));u.mem_write(0x20001000,struct.pack('<h',q['fault_flag']));u.mem_write(0x54b614,struct.pack('<I',0x20001100));u.mem_write(0x20001100,struct.pack('<2f',*q['pump_contributions']))
 for lib in PE.DIRECTORY_ENTRY_IMPORT:
  for entry in lib.imports:
   if entry.name and entry.name.decode() in ['__vbaVarSub','__vbaVarDiv','__vbaR4Var','__vbaFreeVarList','__vbaFreeVar']:u.mem_write(entry.address,struct.pack('<I',runtime.exports['msvbvm60.dll',entry.name.decode()]))
 u.mem_write(0x401228,struct.pack('<I',runtime.exports['msvbvm60.dll','rtcSqr']));u.mem_write(0x4010ac,struct.pack('<I',0x20000000));u.mem_write(0x20000000,b'\xd9\x1d'+struct.pack('<I',0x20000100)+b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc3');prep=False;calls=[]
 def scalar_return(machine,value,cleanup):
  machine.mem_write(0x20000200,struct.pack('<f',value));machine.mem_write(0x20000040,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2'+struct.pack('<H',cleanup));machine.reg_write(UC_X86_REG_EIP,0x20000040)
 def hook(machine,a,size,_):
  if prep and a in [0x50bdd9,0x50bde7]:machine.emu_stop();return
  if a==0x7342c1e1:
   esp=machine.reg_read(UC_X86_REG_ESP);ret=struct.unpack('<I',machine.mem_read(esp,4))[0];machine.reg_write(UC_X86_REG_EAX,0x20000300);machine.reg_write(UC_X86_REG_ESP,esp+4);machine.reg_write(UC_X86_REG_EIP,ret)
  elif a==0x49b140:
   esp=machine.reg_read(UC_X86_REG_ESP);outp,pp,tp=struct.unpack('<3I',machine.mem_read(esp+4,12));p=struct.unpack('<f',machine.mem_read(pp,4))[0];t=struct.unpack('<f',machine.mem_read(tp,4))[0];child=emulate('HLIQ',[p,t]);runtime.write_variant(machine,outp,child['post_arguments']['output_variant_type'],child['output']);machine.reg_write(UC_X86_REG_EAX,outp);machine.mem_write(0x20000020,b'\xc2\x0c\x00');machine.reg_write(UC_X86_REG_EIP,0x20000020);calls.append(hex(a))
  elif a in [0x49beb0,0x49bf00,0x49bde0,0x49a3f0,0x49b3a0]:
   esp=machine.reg_read(UC_X86_REG_ESP);ptr=struct.unpack('<I',machine.mem_read(esp+4,4))[0]
   if a==0x49a3f0:ptr=struct.unpack('<I',machine.mem_read(ptr+8,4))[0]
   value=struct.unpack('<f',machine.mem_read(ptr,4))[0]
   if a==0x49b3a0:
    flagptr=struct.unpack('<I',machine.mem_read(esp+8,4))[0];phase=struct.unpack('<h',machine.mem_read(flagptr,2))[0];value=critical(value,phase)
   elif a==0x49a3f0:value=delta(value)
   else:value=property_value(a,value)
   scalar_return(machine,value,8 if a==0x49b3a0 else 4);calls.append(hex(a))
 u.hook_add(UC_HOOK_CODE,hook)
 if control_cycle:
  u.emu_start(0x51e0c7,0x51e0d9,count=20);assert u.reg_read(UC_X86_REG_EIP)==0x51e0d9
 for start,stop in [(0x50af5c,0x50afdc),(0x50afe4,0x50b3ff)]:u.emu_start(start,stop,count=100000);assert u.reg_read(UC_X86_REG_EIP)==stop
 u.reg_write(UC_X86_REG_EAX,q['command_percent']&0xffff);u.emu_start(0x50b46b,0x50b4e8,count=3000);assert u.reg_read(UC_X86_REG_EIP)==0x50b4e8
 prep=True;u.emu_start(0x50b50c,0x50c587,count=100000);phase_entry=u.reg_read(UC_X86_REG_EIP);assert phase_entry in [0x50bdd9,0x50bde7];prep=False
 u.emu_start(phase_entry,0x50c5ac,count=100000);assert u.reg_read(UC_X86_REG_EIP)==0x50c5ac
 command_states={}
 if q.get('spray_controls') is not None:
  from spray_oracle import execute as spray_execute
  h={n:struct.unpack('<f',u.mem_read(a,4))[0] for n,a in [('signal',0x54b6d0),('lower_threshold',0x54b1d8),('upper_threshold',0x54b1dc),('interlock_signal',0x54b6c0),('spray_capacity',0x54b1d4),('auxiliary_capacity',0x54ba28)]}
  h.update({n:struct.unpack('<h',u.mem_read(a,2))[0] for n,a in [('pump_a',0x54b4e2),('pump_b',0x54b4e4)]});h.update(q['spray_controls']);out=spray_execute(h)
  command_states['spray']=dict(q['spray_controls'],spray_percent=out['spray_percent'])
  u.mem_write(0x54b6d8,struct.pack('<f',out['spray_flow']));u.mem_write(0x54b6ec,struct.pack('<h',out['spray_command']))
 if q.get('heater_controls') is not None:
  from heater_oracle import execute as heater_execute, fields
  addresses=[0x54b6d0,0x54b4a0,0x54b6d4,0x54b1e4,0x54b1e8,0x54b1e0,0x54b1ec,0x54b200,0x54b1d0]
  h=dict(zip(fields,[struct.unpack('<f',u.mem_read(a,4))[0] for a in addresses]));h.update(q['heater_controls'])
  ho=heater_execute(h);command_states['heaters']=dict(q['heater_controls'],proportional_percent=ho['proportional_percent'],backup_percent=ho['backup_percent'])
  u.mem_write(0x54b6dc,struct.pack('<f',ho['total_heat']))
 u.emu_start(0x50cbac,0x50cfa4,count=100000);assert u.reg_read(UC_X86_REG_EIP)==0x50cfa4
 if control_cycle:
  for a,b in [(0x50d113,0x50d137),(0x50d1be,0x50d1f8)]:u.emu_start(a,b,count=100);assert u.reg_read(UC_X86_REG_EIP)==b
 result=dict(expected=dict(singles={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in (OUTPUTS+([0x54b6dc] if q.get('heater_controls') is not None else [])+([0x54b6d8] if q.get('spray_controls') is not None else [])+([0x54b6d0,0x54b738,0x54b6c0] if control_cycle else []))},integers={hex(a):struct.unpack('<h',u.mem_read(a,2))[0] for a in ([0x54b4d6,0x54b4d8,0x54b4ea]+([0x54b6ec] if q.get('spray_controls') is not None else []))}),phase_entry=hex(phase_entry),callee_calls=calls)
 if capture_commands:result['control_commands']=command_states
 return result
if __name__=='__main__':
 docs={n:json.loads((ROOT/f'analysis/{n}_fixtures.json').read_text())['cases'] for n in ['primary_exchange','primary_inventory','primary_phase','primary_phase_state','primary_flow','primary_properties']};cases=[]
 for i in range(160):
  singles={};integers={}
  for n in ['primary_exchange','primary_inventory','primary_phase','primary_phase_state','primary_flow']:
   for name,v in docs[n][i%len(docs[n])]['inputs'].items():
    if name.startswith('g'):
     (integers if name in ['g54b4e2','g54b4e4','g54b4d6','g54b4d8','g54b4ea'] else singles)['0x'+name[1:]]=v
  singles.update(docs['primary_properties'][(i+14)%len(docs['primary_properties'])]['expected']);singles['0x54b684']=min(2600.,max(100.,singles['0x54b684']));singles['0x54b414']=[.1,.5,1.][i%3];singles['0x54b6dc']=0. if i<12 else float(i*100);singles['0x54b688']=[-.01,0.,.1,1.,1.000001][i%5] if i<60 else singles['0x54b688'];q=dict(globals=dict(singles=singles,integers=integers),command_percent=[0,50,100][i%3],fault_flag=[-1,0,1][i%3],pump_contributions=docs['primary_exchange'][i]['inputs']['pump_contributions']);cases.append(dict(inputs=q,**execute(q)))
 path=ROOT/'analysis/primary_core_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),dll_sha256=hashlib.sha256((ROOT/'analysis/program/msvbvm60.dll').read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'connected original primary core cases')
