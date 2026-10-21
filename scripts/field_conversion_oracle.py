#!/usr/bin/env python3
"""Execute original IC field conversion blocks with injected numeric R8 values.
Variant multiplication/addition and conversion helpers modeled; original field
selection/COM reads are not executed. Constants are original native immediates.
"""
import csv,hashlib,json,struct
from native_math_oracle import PE,BASE,EXE,ROOT
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_EAX
rows=list(csv.DictReader((ROOT/'analysis/data/ListData/ICThermoData.csv').open()))
cases=[]
for kind,start,stop,target,field in [('pressure',0x4b14be,0x4b14ec,0x54b494,'P'),('temperature',0x4b1599,0x4b15e3,0x54b498,'TAVG')]:
    values=[float(row[field]) for row in rows]+[-20,0,.001,32,60,100,158.2,220,265,309.1,500,680]
    for value in values:
        uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x1000)
        frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000)
        uc.mem_write(frame-0x30,struct.pack('<H6xd',5,value))
        for address,bits in [(0x54b2fc,0x41681062),(0x54b300,0x42000000),(0x54b304,0x3fe66666)]:uc.mem_write(address,struct.pack('<I',bits))
        for address,stub in [(0x401158,0x20000000),(0x401214,0x20000020),(0x401130,0x20000040),(0x40117c,0x20000080)]:uc.mem_write(address,struct.pack('<I',stub))
        def readvar(pointer):
            raw=bytes(uc.mem_read(pointer,16));vt=struct.unpack_from('<H',raw)[0]
            if vt==4:return struct.unpack_from('<f',raw,8)[0]
            if vt==5:return struct.unpack_from('<d',raw,8)[0]
            raise RuntimeError(f'unsupported Variant {vt}')
        def hook(machine,address,size,_):
            if address not in [0x20000000,0x20000020,0x20000040,0x20000080]:return
            esp=machine.reg_read(UC_X86_REG_ESP)
            arg=lambda i:struct.unpack('<I',machine.mem_read(esp+4+4*i,4))[0]
            if address==0x20000040:
                machine.mem_write(0x20000100,struct.pack('<f',readvar(arg(0))));machine.mem_write(0x20000060,b'\xd9\x05'+struct.pack('<I',0x20000100)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000060)
            else:
                dest=arg(0);left,right=readvar(arg(2)),readvar(arg(1));result=left*right if address==0x20000000 else left/right if address==0x20000080 else left+right
                machine.mem_write(dest,struct.pack('<H6xd',5,result));machine.reg_write(UC_X86_REG_EAX,dest);machine.reg_write(UC_X86_REG_EIP,arg(-1));machine.reg_write(UC_X86_REG_ESP,esp+16)
        uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(start,stop,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==stop
        expected=struct.unpack('<f',uc.mem_read(target,4))[0];cases.append({'kind':kind,'input':value,'expected':expected})
bindings=json.loads((ROOT/'analysis/rea/seed-bindings.json').read_text())
seed_cases=[]
for binding in bindings['bindings']:
    for row in rows:
        value=float(row[binding['field']]);start=int(binding['start'],16);stop=int(binding['stop'],16);target=int(binding['target'],16)
        uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x1000)
        frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000)
        uc.mem_write(frame-0x30,struct.pack('<H6xd',5,value))
        if binding['mode']=='single':uc.mem_write(0x1001f000,struct.pack('<I',frame-0x30))
        for address,item in bindings['constants'].items():uc.mem_write(int(address,16),struct.pack('<I',item['bits']))
        for address,stub in [(0x401158,0x20000000),(0x401214,0x20000020),(0x401130,0x20000040),(0x40117c,0x20000080)]:uc.mem_write(address,struct.pack('<I',stub))
        # Closures above reference the current uc/frame and model numeric R8/R4.
        uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(start,stop,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==stop
        expected=struct.unpack('<f',uc.mem_read(target,4))[0]
        seed_cases.append({'ic':row['IC'],'field':binding['field'],'target':binding['target'],'input':value,'expected':expected})
path=ROOT/'analysis/field_conversion_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'cases':cases,'seed_cases':seed_cases},indent=2)+'\n');print(f'{len(cases)} conversion cases + {len(seed_cases)} original IC field-loader blocks. {path}')
