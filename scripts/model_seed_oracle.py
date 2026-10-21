#!/usr/bin/env python3
"""Original BasicData scalar conversion blocks plus original VB6/OLEAUT32 arithmetic.
Injects getter results using MDB numeric types. No COM, DLL attach or Windows.
Unknown runtime system imports fail rather than being silently substituted.
"""
import csv,hashlib,json,struct
from native_math_oracle import ROOT,EXE,PE,BASE
from native_variant_runtime import NativeVariantRuntime
runtime=NativeVariantRuntime();doc=json.loads((ROOT/'analysis/rea/model-bindings.json').read_text());rows=list(csv.DictReader((ROOT/'analysis/data/ListData/BasicData.csv').open()));cases=[]
for binding in doc['bindings']:
    for row in rows:
        value=float(row[binding['field']]);machine,_=runtime.machine(capture_trace=False)
        machine.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);machine.mem_write(BASE,PE.get_memory_mapped_image())
        frame=0x10010000;stack=0x1001f000
        from unicorn import UC_HOOK_CODE
        from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP
        machine.reg_write(UC_X86_REG_EBP,frame);machine.reg_write(UC_X86_REG_ESP,stack)
        vt={'REAL':4,'DOUBLE PRECISION':5,'INTEGER':3}[binding['source_type']]
        runtime.write_variant(machine,frame-0x34,vt,int(value) if vt==3 else value)
        if binding['mode']=='single':machine.mem_write(stack,struct.pack('<I',frame-0x34))
        for address,item in doc['constants'].items():machine.mem_write(int(address,16),struct.pack('<I',item['bits']))
        for address,export in [(0x401158,'__vbaVarMul'),(0x401214,'__vbaVarAdd'),(0x401130,'__vbaR4Var'),(0x40117c,'__vbaVarDiv'),(0x4011f0,'__vbaR8Var')]:machine.mem_write(address,struct.pack('<I',runtime.exports['msvbvm60.dll',export]))
        operations=[];source_pointers={frame-0x34};returns={}
        arithmetic={runtime.exports['msvbvm60.dll',name]:name for name in ['__vbaVarMul','__vbaVarAdd','__vbaVarDiv']}
        def hook(uc,address,size,_):
            if address in returns:
                destination,operation=returns.pop(address)
                operation['result_type']=runtime.read_variant(uc,destination)[0]
            if address in arithmetic:
                esp=uc.reg_read(UC_X86_REG_ESP);ret,destination,right,left=struct.unpack('<IIII',uc.mem_read(esp,16))
                if (left in source_pointers)==(right in source_pointers):raise RuntimeError('Nonlinear or unknown model conversion '+binding['field'])
                constant_pointer=right if left in source_pointers else left
                vt,value=runtime.read_variant(uc,constant_pointer)
                operation={'operator':arithmetic[address],'constant_type':vt,'constant':value,'constant_left':right in source_pointers}
                operations.append(operation);source_pointers.add(destination);returns[ret]=(destination,operation)
        machine.hook_add(UC_HOOK_CODE,hook)
        if binding['curve']:machine.mem_write(int(binding['target'],16),struct.pack('<I',0x20000800))
        stop=int(binding['stop'],16);machine.emu_start(int(binding['start'],16),stop,count=20000)
        if machine.reg_read(UC_X86_REG_EIP)!=stop:raise RuntimeError('Native model conversion did not reach its store')
        if 'operations' not in binding:binding['operations']=operations
        elif binding['operations']!=operations:raise RuntimeError('Model-dependent numeric conversion '+binding['field'])
        width=binding['output_bits']//8
        expected=struct.unpack('<f' if width==4 else '<d',machine.mem_read(0x20000800+binding['index']*4 if binding['curve'] else int(binding['target'],16),width))[0]
        cases.append({'set':row['SET'],'field':binding['field'],'target':binding['target'],'source_type':binding['source_type'],'input':value,'expected':expected,'output_bits':binding['output_bits'],'curve':binding['curve'],'index':binding['index']})
(ROOT/'analysis/rea/model-bindings.json').write_text(json.dumps(doc,indent=2)+'\n')
path=ROOT/'analysis/model_seed_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'dll_sha256':{file:hashlib.sha256((ROOT/'analysis/program'/file).read_bytes()).hexdigest() for file in ['msvbvm60.dll','OLEAUT32.DLL']},'cases':cases},indent=2)+'\n');print(f'{len(cases)} original model-conversion blocks with native arithmetic helpers. {path}')
