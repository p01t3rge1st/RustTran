#!/usr/bin/env python3
"""Exercise actual RustTran X11 widgets on a private Xvfb display.
Requires local Xvfb and a gui-screenshot build (telemetry only in that feature).
"""
import ctypes as C,ctypes.util,json,os,struct,subprocess,tempfile,time,zlib
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def main():
 out=ROOT/'analysis/gui-interaction';out.mkdir(exist_ok=True)
 x=C.CDLL(ctypes.util.find_library('X11'));t=C.CDLL(ctypes.util.find_library('Xtst'))
 x.XSetInputFocus.argtypes=[C.c_void_p,C.c_ulong,C.c_int,C.c_ulong];x.XQueryTree.argtypes=[C.c_void_p,C.c_ulong,C.POINTER(C.c_ulong),C.POINTER(C.c_ulong),C.POINTER(C.POINTER(C.c_ulong)),C.POINTER(C.c_uint)];x.XFetchName.argtypes=[C.c_void_p,C.c_ulong,C.POINTER(C.c_char_p)];x.XFree.argtypes=[C.c_void_p]
 x.XOpenDisplay.argtypes=[C.c_char_p];x.XOpenDisplay.restype=C.c_void_p;x.XDefaultRootWindow.argtypes=[C.c_void_p];x.XDefaultRootWindow.restype=C.c_ulong;x.XFlush.argtypes=[C.c_void_p];x.XCloseDisplay.argtypes=[C.c_void_p];x.XStringToKeysym.argtypes=[C.c_char_p];x.XStringToKeysym.restype=C.c_ulong;x.XKeysymToKeycode.argtypes=[C.c_void_p,C.c_ulong];x.XKeysymToKeycode.restype=C.c_uint
 t.XTestFakeMotionEvent.argtypes=[C.c_void_p,C.c_int,C.c_int,C.c_int,C.c_ulong];t.XTestFakeButtonEvent.argtypes=[C.c_void_p,C.c_uint,C.c_int,C.c_ulong];t.XTestFakeKeyEvent.argtypes=[C.c_void_p,C.c_uint,C.c_int,C.c_ulong]
 class XImage(C.Structure):_fields_=[('width',C.c_int),('height',C.c_int),('xoffset',C.c_int),('format',C.c_int),('data',C.c_void_p),('byte_order',C.c_int),('bitmap_unit',C.c_int),('bitmap_bit_order',C.c_int),('bitmap_pad',C.c_int),('depth',C.c_int),('bytes_per_line',C.c_int),('bits_per_pixel',C.c_int),('red_mask',C.c_ulong),('green_mask',C.c_ulong),('blue_mask',C.c_ulong)]
 x.XGetImage.argtypes=[C.c_void_p,C.c_ulong,C.c_int,C.c_int,C.c_uint,C.c_uint,C.c_ulong,C.c_int];x.XGetImage.restype=C.POINTER(XImage);x.XDestroyImage.argtypes=[C.POINTER(XImage)]
 def screenshot(name):
  img=x.XGetImage(display,x.XDefaultRootWindow(display),0,0,1440,1020,C.c_ulong(-1).value,2);a=img.contents;assert a.bits_per_pixel==32 and a.byte_order==0 and a.red_mask==0xff0000
  raw=C.string_at(a.data,a.bytes_per_line*a.height);rows=[]
  for i in range(a.height):
   src=raw[i*a.bytes_per_line:i*a.bytes_per_line+a.width*4];rgb=bytearray(a.width*3);rgb[0::3]=src[2::4];rgb[1::3]=src[1::4];rgb[2::3]=src[0::4];rows.append(b'\0'+rgb)
  def chunk(tag,data):return struct.pack('>I',len(data))+tag+data+struct.pack('>I',zlib.crc32(tag+data)&0xffffffff)
  png=b'\x89PNG\r\n\x1a\n'+chunk(b'IHDR',struct.pack('>IIBBBBB',a.width,a.height,8,2,0,0,0))+chunk(b'IDAT',zlib.compress(b''.join(rows)))+chunk(b'IEND',b'');(out/name).write_bytes(png);x.XDestroyImage(img)
 def click(px,py):
  t.XTestFakeMotionEvent(display,-1,px,py,0);x.XFlush(display);time.sleep(.06);t.XTestFakeButtonEvent(display,1,1,0);x.XFlush(display);time.sleep(.04);t.XTestFakeButtonEvent(display,1,0,0);x.XFlush(display);time.sleep(.10)
 def key(name,down):t.XTestFakeKeyEvent(display,x.XKeysymToKeycode(display,x.XStringToKeysym(name.encode())),int(down),0);x.XFlush(display)
 def snapshot():return json.loads((out/'state.json').read_text())
 def wait(predicate,timeout=8):
  stop=time.monotonic()+timeout
  while time.monotonic()<stop:
   try:
    state=snapshot()
    if state.get('error'):raise RuntimeError(state['error'])
    if predicate(state):return state
   except (FileNotFoundError,json.JSONDecodeError):pass
   time.sleep(.02)
  screenshot('failure.png');raise AssertionError('GUI state predicate timed out: '+str(snapshot().get('updates')))
 display=None;app=None;server=None
 try:
  with (out/'xvfb.log').open('w') as log:server=subprocess.Popen([str(ROOT/'.tools/xvfb/usr/bin/Xvfb'),':117','-screen','0','1440x1020x24','-nolisten','tcp','-ac'],stdout=log,stderr=subprocess.STDOUT)
  for _ in range(100):
   display=x.XOpenDisplay(b':117')
   if display:break
   time.sleep(.03)
  assert display
  env=os.environ.copy();env.pop('WAYLAND_DISPLAY',None);env.pop('RUSTTRAN_SCREENSHOT_TO',None);env.update(DISPLAY=':117',XDG_SESSION_TYPE='x11',WINIT_UNIX_BACKEND='x11',WINIT_X11_SCALE_FACTOR='1',LIBGL_ALWAYS_SOFTWARE='1',RUSTTRAN_GUI_STATE_TO=str(out/'state.json'))
  with tempfile.TemporaryDirectory(prefix='gui-run-',dir=out) as folder:
   (out/'state.json').unlink(missing_ok=True)
   with (out/'app.log').open('w') as log:app=subprocess.Popen([str(ROOT/'rusttran/target/debug/rusttran'),'--session',str(ROOT/'rusttran/examples/gui-simulation-session.json'),'--session-steps','8','--size','1440','1020'],cwd=folder,env=env,stdout=log,stderr=subprocess.STDOUT)
   wait(lambda s:s['updates']==8 and not s['running'])
   root=C.c_ulong();parent=C.c_ulong();children=C.POINTER(C.c_ulong)();count=C.c_uint();x.XQueryTree(display,x.XDefaultRootWindow(display),C.byref(root),C.byref(parent),C.byref(children),C.byref(count))
   for i in range(count.value):
    name=C.c_char_p()
    if x.XFetchName(display,children[i],C.byref(name)) and name.value:
     if b'RustTran' in name.value:x.XSetInputFocus(display,children[i],1,0);x.XFlush(display)
     x.XFree(name)
   x.XFree(children);time.sleep(.1)
   click(230,39);wait(lambda s:s['updates']==9)
   click(155,39);wait(lambda s:s['running'] and s['updates']>9);time.sleep(.15);click(155,39);paused=wait(lambda s:not s['running']);time.sleep(.15);assert snapshot()['updates']==paused['updates'];screenshot('running-then-paused.png')
   click(290,39);reset=wait(lambda s:s['updates']==0 and s['history_samples']==0 and not s['running'])
   click(850,460);time.sleep(.1);screenshot('heater-panel.png')
   if not snapshot()['session']['controls']['heaters']['proportional_manual']:click(747,485)
   wait(lambda s:s['session']['controls']['heaters']['proportional_manual'])
   click(900,510);key('Control_L',True);key('a',True);key('a',False);key('Control_L',False)
   for char in '25':key(char,True);key(char,False)
   key('Return',True);key('Return',False)
   wait(lambda s:s['session']['controls']['heaters']['proportional_percent']==25)
   click(230,39);state=wait(lambda s:s['updates']==1);assert state['session']['controls']['heaters']['proportional_percent']==25;screenshot('manual-heater-computed.png')
   # Compare the clicked GUI step to the CLI from precisely the same loaded
   # state plus the two manual commands selected by the actual widgets.
   request=json.load(open(ROOT/'rusttran/examples/gui-simulation-session.json'));request['steps']=1;request['session']['controls']['heaters'].update(proportional_manual=True,proportional_percent=25)
   p=Path(folder)/'input.json';p.write_text(json.dumps(request));expected=json.loads(subprocess.check_output([str(ROOT/'rusttran/target/debug/rusttran-cli'),'recovered-session-run',str(p)]))['solution']['session']
   assert state['session']==expected,'GUI manual step differs from CLI'
   click(835,135);wait(lambda s:s['updates']==0 and s['history_samples']==0);screenshot('sample-loaded.png')
   click(230,39);wait(lambda s:s['updates']==1);click(131,10);click(235,38);wait(lambda s:s['live_schematic_open']);screenshot('live-mimic.png')
   result=dict(live_mimic_opening=True,step_button=True,start_advances_numerical_state=True,pause_freezes_state=True,reset_restores_loaded_state=True,manual_heater_control=True,gui_state_matches_cli=True,embedded_sample_loading=True,paused_after_updates=paused['updates']);(out/'results.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
 finally:
  if app is not None:app.terminate();app.wait(timeout=10)
  if display:x.XCloseDisplay(display)
  if server is not None:server.terminate();server.wait(timeout=10)
if __name__=='__main__':main()
