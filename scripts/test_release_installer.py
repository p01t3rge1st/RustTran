#!/usr/bin/env python3
"""Exercise download verification and actual per-user desktop installation offline."""
import hashlib
import os
import shutil
import subprocess
import tarfile
import tempfile
import unittest
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]

class InstallerTests(unittest.TestCase):
    def setUp(self):
        self.temporary=tempfile.TemporaryDirectory(prefix='rusttran-installer-test-')
        self.root=Path(self.temporary.name);self.addCleanup(self.temporary.cleanup)
        self.payload=self.root/'payload';self.payload.mkdir();self.bin=self.root/'fake-tools';self.bin.mkdir()
        self.downloads=self.root/'temporary';self.downloads.mkdir()
        self.env=os.environ.copy();self.env.update(PATH=str(self.bin)+os.pathsep+self.env['PATH'],MOCK_PAYLOAD=str(self.payload),TMPDIR=str(self.downloads),RUSTTRAN_INSTALL_BIN=str(self.root/'installed bin'),XDG_DATA_HOME=str(self.root/'desktop data'))
        self.write_tool('gh', '''#!/usr/bin/env python3
import os,sys,shutil
from pathlib import Path
a=sys.argv[1:];mode=os.environ.get('MOCK_MODE','ok')
if a[:2]==['auth','status']:sys.exit(1 if mode=='public' else 0)
if a[0]=='api':print('test-build');sys.exit(0)
if a[:2]==['release','download']:
 if mode=='download-failure':sys.exit(1)
 folder=Path(a[a.index('--dir')+1]);folder.mkdir(exist_ok=True)
 for name in ['rusttran-linux-x86_64.tar.gz','SHA256SUMS']:shutil.copyfile(Path(os.environ['MOCK_PAYLOAD'])/name,folder/name)
 sys.exit(0)
sys.exit(2)
''')
        self.write_tool('curl', '''#!/usr/bin/env python3
import os,sys,shutil
from pathlib import Path
a=sys.argv[1:];index=a.index('--output');name=a[index-1].rsplit('/',1)[1];shutil.copyfile(Path(os.environ['MOCK_PAYLOAD'])/name,a[index+1])
''')
        self.package()

    def write_tool(self,name,source):
        path=self.bin/name;path.write_text(source);path.chmod(0o755)

    def package(self,label='first',unsafe=False):
        folder=self.root/'rusttran-linux-x86_64';folder.mkdir(exist_ok=True)
        for name in ['rusttran','rusttran-cli']:
            p=folder/name;p.write_text(f'#!/bin/sh\n# {label}\nexit 0\n');p.chmod(0o755)
        for name,source in [('install.sh','scripts/install-linux.sh'),('rusttran.svg','rusttran/assets/rusttran.svg'),('org.rusttran.RustTran.desktop','packaging/linux/org.rusttran.RustTran.desktop')]:shutil.copy2(ROOT/source,folder/name)
        target=self.payload/'rusttran-linux-x86_64.tar.gz'
        with tarfile.open(target,'w:gz') as archive:
            archive.add(folder,arcname=folder.name)
            if unsafe:
                link=tarfile.TarInfo(folder.name+'/escape');link.type=tarfile.SYMTYPE;link.linkname=str(self.root/'outside');archive.addfile(link)
        (self.payload/'SHA256SUMS').write_text(hashlib.sha256(target.read_bytes()).hexdigest()+'  '+target.name+'\n')

    def run_installer(self,*arguments):
        result=subprocess.run(['bash',str(ROOT/'install.sh'),*arguments],env=self.env,cwd=self.root,capture_output=True,text=True)
        self.assertEqual(list(self.downloads.iterdir()),[],result.stderr)
        return result

    def test_private_install_update_and_desktop_icon(self):
        result=self.run_installer();self.assertEqual(result.returncode,0,result.stderr)
        executable=Path(self.env['RUSTTRAN_INSTALL_BIN'])/'rusttran';self.assertIn('first',executable.read_text())
        desktop=Path(self.env['XDG_DATA_HOME'])/'applications/org.rusttran.RustTran.desktop'
        self.assertIn('Exec="'+str(executable)+'"',desktop.read_text())
        self.assertTrue((Path(self.env['XDG_DATA_HOME'])/'icons/hicolor/scalable/apps/org.rusttran.RustTran.svg').is_file())
        self.package('second');result=self.run_installer('--version','test-build');self.assertEqual(result.returncode,0,result.stderr);self.assertIn('second',executable.read_text())

    def test_public_download_fallback(self):
        self.env['MOCK_MODE']='public';result=self.run_installer();self.assertEqual(result.returncode,0,result.stderr)

    def test_bad_checksum_preserves_existing_install(self):
        self.assertEqual(self.run_installer().returncode,0)
        executable=Path(self.env['RUSTTRAN_INSTALL_BIN'])/'rusttran';original=executable.read_bytes()
        with (self.payload/'rusttran-linux-x86_64.tar.gz').open('ab') as stream:stream.write(b'tampered')
        result=self.run_installer();self.assertNotEqual(result.returncode,0);self.assertIn('Checksum mismatch',result.stderr);self.assertEqual(executable.read_bytes(),original)

    def test_rejects_unsafe_archive_without_installing(self):
        self.package(unsafe=True);result=self.run_installer();self.assertNotEqual(result.returncode,0);self.assertIn('Invalid package entry',result.stderr);self.assertFalse(Path(self.env['RUSTTRAN_INSTALL_BIN']).exists())

    def test_does_not_replace_unowned_executable(self):
        folder=Path(self.env['RUSTTRAN_INSTALL_BIN']);folder.mkdir();p=folder/'rusttran';p.write_text('existing user file')
        result=self.run_installer();self.assertNotEqual(result.returncode,0);self.assertEqual(p.read_text(),'existing user file')

    def test_download_failure_installs_nothing(self):
        self.env['MOCK_MODE']='download-failure';result=self.run_installer();self.assertNotEqual(result.returncode,0);self.assertFalse(Path(self.env['RUSTTRAN_INSTALL_BIN']).exists())

    def test_rejects_unsupported_architecture(self):
        self.write_tool('uname', '#!/bin/sh\nif [ "$1" = -s ]; then echo Linux; else echo aarch64; fi\n')
        result=self.run_installer();self.assertNotEqual(result.returncode,0);self.assertIn('x86_64 only',result.stderr);self.assertFalse(Path(self.env['RUSTTRAN_INSTALL_BIN']).exists())

if __name__=='__main__':unittest.main(verbosity=2)
