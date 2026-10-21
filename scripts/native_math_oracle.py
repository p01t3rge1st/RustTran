#!/usr/bin/env python3
"""Execute original x86 numerical prefixes; model numeric VB Variant helpers.

Requires task-local venv packages unicorn and pefile. This is not Windows/VB
runtime execution: helpers model numeric VT_R4/VT_R8 and scalar R4 inputs.
Stops before Err.Number/cleanup, after numerical instructions completed.
"""
import hashlib
import json
import math
from pathlib import Path
import struct
import pefile
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import *

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / 'analysis/program/PCTran.exe'
PE = pefile.PE(str(EXE))
BASE = PE.OPTIONAL_HEADER.ImageBase
_NATIVE_RUNTIME = None


def f32(x):
    return struct.unpack('<f', struct.pack('<f', x))[0]


def emulate(kind, values, single_byref=False, native_runtime=False):
    scalar = kind in ('HFLD','HGAS','VFLD')
    intp = kind == 'INTP'
    hliq = kind == 'HLIQ'
    runtime=None
    if native_runtime:
        from native_variant_runtime import NativeVariantRuntime
        global _NATIVE_RUNTIME
        if _NATIVE_RUNTIME is None:_NATIVE_RUNTIME=NativeVariantRuntime()
        runtime=_NATIVE_RUNTIME
        uc,_=runtime.machine(capture_trace=False)
    else:
        uc = Uc(UC_ARCH_X86, UC_MODE_32)
    uc.mem_map(BASE, (PE.OPTIONAL_HEADER.SizeOfImage + 4095) & ~4095)
    uc.mem_write(BASE, PE.get_memory_mapped_image())
    if not native_runtime:
        uc.mem_map(0, 4096)  # FS:[0] exception chain storage
        uc.mem_map(0x10000000, 0x20000)
        uc.mem_map(0x20000000, 0x10000)
    addresses = [0x20001000 + i * 32 for i in range(5 if intp else 3 if hliq else len(values))]
    def writevar(addr, value):
        vt = struct.unpack('<H',uc.mem_read(addr,2))[0]
        if single_byref and vt == 0x4004:
            pointer=struct.unpack('<I',uc.mem_read(addr+8,4))[0]
            uc.mem_write(pointer,struct.pack('<f',value))
        else:
            uc.mem_write(addr, struct.pack('<H6xd', 5, value))
    def readvar(addr):
        data = bytes(uc.mem_read(addr, 16))
        raw_vt=struct.unpack_from('<H',data)[0]
        if raw_vt==0x4004:
            return struct.unpack('<f',uc.mem_read(struct.unpack_from('<I',data,8)[0],4))[0]
        vt = raw_vt & 0xfff
        if vt == 2:
            return struct.unpack_from('<h', data, 8)[0]
        if vt == 4:
            return struct.unpack_from('<f', data, 8)[0]
        if vt == 5:
            return struct.unpack_from('<d', data, 8)[0]
        raise RuntimeError(f'Unsupported Variant type {vt} at {addr:#x}')
    for a, v in ([] if intp or hliq else zip(addresses, values)):
        if scalar:
            uc.mem_write(a, struct.pack('<f',v))
        else:
            if single_byref:
                pointer=0x20006000+addresses.index(a)*8
                uc.mem_write(a,struct.pack('<H6xI4x',0x4004,pointer))
            writevar(a, v)
    if hliq:
        writevar(addresses[0],0)
        for addr,value in zip(addresses[1:],values):
            uc.mem_write(addr,struct.pack('<f',value))
    if intp:
        for index, arr in enumerate((values['x'],values['y'])):
            descriptor, data = 0x20004000+index*128,0x20005000+index*4096
            uc.mem_write(addresses[index],struct.pack('<I',descriptor))
            uc.mem_write(descriptor,struct.pack('<HHIIIIi',1,0,4,0,data,len(arr),1))
            uc.mem_write(data,struct.pack('<'+'f'*len(arr),*arr))
        uc.mem_write(addresses[2],struct.pack('<h',len(values['x'])))
        uc.mem_write(addresses[3],struct.pack('<f',values['query']))
        uc.mem_write(addresses[4],struct.pack('<f',0))
    stack = 0x1001f000
    uc.mem_write(stack, struct.pack('<' + 'I' * (len(addresses)+1), 0x2000f000, *addresses))
    uc.reg_write(UC_X86_REG_ESP, stack)
    helpers = {}; native_helpers={}
    native_names=['__vbaVarAdd','__vbaVarSub','__vbaVarMul','__vbaVarDiv','__vbaVarPow','__vbaVarAbs','__vbaR4Var','__vbaVarVargNofree']
    for lib in PE.DIRECTORY_ENTRY_IMPORT:
        for entry in lib.imports:
            if entry.name or entry.ordinal == 587:
                name = entry.name.decode() if entry.name else 'Ordinal587_Log'
                if name.startswith('__vba') or entry.ordinal == 587 or entry.address == 0x4011f4:
                    if runtime and name in native_names:
                        native_entry=runtime.exports['msvbvm60.dll',name]
                        uc.mem_write(entry.address, struct.pack('<I',native_entry))
                        native_helpers[native_entry]=name
                        continue
                    stub = 0x20002000 + len(helpers)*32
                    helpers[stub] = name
                    uc.mem_write(entry.address, struct.pack('<I', stub))
                    uc.mem_write(stub, b'\xc3')
    trace, calls, nested, native_calls = [], [], [], []
    start, stop = {'DECAY':(0x49a4f0,0x49a69a),'EULER':(0x49a830,0x49a9dd),
                   'HFLD':(0x49ab70,0x49acab),'HGAS':(0x49ae10,0x49afda),
                   'VFLD':(0x49bf00,0x49c020),'INTP':(0x49b430,0x49bc50),
                   'HLIQ':(0x49b140,0x49b20a),'DELP':(0x49a3f0,0x49a4d1)}[kind]
    def hook(machine, address, size, _):
        if address in native_helpers:native_calls.append(native_helpers[address])
        if address == stop:
            machine.emu_stop()
            return
        if hliq and address in (0x49bde0,0x49ab70):
            esp = machine.reg_read(UC_X86_REG_ESP)
            pointer = struct.unpack('<I',machine.mem_read(esp+4,4))[0]
            value = struct.unpack('<f',machine.mem_read(pointer,4))[0]
            if address == 0x49bde0:
                tables = {a['name']:a['values'] for a in json.loads((ROOT/'analysis/property_tables.json').read_text())['arrays']}
                child = emulate('INTP',{'x':tables['saturation_temperature'],'y':tables['saturation_pressure_44'],'query':value})
            else:
                child = emulate('HFLD',[value])
            nested.append(child)
            machine.mem_write(0x20000120,struct.pack('<f',child['output']))
            machine.mem_write(0x20000c00,b'\xd9\x05'+struct.pack('<I',0x20000120)+b'\xc2\x04\x00')
            machine.reg_write(UC_X86_REG_EIP,0x20000c00)
            return
        if address not in helpers:
            if BASE <= address < BASE + PE.OPTIONAL_HEADER.SizeOfImage:
                trace.append(address)
            return
        name = helpers[address]
        calls.append(name)
        esp = machine.reg_read(UC_X86_REG_ESP)
        def arg(n):
            return struct.unpack('<I', machine.mem_read(esp+4+n*4, 4))[0]
        def finish(n, eax=0):
            machine.reg_write(UC_X86_REG_EAX, eax)
            machine.reg_write(UC_X86_REG_EIP, arg(-1))
            machine.reg_write(UC_X86_REG_ESP, esp+4+n*4)
        if name == '__vbaVarVargNofree':
            finish(0, machine.reg_read(UC_X86_REG_EDX))
        elif name in ('__vbaOnError', '__vbaFreeVar'):
            finish(1 if name == '__vbaOnError' else 0)
        elif name in ('__vbaVarTstLt','__vbaVarTstGt'):
            left,right=readvar(arg(1)),readvar(arg(0))
            match=left<right if name=='__vbaVarTstLt' else left>right
            finish(2,0xffff if match else 0)
        elif name in ('__vbaVarAdd','__vbaVarSub','__vbaVarMul','__vbaVarDiv','__vbaVarPow'):
            dest, right, left = arg(0), readvar(arg(1)), readvar(arg(2))
            operations = {'__vbaVarAdd':lambda:left+right,'__vbaVarSub':lambda:left-right,
                          '__vbaVarMul':lambda:left*right,'__vbaVarDiv':lambda:left/right,
                          '__vbaVarPow':lambda:math.pow(left,right)}
            writevar(dest, operations[name]())
            finish(3, dest)
        elif name == '__vbaVarAbs':
            writevar(arg(0), abs(readvar(arg(1))))
            finish(2, arg(0))
        elif name in ('__vbaVargVarMove','__vbaVargVarCopy','__vbaVarMove'):
            dest, source = machine.reg_read(UC_X86_REG_ECX), machine.reg_read(UC_X86_REG_EDX)
            if single_byref and struct.unpack('<H',machine.mem_read(dest,2))[0]==0x4004:
                writevar(dest,readvar(source))
            else:
                machine.mem_write(dest, bytes(machine.mem_read(source,16)))
            finish(0, dest)
        elif name == '__vbaR4Var':
            machine.mem_write(0x20000100, struct.pack('<f', readvar(arg(0))))
            # Execute actual FLD and stdcall return to populate Unicorn x87 ST0.
            machine.mem_write(0x20000800, b'\xd9\x05' + struct.pack('<I',0x20000100) + b'\xc2\x04\x00')
            machine.reg_write(UC_X86_REG_EIP, 0x20000800)
        elif name == '__vbaFpR4':
            # Native store/reload implements the helper's float32 rounding.
            machine.mem_write(0x20000900,b'\xd9\x1d'+struct.pack('<I',0x20000108)+
                              b'\xd9\x05'+struct.pack('<I',0x20000108)+b'\xc3')
            machine.reg_write(UC_X86_REG_EIP,0x20000900)
        elif name == '__vbaFpI2':
            machine.mem_write(0x20000b00,b'\xdf\x1d'+struct.pack('<I',0x20000118)+
                              b'\x0f\xbf\x05'+struct.pack('<I',0x20000118)+b'\xc3')
            machine.reg_write(UC_X86_REG_EIP,0x20000b00)
        elif name == 'Ordinal587_Log' or name == '__vbaPowerR8':
            left = struct.unpack('<d',machine.mem_read(esp+4,8))[0]
            value = math.log(left) if name == 'Ordinal587_Log' else math.pow(left,struct.unpack('<d',machine.mem_read(esp+12,8))[0])
            machine.mem_write(0x20000110,struct.pack('<d',value))
            machine.mem_write(0x20000a00,b'\xdd\x05'+struct.pack('<I',0x20000110)+
                              b'\xc2'+struct.pack('<H',8 if name=='Ordinal587_Log' else 16))
            machine.reg_write(UC_X86_REG_EIP,0x20000a00)
        else:
            raise RuntimeError('Unmodeled helper: '+name)
    uc.hook_add(UC_HOOK_CODE, hook)
    uc.emu_start(start, stop+1, count=10000)
    if uc.reg_read(UC_X86_REG_EIP) != stop:
        raise RuntimeError('Did not reach numerical prefix stop')
    ebp = uc.reg_read(UC_X86_REG_EBP)
    result = struct.unpack('<f',uc.mem_read(ebp-0x14,4))[0] if kind=='DELP' else readvar(ebp-0x30) if hliq else struct.unpack('<f',uc.mem_read(addresses[4],4))[0] if intp else readvar(addresses[3]) if kind == 'EULER' else struct.unpack('<f', uc.mem_read(ebp-0x20,4))[0]
    post = {'pressure':values[0],'temperature':values[1],'output_variant_type':struct.unpack('<H',uc.mem_read(ebp-0x30,2))[0]} if hliq else {'query':struct.unpack('<f',uc.mem_read(addresses[3],4))[0],'output':result} if intp else [struct.unpack('<f',uc.mem_read(a,4))[0] for a in addresses] if scalar else [readvar(a) for a in addresses]
    return {'function':kind,'input_encoding':'output Variant,pressure R4,temperature R4 byrefs' if hliq else 'injected one-based R4 SafeArrays and scalar byrefs' if intp else 'scalar R4 by reference' if scalar else 'numeric VT_BYREF|VT_R4 Variant' if single_byref else 'numeric R8 Variant by reference',
            'inputs':values,'output':result,'post_arguments':post,
            'stop_va':hex(stop),'executed_original_instruction_vas':[hex(a) for a in trace],
            'modeled_helper_calls':calls, 'native_runtime_calls':native_calls, **({'independently_executed_callees':nested} if hliq else {})}


