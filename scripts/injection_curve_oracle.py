#!/usr/bin/env python3
"""Execute original seven-point wrapper 0x5124e0 and native INTP prefixes.
Curves come from independently checked native BasicData conversions for all
five configurations. Numeric Variant helpers in INTP are modeled.
"""
import hashlib,json,struct
from native_math_oracle import ROOT,PE,BASE,EXE,emulate
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_ESP,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(x,y,query):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    stack=0x1001f000;uc.reg_write(UC_X86_REG_ESP,stack)
    args=[0x20001000,0x20001010,0x20001020];uc.mem_write(stack,struct.pack('<4I',0x20000080,*args));uc.mem_write(args[0],struct.pack('<f',query))
    for i,values in enumerate([x,y]):
        desc=0x20002000+i*64;data=0x20003000+i*64;uc.mem_write(args[i+1],struct.pack('<I',desc));uc.mem_write(desc,struct.pack('<HHIIIIi',1,0,4,0,data,7,1));uc.mem_write(data,struct.pack('<7f',*values))
    calls=[]
    def hook(machine,address,size,_):
        if address==0x49b430:
            esp=machine.reg_read(UC_X86_REG_ESP);arguments=struct.unpack('<5I',machine.mem_read(esp+4,20));xp,yp,n,q,out=arguments
            count=struct.unpack('<h',machine.mem_read(n,2))[0];assert count==7
            query_value=struct.unpack('<f',machine.mem_read(q,4))[0]
            arrays=[]
            for pointer in [xp,yp]:
                desc=struct.unpack('<I',machine.mem_read(pointer,4))[0];data=struct.unpack('<I',machine.mem_read(desc+12,4))[0];arrays.append(list(struct.unpack('<7f',machine.mem_read(data,28))))
            value=emulate('INTP',dict(x=arrays[0],y=arrays[1],query=query_value))['output'];calls.append(arguments);machine.mem_write(out,struct.pack('<f',value));machine.mem_write(0x20000000,b'\xc2\x14\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
    uc.mem_write(0x20000080,b'\xd9\x1d'+struct.pack('<I',0x20000200));uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x5124e0,0x20000086,count=1000);assert len(calls)==1 and uc.reg_read(UC_X86_REG_EIP)==0x20000086
    return struct.unpack('<f',uc.mem_read(0x20000200,4))[0]
if __name__=='__main__':
    conversions=json.loads((ROOT/'analysis/model_seed_fixtures.json').read_text())['cases'];cases=[]
    for model in ['1','2','3','4','5']:
        curves={name:[None]*7 for name in ['PH','WH','PL','WL']}
        for case in conversions:
            if case['set']==model and case['curve']:curves[case['curve']][case['index']]=case['expected']
        for family,p,w in [('high','PH','WH'),('low','PL','WL')]:
            x,y=curves[p],curves[w];assert all(v is not None for v in x+y)
            queries=[x[0]-1,*x,x[-1]+1,*[(x[i]+x[i+1])/2 for i in range(5)]]
            for query in queries:
                query=f32(query);cases.append(dict(model=model,family=family,pressure=x,flow=y,query=query,expected=execute(x,y,query)))
    path=ROOT/'analysis/injection_curve_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'cases':cases},indent=2)+'\n');print(f'{len(cases)} injection curve cases. {path}')
