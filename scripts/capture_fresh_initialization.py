#!/usr/bin/env python3
"""Capture the actual fresh initialization window on an isolated X11 display."""
import os, subprocess, time
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def main():
    output=ROOT/'analysis/fresh-state-gui.png'
    output.unlink(missing_ok=True)
    with (ROOT/'analysis/fresh-state-xvfb.log').open('w') as log:
        server=subprocess.Popen([str(ROOT/'.tools/xvfb/usr/bin/Xvfb'),':118','-screen','0','1440x1020x24','-nolisten','tcp','-ac'],stdout=log,stderr=subprocess.STDOUT)
    try:
        time.sleep(.3)
        env=os.environ.copy();env.pop('WAYLAND_DISPLAY',None);env.pop('RUSTTRAN_GUI_STATE_TO',None);env.update(DISPLAY=':118',XDG_SESSION_TYPE='x11',WINIT_UNIX_BACKEND='x11',LIBGL_ALWAYS_SOFTWARE='1',RUSTTRAN_SCREENSHOT_TO=str(output))
        with (ROOT/'analysis/fresh-state-gui.log').open('w') as log:
            subprocess.run([str(ROOT/'rusttran/target/debug/rusttran'),'--initialize-thermal','4','--size','1440','1020'],env=env,cwd='/tmp',stdout=log,stderr=subprocess.STDOUT,timeout=45,check=True)
        assert output.exists() and output.stat().st_size>1000
        print(output)
    finally:
        server.terminate();server.wait(timeout=10)
if __name__=='__main__':main()