def main():
    cases = [emulate('DECAY',[t]) for t in (0,1,9.999999,10,10.000001,149.999,150,150.001,3999999,4000000,4000001)]
    cases += [emulate('EULER',v) for v in ([1,1,2,3],[2,1,2,3],[10,1,2,3],[0.0001,0,1,0],
                                         [1,2,2,3],[1,3.002,2,3],[1,3.003,2,3],[1,10,2,3],[-0.5,1,2,3])]
    for kind, thresholds in [('HFLD',[0x401ad8]),('HGAS',[0x401bb0,0x401b68]),('VFLD',[0x401bb0])]:
        values = [0.1,1,10,70,158.2,220]
        for addr in thresholds:
            raw = PE.get_data(addr-BASE,4)
            bits = struct.unpack('<I',raw)[0]
            values.extend(struct.unpack('<f',struct.pack('<I',bits+d))[0] for d in (-1,0,1))
        cases.extend(emulate(kind,[v]) for v in values)
    for x,y in [([1,2,3,4],[10,20,30,40]),([4,3,2,1],[40,30,20,10]),([1,2,3,4],[-10,-5,5,10]),
                ([1,2,3,4,5],[2,4,6,8,10])]:
        cases.extend(emulate('INTP',{'x':x,'y':y,'query':q}) for q in (0,1,1.5,2,2.5,3,4,5,6))
    tbits = struct.unpack('<I',struct.pack('<f',220))[0]
    temps = [struct.unpack('<f',struct.pack('<I',tbits+d))[0] for d in (-1,0,1)]+[300,500,680]
    cases.extend(emulate('HLIQ',[pressure,temp]) for pressure in (500,2200) for temp in temps)
    checked = 0
    for case in cases:
        kind, values = case['function'], case['inputs']
        if kind == 'DECAY':
            t = values[0]
            bits = [(0x3d76fd22,0x3d82de01),(0x3d9ce076,0x3e395810),
                    (0x3e051eb8,0x3e90e560),(0x3e883127,0x3eab851f)][0 if t<10 else 1 if t<150 else 2 if t<4000000 else 3]
            a,b = [struct.unpack('<f',struct.pack('<I',v))[0] for v in bits]
            reference = f32(a*(t+0.1)**(-b))
        elif kind == 'EULER':
            current,old,dt,value = values
            ratio = f32(abs((current-old)/(current+0.001)))
            reference = value+current*dt*(f32(1/ratio) if ratio>2 else 1)
        elif kind == 'INTP':
            pairs = sorted(zip(values['x'],values['y']))
            query = values['query']
            reference = pairs[0][1] if query<=pairs[0][0] else pairs[-1][1]
            for (a,b),(d,e) in zip(pairs,pairs[1:]):
                if a<=query<=d:
                    reference = b+(e-b)*(query-a)/(d-a)
                    break
            reference = max(0,reference)
        elif kind == 'HLIQ':
            pressure,temperature = values
            saturation = case['independently_executed_callees'][0]['output']
            factor = struct.unpack('<d',PE.get_data(0x401be0-BASE,8))[0]
            reference = f32(temperature-32) if temperature<=220 else case['independently_executed_callees'][1]['output']-(f32(pressure)-saturation)*factor
        else:
            continue
        if abs(case['output']-reference)>1e-12:
            raise AssertionError((case,reference))
        checked += 1
    document = {'method':'Unicorn x86 original numerical-prefix execution with modeled VB6 numeric Variant helpers',
                'limitations':['Not actual Windows or MSVBVM60 execution','Err.Number and cleanup paths are not executed; stop follows numerical prefix',
                               'Numeric helper precision, Log ordinal587 and PowerR8 use Python binary64; original runtime precision, subtype coercions and error cases are outside this oracle',
                               'HFLD, HGAS, VFLD output values are raw function values; no unit conversion is applied',
                               'HLIQ callees INTP(recovered tables) and HFLD execute in separate Unicorn instances; original callee return/cleanup is modeled with FLD/RET'],
                'binary_sha256':hashlib.sha256(EXE.read_bytes()).hexdigest(),
                'independent_reference_validation':{'cases_checked':checked,'functions':['DECAY','EULER','INTP','HLIQ'],'absolute_tolerance':1e-12,
                                                     'HLIQ_reference_uses_independently_executed_callee_outputs':True},
                'cases':cases}
    out = ROOT/'analysis/native_math_fixtures.json'
    out.write_text(json.dumps(document,indent=2)+'\n')
    print(json.dumps([{k:v for k,v in c.items() if k in ('function','inputs','output','post_arguments')} for c in cases],indent=2))


if __name__ == '__main__':
    main()
