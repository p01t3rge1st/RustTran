#!/usr/bin/env python3
"""Persistent REA MCP session. Accept JSON requests on stdin; retain full results."""
import json, os, subprocess, sys
from pathlib import Path
root=Path(__file__).resolve().parents[1]
env=os.environ.copy()
node=root/'.tools/node-v24.15.0-linux-x64/bin/node'
env['PATH']=str(node.parent)+os.pathsep+env['PATH']
env['GHIDRA_INSTALL_DIR']=str(root/'.tools/ghidra_12.1.4_PUBLIC')
env['REA_GHIDRA_STARTUP_TIMEOUT_MS']='600000'
p=subprocess.Popen([str(node),str(root/'.tools/rea/node_modules/rea-agents/scripts/rea.mjs'),'--mcp'],stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=open(root/'analysis/rea/server.log','a'),text=True,bufsize=1,env=env)
i=0
def rpc(method,params):
 global i
 i+=1
 p.stdin.write(json.dumps({'jsonrpc':'2.0','id':i,'method':method,'params':params})+'\n');p.stdin.flush()
 while True:
  line=p.stdout.readline()
  if not line: raise RuntimeError('REA exited; inspect server.log')
  value=json.loads(line)
  if value.get('id')==i: return value
rpc('initialize',{'protocolVersion':'2024-11-05','capabilities':{},'clientInfo':{'name':'pctran-analysis','version':'0.1'}})
p.stdin.write(json.dumps({'jsonrpc':'2.0','method':'notifications/initialized'})+'\n');p.stdin.flush()
print('READY',flush=True)
try:
 for line in sys.stdin:
  request=json.loads(line)
  result=rpc(request.get('method','tools/call'),request['params'])
  if request.get('save'):
   destination=root/request['save'];destination.parent.mkdir(parents=True,exist_ok=True)
   destination.write_text(json.dumps(result,indent=2))
  print(json.dumps(result)[:request.get('print_limit',6000)],flush=True)
finally:
 p.terminate();p.wait(timeout=15)
