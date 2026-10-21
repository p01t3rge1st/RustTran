#!/usr/bin/env python3
"""Continuous original accumulator activation/discharge 0x511b60-0x5120f9.
Original coordinator 0x51dfa1 push sequence supplies actual global pointers.
Explicit stateful COM valve reads/writes; cleanup/logging excluded. Original x87
FSQRT and original installer DLL PowerR8; explicit x87 53-bit context.
"""
import copy,hashlib,json,random,struct
from native_power_runtime import power
from native_math_oracle import ROOT,PE,BASE,EXE
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_EDI,UC_X86_REG_ESP,UC_X86_REG_EIP,UC_X86_REG_EAX,UC_X86_REG_FPCW
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
def execute(q):
    s=q["globals"]["singles"];ints=q["globals"]["integers"]
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000);uc.reg_write(UC_X86_REG_EDI,0)
    uc.reg_write(UC_X86_REG_FPCW,0x027f)
    # Run original coordinator push sequence to obtain all 11 actual pointers.
    for a,v in s.items():uc.mem_write(int(a,16),struct.pack('<f',v))
    for a,v in ints.items():uc.mem_write(int(a,16),struct.pack('<h',v))
    uc.emu_start(0x51dfa1,0x51dfd8,count=100);assert uc.reg_read(UC_X86_REG_EIP)==0x51dfd8
    sp=uc.reg_read(UC_X86_REG_ESP);args=struct.unpack('<11I',uc.mem_read(sp,44))
    expected=[0x54b494,0x54b1b8,0x54b4e6,0x54b540,0x54b804,0x54b570,0x54b414,0x54b574,0x54b708,0x54b1c0,0x54b40c]
    assert list(args)==expected
    for i,pointer in enumerate(args):
        assert hex(pointer) in (ints if i==2 else s),hex(pointer)
        uc.mem_write(frame+8+i*4,struct.pack('<I',pointer))
    assert '0x54b458' in s
    uc.reg_write(UC_X86_REG_ESP,0x1001f000);uc.mem_write(0x54b000,bytes(4))
    uc.mem_write(0x401228,struct.pack('<I',0x20000000));uc.mem_write(0x20000000,b'\xdd\x44\x24\x04\xd9\xfa\xc2\x08\x00')
    uc.mem_write(0x4011f4,struct.pack('<I',0x20000020))
    valves=copy.deepcopy(q['valves']);activated=False
    def jump(machine,address):machine.reg_write(UC_X86_REG_EIP,address)
    def read_valve(machine,index,address):machine.reg_write(UC_X86_REG_EAX,valves[index]['opening'] & 0xffff);jump(machine,address)
    def hook(machine,address,size,_):
        nonlocal activated
        if address==0x511b9d:activated=True;read_valve(machine,0,0x511c37)
        elif address==0x511c42:machine.reg_write(UC_X86_REG_EAX,0xffff if valves[0]['inhibited'] else 0);jump(machine,0x511c5d)
        elif address==0x511c61:jump(machine,0x511c8c)
        elif address==0x511ca4:valves[0]['opening']=struct.unpack('<h',machine.mem_read(frame-0x54,2))[0];jump(machine,0x511d21)
        elif address==0x511d21:read_valve(machine,1,0x511db2)
        elif address==0x511dbd:machine.reg_write(UC_X86_REG_EAX,0xffff if valves[1]['inhibited'] else 0);jump(machine,0x511dd8)
        elif address==0x511ddc:jump(machine,0x511e07)
        elif address==0x511e20:valves[1]['opening']=struct.unpack('<h',machine.mem_read(frame-0x54,2))[0];jump(machine,0x511e9a)
        elif address==0x511f0e:
            value=sum(v['opening'] for v in valves)
            if not -32768<=value<=32767:raise ValueError('native I16 valve sum overflow')
            machine.mem_write(frame-0xac,struct.pack('<d',value));jump(machine,0x511fe7)
        elif address==0x512026:jump(machine,0x512051)
        elif address==0x20000020:
            esp=machine.reg_read(UC_X86_REG_ESP);base,exponent=struct.unpack('<dd',machine.mem_read(esp+4,16));value=power(base,exponent)
            machine.mem_write(0x20000200,struct.pack('<d',value));machine.mem_write(0x20000040,b'\xdd\x05'+struct.pack('<I',0x20000200)+b'\xc2\x10\x00');jump(machine,0x20000040)
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x511b60,0x5120f9,count=3000);assert uc.reg_read(UC_X86_REG_EIP)==0x5120f9
    return dict(singles={hex(a):struct.unpack('<f',uc.mem_read(a,4))[0] for a in [0x54b458,0x54b540,0x54b804,0x54b570,0x54b574]},integers={'0x54b4e6':struct.unpack('<h',uc.mem_read(0x54b4e6,2))[0]},valves=valves,activated=activated)

if __name__=='__main__':
    rng=random.Random(20261026);cases=[]
    for i in range(640):
        pressure=f32(rng.uniform(10,2400));gas=f32(rng.uniform(100,1000));water=f32(rng.uniform(2,2000));gas_volume=f32(rng.uniform(100,1000))
        if i<160:pressure=f32(gas+[-.0001,0,.0001][i%3])
        if i<32:water=f32([.999999,1.,1.000001][i%3])
        vals={0x54b494:pressure,0x54b1b8:f32(pressure+[-.0001,0,.0001][(i//3)%3]),0x54b540:gas,0x54b804:f32(rng.uniform(0,10)),0x54b570:water,0x54b414:[0.,.1,.5,1.][i%4],0x54b574:gas_volume,0x54b708:f32(water+gas_volume),0x54b1c0:f32(rng.uniform(.01,2)),0x54b40c:[0.,150.,300.][i%3],0x54b458:f32(rng.uniform(0,300))}
        q=dict(globals=dict(singles={hex(a):v for a,v in vals.items()},integers={'0x54b4e6':[-1,0,1,2][(i//9)%4]}),valves=[dict(opening=rng.choice([-100,-1,0,0,25,50,100]),inhibited=bool(rng.getrandbits(1))) for _ in range(2)])
        cases.append(dict(inputs=q,expected=execute(q)))
    path=ROOT/'analysis/accumulator_system_fixtures.json';path.write_text(json.dumps(dict(method=__doc__,original_sha256=hashlib.sha256(EXE.read_bytes()).hexdigest(),dll_sha256=hashlib.sha256((ROOT/'analysis/program/msvbvm60.dll').read_bytes()).hexdigest(),cases=cases),indent=2)+'\n');print(len(cases),'continuous accumulator activation/discharge cases')
