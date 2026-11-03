#!/usr/bin/env python3
"""Capture the classic NSSS at native and enlarged sizes using software OpenGL/Xvfb."""
import os,subprocess,time
from pathlib import Path
r=Path(__file__).resolve().parents[1];out=r/'analysis/classic-ui';out.mkdir(exist_ok=True)
s=subprocess.Popen([str(r/'.tools/xvfb/usr/bin/Xvfb'),':119','-screen','0','1440x1020x24','-nolisten','tcp','-ac'],stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
try:
 time.sleep(.5)
 env=os.environ.copy();env.pop('WAYLAND_DISPLAY',None);env.pop('RUSTTRAN_GUI_STATE_TO',None);env.update(DISPLAY=':119',XDG_SESSION_TYPE='x11',WINIT_UNIX_BACKEND='x11',WINIT_X11_SCALE_FACTOR='1',LIBGL_ALWAYS_SOFTWARE='1',RUSTTRAN_SCREENSHOT_TO=str(out/'nsss-1024.png'))
 for width,height in [(1024,716),(1440,1020)]:
  env['RUSTTRAN_SCREENSHOT_TO']=str(out/f'nsss-{width}.png')
  subprocess.run([str(r/'rusttran/target/debug/rusttran'),'--size',str(width),str(height)],cwd='/tmp',env=env,check=True,timeout=40,stdout=subprocess.DEVNULL)
 print(out)
finally:s.terminate();s.wait()
