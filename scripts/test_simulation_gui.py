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
 def click_widget(name):
  state=wait(lambda s:name in s.get('widget_rects',{}))
  x0,y0,x1,y1=state['widget_rects'][name];click(round((x0+x1)/2),round((y0+y1)/2))
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
 class XWindowAttributes(C.Structure):
  _fields_=[('x',C.c_int),('y',C.c_int),('width',C.c_int),('height',C.c_int),('border_width',C.c_int),('depth',C.c_int),('visual',C.c_void_p),('root',C.c_ulong),('window_class',C.c_int),('bit_gravity',C.c_int),('win_gravity',C.c_int),('backing_store',C.c_int),('backing_planes',C.c_ulong),('backing_pixel',C.c_ulong),('save_under',C.c_int),('colormap',C.c_ulong),('map_installed',C.c_int),('map_state',C.c_int),('all_event_masks',C.c_long),('your_event_mask',C.c_long),('do_not_propagate_mask',C.c_long),('override_redirect',C.c_int),('screen',C.c_void_p)]
 x.XGetWindowAttributes.argtypes=[C.c_void_p,C.c_ulong,C.POINTER(XWindowAttributes)]
 def focus_app():
  # Telemetry can be written before the window is mapped. XSetInputFocus on
  # an unmapped window is a fatal X BadMatch in a display without a WM.
  for _ in range(100):
   focused=False
   root=C.c_ulong();parent=C.c_ulong();children=C.POINTER(C.c_ulong)();count=C.c_uint()
   x.XQueryTree(display,x.XDefaultRootWindow(display),C.byref(root),C.byref(parent),C.byref(children),C.byref(count))
   for i in range(count.value):
    name=C.c_char_p();attributes=XWindowAttributes()
    if x.XFetchName(display,children[i],C.byref(name)) and name.value:
     if b'RustTran' in name.value and x.XGetWindowAttributes(display,children[i],C.byref(attributes)) and attributes.map_state==2 and attributes.width>=1024:
      x.XSetInputFocus(display,children[i],1,0);x.XFlush(display);focused=True
     x.XFree(name)
   x.XFree(children)
   if focused:time.sleep(.1);return
   time.sleep(.03)
  raise AssertionError('RustTran window did not become viewable')
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
   focus_app()
   click_widget("engine_step");wait(lambda s:s['updates']==9)
   click_widget("engine_start_pause");wait(lambda s:s['running'] and s['updates']>9);time.sleep(.15);click_widget("engine_start_pause");paused=wait(lambda s:not s['running']);time.sleep(.15);assert snapshot()['updates']==paused['updates'];screenshot('running-then-paused.png')
   click_widget("engine_reset");reset=wait(lambda s:s['updates']==0 and s['history_samples']==0 and not s['running'])
   click_widget("heaters_header");time.sleep(.1);screenshot('heater-panel.png')
   if not snapshot()['session']['controls']['heaters']['proportional_manual']:click_widget("heater_manual")
   wait(lambda s:s['session']['controls']['heaters']['proportional_manual'])
   click_widget("percent_Proportional heater");key('Control_L',True);key('a',True);key('a',False);key('Control_L',False)
   for char in '25':key(char,True);key(char,False)
   key('Return',True);key('Return',False)
   wait(lambda s:s['session']['controls']['heaters']['proportional_percent']==25)
   click_widget("engine_step");state=wait(lambda s:s['updates']==1);assert state['session']['controls']['heaters']['proportional_percent']==25;screenshot('manual-heater-computed.png')
   # Compare the clicked GUI step to the CLI from precisely the same loaded
   # state plus the two manual commands selected by the actual widgets.
   request=json.load(open(ROOT/'rusttran/examples/gui-simulation-session.json'));request['steps']=1;request['session']['controls']['heaters'].update(proportional_manual=True,proportional_percent=25)
   p=Path(folder)/'input.json';p.write_text(json.dumps(request));expected=json.loads(subprocess.check_output([str(ROOT/'rusttran/target/debug/rusttran-cli'),'recovered-session-run',str(p)]))['solution']['session']
   assert state['session']==expected,'GUI manual step differs from CLI'
   click_widget("engine_load_sample");wait(lambda s:s['updates']==0 and s['history_samples']==0);screenshot('sample-loaded.png')
   click_widget("engine_step");wait(lambda s:s['updates']==1);click_widget("view_menu");click_widget("live_mimic_item");wait(lambda s:s['live_schematic_open']);screenshot('live-mimic.png')
   app.terminate();app.wait(timeout=10);(out/'state.json').unlink(missing_ok=True)
   with (out/'classic-app.log').open('w') as log:
    app=subprocess.Popen([str(ROOT/'rusttran/target/debug/rusttran'),'--session',str(ROOT/'rusttran/examples/gui-containment-fans-session.json'),'--view','live','--size','1024','716'],cwd=folder,env=env,stdout=log,stderr=subprocess.STDOUT)
   wait(lambda s:s['view']=='live' and s['updates']==0);focus_app()
   click_widget('mimic_HeaterProportional');wait(lambda s:s['selected_component']=='HeaterProportional')
   if not snapshot()['session']['controls']['heaters']['proportional_manual']:click_widget('mimic_heater_manual')
   click_widget('percent_Heater command');key('Control_L',True);key('a',True);key('a',False);key('Control_L',False)
   for char in '25':key(char,True);key(char,False)
   key('Return',True);key('Return',False)
   before=wait(lambda s:s['session']['controls']['heaters']['proportional_percent']==25)
   p.write_text(json.dumps(dict(session=before['session'],steps=1)))
   expected=json.loads(subprocess.check_output([str(ROOT/'rusttran/target/debug/rusttran-cli'),'recovered-session-run',str(p)]))['solution']['session']
   click_widget('classic_tool_11');state=wait(lambda s:s['updates']==1)
   assert state['session']==expected,'Classic mimic heater step differs from CLI'
   click_widget('component_close');wait(lambda s:s['selected_component'] is None)
   click_widget('mimic_RCP-1');wait(lambda s:s['selected_component']=='RCP-1')
   click_widget('percent_Pump command');key('Control_L',True);key('a',True);key('a',False);key('Control_L',False)
   for char in '50':key(char,True);key(char,False)
   key('Return',True);key('Return',False)
   before=wait(lambda s:s['session']['controls']['rcp']['pump_percent'][0]==50)
   p.write_text(json.dumps(dict(session=before['session'],steps=1)))
   expected=json.loads(subprocess.check_output([str(ROOT/'rusttran/target/debug/rusttran-cli'),'recovered-session-run',str(p)]))['solution']['session']
   click_widget('classic_tool_11');state=wait(lambda s:s['updates']==2)
   assert state['session']==expected,'Classic mimic RCP step differs from CLI'
   click_widget('component_close');wait(lambda s:s['selected_component'] is None)
   click_widget('mimic_Fan Cooler 1');wait(lambda s:s['selected_component']=='Fan Cooler 1')
   if not snapshot()['session']['controls']['containment_fans']['fan_manual'][0]:click_widget('mimic_fan_manual')
   click_widget('percent_Fan command');key('Control_L',True);key('a',True);key('a',False);key('Control_L',False)
   for char in '75':key(char,True);key(char,False)
   key('Return',True);key('Return',False)
   before=wait(lambda s:s['session']['controls']['containment_fans']['fan_percent'][0]==75)
   p.write_text(json.dumps(dict(session=before['session'],steps=1)))
   expected=json.loads(subprocess.check_output([str(ROOT/'rusttran/target/debug/rusttran-cli'),'recovered-session-run',str(p)]))['solution']['session']
   previous=before['updates'];click_widget('classic_tool_11');state=wait(lambda s:s['updates']==previous+1)
   assert state['session']==expected,'Classic fan step differs from CLI'
   assert state['session']['globals']['singles']['0x54b750']>0,'Fan command must remove heat'
   click_widget('component_close');wait(lambda s:s['selected_component'] is None)
   screenshot('classic-live.png')
   click_widget('mimic_FAN_COOLING_HEAT');wait(lambda s:s['selected_component']=='FAN_COOLING_HEAT')
   click_widget('percent_Fan heat exchanger');key('Control_L',True);key('a',True);key('a',False);key('Control_L',False)
   key('0',True);key('0',False);key('Return',True);key('Return',False)
   before=wait(lambda s:s['session']['controls']['containment_fans']['exchanger_percent']==0)
   p.write_text(json.dumps(dict(session=before['session'],steps=1)))
   expected=json.loads(subprocess.check_output([str(ROOT/'rusttran/target/debug/rusttran-cli'),'recovered-session-run',str(p)]))['solution']['session']
   previous=before['updates'];click_widget('classic_tool_11');state=wait(lambda s:s['updates']==previous+1)
   assert state['session']==expected,'Fan exchanger step differs from CLI'
   assert state['session']['globals']['singles']['0x54b750']==0,'Zero exchanger command must stop heat removal'
   click_widget('component_close');wait(lambda s:s['selected_component'] is None)

   click_widget('classic_tool_3');wait(lambda s:s['running'] and s['updates']>2)
   click_widget('classic_tool_4');wait(lambda s:not s['running'])
   click_widget('classic_tool_2');wait(lambda s:s['updates']==0 and not s['running'])
   click_widget('classic_tool_1');wait(lambda s:s['view']=='schematic')
   click_widget('ic_8');wait(lambda s:s['selected_ic']=='8')
   click_widget('mimic_RCP-1');wait(lambda s:s['selected_component']=='RCP-1')
   screenshot('classic-ic-equipment.png')
   result=dict(classic_fan_exchanger_matches_cli=True,classic_fan_exchanger_stops_heat=True,classic_fan_matches_cli=True,classic_fan_produces_heat=True,classic_heater_matches_cli=True,classic_rcp_matches_cli=True,classic_start_pause_reset=True,classic_ic_selector=True,classic_equipment_inspection=True,live_mimic_opening=True,step_button=True,start_advances_numerical_state=True,pause_freezes_state=True,reset_restores_loaded_state=True,manual_heater_control=True,gui_state_matches_cli=True,embedded_sample_loading=True,paused_after_updates=paused['updates']);(out/'results.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
 finally:
  if app is not None:app.terminate();app.wait(timeout=10)
  if display:x.XCloseDisplay(display)
  if server is not None:server.terminate();server.wait(timeout=10)
if __name__=='__main__':main()
