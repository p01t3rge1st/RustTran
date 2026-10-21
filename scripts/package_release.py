#!/usr/bin/env python3
"""Package the already-built RustTran Linux binaries and desktop integration."""
import argparse, shutil, subprocess, tomllib
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser(); p.add_argument('--target',default=''); args=p.parse_args()
source=ROOT/'rusttran/target'/args.target/'release'
dest=ROOT/'dist/rusttran-linux-x86_64'; dest.mkdir(parents=True,exist_ok=True)
for name in ['rusttran','rusttran-cli']: shutil.copy2(source/name,dest/name)
for source,name in [(ROOT/'scripts/install-linux.sh','install.sh'),(ROOT/'rusttran/assets/rusttran.svg','rusttran.svg'),(ROOT/'packaging/linux/org.rusttran.RustTran.desktop','org.rusttran.RustTran.desktop')]: shutil.copy2(source,dest/name)
shutil.copy2(ROOT/'rusttran/README.md',dest/'README.md')
shutil.copytree(ROOT/'rusttran/examples',dest/'examples',dirs_exist_ok=True)
version=tomllib.loads((ROOT/'rusttran/Cargo.toml').read_text())['package']['version']
deb=ROOT/'dist/deb-root'; (deb/'DEBIAN').mkdir(parents=True,exist_ok=True)
(deb/'DEBIAN/control').write_text(f'Package: rusttran\nVersion: {version}\nArchitecture: amd64\nMaintainer: RustTran contributors\nDepends: libc6 (>= 2.28), libgcc-s1\nSection: science\nPriority: optional\nDescription: RustTran PWR initial-condition viewer and property tools\n')
for name in ['rusttran','rusttran-cli']:
    folder=deb/'usr/bin';folder.mkdir(parents=True,exist_ok=True);shutil.copy2(dest/name,folder/name)
for name,relative in [('org.rusttran.RustTran.desktop','usr/share/applications/org.rusttran.RustTran.desktop'),('rusttran.svg','usr/share/icons/hicolor/scalable/apps/org.rusttran.RustTran.svg')]:
    path=deb/relative;path.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(dest/name,path)
subprocess.run(['dpkg-deb','--build','--root-owner-group',str(deb),str(ROOT/f'dist/rusttran_{version}_amd64.deb')],check=True)
print(dest)
