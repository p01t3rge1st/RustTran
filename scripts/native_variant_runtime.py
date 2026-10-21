#!/usr/bin/env python3
"""Run original numeric VB6/OLEAUT32 exports supplied with the installer.
No Windows process, DLL attach initialization, COM or full VB exception runtime.
Unknown system imports are fail-closed. Inputs restricted to numeric Variants.
"""
import hashlib,json,struct
from pathlib import Path
import pefile
from unicorn import Uc,UC_ARCH_X86,UC_MODE_32,UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_ESP,UC_X86_REG_EIP
ROOT=Path(__file__).resolve().parents[1]
class NativeVariantRuntime:
    def __init__(self):
        self.images={name:pefile.PE(str(ROOT/'analysis/program'/file)) for name,file in [('msvbvm60.dll','msvbvm60.dll'),('oleaut32.dll','OLEAUT32.DLL')]}
        self.exports={}
        for name,pe in self.images.items():
            for export in pe.DIRECTORY_ENTRY_EXPORT.symbols:
                if export.forwarder:continue
                address=pe.OPTIONAL_HEADER.ImageBase+export.address
                self.exports[name,export.ordinal]=address
                if export.name:self.exports[name,export.name.decode()]=address
    def machine(self, capture_trace=True):
        machine=Uc(UC_ARCH_X86,UC_MODE_32)
        for pe in self.images.values():
            machine.mem_map(pe.OPTIONAL_HEADER.ImageBase,(pe.OPTIONAL_HEADER.SizeOfImage+4095)&~4095);machine.mem_write(pe.OPTIONAL_HEADER.ImageBase,pe.get_memory_mapped_image())
        machine.mem_map(0,4096);machine.mem_map(0x10000000,0x20000);machine.mem_map(0x20000000,0x20000)
        blocked={}
        for pe in self.images.values():
            for library in pe.DIRECTORY_ENTRY_IMPORT:
                name=library.dll.decode().lower()
                for entry in library.imports:
                    symbol=entry.name.decode() if entry.name else entry.ordinal
                    target=self.exports.get((name,symbol))
                    if target is None:
                        target=0x20010000+len(blocked)*16;blocked[target]=name+':'+str(symbol);machine.mem_write(target,b'\x0f\x0b')
                    machine.mem_write(entry.address,struct.pack('<I',target))
        # VB6 dynamically binds these OLEAUT32 arithmetic exports during startup.
        # Resolve the actual original DLL code, without replacing its arithmetic.
        for name in ['VarMul','VarAdd','VarDiv','VarSub','VarAbs','VarPow']:
            export='__vba'+name
            entry=self.exports.get(('msvbvm60.dll',export))
            target=self.exports.get(('oleaut32.dll',name))
            if entry is None or target is None:continue
            code=self.images['msvbvm60.dll'].get_data(entry-self.images['msvbvm60.dll'].OPTIONAL_HEADER.ImageBase,64)
            index=code.find(b'\xff\x15')
            if index<0:raise RuntimeError('No arithmetic API binding for '+name)
            pointer=struct.unpack_from('<I',code,index+2)[0]
            machine.mem_write(pointer,struct.pack('<I',target))
        trace=[]
        def hook(uc,address,size,_):
            if address in blocked:raise RuntimeError('Unsupported system import '+blocked[address])
            if capture_trace:trace.append(address)
        machine.hook_add(UC_HOOK_CODE,hook)
        return machine,trace
    @staticmethod
    def write_variant(machine,pointer,vt,value):
        payload=struct.pack('<f',value)+bytes(4) if vt==4 else struct.pack('<d',value) if vt==5 else struct.pack('<i',value)+bytes(4) if vt==3 else struct.pack('<h',value)+bytes(6)
        machine.mem_write(pointer,struct.pack('<H6x',vt)+payload)
    @staticmethod
    def read_variant(machine,pointer):
        raw=bytes(machine.mem_read(pointer,16));vt=struct.unpack_from('<H',raw)[0]
        if vt not in [2,3,4,5]:raise RuntimeError(f'Unsupported result Variant type {vt}')
        return vt,struct.unpack_from({2:'<h',3:'<i',4:'<f',5:'<d'}[vt],raw,8)[0]
    def arithmetic(self,function,left,right):
        machine,trace=self.machine();dest=0x20000100;lp=0x20000120;rp=0x20000140
        self.write_variant(machine,lp,*left);self.write_variant(machine,rp,*right)
        stack=0x1001f000;stop=0x2000f000
        machine.mem_write(stack,struct.pack('<IIII',stop,dest,rp,lp));machine.reg_write(UC_X86_REG_ESP,stack)
        machine.emu_start(self.exports['msvbvm60.dll',function],stop,count=200000)
        if machine.reg_read(UC_X86_REG_EIP)!=stop:raise RuntimeError('Native Variant export did not return')
        vt,value=self.read_variant(machine,dest)
        return {'function':function,'left':left,'right':right,'result_type':vt,'value':value,'executed_instruction_count':len(trace)}
def main():
    runtime=NativeVariantRuntime();cases=[]
    for function in ['__vbaVarMul','__vbaVarAdd','__vbaVarDiv']:
        for left in [(4,309.1),(5,309.1),(3,309),(2,309)]:
            cases.append(runtime.arithmetic(function,left,(4,1.8)))
    doc={'method':__doc__,'dll_sha256':{name:hashlib.sha256((ROOT/'analysis/program'/file).read_bytes()).hexdigest() for name,file in [('msvbvm60.dll','msvbvm60.dll'),('oleaut32.dll','OLEAUT32.DLL')]},'cases':cases}
    path=ROOT/'analysis/native_variant_runtime.json';path.write_text(json.dumps(doc,indent=2)+'\n');print(json.dumps(cases,indent=2))
if __name__=='__main__':main()
