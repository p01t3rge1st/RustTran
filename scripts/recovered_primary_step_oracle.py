#!/usr/bin/env python3
"""Compose original numeric source/relief/tail, primary control/balance,
stream balance and 14-state coordinator integration slices. Separate native
machines exchange shared scalar state; six SG derivatives and remaining
cached/source inputs are explicit. Not a whole-plant/original GUI trajectory.
"""
import copy,json,struct
from native_math_oracle import ROOT,PE,BASE
from steam_control_oracle import execute as steam_control
from steam_valves_oracle import execute as steam_valves
from steam_system_oracle import execute as steam_body
from restored_controls_oracle import bindings as event_bindings
from connected_thermal_oracle import execute as thermal_transfer
from accumulator_system_oracle import execute as accumulator
from supply_system_oracle import execute as supply
from loop_transport_oracle import execute as loop_transport
from rcp_control_oracle import execute as rcp
from primary_devices_oracle import execute as devices
from primary_references_oracle import execute as references
from primary_properties_oracle import execute as properties
from primary_relief_oracle import execute as relief
from relief_tail_oracle import execute as tail
from primary_core_oracle import execute as primary
from native_integration_oracle import execute as integration
from steam_generator_oracle import execute as steam,bindings as steam_bindings
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32
from unicorn.x86_const import UC_X86_REG_FPCW
STEAM=[0x54b7d0,0x54b7d4,0x54b7d8,0x54b7dc,0x54b7e0,0x54b7e4]
def execute(q):
 g=copy.deepcopy(q['globals']);c=copy.deepcopy(q['controls']);bound=None
 if c.get('event_schedule') is not None:
  bound=event_bindings(c['event_schedule'])
  if c.get('rcp') is not None:c['rcp']['trip_time']=bound['rcp_trip_time']
  if c.get('normal_thermal') is not None:c['normal_thermal'].update(failure_time=bound['steam_failure_time'],fault_flag=c['event_schedule']['flags'][7])
  if c.get('steam_controls') is not None:c['steam_controls'].update(failure_time=bound['steam_failure_time'],fault_flag=bound['steam_fault_flag'])
  if c.get('steam_valves') is not None:c['steam_valves']['fault_flags']=bound['steam_valve_fault_flags']
 s=g['singles'];flags=g['integers'];out={'0x54b40c':c['clock'],'0x54b414':c['step']};s.update(out)
 props=properties(s['0x54b494'])['expected'];s.update(props);out.update(props)
 device_result=None;device_flags={}
 if c.get('references') is not None:
  refs=references(dict(globals=g,controls=c['references']));s.update(refs);out.update(refs)
 if c.get('devices') is not None:
  device_result=devices(dict(globals=g,**c['devices']));s.update(device_result['singles']);out.update(device_result['singles']);device_flags.update(device_result['integers']);flags.update(device_flags)
 rcp_result=None
 if c.get('rcp') is not None:
  rcp_result=rcp(dict(globals=g,controls=c['rcp']));s.update(rcp_result['singles']);out.update(rcp_result['singles']);device_flags.update(rcp_result['integers']);flags.update(rcp_result['integers'])
 supply_result=None
 if c.get('supply') is not None:
  supply_result=supply(dict(globals=g,**c['supply']));s.update(supply_result['singles']);out.update(supply_result['singles']);device_flags.update(supply_result['integers']);flags.update(supply_result['integers'])
 accumulator_result=None
 if c.get('accumulator') is not None:
  accumulator_result=accumulator(dict(globals=g,valves=c['accumulator']));s.update(accumulator_result['singles']);out.update(accumulator_result['singles']);device_flags.update(accumulator_result['integers']);flags.update(accumulator_result['integers'])
 r=relief(dict(globals=g,valves=c['valves']));out.update(r['singles']);s.update(r['singles']);ints={**device_flags,**r['integers']};flags.update(ints)
 t=tail(dict(g54bf98=s['0x54bf98'],g54bf9c=s['0x54bf9c'],g54b6a8=s['0x54b6a8'],control_state=c['tail_control_state']));s['0x54bf9c']=t['g54bf9c'];out['0x54bf9c']=t['g54bf9c']
 thermal_result=None
 if c.get('normal_thermal') is not None:
  thermal_result=thermal_transfer(dict(globals=g,controls=c['normal_thermal']));s.update(thermal_result['singles']);out.update(thermal_result['singles'])
 valve_state=copy.deepcopy(c.get('steam_valves'));valves_out=[];auxiliary_out=[]
 controls_out=[];selected=(c.get('steam_controls') or {}).get('fault_selected',False)
 if c.get('steam_phase_flags') is not None:
  for bind,phase in zip(steam_bindings(),c['steam_phase_flags']):
   if c.get('steam_controls') is not None:
    control=c['steam_controls'];i=0 if bind['loop']=='A' else 1
    result=steam_control(dict(globals=g,side=bind['loop'],controls=dict(failure_time=control['failure_time'],fault_flag=control['fault_flag'],fault_selected=selected,feedwater_percent=valve_state['feedwater'][i]['percent'] if valve_state is not None else control['feedwater_percent'][i])))
    selected=result['fault_selected'];s.update(result['singles']);out.update(result['singles']);controls_out.append(result)
   if valve_state is not None:
    result=steam_valves(dict(globals=g,side=bind['loop'],controls=valve_state));valve_state=result['controls'];s.update(result['singles']);out.update(result['singles']);valves_out.append(result)
   outflow_offset=0x68
   if c.get('steam_auxiliary_percent') is not None:
    result=steam_body(dict(globals=g,side=bind['loop'],auxiliary_percent=c['steam_auxiliary_percent']),True);s.update(result['singles']);out.update(result['singles']);auxiliary_out.append(result)
   args=[int(a['pointer'],16) for a in bind['arguments']]
   get=lambda offset:s[hex(args[(offset-8)//4])]
   inp=dict(pressure=get(8),pressure_floor=s['0x54b544'],fraction=get(0x60),inflow_a=get(0x20),inflow_b=get(0x50),enthalpy_a=s['0x54b718'],enthalpy_b=s['0x54b734'],outflow=get(outflow_offset),volume=get(0x80),share=get(0xa4),heat_a=get(0x94),heat_b=get(0x98),phase_flag=phase,pressure_work=s['0x54b334'])
   sg=steam(inp)['expected'];updates={hex(args[(offset-8)//4]):sg[name] for offset,name in [(8,'pressure'),(outflow_offset,'outflow'),(0x74,'fraction_derivative'),(0x70,'pressure_derivative'),(0x58,'inventory_derivative')]};s.update(updates);out.update(updates)
 else:
  sg={hex(a):v for a,v in zip(STEAM,c['steam_derivatives'])};s.update(sg);out.update(sg)
 core=primary(dict(globals=g,command_percent=c['command_percent'],fault_flag=c['fault_flag'],pump_contributions=c['pump_contributions'],heater_controls=c['heaters'],spray_controls=c['spray']),True,c.get('capture_control_commands',False));r=core['expected'];out.update(r['singles']);s.update(r['singles']);ints.update(r['integers']);flags.update(r['integers'])
 if c.get('loop_transport'):
  transport=loop_transport(dict(globals=g));s.update(transport);out.update(transport)
 u=Uc(UC_ARCH_X86,UC_MODE_32);u.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);u.mem_write(BASE,PE.get_memory_mapped_image());u.reg_write(UC_X86_REG_FPCW,0x027f)
 for a in [0x54b6a4,0x54bb50,0x54ba90,0x54b738]:u.mem_write(a,struct.pack('<f',s[hex(a)]))
 u.emu_start(0x523dc8,0x523e04,count=100)
 stream={hex(a):struct.unpack('<f',u.mem_read(a,4))[0] for a in [0x54b674,0x54b4b8]};s.update(stream);out.update(stream)
 r=integration(dict(globals=g,activation_time=c['activation_time']));out.update(r['singles'])
 result=dict(singles=out,integers=ints,relief_tail=t)
 if c.get('capture_control_commands'):result['primary_commands']=core['control_commands']
 if supply_result is not None:result['supply']=supply_result
 if accumulator_result is not None:result['accumulator']=accumulator_result
 if thermal_result is not None:result['thermal_loops']=thermal_result['loops']
 if bound is not None:result['event_bindings']=bound
 if device_result is not None:result['primary_devices']=device_result
 if rcp_result is not None:result['rcp']=rcp_result
 if c.get('steam_controls') is not None:result['steam_controls']=controls_out
 if c.get('steam_valves') is not None:result['steam_valves']=valves_out
 if c.get('steam_auxiliary_percent') is not None:result['steam_auxiliary']=auxiliary_out
 return result
if __name__=='__main__':
 cp=json.loads((ROOT/'analysis/primary_control_cycle_fixtures.json').read_text())['cases'];ip=json.loads((ROOT/'analysis/native_integration_fixtures.json').read_text())['cases'];rp=json.loads((ROOT/'analysis/primary_relief_fixtures.json').read_text())['cases'];states=json.loads((ROOT/'analysis/integration_states.json').read_text())['states'];cases=[]
 for i in range(32):
  c=copy.deepcopy(cp[i]['inputs']);g=c['globals'];s=g['singles'];r=rp[i]['inputs'];it=ip[i]['inputs']['globals']['singles']
  for a,v in r['globals']['singles'].items():
   if a not in ['0x54b494','0x54b4a0','0x54b724','0x54b728']:s[a]=v
  g['integers']['0x54b4d0']=r['globals']['integers']['0x54b4d0']
  for b in states:s.setdefault(hex(b['state_va']),it[hex(b['state_va'])]);s[hex(b['previous_derivative_va'])]=it[hex(b['previous_derivative_va'])]
  s.update({'0x54bb50':2.5,'0x54ba90':500.,'0x54bf98':[4999.,5000.,5001.][i%3],'0x54bf9c':2.})
  controls=dict(clock=[0.,99.,100.,101.,300.][i%5],step=.1,command_percent=c['command_percent'],fault_flag=c['fault_flag'],pump_contributions=c['pump_contributions'],heaters=c['heater_controls'],spray=c['spray_controls'],valves=r['valves'],tail_control_state=0,activation_time=100.,steam_derivatives=[it[hex(a)] for a in STEAM])
  for a in STEAM:s.pop(hex(a),None)
  q=dict(globals=g,controls=controls);cases.append(dict(inputs=q,expected=execute(q)))
 (ROOT/'analysis/recovered_primary_step_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n');print(len(cases),'composed numerical-step cases')
