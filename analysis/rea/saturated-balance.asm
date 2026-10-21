
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

00501e60 <.text+0x100e60>:
  501e60:	55                   	push   ebp
  501e61:	8b ec                	mov    ebp,esp
  501e63:	83 ec 14             	sub    esp,0x14
  501e66:	68 16 47 40 00       	push   0x404716
  501e6b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  501e71:	50                   	push   eax
  501e72:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  501e79:	81 ec 94 00 00 00    	sub    esp,0x94
  501e7f:	53                   	push   ebx
  501e80:	56                   	push   esi
  501e81:	57                   	push   edi
  501e82:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  501e85:	c7 45 f0 50 32 40 00 	mov    DWORD PTR [ebp-0x10],0x403250
  501e8c:	33 c0                	xor    eax,eax
  501e8e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  501e91:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  501e94:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  501e97:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
  501e9a:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  501ea0:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  501ea6:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  501eac:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
  501eb2:	6a 01                	push   0x1
  501eb4:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  501eba:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
  501ebd:	56                   	push   esi
  501ebe:	e8 cd a2 f9 ff       	call   0x49c190
  501ec3:	d9 5d b4             	fstp   DWORD PTR [ebp-0x4c]
  501ec6:	56                   	push   esi
  501ec7:	e8 34 a0 f9 ff       	call   0x49bf00
  501ecc:	d9 5d c8             	fstp   DWORD PTR [ebp-0x38]
  501ecf:	56                   	push   esi
  501ed0:	e8 3b 8f f9 ff       	call   0x49ae10
  501ed5:	d9 5d d8             	fstp   DWORD PTR [ebp-0x28]
  501ed8:	56                   	push   esi
  501ed9:	e8 92 8c f9 ff       	call   0x49ab70
  501ede:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  501ee1:	89 75 94             	mov    DWORD PTR [ebp-0x6c],esi
  501ee4:	c7 45 8c 04 40 00 00 	mov    DWORD PTR [ebp-0x74],0x4004
  501eeb:	8d 45 8c             	lea    eax,[ebp-0x74]
  501eee:	50                   	push   eax
  501eef:	e8 fc 84 f9 ff       	call   0x49a3f0
  501ef4:	d9 5d d0             	fstp   DWORD PTR [ebp-0x30]
  501ef7:	d9 06                	fld    DWORD PTR [esi]
  501ef9:	d8 65 d0             	fsub   DWORD PTR [ebp-0x30]
  501efc:	d9 9d 70 ff ff ff    	fstp   DWORD PTR [ebp-0x90]
  501f02:	df e0                	fnstsw ax
  501f04:	a8 0d                	test   al,0xd
  501f06:	0f 85 62 05 00 00    	jne    0x50246e
  501f0c:	8d 8d 70 ff ff ff    	lea    ecx,[ebp-0x90]
  501f12:	51                   	push   ecx
  501f13:	e8 f8 8e f9 ff       	call   0x49ae10
  501f18:	d9 9d 6c ff ff ff    	fstp   DWORD PTR [ebp-0x94]
  501f1e:	d9 45 d0             	fld    DWORD PTR [ebp-0x30]
  501f21:	d8 06                	fadd   DWORD PTR [esi]
  501f23:	d9 9d 74 ff ff ff    	fstp   DWORD PTR [ebp-0x8c]
  501f29:	df e0                	fnstsw ax
  501f2b:	a8 0d                	test   al,0xd
  501f2d:	0f 85 3b 05 00 00    	jne    0x50246e
  501f33:	8d 95 74 ff ff ff    	lea    edx,[ebp-0x8c]
  501f39:	52                   	push   edx
  501f3a:	e8 d1 8e f9 ff       	call   0x49ae10
  501f3f:	d8 a5 6c ff ff ff    	fsub   DWORD PTR [ebp-0x94]
  501f45:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501f4c:	75 08                	jne    0x501f56
  501f4e:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  501f54:	eb 0b                	jmp    0x501f61
  501f56:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  501f5c:	e8 c7 27 f0 ff       	call   0x404728
  501f61:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501f68:	75 05                	jne    0x501f6f
  501f6a:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  501f6d:	eb 08                	jmp    0x501f77
  501f6f:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  501f72:	e8 b1 27 f0 ff       	call   0x404728
  501f77:	d9 5d e0             	fstp   DWORD PTR [ebp-0x20]
  501f7a:	df e0                	fnstsw ax
  501f7c:	a8 0d                	test   al,0xd
  501f7e:	0f 85 ea 04 00 00    	jne    0x50246e
  501f84:	d9 06                	fld    DWORD PTR [esi]
  501f86:	d8 65 d0             	fsub   DWORD PTR [ebp-0x30]
  501f89:	d9 9d 70 ff ff ff    	fstp   DWORD PTR [ebp-0x90]
  501f8f:	df e0                	fnstsw ax
  501f91:	a8 0d                	test   al,0xd
  501f93:	0f 85 d5 04 00 00    	jne    0x50246e
  501f99:	8d 85 70 ff ff ff    	lea    eax,[ebp-0x90]
  501f9f:	50                   	push   eax
  501fa0:	e8 eb a1 f9 ff       	call   0x49c190
  501fa5:	d9 9d 6c ff ff ff    	fstp   DWORD PTR [ebp-0x94]
  501fab:	d9 45 d0             	fld    DWORD PTR [ebp-0x30]
  501fae:	d8 06                	fadd   DWORD PTR [esi]
  501fb0:	d9 9d 74 ff ff ff    	fstp   DWORD PTR [ebp-0x8c]
  501fb6:	df e0                	fnstsw ax
  501fb8:	a8 0d                	test   al,0xd
  501fba:	0f 85 ae 04 00 00    	jne    0x50246e
  501fc0:	8d 8d 74 ff ff ff    	lea    ecx,[ebp-0x8c]
  501fc6:	51                   	push   ecx
  501fc7:	e8 c4 a1 f9 ff       	call   0x49c190
  501fcc:	d8 a5 6c ff ff ff    	fsub   DWORD PTR [ebp-0x94]
  501fd2:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501fd9:	75 08                	jne    0x501fe3
  501fdb:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  501fe1:	eb 0b                	jmp    0x501fee
  501fe3:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  501fe9:	e8 3a 27 f0 ff       	call   0x404728
  501fee:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501ff5:	75 05                	jne    0x501ffc
  501ff7:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  501ffa:	eb 08                	jmp    0x502004
  501ffc:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  501fff:	e8 24 27 f0 ff       	call   0x404728
  502004:	d9 5d a0             	fstp   DWORD PTR [ebp-0x60]
  502007:	df e0                	fnstsw ax
  502009:	a8 0d                	test   al,0xd
  50200b:	0f 85 5d 04 00 00    	jne    0x50246e
  502011:	d9 06                	fld    DWORD PTR [esi]
  502013:	d8 65 d0             	fsub   DWORD PTR [ebp-0x30]
  502016:	d9 9d 70 ff ff ff    	fstp   DWORD PTR [ebp-0x90]
  50201c:	df e0                	fnstsw ax
  50201e:	a8 0d                	test   al,0xd
  502020:	0f 85 48 04 00 00    	jne    0x50246e
  502026:	8d 95 70 ff ff ff    	lea    edx,[ebp-0x90]
  50202c:	52                   	push   edx
  50202d:	e8 3e 8b f9 ff       	call   0x49ab70
  502032:	d9 9d 6c ff ff ff    	fstp   DWORD PTR [ebp-0x94]
  502038:	d9 45 d0             	fld    DWORD PTR [ebp-0x30]
  50203b:	d8 06                	fadd   DWORD PTR [esi]
  50203d:	d9 9d 74 ff ff ff    	fstp   DWORD PTR [ebp-0x8c]
  502043:	df e0                	fnstsw ax
  502045:	a8 0d                	test   al,0xd
  502047:	0f 85 21 04 00 00    	jne    0x50246e
  50204d:	8d 85 74 ff ff ff    	lea    eax,[ebp-0x8c]
  502053:	50                   	push   eax
  502054:	e8 17 8b f9 ff       	call   0x49ab70
  502059:	d8 a5 6c ff ff ff    	fsub   DWORD PTR [ebp-0x94]
  50205f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  502066:	75 08                	jne    0x502070
  502068:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50206e:	eb 0b                	jmp    0x50207b
  502070:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  502076:	e8 ad 26 f0 ff       	call   0x404728
  50207b:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  502082:	75 05                	jne    0x502089
  502084:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  502087:	eb 08                	jmp    0x502091
  502089:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  50208c:	e8 97 26 f0 ff       	call   0x404728
  502091:	d9 5d ac             	fstp   DWORD PTR [ebp-0x54]
  502094:	df e0                	fnstsw ax
  502096:	a8 0d                	test   al,0xd
  502098:	0f 85 d0 03 00 00    	jne    0x50246e
  50209e:	d9 06                	fld    DWORD PTR [esi]
  5020a0:	d8 65 d0             	fsub   DWORD PTR [ebp-0x30]
  5020a3:	d9 9d 70 ff ff ff    	fstp   DWORD PTR [ebp-0x90]
  5020a9:	df e0                	fnstsw ax
  5020ab:	a8 0d                	test   al,0xd
  5020ad:	0f 85 bb 03 00 00    	jne    0x50246e
  5020b3:	8d 8d 70 ff ff ff    	lea    ecx,[ebp-0x90]
  5020b9:	51                   	push   ecx
  5020ba:	e8 41 9e f9 ff       	call   0x49bf00
  5020bf:	d9 9d 6c ff ff ff    	fstp   DWORD PTR [ebp-0x94]
  5020c5:	d9 45 d0             	fld    DWORD PTR [ebp-0x30]
  5020c8:	d8 06                	fadd   DWORD PTR [esi]
  5020ca:	d9 9d 74 ff ff ff    	fstp   DWORD PTR [ebp-0x8c]
  5020d0:	df e0                	fnstsw ax
  5020d2:	a8 0d                	test   al,0xd
  5020d4:	0f 85 94 03 00 00    	jne    0x50246e
  5020da:	8d 95 74 ff ff ff    	lea    edx,[ebp-0x8c]
  5020e0:	52                   	push   edx
  5020e1:	e8 1a 9e f9 ff       	call   0x49bf00
  5020e6:	d8 a5 6c ff ff ff    	fsub   DWORD PTR [ebp-0x94]
  5020ec:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5020f3:	75 08                	jne    0x5020fd
  5020f5:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  5020fb:	eb 0b                	jmp    0x502108
  5020fd:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  502103:	e8 20 26 f0 ff       	call   0x404728
  502108:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50210f:	75 05                	jne    0x502116
  502111:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  502114:	eb 08                	jmp    0x50211e
  502116:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  502119:	e8 0a 26 f0 ff       	call   0x404728
  50211e:	d9 5d b8             	fstp   DWORD PTR [ebp-0x48]
  502121:	df e0                	fnstsw ax
  502123:	a8 0d                	test   al,0xd
  502125:	0f 85 43 03 00 00    	jne    0x50246e
  50212b:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  502131:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  502134:	d8 21                	fsub   DWORD PTR [ecx]
  502136:	d8 4d c8             	fmul   DWORD PTR [ebp-0x38]
  502139:	d9 45 b4             	fld    DWORD PTR [ebp-0x4c]
  50213c:	d8 09                	fmul   DWORD PTR [ecx]
  50213e:	de c1                	faddp  st(1),st
  502140:	8b 45 28             	mov    eax,DWORD PTR [ebp+0x28]
  502143:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50214a:	75 04                	jne    0x502150
  50214c:	d8 38                	fdivr  DWORD PTR [eax]
  50214e:	eb 07                	jmp    0x502157
  502150:	ff 30                	push   DWORD PTR [eax]
  502152:	e8 ef 25 f0 ff       	call   0x404746
  502157:	d9 5d bc             	fstp   DWORD PTR [ebp-0x44]
  50215a:	df e0                	fnstsw ax
  50215c:	a8 0d                	test   al,0xd
  50215e:	0f 85 0a 03 00 00    	jne    0x50246e
  502164:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50216a:	d8 21                	fsub   DWORD PTR [ecx]
  50216c:	d8 4d dc             	fmul   DWORD PTR [ebp-0x24]
  50216f:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  502172:	d8 09                	fmul   DWORD PTR [ecx]
  502174:	de c1                	faddp  st(1),st
  502176:	d9 5d c4             	fstp   DWORD PTR [ebp-0x3c]
  502179:	df e0                	fnstsw ax
  50217b:	a8 0d                	test   al,0xd
  50217d:	0f 85 eb 02 00 00    	jne    0x50246e
  502183:	d9 45 b4             	fld    DWORD PTR [ebp-0x4c]
  502186:	d8 65 c8             	fsub   DWORD PTR [ebp-0x38]
  502189:	d8 4d bc             	fmul   DWORD PTR [ebp-0x44]
  50218c:	d9 5d d4             	fstp   DWORD PTR [ebp-0x2c]
  50218f:	df e0                	fnstsw ax
  502191:	a8 0d                	test   al,0xd
  502193:	0f 85 d5 02 00 00    	jne    0x50246e
  502199:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50219f:	d8 21                	fsub   DWORD PTR [ecx]
  5021a1:	d8 4d b8             	fmul   DWORD PTR [ebp-0x48]
  5021a4:	d9 45 a0             	fld    DWORD PTR [ebp-0x60]
  5021a7:	d8 09                	fmul   DWORD PTR [ecx]
  5021a9:	de c1                	faddp  st(1),st
  5021ab:	d8 4d bc             	fmul   DWORD PTR [ebp-0x44]
  5021ae:	d9 5d cc             	fstp   DWORD PTR [ebp-0x34]
  5021b1:	df e0                	fnstsw ax
  5021b3:	a8 0d                	test   al,0xd
  5021b5:	0f 85 b3 02 00 00    	jne    0x50246e
  5021bb:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  5021c1:	d8 21                	fsub   DWORD PTR [ecx]
  5021c3:	d8 4d c8             	fmul   DWORD PTR [ebp-0x38]
  5021c6:	d9 45 b4             	fld    DWORD PTR [ebp-0x4c]
  5021c9:	d8 09                	fmul   DWORD PTR [ecx]
  5021cb:	de c1                	faddp  st(1),st
  5021cd:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
  5021d0:	d9 02                	fld    DWORD PTR [edx]
  5021d2:	8b 75 18             	mov    esi,DWORD PTR [ebp+0x18]
  5021d5:	d8 26                	fsub   DWORD PTR [esi]
  5021d7:	de c9                	fmulp  st(1),st
  5021d9:	d9 5d c0             	fstp   DWORD PTR [ebp-0x40]
  5021dc:	df e0                	fnstsw ax
  5021de:	a8 0d                	test   al,0xd
  5021e0:	0f 85 88 02 00 00    	jne    0x50246e
  5021e6:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  5021e9:	d8 65 dc             	fsub   DWORD PTR [ebp-0x24]
  5021ec:	d9 5d b0             	fstp   DWORD PTR [ebp-0x50]
  5021ef:	df e0                	fnstsw ax
  5021f1:	a8 0d                	test   al,0xd
  5021f3:	0f 85 75 02 00 00    	jne    0x50246e
  5021f9:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  5021fc:	d9 00                	fld    DWORD PTR [eax]
  5021fe:	d8 65 c4             	fsub   DWORD PTR [ebp-0x3c]
  502201:	d8 0e                	fmul   DWORD PTR [esi]
  502203:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  502206:	d8 65 c4             	fsub   DWORD PTR [ebp-0x3c]
  502209:	d8 0a                	fmul   DWORD PTR [edx]
  50220b:	de e9                	fsubp  st(1),st
  50220d:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
  502210:	d8 02                	fadd   DWORD PTR [edx]
  502212:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  502219:	75 05                	jne    0x502220
  50221b:	d8 75 bc             	fdiv   DWORD PTR [ebp-0x44]
  50221e:	eb 08                	jmp    0x502228
  502220:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
  502223:	e8 00 25 f0 ff       	call   0x404728
  502228:	d9 5d a4             	fstp   DWORD PTR [ebp-0x5c]
  50222b:	df e0                	fnstsw ax
  50222d:	a8 0d                	test   al,0xd
  50222f:	0f 85 39 02 00 00    	jne    0x50246e
  502235:	d9 01                	fld    DWORD PTR [ecx]
  502237:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50223d:	d8 4d ac             	fmul   DWORD PTR [ebp-0x54]
  502240:	d9 45 e0             	fld    DWORD PTR [ebp-0x20]
  502243:	d8 09                	fmul   DWORD PTR [ecx]
  502245:	df e0                	fnstsw ax
  502247:	a8 0d                	test   al,0xd
  502249:	0f 85 1f 02 00 00    	jne    0x50246e
  50224f:	de c1                	faddp  st(1),st
  502251:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  502257:	d8 21                	fsub   DWORD PTR [ecx]
  502259:	d8 4d c8             	fmul   DWORD PTR [ebp-0x38]
  50225c:	d9 45 b4             	fld    DWORD PTR [ebp-0x4c]
  50225f:	d8 09                	fmul   DWORD PTR [ecx]
  502261:	de c1                	faddp  st(1),st
  502263:	d8 0d 34 b3 54 00    	fmul   DWORD PTR ds:0x54b334
  502269:	df e0                	fnstsw ax
  50226b:	a8 0d                	test   al,0xd
  50226d:	0f 85 fb 01 00 00    	jne    0x50246e
  502273:	de e9                	fsubp  st(1),st
  502275:	d9 5d a8             	fstp   DWORD PTR [ebp-0x58]
  502278:	df e0                	fnstsw ax
  50227a:	a8 0d                	test   al,0xd
  50227c:	0f 85 ec 01 00 00    	jne    0x50246e
  502282:	d9 45 a4             	fld    DWORD PTR [ebp-0x5c]
  502285:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  502288:	d9 45 b0             	fld    DWORD PTR [ebp-0x50]
  50228b:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  50228e:	de e9                	fsubp  st(1),st
  502290:	d9 45 a8             	fld    DWORD PTR [ebp-0x58]
  502293:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  502296:	d9 45 b0             	fld    DWORD PTR [ebp-0x50]
  502299:	d8 4d cc             	fmul   DWORD PTR [ebp-0x34]
  50229c:	de e9                	fsubp  st(1),st
  50229e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5022a5:	75 04                	jne    0x5022ab
  5022a7:	de f9                	fdivp  st(1),st
  5022a9:	eb 09                	jmp    0x5022b4
  5022ab:	50                   	push   eax
  5022ac:	b0 0d                	mov    al,0xd
  5022ae:	e8 87 24 f0 ff       	call   0x40473a
  5022b3:	58                   	pop    eax
  5022b4:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  5022b7:	d9 19                	fstp   DWORD PTR [ecx]
  5022b9:	df e0                	fnstsw ax
  5022bb:	a8 0d                	test   al,0xd
  5022bd:	0f 85 ab 01 00 00    	jne    0x50246e
  5022c3:	d9 45 a8             	fld    DWORD PTR [ebp-0x58]
  5022c6:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  5022c9:	d9 45 a4             	fld    DWORD PTR [ebp-0x5c]
  5022cc:	d8 4d cc             	fmul   DWORD PTR [ebp-0x34]
  5022cf:	de e9                	fsubp  st(1),st
  5022d1:	d9 45 a8             	fld    DWORD PTR [ebp-0x58]
  5022d4:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  5022d7:	d9 45 b0             	fld    DWORD PTR [ebp-0x50]
  5022da:	d8 4d cc             	fmul   DWORD PTR [ebp-0x34]
  5022dd:	de e9                	fsubp  st(1),st
  5022df:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5022e6:	75 04                	jne    0x5022ec
  5022e8:	de f9                	fdivp  st(1),st
  5022ea:	eb 09                	jmp    0x5022f5
  5022ec:	50                   	push   eax
  5022ed:	b0 0d                	mov    al,0xd
  5022ef:	e8 46 24 f0 ff       	call   0x40473a
  5022f4:	58                   	pop    eax
  5022f5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  5022f8:	d9 1a                	fstp   DWORD PTR [edx]
  5022fa:	df e0                	fnstsw ax
  5022fc:	a8 0d                	test   al,0xd
  5022fe:	0f 85 6a 01 00 00    	jne    0x50246e
  502304:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  50230a:	50                   	push   eax
  50230b:	8d 45 9c             	lea    eax,[ebp-0x64]
  50230e:	50                   	push   eax
  50230f:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  502315:	8b f0                	mov    esi,eax
  502317:	8b 0e                	mov    ecx,DWORD PTR [esi]
  502319:	8d 95 74 ff ff ff    	lea    edx,[ebp-0x8c]
  50231f:	52                   	push   edx
  502320:	56                   	push   esi
  502321:	ff 51 1c             	call   DWORD PTR [ecx+0x1c]
  502324:	db e2                	fnclex
  502326:	85 c0                	test   eax,eax
  502328:	7d 0f                	jge    0x502339
  50232a:	6a 1c                	push   0x1c
  50232c:	68 d0 b0 41 00       	push   0x41b0d0
  502331:	56                   	push   esi
  502332:	50                   	push   eax
  502333:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  502339:	33 c0                	xor    eax,eax
  50233b:	8b 95 74 ff ff ff    	mov    edx,DWORD PTR [ebp-0x8c]
  502341:	85 d2                	test   edx,edx
  502343:	0f 9f c0             	setg   al
  502346:	f7 d8                	neg    eax
  502348:	8b f0                	mov    esi,eax
  50234a:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50234d:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  502353:	66 85 f6             	test   si,si
  502356:	0f 84 de 00 00 00    	je     0x50243a
  50235c:	ba c0 3e 42 00       	mov    edx,0x423ec0
  502361:	b9 48 b6 54 00       	mov    ecx,0x54b648
  502366:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  50236c:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  502371:	85 c0                	test   eax,eax
  502373:	75 10                	jne    0x502385
  502375:	68 10 b0 54 00       	push   0x54b010
  50237a:	68 8c 7e 40 00       	push   0x407e8c
  50237f:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  502385:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  50238b:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  502390:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
  502393:	b9 09 00 00 00       	mov    ecx,0x9
  502398:	89 8d 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],ecx
  50239e:	ba 01 00 00 00       	mov    edx,0x1
  5023a3:	89 55 94             	mov    DWORD PTR [ebp-0x6c],edx
  5023a6:	c7 45 8c 03 00 00 00 	mov    DWORD PTR [ebp-0x74],0x3
  5023ad:	8b 3e                	mov    edi,DWORD PTR [esi]
  5023af:	83 ec 10             	sub    esp,0x10
  5023b2:	8b dc                	mov    ebx,esp
  5023b4:	89 0b                	mov    DWORD PTR [ebx],ecx
  5023b6:	8b 4d 80             	mov    ecx,DWORD PTR [ebp-0x80]
  5023b9:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  5023bc:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  5023bf:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
  5023c2:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  5023c5:	83 ec 10             	sub    esp,0x10
  5023c8:	8b cc                	mov    ecx,esp
  5023ca:	8b 45 8c             	mov    eax,DWORD PTR [ebp-0x74]
  5023cd:	89 01                	mov    DWORD PTR [ecx],eax
  5023cf:	8b 45 90             	mov    eax,DWORD PTR [ebp-0x70]
  5023d2:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  5023d5:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  5023d8:	8b 55 98             	mov    edx,DWORD PTR [ebp-0x68]
  5023db:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  5023de:	56                   	push   esi
  5023df:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  5023e5:	db e2                	fnclex
  5023e7:	85 c0                	test   eax,eax
  5023e9:	7d 12                	jge    0x5023fd
  5023eb:	68 b0 02 00 00       	push   0x2b0
  5023f0:	68 d8 ae 41 00       	push   0x41aed8
  5023f5:	56                   	push   esi
  5023f6:	50                   	push   eax
  5023f7:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5023fd:	c7 85 78 ff ff ff 00 	mov    DWORD PTR [ebp-0x88],0x0
  502404:	00 00 00 
  502407:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50240c:	8b 08                	mov    ecx,DWORD PTR [eax]
  50240e:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
  502414:	52                   	push   edx
  502415:	50                   	push   eax
  502416:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  50241c:	db e2                	fnclex
  50241e:	85 c0                	test   eax,eax
  502420:	7d 18                	jge    0x50243a
  502422:	68 fc 06 00 00       	push   0x6fc
  502427:	68 34 e4 41 00       	push   0x41e434
  50242c:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  502432:	51                   	push   ecx
  502433:	50                   	push   eax
  502434:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50243a:	6a 00                	push   0x0
  50243c:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  502442:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  502448:	9b                   	fwait
  502449:	68 5b 24 50 00       	push   0x50245b
  50244e:	eb 0a                	jmp    0x50245a
  502450:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  502453:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  502459:	c3                   	ret
  50245a:	c3                   	ret
  50245b:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  50245e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  502465:	5f                   	pop    edi
  502466:	5e                   	pop    esi
  502467:	5b                   	pop    ebx
  502468:	8b e5                	mov    esp,ebp
  50246a:	5d                   	pop    ebp
  50246b:	c2 24 00             	ret    0x24
  50246e:	e9 a9 22 f0 ff       	jmp    0x40471c
  502473:	90                   	nop
  502474:	90                   	nop
  502475:	90                   	nop
  502476:	90                   	nop
  502477:	90                   	nop
  502478:	90                   	nop
  502479:	90                   	nop
  50247a:	90                   	nop
  50247b:	90                   	nop
  50247c:	90                   	nop
  50247d:	90                   	nop
  50247e:	90                   	nop
  50247f:	90                   	nop
