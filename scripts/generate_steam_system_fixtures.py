#!/usr/bin/env python3
"""Generate native SG auxiliary and continuous-body references."""
import copy,hashlib,json,random
from steam_system_oracle import execute,f32,BINDINGS
from native_math_oracle import ROOT,EXE
rng=random.Random(20261022)
aux=[]
for i in range(640):
 side=i%2;addresses=[int(a['pointer'],16) for a in BINDINGS[side]['arguments']]
 vals={0xc:[0.,.1,1.][i%3],0x1c:1000.,0x20:rng.uniform(-100,2000),0x24:.5,0x5c:1000.,0x64:rng.uniform(.1,.9),0x68:rng.uniform(-100,2000),0x88:rng.uniform(-1,1),0xa4:[.1,1/3,.5,2/3,1.][(i//2)%5]}
 s={hex(addresses[(o-8)//4]):f32(v) for o,v in vals.items()};s.update({'0x54b184':.1,'0x54b72c':350.})
 q=dict(globals=dict(singles=s,integers={'0x54b4d2':[-1,0,1,2][(i//2)%4],'0x54b4d4':[-1,0,1,2][(i//8)%4]}),side='A' if side==0 else 'B',auxiliary_percent=[[0,0],[0,100],[100,0],[50,100],[100,50]][(i//32)%5])
 aux.append(dict(inputs=q,expected=execute(q,True)))
base=json.loads((ROOT/'analysis/steam_control_fixtures.json').read_text())['cases'];valves=json.loads((ROOT/'analysis/steam_valves_fixtures.json').read_text())['cases'];cases=[]
for i in range(320):
 q=copy.deepcopy(base[i]['inputs']);v=valves[i]['inputs'];g=q['globals'];s=g['singles']
 for a,value in v['globals']['singles'].items():s.setdefault(a,value)
 s.update({'0x54ba7c':1000.,'0x54b72c':350.,'0x54b734':450.,'0x54b188':10000.,'0x54b334':.185})
 s['0x54b414']=max(.1,s['0x54b414'])
 side=i%2;s['0x54b6c8' if side==0 else '0x54b6cc']=f32(rng.uniform(0,1000))
 pressure=s['0x54b4fc' if side==0 else '0x54b500'];s['0x54b544']=f32(pressure+[-10.,0.,10.][i%3]);s['0x54b504' if side==0 else '0x54b508']=f32(.2 if i%3==0 else .8)
 g['integers']['0x54b4d4']=[-1,0,1,2][(i//2)%4];g['integers']['0x54b4d2']=[-1,0,1,2][(i//8)%4]
 initial=q.pop('controls');q['controls']=dict(initial=initial,valves=copy.deepcopy(v['controls']),auxiliary_percent=[[0,0],[0,100],[100,0],[50,100],[100,50]][(i//32)%5])
 cases.append(dict(inputs=q,expected=execute(q)))
for name,rows in [('steam_auxiliary',aux),('steam_system',cases)]:
 (ROOT/f'analysis/{name}_fixtures.json').write_text(json.dumps(dict(method=__doc__+' '+execute.__doc__ if execute.__doc__ else __import__('steam_system_oracle').__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),cases=rows),indent=2)+'\n');print(name,len(rows))
