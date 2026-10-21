#!/usr/bin/env python3
"""Create portable release assets from already-built GUI/CLI binaries."""
import argparse
import hashlib
import json
import shutil
import subprocess
import tarfile
import tomllib
import zipfile
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--platform',choices=['linux','windows','all'],required=True)
    parser.add_argument('--output',type=Path,default=ROOT/'dist/release-assets')
    parser.add_argument('--windows-target',default='x86_64-pc-windows-gnu')
    args=parser.parse_args();out=args.output;out.mkdir(parents=True,exist_ok=True)
    version=tomllib.loads((ROOT/'rusttran/Cargo.toml').read_text())['package']['version']
    commit=subprocess.check_output(['git','rev-parse','HEAD'],cwd=ROOT,text=True).strip()
    info=json.dumps(dict(version=version,commit=commit,scope='Partial PCTran reconstruction; complete original scenario equivalence not validated'),indent=2)+'\n'
    if args.platform in ['linux','all']:
        package=ROOT/'dist/rusttran-linux-x86_64'
        for name in ['rusttran','rusttran-cli','install.sh','rusttran.svg','org.rusttran.RustTran.desktop']:
            if not (package/name).is_file():raise SystemExit(f'Missing Linux package file: {name}')
        (package/'BUILD_INFO.json').write_text(info)
        with tarfile.open(out/'rusttran-linux-x86_64.tar.gz','w:gz') as archive:archive.add(package,arcname=package.name)
        shutil.copy2(ROOT/f'dist/rusttran_{version}_amd64.deb',out/f'rusttran_{version}_amd64.deb')
    if args.platform in ['windows','all']:
        binaries=ROOT/'rusttran/target'/args.windows_target/'release'
        for source,name in [('rusttran.exe','RustTran.exe'),('rusttran-cli.exe','RustTran-cli.exe')]:shutil.copy2(binaries/source,out/name)
        with zipfile.ZipFile(out/'rusttran-windows-x86_64.zip','w',zipfile.ZIP_DEFLATED) as archive:
            for name in ['RustTran.exe','RustTran-cli.exe']:archive.write(out/name,name)
            archive.write(ROOT/'rusttran/README.md','README.md')
            for path in sorted((ROOT/'rusttran/examples').rglob('*')):
                if path.is_file():archive.write(path,'examples/'+path.relative_to(ROOT/'rusttran/examples').as_posix())
            archive.writestr('BUILD_INFO.json',info)
    shutil.copy2(ROOT/'install.sh',out/'install.sh')
    (out/'BUILD_INFO.json').write_text(info)
    checksums=[]
    for path in sorted(out.iterdir()):
        if path.is_file() and path.name!='SHA256SUMS':checksums.append(f'{hashlib.sha256(path.read_bytes()).hexdigest()}  {path.name}\n')
    (out/'SHA256SUMS').write_text(''.join(checksums))
    print(out)
if __name__=='__main__':main()
