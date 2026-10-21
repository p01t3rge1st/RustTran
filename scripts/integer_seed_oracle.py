#!/usr/bin/env python3
"""Execute original integer field store blocks with modeled I2Var/I4Var helpers.
Inputs are integer-valued MDB records. COM reads and VB runtime errors excluded.
"""
import csv,hashlib,json,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_EAX
bindings=json.loads((ROOT/'analysis/rea/seed-bindings.json').read_text())['integer_bindings'];rows=list(csv.DictReader((ROOT/'analysis/data/ListData/ICThermoData.csv').open()));cases=[]
for binding in bindings:
    for row in rows:
        value=int(row[binding['field']]);bits=binding['bits'];assert -(2**(bits-1))<=value<2**(bits-1)
        uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x1000)
        frame=0x10010000;stack=0x1001f000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,stack)
        uc.mem_write(frame-0x30,struct.pack('<H6xi4x',3,value));uc.mem_write(stack,struct.pack('<I',frame-0x30))
        uc.mem_write(0x4011a0 if bits==16 else 0x40120c,struct.pack('<I',0x20000000))
        def hook(machine,address,size,_):
            if address!=0x20000000:return
            esp=machine.reg_read(UC_X86_REG_ESP);ret,pointer=struct.unpack('<II',machine.mem_read(esp,8));v=struct.unpack('<i',machine.mem_read(pointer+8,4))[0]
            machine.reg_write(UC_X86_REG_EAX,v&0xffffffff);machine.reg_write(UC_X86_REG_EIP,ret);machine.reg_write(UC_X86_REG_ESP,esp+8)
        uc.hook_add(UC_HOOK_CODE,hook);stop=int(binding['stop'],16);uc.emu_start(int(binding['start'],16),stop,count=1000);assert uc.reg_read(UC_X86_REG_EIP)==stop
        expected=struct.unpack('<h' if bits==16 else '<i',uc.mem_read(int(binding['target'],16),bits//8))[0]
        cases.append({'ic':row['IC'],'field':binding['field'],'target':binding['target'],'bits':bits,'input':value,'expected':expected})
path=ROOT/'analysis/integer_seed_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'cases':cases},indent=2)+'\n');print(f'{len(cases)} native integer loader cases. {path}')
