
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0050b10f <.text+0x10a10f>:
  50b10f:	8d 8d f0 fe ff ff    	lea    ecx,[ebp-0x110]
  50b115:	51                   	push   ecx
  50b116:	e8 d5 f2 f8 ff       	call   0x49a3f0
  50b11b:	d9 5d 9c             	fstp   DWORD PTR [ebp-0x64]
  50b11e:	d9 45 9c             	fld    DWORD PTR [ebp-0x64]
  50b121:	d8 05 84 b6 54 00    	fadd   DWORD PTR ds:0x54b684
  50b127:	d9 5d a0             	fstp   DWORD PTR [ebp-0x60]
  50b12a:	df e0                	fnstsw ax
  50b12c:	a8 0d                	test   al,0xd
  50b12e:	0f 85 01 29 00 00    	jne    0x50da35
  50b134:	d9 05 84 b6 54 00    	fld    DWORD PTR ds:0x54b684
  50b13a:	d8 65 9c             	fsub   DWORD PTR [ebp-0x64]
  50b13d:	d9 5d 84             	fstp   DWORD PTR [ebp-0x7c]
  50b140:	df e0                	fnstsw ax
  50b142:	a8 0d                	test   al,0xd
  50b144:	0f 85 eb 28 00 00    	jne    0x50da35
  50b14a:	8d 55 a0             	lea    edx,[ebp-0x60]
  50b14d:	52                   	push   edx
  50b14e:	e8 5d 0d f9 ff       	call   0x49beb0
  50b153:	d9 9d 64 ff ff ff    	fstp   DWORD PTR [ebp-0x9c]
  50b159:	8d 45 84             	lea    eax,[ebp-0x7c]
  50b15c:	50                   	push   eax
  50b15d:	e8 4e 0d f9 ff       	call   0x49beb0
  50b162:	d9 9d 58 ff ff ff    	fstp   DWORD PTR [ebp-0xa8]
  50b168:	8d 4d 84             	lea    ecx,[ebp-0x7c]
  50b16b:	51                   	push   ecx
  50b16c:	e8 8f 0d f9 ff       	call   0x49bf00
  50b171:	d9 9d d8 fe ff ff    	fstp   DWORD PTR [ebp-0x128]
  50b177:	8d 55 a0             	lea    edx,[ebp-0x60]
  50b17a:	52                   	push   edx
  50b17b:	e8 80 0d f9 ff       	call   0x49bf00
  50b180:	d8 a5 d8 fe ff ff    	fsub   DWORD PTR [ebp-0x128]
  50b186:	d9 85 64 ff ff ff    	fld    DWORD PTR [ebp-0x9c]
  50b18c:	d8 a5 58 ff ff ff    	fsub   DWORD PTR [ebp-0xa8]
  50b192:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b199:	75 04                	jne    0x50b19f
  50b19b:	de f9                	fdivp  st(1),st
  50b19d:	eb 09                	jmp    0x50b1a8
  50b19f:	50                   	push   eax
  50b1a0:	b0 0d                	mov    al,0xd
  50b1a2:	e8 93 95 ef ff       	call   0x40473a
  50b1a7:	58                   	pop    eax
  50b1a8:	d9 9d 7c ff ff ff    	fstp   DWORD PTR [ebp-0x84]
  50b1ae:	df e0                	fnstsw ax
  50b1b0:	a8 0d                	test   al,0xd
  50b1b2:	0f 85 7d 28 00 00    	jne    0x50da35
  50b1b8:	d9 05 7c b6 54 00    	fld    DWORD PTR ds:0x54b67c
  50b1be:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b1c5:	75 08                	jne    0x50b1cf
  50b1c7:	d8 35 30 b7 54 00    	fdiv   DWORD PTR ds:0x54b730
  50b1cd:	eb 0b                	jmp    0x50b1da
  50b1cf:	ff 35 30 b7 54 00    	push   DWORD PTR ds:0x54b730
  50b1d5:	e8 4e 95 ef ff       	call   0x404728
  50b1da:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b1e1:	75 08                	jne    0x50b1eb
  50b1e3:	d8 35 30 b5 54 00    	fdiv   DWORD PTR ds:0x54b530
  50b1e9:	eb 0b                	jmp    0x50b1f6
  50b1eb:	ff 35 30 b5 54 00    	push   DWORD PTR ds:0x54b530
  50b1f1:	e8 32 95 ef ff       	call   0x404728
  50b1f6:	d9 1d e4 b6 54 00    	fstp   DWORD PTR ds:0x54b6e4
  50b1fc:	df e0                	fnstsw ax
  50b1fe:	a8 0d                	test   al,0xd
  50b200:	0f 85 2f 28 00 00    	jne    0x50da35
  50b206:	d9 05 80 b6 54 00    	fld    DWORD PTR ds:0x54b680
  50b20c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b213:	75 08                	jne    0x50b21d
  50b215:	d8 35 30 b7 54 00    	fdiv   DWORD PTR ds:0x54b730
  50b21b:	eb 0b                	jmp    0x50b228
  50b21d:	ff 35 30 b7 54 00    	push   DWORD PTR ds:0x54b730
  50b223:	e8 00 95 ef ff       	call   0x404728
  50b228:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b22f:	75 08                	jne    0x50b239
  50b231:	d8 35 34 b5 54 00    	fdiv   DWORD PTR ds:0x54b534
  50b237:	eb 0b                	jmp    0x50b244
  50b239:	ff 35 34 b5 54 00    	push   DWORD PTR ds:0x54b534
  50b23f:	e8 e4 94 ef ff       	call   0x404728
  50b244:	d9 1d e8 b6 54 00    	fstp   DWORD PTR ds:0x54b6e8
  50b24a:	df e0                	fnstsw ax
  50b24c:	a8 0d                	test   al,0xd
  50b24e:	0f 85 e1 27 00 00    	jne    0x50da35
  50b254:	a1 30 b6 54 00       	mov    eax,ds:0x54b630
  50b259:	66 83 38 ff          	cmp    WORD PTR [eax],0xffff
  50b25d:	d9 05 e4 b6 54 00    	fld    DWORD PTR ds:0x54b6e4
  50b263:	d8 0d 30 b7 54 00    	fmul   DWORD PTR ds:0x54b730
  50b269:	9c                   	pushf
  50b26a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b271:	75 08                	jne    0x50b27b
  50b273:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50b279:	eb 0b                	jmp    0x50b286
  50b27b:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  50b281:	e8 a2 94 ef ff       	call   0x404728
  50b286:	9d                   	popf
  50b287:	75 08                	jne    0x50b291
  50b289:	d8 05 34 b7 54 00    	fadd   DWORD PTR ds:0x54b734
  50b28f:	eb 06                	jmp    0x50b297
  50b291:	d8 2d 34 b7 54 00    	fsubr  DWORD PTR ds:0x54b734
  50b297:	d9 5d 88             	fstp   DWORD PTR [ebp-0x78]
  50b29a:	df e0                	fnstsw ax
  50b29c:	a8 0d                	test   al,0xd
  50b29e:	0f 85 91 27 00 00    	jne    0x50da35
  50b2a4:	a1 14 b6 54 00       	mov    eax,ds:0x54b614
  50b2a9:	d9 40 04             	fld    DWORD PTR [eax+0x4]
  50b2ac:	d8 00                	fadd   DWORD PTR [eax]
  50b2ae:	df e0                	fnstsw ax
  50b2b0:	a8 0d                	test   al,0xd
  50b2b2:	0f 85 7d 27 00 00    	jne    0x50da35
  50b2b8:	dc 0d 00 35 40 00    	fmul   QWORD PTR ds:0x403500
  50b2be:	d9 1d b0 ba 54 00    	fstp   DWORD PTR ds:0x54bab0
  50b2c4:	df e0                	fnstsw ax
  50b2c6:	a8 0d                	test   al,0xd
  50b2c8:	0f 85 67 27 00 00    	jne    0x50da35
  50b2ce:	66 8b 0d e4 b4 54 00 	mov    cx,WORD PTR ds:0x54b4e4
  50b2d5:	66 03 0d e2 b4 54 00 	add    cx,WORD PTR ds:0x54b4e2
  50b2dc:	0f 80 58 27 00 00    	jo     0x50da3a
  50b2e2:	0f bf d1             	movsx  edx,cx
  50b2e5:	89 95 a4 fe ff ff    	mov    DWORD PTR [ebp-0x15c],edx
  50b2eb:	db 85 a4 fe ff ff    	fild   DWORD PTR [ebp-0x15c]
  50b2f1:	d9 9d a0 fe ff ff    	fstp   DWORD PTR [ebp-0x160]
  50b2f7:	d9 85 a0 fe ff ff    	fld    DWORD PTR [ebp-0x160]
  50b2fd:	d8 0d 34 b1 54 00    	fmul   DWORD PTR ds:0x54b134
  50b303:	df e0                	fnstsw ax
  50b305:	a8 0d                	test   al,0xd
  50b307:	0f 85 28 27 00 00    	jne    0x50da35
  50b30d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b314:	75 08                	jne    0x50b31e
  50b316:	dc 35 60 1c 40 00    	fdiv   QWORD PTR ds:0x401c60
  50b31c:	eb 11                	jmp    0x50b32f
  50b31e:	ff 35 64 1c 40 00    	push   DWORD PTR ds:0x401c64
  50b324:	ff 35 60 1c 40 00    	push   DWORD PTR ds:0x401c60
  50b32a:	e8 05 94 ef ff       	call   0x404734
  50b32f:	d9 05 20 b1 54 00    	fld    DWORD PTR ds:0x54b120
  50b335:	d8 0d 68 ba 54 00    	fmul   DWORD PTR ds:0x54ba68
  50b33b:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b342:	75 08                	jne    0x50b34c
  50b344:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  50b34a:	eb 0b                	jmp    0x50b357
  50b34c:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  50b352:	e8 d1 93 ef ff       	call   0x404728
  50b357:	df e0                	fnstsw ax
  50b359:	a8 0d                	test   al,0xd
  50b35b:	0f 85 d4 26 00 00    	jne    0x50da35
  50b361:	de c1                	faddp  st(1),st
  50b363:	d8 0d 30 b3 54 00    	fmul   DWORD PTR ds:0x54b330
  50b369:	d8 25 7c b6 54 00    	fsub   DWORD PTR ds:0x54b67c
  50b36f:	d8 25 80 b6 54 00    	fsub   DWORD PTR ds:0x54b680
  50b375:	d8 25 e0 b6 54 00    	fsub   DWORD PTR ds:0x54b6e0
  50b37b:	d9 1d 78 b6 54 00    	fstp   DWORD PTR ds:0x54b678
  50b381:	df e0                	fnstsw ax
  50b383:	a8 0d                	test   al,0xd
  50b385:	0f 85 aa 26 00 00    	jne    0x50da35
  50b38b:	d9 05 24 b7 54 00    	fld    DWORD PTR ds:0x54b724
  50b391:	d8 25 28 b7 54 00    	fsub   DWORD PTR ds:0x54b728
  50b397:	d9 1d d8 ba 54 00    	fstp   DWORD PTR ds:0x54bad8
  50b39d:	df e0                	fnstsw ax
  50b39f:	a8 0d                	test   al,0xd
  50b3a1:	0f 85 8e 26 00 00    	jne    0x50da35
  50b3a7:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50b3ad:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50b3b3:	d8 0d 20 b7 54 00    	fmul   DWORD PTR ds:0x54b720
  50b3b9:	d9 05 1c b7 54 00    	fld    DWORD PTR ds:0x54b71c
  50b3bf:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50b3c5:	de c1                	faddp  st(1),st
  50b3c7:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50b3cd:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50b3d3:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50b3d9:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50b3df:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50b3e5:	de c1                	faddp  st(1),st
  50b3e7:	d8 0d 34 b3 54 00    	fmul   DWORD PTR ds:0x54b334
  50b3ed:	de e9                	fsubp  st(1),st
  50b3ef:	d9 9d 50 ff ff ff    	fstp   DWORD PTR [ebp-0xb0]
  50b3f5:	df e0                	fnstsw ax
  50b3f7:	a8 0d                	test   al,0xd
  50b3f9:	0f 85 36 26 00 00    	jne    0x50da35
