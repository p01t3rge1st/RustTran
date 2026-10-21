#!/usr/bin/env python3
"""Execute numeric loop-reference initialization prefixes from 0x51afe0.
Slices: 0x51b1d9–0x51b303, 0x51bde6–0x51be4e, 0x51c014–0x51c0e1.
The saturation-pressure pointer pushed earlier at 0x51b19c is supplied on the
stack. Property returns use independent original prefixes. 53-bit x87 context;
no COM/UI/reset dispatcher or Windows process initialization is replayed.
"""
import hashlib,json,struct
from native_math_oracle import ROOT,PE,BASE,EXE
from vessel_oracle import property_value
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EDI,UC_X86_REG_EIP,UC_X86_REG_FPCW
REQUIRED=[0x54b204,0x54b128,0x54b1a8,0x54b41c,0x54b1fc,0x54b4b0,0x54b518,0x54b514,0x54b2a0,0x54b1f8,0x54b1cc,0x54b4cc,0x54b1a4]
OUTPUTS=[0x54b740,0x54b744,0x54b758,0x54b75c,0x54b4c0,0x54b760,0x54b764,0x54b768,0x54b76c,0x54b838,0x54b848,0x54b84c,0x54b808,0x54b850,0x54b854]
def execute(inputs,k):
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;stack=0x1001f000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,stack);uc.reg_write(UC_X86_REG_EDI,0);uc.reg_write(UC_X86_REG_FPCW,0x027f)
    for address,value in inputs.items():uc.mem_write(int(address,16),struct.pack('<f',value))
    uc.mem_write(0x54b4de,struct.pack('<h',k));uc.mem_write(0x54b000,struct.pack('<I',0));uc.mem_write(stack,struct.pack('<I',0x54b1a8))
    calls=[]
    def hook(machine,address,size,_):
        if address in [0x49bde0,0x49beb0,0x49bf00,0x49c190]:
            esp=machine.reg_read(UC_X86_REG_ESP);pointer=struct.unpack('<I',machine.mem_read(esp+4,4))[0];value=struct.unpack('<f',machine.mem_read(pointer,4))[0];result=property_value(address,value);calls.append(dict(address=hex(address),argument_pointer=hex(pointer),input=value,output=result))
            machine.mem_write(0x20000200,struct.pack('<f',result));machine.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2\x04\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
    uc.hook_add(UC_HOOK_CODE,hook)
    for start,stop in [(0x51b1d9,0x51b303),(0x51bde6,0x51be4e),(0x51c014,0x51c0e1)]:
        uc.emu_start(start,stop,count=2000);assert uc.reg_read(UC_X86_REG_EIP)==stop
    return dict(expected={hex(a):struct.unpack('<f',uc.mem_read(a,4))[0] for a in OUTPUTS},property_calls=calls)
if __name__=='__main__':
    models=json.loads((ROOT/'analysis/model_seed_fixtures.json').read_text())['cases'];ics=json.loads((ROOT/'analysis/field_conversion_fixtures.json').read_text())['seed_cases'];ints=json.loads((ROOT/'analysis/integer_seed_fixtures.json').read_text())['cases'];mg={};ig={};kg={};cases=[]
    for c in models:
        if not c['curve']:mg.setdefault(c['set'],{})[c['target']]=c['expected']
    for c in ics:ig.setdefault(c['ic'],{})[c['target']]=c['expected']
    for c in ints:
        if c['target']=='0x54b4de':kg[c['ic']]=c['expected']
    for model,m in mg.items():
        for ic,i in ig.items():
            merged=m|i;inputs={hex(a):merged[hex(a)] for a in REQUIRED};cases.append(dict(model=model,ic=ic,inputs=inputs,k=kg[ic],**execute(inputs,kg[ic])))
    path=ROOT/'analysis/loop_reference_fixtures.json';path.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'required_globals':[hex(a) for a in REQUIRED],'cases':cases},indent=2)+'\n');print(f'{len(cases)} model/IC loop-reference cases. {path}')
