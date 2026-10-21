#!/usr/bin/env python3
"""Original relief numeric branches and critical-flow table selector.
Valve values and precomputed phase fluxes/enthalpies are supplied inputs.
COM reads/cleanup are bypassed; native HGAS/INTP numerical prefixes provide
property returns with modeled VB numeric helpers. No Windows plant run.
"""
import hashlib,json,random,struct
from functools import lru_cache
from native_math_oracle import ROOT,PE,BASE,EXE,emulate
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EBP,UC_X86_REG_ESP,UC_X86_REG_EIP
f32=lambda x:struct.unpack('<f',struct.pack('<f',x))[0]
TABLES={a['name']:a['values'] for a in json.loads((ROOT/'analysis/property_tables.json').read_text())['arrays']}
def machine():
    uc=Uc(UC_ARCH_X86,UC_MODE_32);uc.mem_map(BASE,(PE.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);uc.mem_write(BASE,PE.get_memory_mapped_image());uc.mem_map(0x10000000,0x20000);uc.mem_map(0x20000000,0x10000)
    uc.mem_write(0x54b000,struct.pack('<I',0));return uc
@lru_cache(maxsize=4096)
def critical(pressure,phase):
    uc=machine();stack=0x1001f000
    uc.mem_write(stack,struct.pack('<III',0x20000080,0x20001000,0x20001010));uc.mem_write(0x20001000,struct.pack('<f',pressure));uc.mem_write(0x20001010,struct.pack('<h',phase));uc.reg_write(UC_X86_REG_ESP,stack)
    calls=[]
    def hook(machine,address,size,_):
        if address==0x49b430:
            esp=machine.reg_read(UC_X86_REG_ESP);args=struct.unpack('<5I',machine.mem_read(esp+4,20));x,y,count,query,result=args
            x=struct.unpack('<I',machine.mem_read(x,4))[0];y=struct.unpack('<I',machine.mem_read(y,4))[0]
            assert x==0x54b3ac and y in [0x54b3c8,0x54b3e4]
            assert struct.unpack('<h',machine.mem_read(count,2))[0]==16
            curve='auxiliary_curve_2' if y==0x54b3e4 else 'auxiliary_curve_1'
            value=emulate('INTP',{'x':TABLES['auxiliary_grid'],'y':TABLES[curve],'query':pressure})['output'];calls.append({'x':hex(x),'y':hex(y)})
            machine.mem_write(result,struct.pack('<f',value));machine.mem_write(0x20000000,b'\xc2\x14\x00');machine.reg_write(UC_X86_REG_EIP,0x20000000)
    # Store the actual wrapper return through a Single, then stop.
    uc.mem_write(0x20000080,b'\xd9\x1d'+struct.pack('<I',0x20000200))
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x49b3a0,0x20000086,count=1000)
    assert len(calls)==1 and uc.reg_read(UC_X86_REG_EIP)==0x20000086
    return struct.unpack('<f',uc.mem_read(0x20000200,4))[0]
def execute(inputs):
    uc=machine();frame=0x10010000;uc.reg_write(UC_X86_REG_EBP,frame);uc.reg_write(UC_X86_REG_ESP,0x1001f000)
    pointers=[0x20001000+i*16 for i in range(13)]
    for i,pointer in enumerate(pointers):uc.mem_write(frame+8+i*4,struct.pack('<I',pointer))
    for name,i in [('pressure',0),('porv_area',4),('level',7),('phase_flag',9),('liquid_flux',10),('vapor_flux',11),('safety_area',12)]:uc.mem_write(pointers[i],struct.pack('<h' if name=='phase_flag' else '<f',inputs[name]))
    for name,address in [('reset_level',0x54b400),('mixture_level',0x54b408),('liquid_enthalpy',0x54b728),('vapor_enthalpy',0x54b724),('g54b6ac',0x54b6ac)]:uc.mem_write(address,struct.pack('<f',inputs[name]))
    valve_sum=inputs['porv_a']+inputs['porv_b'];assert -32768<=valve_sum<=32767
    uc.mem_write(frame-0xe0,struct.pack('<i',valve_sum));uc.mem_write(frame-0x70,struct.pack('<h',2))
    # Integer conversion of the third UI Variant supplied by caller.
    uc.mem_write(0x20000040,b'\xb8'+struct.pack('<i',inputs['safety_valve'])+b'\xc2\x04\x00')
    from unicorn.x86_const import UC_X86_REG_ESI
    uc.reg_write(UC_X86_REG_ESI,0x20000040)
    def hook(machine,address,size,_):
        if address==0x51020f:machine.reg_write(UC_X86_REG_EIP,0x510246)
        elif address in [0x49ae10,0x49b3a0]:
            esp=machine.reg_read(UC_X86_REG_ESP);pointer=struct.unpack('<I',machine.mem_read(esp+4,4))[0];pressure=struct.unpack('<f',machine.mem_read(pointer,4))[0]
            value=emulate('HGAS',[pressure])['output'] if address==0x49ae10 else critical(pressure,2)
            cleanup=4 if address==0x49ae10 else 8
            machine.mem_write(0x20000200,struct.pack('<f',value));machine.mem_write(0x20000000,b'\xd9\x05'+struct.pack('<I',0x20000200)+b'\xc2'+struct.pack('<H',cleanup));machine.reg_write(UC_X86_REG_EIP,0x20000000)
    uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(0x510177,0x5103d3,count=2000);assert uc.reg_read(UC_X86_REG_EIP)==0x5103d3
    return {'flow':struct.unpack('<f',uc.mem_read(pointers[8],4))[0],'enthalpy':struct.unpack('<f',uc.mem_read(0x54b73c,4))[0],'phase_flag':struct.unpack('<h',uc.mem_read(pointers[9],2))[0]}
def main():
    rng=random.Random(20261021);cases=[]
    for i in range(300):
        inputs=dict(pressure=f32(rng.uniform(14.7,3000)),porv_area=f32(rng.uniform(.001,1)),safety_area=f32(rng.uniform(.001,1)),level=f32(rng.uniform(.2,1.1)),reset_level=f32(.5),mixture_level=f32(.98),phase_flag=rng.choice([0,1,2]),liquid_flux=f32(rng.uniform(100,12000)),vapor_flux=f32(rng.uniform(100,7000)),liquid_enthalpy=f32(rng.uniform(100,700)),vapor_enthalpy=f32(rng.uniform(800,1200)),g54b6ac=f32(rng.choice([99.999,100.,100.001])),porv_a=rng.choice([0,50,100]),porv_b=rng.choice([0,50,100]),safety_valve=rng.choice([0,50,100]))
        if i<36:inputs['level']=f32([.499999,.5,.500001,.979999,.98,.980001][i%6]);inputs['phase_flag']=[0,1,2][i//6%3]
        if i>=290:inputs['porv_a']=-50
        cases.append({'inputs':inputs,'expected':execute(inputs)})
    critical_cases=[{'pressure':f32(p),'phase':phase,'expected':critical(f32(p),phase)} for p in [-1,0,1,99.999,100,100.001,200,399.999,400,600,1000,2000,2800,2801]+[rng.uniform(0,3000) for _ in range(26)] for phase in [-1,0,1,2]]
    out=ROOT/'analysis/relief_fixtures.json';out.write_text(json.dumps({'method':__doc__,'original_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),'seed':20261021,'cases':cases,'critical_cases':critical_cases},indent=2)+'\n');print(f'{len(cases)} relief cases; {len(critical_cases)} critical table cases. {out}')
if __name__=='__main__':main()
