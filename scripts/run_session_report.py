#!/usr/bin/env python3
"""Run the recovered stateful engine and export its actual history as JSON/CSV/HTML.
Input is decoded RustTran session state, not an original PCTran save file.
"""
import argparse,csv,json,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
FIELDS={
 '0x54b494':('Primary pressure','psia'),
 '0x54b498':('Primary temperature','degF'),
 '0x54b4a0':('Pressurizer level','fraction'),
 '0x54b4fc':('Steam generator A pressure','psia'),
 '0x54b500':('Steam generator B pressure','psia'),
 '0x54b530':('Coolant pump A flow','lb/s'),
 '0x54b534':('Coolant pump B flow','lb/s'),
 '0x54ba20':('Supply injection flow','lb/s'),
 '0x54ba40':('Supply tank volume','ft3'),
 '0x54b804':('Accumulator discharge','lb/s'),
 '0x54b570':('Accumulator water volume','ft3'),
 '0x54b540':('Accumulator gas pressure','psia'),
}
def records(initial,steps):
 state=initial['globals']['singles'].copy();rows=[]
 for i,step in enumerate(steps):
  state.update(step['singles']);rows.append(dict(update=i+1,clock_s=step['singles']['0x54b40c'],**{a:state.get(a) for a in FIELDS}))
 return rows
HTML='''<!doctype html><html lang="en"><meta charset="utf-8"><title>RustTran history</title>
<style>body{background:#191d20;color:#e6eaec;font:16px system-ui;margin:36px auto;max-width:1100px;padding:0 24px}h1{color:#e7bf54}section{background:#252a2e;padding:24px;border:1px solid #414950;border-radius:10px}select{background:#30363b;color:#e6eaec;padding:10px;max-width:100%;border:1px solid #e7bf54}svg{width:100%;height:auto}p{line-height:1.5;color:#afb9c0}a{color:#e7bf54}#value{font-variant-numeric:tabular-nums;min-height:3em}</style>
<h1>RustTran · Recorded history</h1><p>Actual outputs from the recovered stateful pipeline, using supplied initial and source state. Full PCTran scenario equivalence has not been validated. Time labels are update evaluation clocks.</p>
<section><label>Variable <select id="field"></select></label><p id="value"></p><svg id="chart" viewBox="0 0 1000 420" role="img" aria-label="Recorded values by time"></svg></section><p><a href="history.csv">CSV data</a> · <a href="run.json">Complete results and resumable session</a></p>
<script>const data=__DATA__,fields=__FIELDS__,select=document.querySelector('#field'),svg=document.querySelector('#chart'),note=document.querySelector('#value');
for(const [address,[name,unit]] of Object.entries(fields)){const option=document.createElement('option');option.value=address;option.textContent=`${name} (${unit})`;select.append(option)}
const node=(tag,attrs,text)=>{let e=document.createElementNS('http://www.w3.org/2000/svg',tag);for(const [a,v]of Object.entries(attrs))e.setAttribute(a,v);if(text!==undefined)e.textContent=text;svg.append(e);return e};
function draw(){svg.replaceChildren();const key=select.value,values=data.filter(r=>r[key]!==null&&Number.isFinite(r[key]));if(!values.length){note.textContent='No recorded values for this variable.';return}const xs=values.map(r=>r.clock_s),ys=values.map(r=>r[key]),xmin=xs.reduce((a,b)=>Math.min(a,b)),xmax=xs.reduce((a,b)=>Math.max(a,b)),ymin=ys.reduce((a,b)=>Math.min(a,b)),ymax=ys.reduce((a,b)=>Math.max(a,b)),dx=xmax-xmin||1,dy=ymax-ymin||Math.max(1,Math.abs(ymax)*.01),x=v=>90+(v-xmin)/dx*870,y=v=>350-(v-ymin)/dy*290;node('path',{d:'M90 45V350H960',stroke:'#647078',fill:'none'});for(let i=0;i<=4;i++){let v=ymin+dy*i/4;node('line',{x1:90,x2:960,y1:y(v),y2:y(v),stroke:'#414950'});node('text',{x:82,y:y(v)+5,'text-anchor':'end',fill:'#afb9c0','font-size':13},v.toPrecision(6))}node('text',{x:90,y:390,fill:'#afb9c0'},xmin.toPrecision(8)+' s');node('text',{x:960,y:390,'text-anchor':'end',fill:'#afb9c0'},xmax.toPrecision(8)+' s');node('polyline',{points:values.map(r=>`${x(r.clock_s)},${y(r[key])}`).join(' '),fill:'none',stroke:'#e7bf54','stroke-width':2});for(const r of values.filter((_,i)=>i%Math.max(1,Math.ceil(values.length/2000))===0)){let p=node('circle',{cx:x(r.clock_s),cy:y(r[key]),r:3,fill:'#e7bf54'});let title=document.createElementNS('http://www.w3.org/2000/svg','title');title.textContent=`Update ${r.update}: ${r.clock_s} s, ${r[key]} ${fields[key][1]}`;p.append(title)}note.textContent=`${values.length} updates · First ${ys[0].toPrecision(8)} · Last ${ys.at(-1).toPrecision(8)} ${fields[key][1]}`}
select.addEventListener('change',draw);draw();</script></html>'''
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--state',required=True,type=Path);p.add_argument('--steps',type=int);p.add_argument('--cli',type=Path,default=ROOT/'dist/rusttran-linux-x86_64/rusttran-cli');p.add_argument('--output',required=True,type=Path);a=p.parse_args();source=json.loads(a.state.read_text());source=source.get('solution',source);source=source.get('session',source);count=a.steps if a.steps is not None else 8
 if count<1:p.error('--steps must be positive')
 with tempfile.TemporaryDirectory(prefix='rusttran-session-') as tmp:
  request=Path(tmp)/'run.json';request.write_text(json.dumps(dict(session=source,steps=count)));result=json.loads(subprocess.check_output([str(a.cli.resolve()),'recovered-session-run',str(request)],text=True))
 rows=records(source,result['solution']['steps']);a.output.mkdir(parents=True,exist_ok=True);(a.output/'run.json').write_text(json.dumps(result,indent=2)+'\n')
 with (a.output/'history.csv').open('w',newline='') as stream:
  writer=csv.writer(stream);writer.writerow(['update','evaluation_clock_s',*[f'{name} [{unit}]' for name,unit in FIELDS.values()]])
  for row in rows:writer.writerow([row['update'],row['clock_s'],*[row[x] for x in FIELDS]])
 (a.output/'history.html').write_text(HTML.replace('__DATA__',json.dumps(rows).replace('<','\\u003c')).replace('__FIELDS__',json.dumps(FIELDS)))
 print(f'{len(rows)} recorded updates: {a.output / "history.html"}')
if __name__=='__main__':main()
