#!/usr/bin/env python3
"""Twelve eight-update chains of independently executed native plant slices.
Stateful decoded COM commands feed subsequent updates, including heaters/spray,
RCP, source pumps, accumulator and SG valves. Explicit missing plant inputs are
retained; this is not continuous original Windows coordinator execution. Small
0.0001 s steps keep synthetic component states within their supported ranges.
"""
import copy,hashlib,json,struct
from native_math_oracle import ROOT,EXE
from recovered_primary_step_oracle import execute as step
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
OPTIONALS=['event_schedule','references','devices','rcp','accumulator','supply','normal_thermal','steam_controls','steam_valves','steam_auxiliary_percent','steam_derivatives','steam_phase_flags']
def execute(q):
 session=copy.deepcopy(q['session']);g=session['globals'];c=session['controls'];c['capture_control_commands']=True
 for field in OPTIONALS:c.setdefault(field,None)
 results=[]
 for _ in range(q['steps']):
  out=step(dict(globals=g,controls=c));g['singles'].update(out['singles']);g['integers'].update(out['integers'])
  if out.get('primary_devices') is not None:c['devices']['controls']=copy.deepcopy(out['primary_devices']['controls'])
  if out.get('rcp') is not None:c['rcp']['pump_percent']=out['rcp']['pump_percent'].copy()
  if out.get('supply') is not None:c['supply']['controls']=copy.deepcopy(out['supply']['controls'])
  if out.get('accumulator') is not None:c['accumulator']=copy.deepcopy(out['accumulator']['valves'])
  if out.get('steam_controls'):c['steam_controls']['fault_selected']=out['steam_controls'][-1]['fault_selected']
  if out.get('steam_valves'):
   c['steam_valves']=copy.deepcopy(out['steam_valves'][-1]['controls'])
   if c.get('steam_controls') is not None:c['steam_controls']['feedwater_percent']=[v['percent'] for v in c['steam_valves']['feedwater']]
  c['heaters']=copy.deepcopy(out['primary_commands']['heaters']);c['spray']=copy.deepcopy(out['primary_commands']['spray']);c['clock']=f32(c['clock']+c['step']);results.append(out)
 return dict(session=session,steps=results)
if __name__=='__main__':
 base=json.loads((ROOT/'analysis/recovered_supply_step_fixtures.json').read_text())['cases'];cases=[]
 checkpoint=ROOT/'analysis/recovered_session.partial.json'
 if checkpoint.exists():cases=json.loads(checkpoint.read_text())
 for i in range(len(cases),12):
  source=copy.deepcopy(base[i*4]['inputs']);c=source['controls'];c['clock']=f32([0.,149.99969482421875,299.9990234375][i%3]);c['step']=f32(.0001);c['supply']['controls']['mode']=[0,1,2][i%3]
  q=dict(session=source,steps=8);cases.append(dict(inputs=q,expected=execute(q)));checkpoint.write_text(json.dumps(cases)+'\n');print(i+1,'/12 native-slice stateful chains',flush=True)
 path=ROOT/'analysis/recovered_session_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');checkpoint.unlink(missing_ok=True);print(len(cases),'stateful session chains')
