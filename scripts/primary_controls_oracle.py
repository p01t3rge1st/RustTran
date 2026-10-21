#!/usr/bin/env python3
"""Composed original primary frame with original spray and heater numeric slices.
COM inputs/writes are supplied/captured; common signal is an upstream input.
No full plant dispatcher, GUI trajectory or original UI/error execution.
"""
import json
from native_math_oracle import ROOT
from primary_core_oracle import execute
cases=[]
for i,c in enumerate(json.loads((ROOT/'analysis/primary_heaters_fixtures.json').read_text())['cases']):
 q=c['inputs'] # Previous spray flow is read by inventory/phase before refresh.
 q['globals']['singles'].update({'0x54b1d8':1900.,'0x54b1dc':2100.,'0x54b6c0':[89.,90.,91.][i%3],'0x54b1d4':10.,'0x54ba28':20.})
 q['spray_controls']=dict(spray_manual=bool(i&1),spray_percent=[0,50,100][i%3],auxiliary_percent=[0,25,100][i%3])
 cases.append(dict(inputs=q,**execute(q)))
(ROOT/'analysis/primary_controls_fixtures.json').write_text(json.dumps(dict(method=__doc__,cases=cases),indent=2)+'\n')
print(len(cases),'primary spray/heater cases')
