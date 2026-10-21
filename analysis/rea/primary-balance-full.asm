
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0050af30 <.text+0x109f30>:
  50af30:	55                   	push   ebp
  50af31:	8b ec                	mov    ebp,esp
  50af33:	83 ec 14             	sub    esp,0x14
  50af36:	68 16 47 40 00       	push   0x404716
  50af3b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  50af41:	50                   	push   eax
  50af42:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  50af49:	81 ec a8 01 00 00    	sub    esp,0x1a8
  50af4f:	53                   	push   ebx
  50af50:	56                   	push   esi
  50af51:	57                   	push   edi
  50af52:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  50af55:	c7 45 f0 c0 34 40 00 	mov    DWORD PTR [ebp-0x10],0x4034c0
  50af5c:	33 db                	xor    ebx,ebx
  50af5e:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  50af61:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
  50af64:	89 5d c0             	mov    DWORD PTR [ebp-0x40],ebx
  50af67:	89 5d b4             	mov    DWORD PTR [ebp-0x4c],ebx
  50af6a:	89 5d ac             	mov    DWORD PTR [ebp-0x54],ebx
  50af6d:	89 5d a8             	mov    DWORD PTR [ebp-0x58],ebx
  50af70:	89 5d a0             	mov    DWORD PTR [ebp-0x60],ebx
  50af73:	89 5d 84             	mov    DWORD PTR [ebp-0x7c],ebx
  50af76:	89 9d 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],ebx
  50af7c:	89 9d 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],ebx
  50af82:	89 9d 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],ebx
  50af88:	89 9d 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],ebx
  50af8e:	89 9d 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],ebx
  50af94:	89 9d 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],ebx
  50af9a:	89 9d 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],ebx
  50afa0:	89 9d 30 ff ff ff    	mov    DWORD PTR [ebp-0xd0],ebx
  50afa6:	89 9d 20 ff ff ff    	mov    DWORD PTR [ebp-0xe0],ebx
  50afac:	89 9d 10 ff ff ff    	mov    DWORD PTR [ebp-0xf0],ebx
  50afb2:	89 9d 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],ebx
  50afb8:	89 9d f0 fe ff ff    	mov    DWORD PTR [ebp-0x110],ebx
  50afbe:	89 9d e0 fe ff ff    	mov    DWORD PTR [ebp-0x120],ebx
  50afc4:	89 9d dc fe ff ff    	mov    DWORD PTR [ebp-0x124],ebx
  50afca:	89 9d d8 fe ff ff    	mov    DWORD PTR [ebp-0x128],ebx
  50afd0:	89 9d d4 fe ff ff    	mov    DWORD PTR [ebp-0x12c],ebx
  50afd6:	89 9d c0 fe ff ff    	mov    DWORD PTR [ebp-0x140],ebx
  50afdc:	6a 01                	push   0x1
  50afde:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  50afe4:	68 94 b4 54 00       	push   0x54b494
  50afe9:	e8 c2 0e f9 ff       	call   0x49beb0
  50afee:	d9 1d 90 b6 54 00    	fstp   DWORD PTR ds:0x54b690
  50aff4:	d9 05 9c b4 54 00    	fld    DWORD PTR ds:0x54b49c
  50affa:	d8 05 0c 1a 40 00    	fadd   DWORD PTR ds:0x401a0c
  50b000:	d9 9d d8 fe ff ff    	fstp   DWORD PTR [ebp-0x128]
  50b006:	df e0                	fnstsw ax
  50b008:	a8 0d                	test   al,0xd
  50b00a:	0f 85 25 2a 00 00    	jne    0x50da35
  50b010:	8d 85 d8 fe ff ff    	lea    eax,[ebp-0x128]
  50b016:	50                   	push   eax
  50b017:	68 94 b4 54 00       	push   0x54b494
  50b01c:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50b022:	51                   	push   ecx
  50b023:	e8 18 01 f9 ff       	call   0x49b140
  50b028:	d9 05 9c b4 54 00    	fld    DWORD PTR ds:0x54b49c
  50b02e:	d8 25 0c 1a 40 00    	fsub   DWORD PTR ds:0x401a0c
  50b034:	d9 9d d4 fe ff ff    	fstp   DWORD PTR [ebp-0x12c]
  50b03a:	df e0                	fnstsw ax
  50b03c:	a8 0d                	test   al,0xd
  50b03e:	0f 85 f1 29 00 00    	jne    0x50da35
  50b044:	8d 95 d4 fe ff ff    	lea    edx,[ebp-0x12c]
  50b04a:	52                   	push   edx
  50b04b:	68 94 b4 54 00       	push   0x54b494
  50b050:	8d 85 20 ff ff ff    	lea    eax,[ebp-0xe0]
  50b056:	50                   	push   eax
  50b057:	e8 e4 00 f9 ff       	call   0x49b140
  50b05c:	c7 85 f8 fe ff ff 04 	mov    DWORD PTR [ebp-0x108],0x4
  50b063:	00 00 00 
  50b066:	bf 02 00 00 00       	mov    edi,0x2
  50b06b:	89 bd f0 fe ff ff    	mov    DWORD PTR [ebp-0x110],edi
  50b071:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50b077:	51                   	push   ecx
  50b078:	8d 95 20 ff ff ff    	lea    edx,[ebp-0xe0]
  50b07e:	52                   	push   edx
  50b07f:	8d 85 10 ff ff ff    	lea    eax,[ebp-0xf0]
  50b085:	50                   	push   eax
  50b086:	ff 15 04 10 40 00    	call   DWORD PTR ds:0x401004
  50b08c:	50                   	push   eax
  50b08d:	8d 8d f0 fe ff ff    	lea    ecx,[ebp-0x110]
  50b093:	51                   	push   ecx
  50b094:	8d 95 00 ff ff ff    	lea    edx,[ebp-0x100]
  50b09a:	52                   	push   edx
  50b09b:	ff 15 7c 11 40 00    	call   DWORD PTR ds:0x40117c
  50b0a1:	50                   	push   eax
  50b0a2:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  50b0a8:	d9 1d 30 b7 54 00    	fstp   DWORD PTR ds:0x54b730
  50b0ae:	8d 85 20 ff ff ff    	lea    eax,[ebp-0xe0]
  50b0b4:	50                   	push   eax
  50b0b5:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50b0bb:	51                   	push   ecx
  50b0bc:	57                   	push   edi
  50b0bd:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50b0c3:	83 c4 0c             	add    esp,0xc
  50b0c6:	68 9c b4 54 00       	push   0x54b49c
  50b0cb:	68 94 b4 54 00       	push   0x54b494
  50b0d0:	8d 95 30 ff ff ff    	lea    edx,[ebp-0xd0]
  50b0d6:	52                   	push   edx
  50b0d7:	e8 64 00 f9 ff       	call   0x49b140
  50b0dc:	8d 85 30 ff ff ff    	lea    eax,[ebp-0xd0]
  50b0e2:	50                   	push   eax
  50b0e3:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  50b0e9:	d9 1d 34 b7 54 00    	fstp   DWORD PTR ds:0x54b734
  50b0ef:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50b0f5:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  50b0fb:	c7 85 f8 fe ff ff 84 	mov    DWORD PTR [ebp-0x108],0x54b684
  50b102:	b6 54 00 
  50b105:	c7 85 f0 fe ff ff 04 	mov    DWORD PTR [ebp-0x110],0x4004
  50b10c:	40 00 00 
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
  50b3ff:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50b404:	8b 08                	mov    ecx,DWORD PTR [eax]
  50b406:	50                   	push   eax
  50b407:	ff 91 b8 05 00 00    	call   DWORD PTR [ecx+0x5b8]
  50b40d:	50                   	push   eax
  50b40e:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50b414:	52                   	push   edx
  50b415:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50b41b:	8b f0                	mov    esi,eax
  50b41d:	8b 06                	mov    eax,DWORD PTR [esi]
  50b41f:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  50b425:	51                   	push   ecx
  50b426:	6a 01                	push   0x1
  50b428:	56                   	push   esi
  50b429:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50b42c:	db e2                	fnclex
  50b42e:	3b c3                	cmp    eax,ebx
  50b430:	7d 0f                	jge    0x50b441
  50b432:	6a 40                	push   0x40
  50b434:	68 68 c9 41 00       	push   0x41c968
  50b439:	56                   	push   esi
  50b43a:	50                   	push   eax
  50b43b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50b441:	53                   	push   ebx
  50b442:	68 09 00 03 68       	push   0x68030009
  50b447:	8b 95 48 ff ff ff    	mov    edx,DWORD PTR [ebp-0xb8]
  50b44d:	52                   	push   edx
  50b44e:	8d 85 30 ff ff ff    	lea    eax,[ebp-0xd0]
  50b454:	50                   	push   eax
  50b455:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  50b45b:	83 c4 10             	add    esp,0x10
  50b45e:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50b464:	51                   	push   ecx
  50b465:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  50b46b:	0f bf d0             	movsx  edx,ax
  50b46e:	89 95 9c fe ff ff    	mov    DWORD PTR [ebp-0x164],edx
  50b474:	db 85 9c fe ff ff    	fild   DWORD PTR [ebp-0x164]
  50b47a:	dd 9d 94 fe ff ff    	fstp   QWORD PTR [ebp-0x16c]
  50b480:	dd 85 94 fe ff ff    	fld    QWORD PTR [ebp-0x16c]
  50b486:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b48d:	75 08                	jne    0x50b497
  50b48f:	dc 35 a0 28 40 00    	fdiv   QWORD PTR ds:0x4028a0
  50b495:	eb 11                	jmp    0x50b4a8
  50b497:	ff 35 a4 28 40 00    	push   DWORD PTR ds:0x4028a4
  50b49d:	ff 35 a0 28 40 00    	push   DWORD PTR ds:0x4028a0
  50b4a3:	e8 8c 92 ef ff       	call   0x404734
  50b4a8:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50b4ae:	d8 0d d8 b6 54 00    	fmul   DWORD PTR ds:0x54b6d8
  50b4b4:	d9 05 c8 b6 54 00    	fld    DWORD PTR ds:0x54b6c8
  50b4ba:	d8 05 a4 b6 54 00    	fadd   DWORD PTR ds:0x54b6a4
  50b4c0:	d8 05 cc b6 54 00    	fadd   DWORD PTR ds:0x54b6cc
  50b4c6:	d8 05 b0 b6 54 00    	fadd   DWORD PTR ds:0x54b6b0
  50b4cc:	df e0                	fnstsw ax
  50b4ce:	a8 0d                	test   al,0xd
  50b4d0:	0f 85 5f 25 00 00    	jne    0x50da35
  50b4d6:	de c1                	faddp  st(1),st
  50b4d8:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  50b4de:	df e0                	fnstsw ax
  50b4e0:	a8 0d                	test   al,0xd
  50b4e2:	0f 85 4d 25 00 00    	jne    0x50da35
  50b4e8:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  50b4ee:	50                   	push   eax
  50b4ef:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  50b4f5:	51                   	push   ecx
  50b4f6:	57                   	push   edi
  50b4f7:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50b4fd:	83 c4 0c             	add    esp,0xc
  50b500:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50b506:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  50b50c:	d9 05 c4 b6 54 00    	fld    DWORD PTR ds:0x54b6c4
  50b512:	d8 a5 54 ff ff ff    	fsub   DWORD PTR [ebp-0xac]
  50b518:	d8 25 ac b4 54 00    	fsub   DWORD PTR ds:0x54b4ac
  50b51e:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  50b524:	d8 05 38 bb 54 00    	fadd   DWORD PTR ds:0x54bb38
  50b52a:	d9 1d 38 bb 54 00    	fstp   DWORD PTR ds:0x54bb38
  50b530:	df e0                	fnstsw ax
  50b532:	a8 0d                	test   al,0xd
  50b534:	0f 85 fb 24 00 00    	jne    0x50da35
  50b53a:	d9 05 0c b7 54 00    	fld    DWORD PTR ds:0x54b70c
  50b540:	d8 0d 38 bb 54 00    	fmul   DWORD PTR ds:0x54bb38
  50b546:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  50b549:	df e0                	fnstsw ax
  50b54b:	a8 0d                	test   al,0xd
  50b54d:	0f 85 e2 24 00 00    	jne    0x50da35
  50b553:	d9 05 38 bb 54 00    	fld    DWORD PTR ds:0x54bb38
  50b559:	d8 8d 7c ff ff ff    	fmul   DWORD PTR [ebp-0x84]
  50b55f:	d9 5d d0             	fstp   DWORD PTR [ebp-0x30]
  50b562:	df e0                	fnstsw ax
  50b564:	a8 0d                	test   al,0xd
  50b566:	0f 85 c9 24 00 00    	jne    0x50da35
  50b56c:	d9 05 a8 b4 54 00    	fld    DWORD PTR ds:0x54b4a8
  50b572:	d8 0d 34 b3 54 00    	fmul   DWORD PTR ds:0x54b334
  50b578:	d9 5d c4             	fstp   DWORD PTR [ebp-0x3c]
  50b57b:	df e0                	fnstsw ax
  50b57d:	a8 0d                	test   al,0xd
  50b57f:	0f 85 b0 24 00 00    	jne    0x50da35
  50b585:	d9 05 38 bb 54 00    	fld    DWORD PTR ds:0x54bb38
  50b58b:	d9 e0                	fchs
  50b58d:	d8 0d 30 b7 54 00    	fmul   DWORD PTR ds:0x54b730
  50b593:	d9 05 f8 b2 54 00    	fld    DWORD PTR ds:0x54b2f8
  50b599:	d8 0d ac b1 54 00    	fmul   DWORD PTR ds:0x54b1ac
  50b59f:	de e9                	fsubp  st(1),st
  50b5a1:	d9 5d b8             	fstp   DWORD PTR [ebp-0x48]
  50b5a4:	df e0                	fnstsw ax
  50b5a6:	a8 0d                	test   al,0xd
  50b5a8:	0f 85 87 24 00 00    	jne    0x50da35
  50b5ae:	d9 05 ac b4 54 00    	fld    DWORD PTR ds:0x54b4ac
  50b5b4:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50b5ba:	df e0                	fnstsw ax
  50b5bc:	f6 c4 01             	test   ah,0x1
  50b5bf:	75 29                	jne    0x50b5ea
  50b5c1:	8b 15 34 b7 54 00    	mov    edx,DWORD PTR ds:0x54b734
  50b5c7:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
  50b5ca:	d9 05 ac b4 54 00    	fld    DWORD PTR ds:0x54b4ac
  50b5d0:	d9 e0                	fchs
  50b5d2:	d8 0d 54 b6 54 00    	fmul   DWORD PTR ds:0x54b654
  50b5d8:	d9 1d 88 b7 54 00    	fstp   DWORD PTR ds:0x54b788
  50b5de:	df e0                	fnstsw ax
  50b5e0:	a8 0d                	test   al,0xd
  50b5e2:	0f 85 4d 24 00 00    	jne    0x50da35
  50b5e8:	eb 0e                	jmp    0x50b5f8
  50b5ea:	a1 28 b7 54 00       	mov    eax,ds:0x54b728
  50b5ef:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  50b5f2:	89 1d 88 b7 54 00    	mov    DWORD PTR ds:0x54b788,ebx
  50b5f8:	66 8b 0d d8 b4 54 00 	mov    cx,WORD PTR ds:0x54b4d8
  50b5ff:	be 01 00 00 00       	mov    esi,0x1
  50b604:	66 3b ce             	cmp    cx,si
  50b607:	75 06                	jne    0x50b60f
  50b609:	89 1d 88 b7 54 00    	mov    DWORD PTR ds:0x54b788,ebx
  50b60f:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50b615:	d8 1d f8 13 40 00    	fcomp  DWORD PTR ds:0x4013f8
  50b61b:	df e0                	fnstsw ax
  50b61d:	f6 c4 41             	test   ah,0x41
  50b620:	0f 85 d1 01 00 00    	jne    0x50b7f7
  50b626:	d9 05 9c b1 54 00    	fld    DWORD PTR ds:0x54b19c
  50b62c:	dc 0d c8 30 40 00    	fmul   QWORD PTR ds:0x4030c8
  50b632:	d8 05 a4 b4 54 00    	fadd   DWORD PTR ds:0x54b4a4
  50b638:	d9 1d a4 b4 54 00    	fstp   DWORD PTR ds:0x54b4a4
  50b63e:	df e0                	fnstsw ax
  50b640:	a8 0d                	test   al,0xd
  50b642:	0f 85 ed 23 00 00    	jne    0x50da35
  50b648:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50b64e:	d9 05 9c b1 54 00    	fld    DWORD PTR ds:0x54b19c
  50b654:	dc 0d c8 30 40 00    	fmul   QWORD PTR ds:0x4030c8
  50b65a:	de e9                	fsubp  st(1),st
  50b65c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b663:	75 08                	jne    0x50b66d
  50b665:	d8 35 a4 b4 54 00    	fdiv   DWORD PTR ds:0x54b4a4
  50b66b:	eb 0b                	jmp    0x50b678
  50b66d:	ff 35 a4 b4 54 00    	push   DWORD PTR ds:0x54b4a4
  50b673:	e8 b0 90 ef ff       	call   0x404728
  50b678:	d9 1d ec b7 54 00    	fstp   DWORD PTR ds:0x54b7ec
  50b67e:	df e0                	fnstsw ax
  50b680:	a8 0d                	test   al,0xd
  50b682:	0f 85 ad 23 00 00    	jne    0x50da35
  50b688:	d9 05 a0 b1 54 00    	fld    DWORD PTR ds:0x54b1a0
  50b68e:	d8 05 9c b1 54 00    	fadd   DWORD PTR ds:0x54b19c
  50b694:	d8 25 a4 b4 54 00    	fsub   DWORD PTR ds:0x54b4a4
  50b69a:	d9 1d a8 b4 54 00    	fstp   DWORD PTR ds:0x54b4a8
  50b6a0:	df e0                	fnstsw ax
  50b6a2:	a8 0d                	test   al,0xd
  50b6a4:	0f 85 8b 23 00 00    	jne    0x50da35
  50b6aa:	d9 05 9c b1 54 00    	fld    DWORD PTR ds:0x54b19c
  50b6b0:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b6b7:	75 08                	jne    0x50b6c1
  50b6b9:	d8 35 54 b6 54 00    	fdiv   DWORD PTR ds:0x54b654
  50b6bf:	eb 0b                	jmp    0x50b6cc
  50b6c1:	ff 35 54 b6 54 00    	push   DWORD PTR ds:0x54b654
  50b6c7:	e8 5c 90 ef ff       	call   0x404728
  50b6cc:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b6d3:	75 08                	jne    0x50b6dd
  50b6d5:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50b6db:	eb 0b                	jmp    0x50b6e8
  50b6dd:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  50b6e3:	e8 40 90 ef ff       	call   0x404728
  50b6e8:	d8 2d 38 bb 54 00    	fsubr  DWORD PTR ds:0x54bb38
  50b6ee:	d9 1d 38 bb 54 00    	fstp   DWORD PTR ds:0x54bb38
  50b6f4:	df e0                	fnstsw ax
  50b6f6:	a8 0d                	test   al,0xd
  50b6f8:	0f 85 37 23 00 00    	jne    0x50da35
  50b6fe:	66 8b d6             	mov    dx,si
  50b701:	66 89 15 d6 b4 54 00 	mov    WORD PTR ds:0x54b4d6,dx
  50b708:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b70e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b715:	75 08                	jne    0x50b71f
  50b717:	d8 35 50 b6 54 00    	fdiv   DWORD PTR ds:0x54b650
  50b71d:	eb 0b                	jmp    0x50b72a
  50b71f:	ff 35 50 b6 54 00    	push   DWORD PTR ds:0x54b650
  50b725:	e8 fe 8f ef ff       	call   0x404728
  50b72a:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50b730:	d8 25 ec b7 54 00    	fsub   DWORD PTR ds:0x54b7ec
  50b736:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b73d:	75 08                	jne    0x50b747
  50b73f:	d8 35 4c b6 54 00    	fdiv   DWORD PTR ds:0x54b64c
  50b745:	eb 0b                	jmp    0x50b752
  50b747:	ff 35 4c b6 54 00    	push   DWORD PTR ds:0x54b64c
  50b74d:	e8 d6 8f ef ff       	call   0x404728
  50b752:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b758:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b75f:	75 08                	jne    0x50b769
  50b761:	d8 35 50 b6 54 00    	fdiv   DWORD PTR ds:0x54b650
  50b767:	eb 0b                	jmp    0x50b774
  50b769:	ff 35 50 b6 54 00    	push   DWORD PTR ds:0x54b650
  50b76f:	e8 b4 8f ef ff       	call   0x404728
  50b774:	de c1                	faddp  st(1),st
  50b776:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b77d:	75 04                	jne    0x50b783
  50b77f:	de f9                	fdivp  st(1),st
  50b781:	eb 09                	jmp    0x50b78c
  50b783:	50                   	push   eax
  50b784:	b0 0d                	mov    al,0xd
  50b786:	e8 af 8f ef ff       	call   0x40473a
  50b78b:	58                   	pop    eax
  50b78c:	d9 1d 88 b6 54 00    	fstp   DWORD PTR ds:0x54b688
  50b792:	df e0                	fnstsw ax
  50b794:	a8 0d                	test   al,0xd
  50b796:	0f 85 99 22 00 00    	jne    0x50da35
  50b79c:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50b7a2:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50b7a8:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50b7ae:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50b7b4:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50b7ba:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50b7c0:	df e0                	fnstsw ax
  50b7c2:	a8 0d                	test   al,0xd
  50b7c4:	0f 85 6b 22 00 00    	jne    0x50da35
  50b7ca:	de c1                	faddp  st(1),st
  50b7cc:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b7d3:	75 04                	jne    0x50b7d9
  50b7d5:	de f9                	fdivp  st(1),st
  50b7d7:	eb 09                	jmp    0x50b7e2
  50b7d9:	50                   	push   eax
  50b7da:	b0 0d                	mov    al,0xd
  50b7dc:	e8 59 8f ef ff       	call   0x40473a
  50b7e1:	58                   	pop    eax
  50b7e2:	d9 1d f0 b7 54 00    	fstp   DWORD PTR ds:0x54b7f0
  50b7e8:	df e0                	fnstsw ax
  50b7ea:	a8 0d                	test   al,0xd
  50b7ec:	0f 85 43 22 00 00    	jne    0x50da35
  50b7f2:	e9 f0 05 00 00       	jmp    0x50bde7
  50b7f7:	d9 05 a0 b4 54 00    	fld    DWORD PTR ds:0x54b4a0
  50b7fd:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50b803:	df e0                	fnstsw ax
  50b805:	f6 c4 01             	test   ah,0x1
  50b808:	74 0c                	je     0x50b816
  50b80a:	66 8b d6             	mov    dx,si
  50b80d:	66 89 15 d6 b4 54 00 	mov    WORD PTR ds:0x54b4d6,dx
  50b814:	eb 07                	jmp    0x50b81d
  50b816:	66 8b 15 d6 b4 54 00 	mov    dx,WORD PTR ds:0x54b4d6
  50b81d:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50b823:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50b829:	df e0                	fnstsw ax
  50b82b:	f6 c4 01             	test   ah,0x1
  50b82e:	0f 84 ae 00 00 00    	je     0x50b8e2
  50b834:	66 3b cb             	cmp    cx,bx
  50b837:	75 08                	jne    0x50b841
  50b839:	d9 05 ac b4 54 00    	fld    DWORD PTR ds:0x54b4ac
  50b83f:	eb 0c                	jmp    0x50b84d
  50b841:	d9 05 c4 b6 54 00    	fld    DWORD PTR ds:0x54b6c4
  50b847:	d8 a5 54 ff ff ff    	fsub   DWORD PTR [ebp-0xac]
  50b84d:	d8 25 a8 b6 54 00    	fsub   DWORD PTR ds:0x54b6a8
  50b853:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  50b859:	d8 05 f0 b7 54 00    	fadd   DWORD PTR ds:0x54b7f0
  50b85f:	d9 1d f0 b7 54 00    	fstp   DWORD PTR ds:0x54b7f0
  50b865:	df e0                	fnstsw ax
  50b867:	a8 0d                	test   al,0xd
  50b869:	0f 85 c6 21 00 00    	jne    0x50da35
  50b86f:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50b875:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b87c:	75 08                	jne    0x50b886
  50b87e:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50b884:	eb 0b                	jmp    0x50b891
  50b886:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50b88c:	e8 97 8e ef ff       	call   0x404728
  50b891:	d8 25 4c b6 54 00    	fsub   DWORD PTR ds:0x54b64c
  50b897:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50b89d:	d8 25 4c b6 54 00    	fsub   DWORD PTR ds:0x54b64c
  50b8a3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b8aa:	75 04                	jne    0x50b8b0
  50b8ac:	de f9                	fdivp  st(1),st
  50b8ae:	eb 09                	jmp    0x50b8b9
  50b8b0:	50                   	push   eax
  50b8b1:	b0 0d                	mov    al,0xd
  50b8b3:	e8 82 8e ef ff       	call   0x40473a
  50b8b8:	58                   	pop    eax
  50b8b9:	d9 1d 88 b6 54 00    	fstp   DWORD PTR ds:0x54b688
  50b8bf:	df e0                	fnstsw ax
  50b8c1:	a8 0d                	test   al,0xd
  50b8c3:	0f 85 6c 21 00 00    	jne    0x50da35
  50b8c9:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50b8cf:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50b8d5:	df e0                	fnstsw ax
  50b8d7:	f6 c4 01             	test   ah,0x1
  50b8da:	74 06                	je     0x50b8e2
  50b8dc:	89 1d 88 b6 54 00    	mov    DWORD PTR ds:0x54b688,ebx
  50b8e2:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  50b8e8:	d8 1d 44 b5 54 00    	fcomp  DWORD PTR ds:0x54b544
  50b8ee:	df e0                	fnstsw ax
  50b8f0:	f6 c4 01             	test   ah,0x1
  50b8f3:	74 0a                	je     0x50b8ff
  50b8f5:	a1 44 b5 54 00       	mov    eax,ds:0x54b544
  50b8fa:	a3 94 b4 54 00       	mov    ds:0x54b494,eax
  50b8ff:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  50b905:	d8 1d 84 b6 54 00    	fcomp  DWORD PTR ds:0x54b684
  50b90b:	df e0                	fnstsw ax
  50b90d:	f6 c4 01             	test   ah,0x1
  50b910:	0f 84 76 01 00 00    	je     0x50ba8c
  50b916:	66 3b cb             	cmp    cx,bx
  50b919:	0f 85 6d 01 00 00    	jne    0x50ba8c
  50b91f:	d9 05 a0 b1 54 00    	fld    DWORD PTR ds:0x54b1a0
  50b925:	d8 05 9c b1 54 00    	fadd   DWORD PTR ds:0x54b19c
  50b92b:	d9 1d a4 b4 54 00    	fstp   DWORD PTR ds:0x54b4a4
  50b931:	df e0                	fnstsw ax
  50b933:	a8 0d                	test   al,0xd
  50b935:	0f 85 fa 20 00 00    	jne    0x50da35
  50b93b:	66 8b ce             	mov    cx,si
  50b93e:	66 89 0d d8 b4 54 00 	mov    WORD PTR ds:0x54b4d8,cx
  50b945:	d9 05 a0 b4 54 00    	fld    DWORD PTR ds:0x54b4a0
  50b94b:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50b951:	d8 0d 9c b1 54 00    	fmul   DWORD PTR ds:0x54b19c
  50b957:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b95e:	75 08                	jne    0x50b968
  50b960:	d8 35 a4 b4 54 00    	fdiv   DWORD PTR ds:0x54b4a4
  50b966:	eb 0b                	jmp    0x50b973
  50b968:	ff 35 a4 b4 54 00    	push   DWORD PTR ds:0x54b4a4
  50b96e:	e8 b5 8d ef ff       	call   0x404728
  50b973:	d9 1d ec b7 54 00    	fstp   DWORD PTR ds:0x54b7ec
  50b979:	df e0                	fnstsw ax
  50b97b:	a8 0d                	test   al,0xd
  50b97d:	0f 85 b2 20 00 00    	jne    0x50da35
  50b983:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b989:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b990:	75 08                	jne    0x50b99a
  50b992:	d8 35 50 b6 54 00    	fdiv   DWORD PTR ds:0x54b650
  50b998:	eb 0b                	jmp    0x50b9a5
  50b99a:	ff 35 50 b6 54 00    	push   DWORD PTR ds:0x54b650
  50b9a0:	e8 83 8d ef ff       	call   0x404728
  50b9a5:	df e0                	fnstsw ax
  50b9a7:	a8 0d                	test   al,0xd
  50b9a9:	0f 85 86 20 00 00    	jne    0x50da35
  50b9af:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b9b5:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50b9bb:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b9c2:	75 08                	jne    0x50b9cc
  50b9c4:	d8 35 4c b6 54 00    	fdiv   DWORD PTR ds:0x54b64c
  50b9ca:	eb 0b                	jmp    0x50b9d7
  50b9cc:	ff 35 4c b6 54 00    	push   DWORD PTR ds:0x54b64c
  50b9d2:	e8 51 8d ef ff       	call   0x404728
  50b9d7:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b9dd:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b9e4:	75 08                	jne    0x50b9ee
  50b9e6:	d8 35 50 b6 54 00    	fdiv   DWORD PTR ds:0x54b650
  50b9ec:	eb 0b                	jmp    0x50b9f9
  50b9ee:	ff 35 50 b6 54 00    	push   DWORD PTR ds:0x54b650
  50b9f4:	e8 2f 8d ef ff       	call   0x404728
  50b9f9:	df e0                	fnstsw ax
  50b9fb:	a8 0d                	test   al,0xd
  50b9fd:	0f 85 32 20 00 00    	jne    0x50da35
  50ba03:	de c1                	faddp  st(1),st
  50ba05:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50ba0c:	75 04                	jne    0x50ba12
  50ba0e:	de f9                	fdivp  st(1),st
  50ba10:	eb 09                	jmp    0x50ba1b
  50ba12:	50                   	push   eax
  50ba13:	b0 0d                	mov    al,0xd
  50ba15:	e8 20 8d ef ff       	call   0x40473a
  50ba1a:	58                   	pop    eax
  50ba1b:	d9 1d 88 b6 54 00    	fstp   DWORD PTR ds:0x54b688
  50ba21:	df e0                	fnstsw ax
  50ba23:	a8 0d                	test   al,0xd
  50ba25:	0f 85 0a 20 00 00    	jne    0x50da35
  50ba2b:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50ba31:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50ba37:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50ba3d:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50ba43:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50ba49:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50ba4f:	df e0                	fnstsw ax
  50ba51:	a8 0d                	test   al,0xd
  50ba53:	0f 85 dc 1f 00 00    	jne    0x50da35
  50ba59:	de c1                	faddp  st(1),st
  50ba5b:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50ba62:	75 04                	jne    0x50ba68
  50ba64:	de f9                	fdivp  st(1),st
  50ba66:	eb 09                	jmp    0x50ba71
  50ba68:	50                   	push   eax
  50ba69:	b0 0d                	mov    al,0xd
  50ba6b:	e8 ca 8c ef ff       	call   0x40473a
  50ba70:	58                   	pop    eax
  50ba71:	d9 1d f0 b7 54 00    	fstp   DWORD PTR ds:0x54b7f0
  50ba77:	df e0                	fnstsw ax
  50ba79:	a8 0d                	test   al,0xd
  50ba7b:	0f 85 b4 1f 00 00    	jne    0x50da35
  50ba81:	89 1d a8 b4 54 00    	mov    DWORD PTR ds:0x54b4a8,ebx
  50ba87:	e9 5b 03 00 00       	jmp    0x50bde7
  50ba8c:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50ba92:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50ba98:	d9 9d 90 fe ff ff    	fstp   DWORD PTR [ebp-0x170]
  50ba9e:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50baa4:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50baaa:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50bab0:	d8 85 90 fe ff ff    	fadd   DWORD PTR [ebp-0x170]
  50bab6:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50babd:	75 08                	jne    0x50bac7
  50babf:	d8 bd 90 fe ff ff    	fdivr  DWORD PTR [ebp-0x170]
  50bac5:	eb 0b                	jmp    0x50bad2
  50bac7:	ff b5 90 fe ff ff    	push   DWORD PTR [ebp-0x170]
  50bacd:	e8 74 8c ef ff       	call   0x404746
  50bad2:	d9 1d ec b7 54 00    	fstp   DWORD PTR ds:0x54b7ec
  50bad8:	df e0                	fnstsw ax
  50bada:	a8 0d                	test   al,0xd
  50badc:	0f 85 53 1f 00 00    	jne    0x50da35
  50bae2:	d9 05 84 b6 54 00    	fld    DWORD PTR ds:0x54b684
  50bae8:	dc 0d f8 34 40 00    	fmul   QWORD PTR ds:0x4034f8
  50baee:	df e0                	fnstsw ax
  50baf0:	a8 0d                	test   al,0xd
  50baf2:	0f 85 3d 1f 00 00    	jne    0x50da35
  50baf8:	d9 9d 8c fe ff ff    	fstp   DWORD PTR [ebp-0x174]
  50bafe:	d9 85 8c fe ff ff    	fld    DWORD PTR [ebp-0x174]
  50bb04:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50bb0a:	d8 1d 94 b4 54 00    	fcomp  DWORD PTR ds:0x54b494
  50bb10:	df e0                	fnstsw ax
  50bb12:	f6 c4 01             	test   ah,0x1
  50bb15:	75 05                	jne    0x50bb1c
  50bb17:	89 5d ac             	mov    DWORD PTR [ebp-0x54],ebx
  50bb1a:	eb 6b                	jmp    0x50bb87
  50bb1c:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  50bb22:	d9 05 84 b6 54 00    	fld    DWORD PTR ds:0x54b684
  50bb28:	dc 0d f8 34 40 00    	fmul   QWORD PTR ds:0x4034f8
  50bb2e:	de e9                	fsubp  st(1),st
  50bb30:	d9 05 f4 34 40 00    	fld    DWORD PTR ds:0x4034f4
  50bb36:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50bb3d:	75 08                	jne    0x50bb47
  50bb3f:	d8 35 4c b6 54 00    	fdiv   DWORD PTR ds:0x54b64c
  50bb45:	eb 0b                	jmp    0x50bb52
  50bb47:	ff 35 4c b6 54 00    	push   DWORD PTR ds:0x54b64c
  50bb4d:	e8 d6 8b ef ff       	call   0x404728
  50bb52:	df e0                	fnstsw ax
  50bb54:	a8 0d                	test   al,0xd
  50bb56:	0f 85 d9 1e 00 00    	jne    0x50da35
  50bb5c:	de c9                	fmulp  st(1),st
  50bb5e:	df e0                	fnstsw ax
  50bb60:	a8 0d                	test   al,0xd
  50bb62:	0f 85 cd 1e 00 00    	jne    0x50da35
  50bb68:	83 ec 08             	sub    esp,0x8
  50bb6b:	dd 1c 24             	fstp   QWORD PTR [esp]
  50bb6e:	ff 15 28 12 40 00    	call   DWORD PTR ds:0x401228
  50bb74:	d8 0d b0 ba 54 00    	fmul   DWORD PTR ds:0x54bab0
  50bb7a:	d9 5d ac             	fstp   DWORD PTR [ebp-0x54]
  50bb7d:	df e0                	fnstsw ax
  50bb7f:	a8 0d                	test   al,0xd
  50bb81:	0f 85 ae 1e 00 00    	jne    0x50da35
  50bb87:	89 b5 dc fe ff ff    	mov    DWORD PTR [ebp-0x124],esi
  50bb8d:	8d 8d dc fe ff ff    	lea    ecx,[ebp-0x124]
  50bb93:	51                   	push   ecx
  50bb94:	68 94 b4 54 00       	push   0x54b494
  50bb99:	e8 02 f8 f8 ff       	call   0x49b3a0
  50bb9e:	d8 0d b0 ba 54 00    	fmul   DWORD PTR ds:0x54bab0
  50bba4:	d9 5d c0             	fstp   DWORD PTR [ebp-0x40]
  50bba7:	df e0                	fnstsw ax
  50bba9:	a8 0d                	test   al,0xd
  50bbab:	0f 85 84 1e 00 00    	jne    0x50da35
  50bbb1:	89 bd dc fe ff ff    	mov    DWORD PTR [ebp-0x124],edi
  50bbb7:	8d 95 dc fe ff ff    	lea    edx,[ebp-0x124]
  50bbbd:	52                   	push   edx
  50bbbe:	68 94 b4 54 00       	push   0x54b494
  50bbc3:	e8 d8 f7 f8 ff       	call   0x49b3a0
  50bbc8:	d8 0d b0 ba 54 00    	fmul   DWORD PTR ds:0x54bab0
  50bbce:	d9 1d 68 b6 54 00    	fstp   DWORD PTR ds:0x54b668
  50bbd4:	df e0                	fnstsw ax
  50bbd6:	a8 0d                	test   al,0xd
  50bbd8:	0f 85 57 1e 00 00    	jne    0x50da35
  50bbde:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  50bbe4:	d8 1d 44 b5 54 00    	fcomp  DWORD PTR ds:0x54b544
  50bbea:	df e0                	fnstsw ax
  50bbec:	f6 c4 01             	test   ah,0x1
  50bbef:	74 06                	je     0x50bbf7
  50bbf1:	89 1d 68 b6 54 00    	mov    DWORD PTR ds:0x54b668,ebx
  50bbf7:	d9 05 e0 b2 54 00    	fld    DWORD PTR ds:0x54b2e0
  50bbfd:	d8 05 44 b5 54 00    	fadd   DWORD PTR ds:0x54b544
  50bc03:	df e0                	fnstsw ax
  50bc05:	a8 0d                	test   al,0xd
  50bc07:	0f 85 28 1e 00 00    	jne    0x50da35
  50bc0d:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50bc13:	d8 1d 94 b4 54 00    	fcomp  DWORD PTR ds:0x54b494
  50bc19:	df e0                	fnstsw ax
  50bc1b:	f6 c4 41             	test   ah,0x41
  50bc1e:	75 28                	jne    0x50bc48
  50bc20:	66 39 1d ea b4 54 00 	cmp    WORD PTR ds:0x54b4ea,bx
  50bc27:	75 1f                	jne    0x50bc48
  50bc29:	a1 68 b6 54 00       	mov    eax,ds:0x54b668
  50bc2e:	a3 6c b6 54 00       	mov    ds:0x54b66c,eax
  50bc33:	8b 4d c0             	mov    ecx,DWORD PTR [ebp-0x40]
  50bc36:	89 0d 70 b6 54 00    	mov    DWORD PTR ds:0x54b670,ecx
  50bc3c:	66 89 35 ea b4 54 00 	mov    WORD PTR ds:0x54b4ea,si
  50bc43:	e9 84 00 00 00       	jmp    0x50bccc
  50bc48:	66 39 35 ea b4 54 00 	cmp    WORD PTR ds:0x54b4ea,si
  50bc4f:	75 7b                	jne    0x50bccc
  50bc51:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  50bc57:	d8 1d 44 b5 54 00    	fcomp  DWORD PTR ds:0x54b544
  50bc5d:	df e0                	fnstsw ax
  50bc5f:	f6 c4 41             	test   ah,0x41
  50bc62:	75 62                	jne    0x50bcc6
  50bc64:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  50bc6a:	d8 25 44 b5 54 00    	fsub   DWORD PTR ds:0x54b544
  50bc70:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50bc77:	75 08                	jne    0x50bc81
  50bc79:	d8 35 e0 b2 54 00    	fdiv   DWORD PTR ds:0x54b2e0
  50bc7f:	eb 0b                	jmp    0x50bc8c
  50bc81:	ff 35 e0 b2 54 00    	push   DWORD PTR ds:0x54b2e0
  50bc87:	e8 9c 8a ef ff       	call   0x404728
  50bc8c:	df e0                	fnstsw ax
  50bc8e:	a8 0d                	test   al,0xd
  50bc90:	0f 85 9f 1d 00 00    	jne    0x50da35
  50bc96:	83 ec 08             	sub    esp,0x8
  50bc99:	dd 1c 24             	fstp   QWORD PTR [esp]
  50bc9c:	ff 15 28 12 40 00    	call   DWORD PTR ds:0x401228
  50bca2:	dd 9d cc fe ff ff    	fstp   QWORD PTR [ebp-0x134]
  50bca8:	d9 05 6c b6 54 00    	fld    DWORD PTR ds:0x54b66c
  50bcae:	dc 8d cc fe ff ff    	fmul   QWORD PTR [ebp-0x134]
  50bcb4:	d9 1d 68 b6 54 00    	fstp   DWORD PTR ds:0x54b668
  50bcba:	df e0                	fnstsw ax
  50bcbc:	a8 0d                	test   al,0xd
  50bcbe:	0f 85 71 1d 00 00    	jne    0x50da35
  50bcc4:	eb 06                	jmp    0x50bccc
  50bcc6:	89 1d 68 b6 54 00    	mov    DWORD PTR ds:0x54b668,ebx
  50bccc:	d9 05 34 ba 54 00    	fld    DWORD PTR ds:0x54ba34
  50bcd2:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50bcd8:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  50bcdb:	d9 05 34 ba 54 00    	fld    DWORD PTR ds:0x54ba34
  50bce1:	d8 0d 68 b6 54 00    	fmul   DWORD PTR ds:0x54b668
  50bce7:	df e0                	fnstsw ax
  50bce9:	a8 0d                	test   al,0xd
  50bceb:	0f 85 44 1d 00 00    	jne    0x50da35
  50bcf1:	de c1                	faddp  st(1),st
  50bcf3:	d9 5d b4             	fstp   DWORD PTR [ebp-0x4c]
  50bcf6:	df e0                	fnstsw ax
  50bcf8:	a8 0d                	test   al,0xd
  50bcfa:	0f 85 35 1d 00 00    	jne    0x50da35
  50bd00:	d9 05 34 ba 54 00    	fld    DWORD PTR ds:0x54ba34
  50bd06:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50bd0c:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  50bd0f:	d8 0d 28 b7 54 00    	fmul   DWORD PTR ds:0x54b728
  50bd15:	d9 05 34 ba 54 00    	fld    DWORD PTR ds:0x54ba34
  50bd1b:	d8 0d 68 b6 54 00    	fmul   DWORD PTR ds:0x54b668
  50bd21:	d8 0d 24 b7 54 00    	fmul   DWORD PTR ds:0x54b724
  50bd27:	df e0                	fnstsw ax
  50bd29:	a8 0d                	test   al,0xd
  50bd2b:	0f 85 04 1d 00 00    	jne    0x50da35
  50bd31:	de c1                	faddp  st(1),st
  50bd33:	d9 05 34 ba 54 00    	fld    DWORD PTR ds:0x54ba34
  50bd39:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50bd3f:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  50bd42:	d9 05 34 ba 54 00    	fld    DWORD PTR ds:0x54ba34
  50bd48:	d8 0d 68 b6 54 00    	fmul   DWORD PTR ds:0x54b668
  50bd4e:	df e0                	fnstsw ax
  50bd50:	a8 0d                	test   al,0xd
  50bd52:	0f 85 dd 1c 00 00    	jne    0x50da35
  50bd58:	de c1                	faddp  st(1),st
  50bd5a:	dc 05 38 30 40 00    	fadd   QWORD PTR ds:0x403038
  50bd60:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50bd67:	75 04                	jne    0x50bd6d
  50bd69:	de f9                	fdivp  st(1),st
  50bd6b:	eb 09                	jmp    0x50bd76
  50bd6d:	50                   	push   eax
  50bd6e:	b0 0d                	mov    al,0xd
  50bd70:	e8 c5 89 ef ff       	call   0x40473a
  50bd75:	58                   	pop    eax
  50bd76:	d9 5d a8             	fstp   DWORD PTR [ebp-0x58]
  50bd79:	df e0                	fnstsw ax
  50bd7b:	a8 0d                	test   al,0xd
  50bd7d:	0f 85 b2 1c 00 00    	jne    0x50da35
  50bd83:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50bd89:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50bd8f:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50bd95:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50bd9b:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50bda1:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50bda7:	df e0                	fnstsw ax
  50bda9:	a8 0d                	test   al,0xd
  50bdab:	0f 85 84 1c 00 00    	jne    0x50da35
  50bdb1:	de c1                	faddp  st(1),st
  50bdb3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50bdba:	75 04                	jne    0x50bdc0
  50bdbc:	de f9                	fdivp  st(1),st
  50bdbe:	eb 09                	jmp    0x50bdc9
  50bdc0:	50                   	push   eax
  50bdc1:	b0 0d                	mov    al,0xd
  50bdc3:	e8 72 89 ef ff       	call   0x40473a
  50bdc8:	58                   	pop    eax
  50bdc9:	d9 1d f0 b7 54 00    	fstp   DWORD PTR ds:0x54b7f0
  50bdcf:	df e0                	fnstsw ax
  50bdd1:	a8 0d                	test   al,0xd
  50bdd3:	0f 85 5c 1c 00 00    	jne    0x50da35
  50bdd9:	66 8b 15 d6 b4 54 00 	mov    dx,WORD PTR ds:0x54b4d6
  50bde0:	66 8b 0d d8 b4 54 00 	mov    cx,WORD PTR ds:0x54b4d8
  50bde7:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50bded:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50bdf3:	d8 0d 28 b7 54 00    	fmul   DWORD PTR ds:0x54b728
  50bdf9:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50bdff:	d8 0d 24 b7 54 00    	fmul   DWORD PTR ds:0x54b724
  50be05:	df e0                	fnstsw ax
  50be07:	a8 0d                	test   al,0xd
  50be09:	0f 85 26 1c 00 00    	jne    0x50da35
  50be0f:	de c1                	faddp  st(1),st
  50be11:	d9 9d 74 ff ff ff    	fstp   DWORD PTR [ebp-0x8c]
  50be17:	df e0                	fnstsw ax
  50be19:	a8 0d                	test   al,0xd
  50be1b:	0f 85 14 1c 00 00    	jne    0x50da35
  50be21:	d9 45 e0             	fld    DWORD PTR [ebp-0x20]
  50be24:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50be2a:	d8 0d ac b4 54 00    	fmul   DWORD PTR ds:0x54b4ac
  50be30:	d9 05 3c b7 54 00    	fld    DWORD PTR ds:0x54b73c
  50be36:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50be3c:	d8 0d a8 b6 54 00    	fmul   DWORD PTR ds:0x54b6a8
  50be42:	de e9                	fsubp  st(1),st
  50be44:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50be4b:	75 08                	jne    0x50be55
  50be4d:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50be53:	eb 0b                	jmp    0x50be60
  50be55:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50be5b:	e8 c8 88 ef ff       	call   0x404728
  50be60:	d9 5d c8             	fstp   DWORD PTR [ebp-0x38]
  50be63:	df e0                	fnstsw ax
  50be65:	a8 0d                	test   al,0xd
  50be67:	0f 85 c8 1b 00 00    	jne    0x50da35
  50be6d:	66 3b d3             	cmp    dx,bx
  50be70:	0f 85 f2 02 00 00    	jne    0x50c168
  50be76:	66 3b cb             	cmp    cx,bx
  50be79:	0f 85 5b 01 00 00    	jne    0x50bfda
  50be7f:	8b 55 ac             	mov    edx,DWORD PTR [ebp-0x54]
  50be82:	89 15 a4 b6 54 00    	mov    DWORD PTR ds:0x54b6a4,edx
  50be88:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [ebp-0xb0]
  50be8e:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
  50be94:	d9 05 ac b4 54 00    	fld    DWORD PTR ds:0x54b4ac
  50be9a:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50bea0:	df e0                	fnstsw ax
  50bea2:	f6 c4 41             	test   ah,0x41
  50bea5:	74 4c                	je     0x50bef3
  50bea7:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50bead:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50beb3:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50beb9:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50bebf:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50bec5:	de c1                	faddp  st(1),st
  50bec7:	d9 05 a8 b6 54 00    	fld    DWORD PTR ds:0x54b6a8
  50becd:	d8 25 ac b4 54 00    	fsub   DWORD PTR ds:0x54b4ac
  50bed3:	de c9                	fmulp  st(1),st
  50bed5:	d9 9d 78 ff ff ff    	fstp   DWORD PTR [ebp-0x88]
  50bedb:	df e0                	fnstsw ax
  50bedd:	a8 0d                	test   al,0xd
  50bedf:	0f 85 50 1b 00 00    	jne    0x50da35
  50bee5:	8b 4d c8             	mov    ecx,DWORD PTR [ebp-0x38]
  50bee8:	89 8d 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],ecx
  50beee:	e9 98 00 00 00       	jmp    0x50bf8b
  50bef3:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50bef9:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50beff:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50bf05:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50bf0b:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50bf11:	df e0                	fnstsw ax
  50bf13:	a8 0d                	test   al,0xd
  50bf15:	0f 85 1a 1b 00 00    	jne    0x50da35
  50bf1b:	de c1                	faddp  st(1),st
  50bf1d:	d8 0d a8 b6 54 00    	fmul   DWORD PTR ds:0x54b6a8
  50bf23:	d8 05 88 b7 54 00    	fadd   DWORD PTR ds:0x54b788
  50bf29:	d9 9d 78 ff ff ff    	fstp   DWORD PTR [ebp-0x88]
  50bf2f:	df e0                	fnstsw ax
  50bf31:	a8 0d                	test   al,0xd
  50bf33:	0f 85 fc 1a 00 00    	jne    0x50da35
  50bf39:	d9 05 88 b7 54 00    	fld    DWORD PTR ds:0x54b788
  50bf3f:	d8 0d 34 b3 54 00    	fmul   DWORD PTR ds:0x54b334
  50bf45:	d8 0d 94 b4 54 00    	fmul   DWORD PTR ds:0x54b494
  50bf4b:	d9 05 3c b7 54 00    	fld    DWORD PTR ds:0x54b73c
  50bf51:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50bf57:	d8 0d a8 b6 54 00    	fmul   DWORD PTR ds:0x54b6a8
  50bf5d:	de e9                	fsubp  st(1),st
  50bf5f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50bf66:	75 08                	jne    0x50bf70
  50bf68:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50bf6e:	eb 0b                	jmp    0x50bf7b
  50bf70:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50bf76:	e8 ad 87 ef ff       	call   0x404728
  50bf7b:	d9 9d 5c ff ff ff    	fstp   DWORD PTR [ebp-0xa4]
  50bf81:	df e0                	fnstsw ax
  50bf83:	a8 0d                	test   al,0xd
  50bf85:	0f 85 aa 1a 00 00    	jne    0x50da35
  50bf8b:	8b 15 9c b4 54 00    	mov    edx,DWORD PTR ds:0x54b49c
  50bf91:	89 15 98 b4 54 00    	mov    DWORD PTR ds:0x54b498,edx
  50bf97:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50bf9d:	d8 0d a4 b4 54 00    	fmul   DWORD PTR ds:0x54b4a4
  50bfa3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50bfaa:	75 08                	jne    0x50bfb4
  50bfac:	d8 35 9c b1 54 00    	fdiv   DWORD PTR ds:0x54b19c
  50bfb2:	eb 0b                	jmp    0x50bfbf
  50bfb4:	ff 35 9c b1 54 00    	push   DWORD PTR ds:0x54b19c
  50bfba:	e8 69 87 ef ff       	call   0x404728
  50bfbf:	d8 2d f8 13 40 00    	fsubr  DWORD PTR ds:0x4013f8
  50bfc5:	d9 1d a0 b4 54 00    	fstp   DWORD PTR ds:0x54b4a0
  50bfcb:	df e0                	fnstsw ax
  50bfcd:	a8 0d                	test   al,0xd
  50bfcf:	0f 85 60 1a 00 00    	jne    0x50da35
  50bfd5:	e9 ad 05 00 00       	jmp    0x50c587
  50bfda:	66 3b d3             	cmp    dx,bx
  50bfdd:	0f 85 85 01 00 00    	jne    0x50c168
  50bfe3:	66 3b ce             	cmp    cx,si
  50bfe6:	0f 85 7c 01 00 00    	jne    0x50c168
  50bfec:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  50bfef:	a3 a4 b6 54 00       	mov    ds:0x54b6a4,eax
  50bff4:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  50bff7:	89 4d 88             	mov    DWORD PTR [ebp-0x78],ecx
  50bffa:	d9 05 f8 b2 54 00    	fld    DWORD PTR ds:0x54b2f8
  50c000:	d8 0d ac b1 54 00    	fmul   DWORD PTR ds:0x54b1ac
  50c006:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c00d:	75 08                	jne    0x50c017
  50c00f:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50c015:	eb 0b                	jmp    0x50c022
  50c017:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50c01d:	e8 06 87 ef ff       	call   0x404728
  50c022:	d8 0d 78 b7 54 00    	fmul   DWORD PTR ds:0x54b778
  50c028:	d8 85 50 ff ff ff    	fadd   DWORD PTR [ebp-0xb0]
  50c02e:	d9 9d 68 ff ff ff    	fstp   DWORD PTR [ebp-0x98]
  50c034:	df e0                	fnstsw ax
  50c036:	a8 0d                	test   al,0xd
  50c038:	0f 85 f7 19 00 00    	jne    0x50da35
  50c03e:	d9 05 c8 b6 54 00    	fld    DWORD PTR ds:0x54b6c8
  50c044:	d8 45 b4             	fadd   DWORD PTR [ebp-0x4c]
  50c047:	d8 05 cc b6 54 00    	fadd   DWORD PTR ds:0x54b6cc
  50c04d:	d8 05 b0 b6 54 00    	fadd   DWORD PTR ds:0x54b6b0
  50c053:	d8 05 d8 b6 54 00    	fadd   DWORD PTR ds:0x54b6d8
  50c059:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  50c05f:	df e0                	fnstsw ax
  50c061:	a8 0d                	test   al,0xd
  50c063:	0f 85 cc 19 00 00    	jne    0x50da35
  50c069:	a1 90 b6 54 00       	mov    eax,ds:0x54b690
  50c06e:	a3 98 b4 54 00       	mov    ds:0x54b498,eax
  50c073:	a3 9c b4 54 00       	mov    ds:0x54b49c,eax
  50c078:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50c07e:	d8 0d a4 b4 54 00    	fmul   DWORD PTR ds:0x54b4a4
  50c084:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c08b:	75 08                	jne    0x50c095
  50c08d:	d8 35 9c b1 54 00    	fdiv   DWORD PTR ds:0x54b19c
  50c093:	eb 0b                	jmp    0x50c0a0
  50c095:	ff 35 9c b1 54 00    	push   DWORD PTR ds:0x54b19c
  50c09b:	e8 88 86 ef ff       	call   0x404728
  50c0a0:	d8 2d f8 13 40 00    	fsubr  DWORD PTR ds:0x4013f8
  50c0a6:	d9 1d a0 b4 54 00    	fstp   DWORD PTR ds:0x54b4a0
  50c0ac:	df e0                	fnstsw ax
  50c0ae:	a8 0d                	test   al,0xd
  50c0b0:	0f 85 7f 19 00 00    	jne    0x50da35
  50c0b6:	d9 05 2c b7 54 00    	fld    DWORD PTR ds:0x54b72c
  50c0bc:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50c0c2:	d8 0d c4 b6 54 00    	fmul   DWORD PTR ds:0x54b6c4
  50c0c8:	d9 05 3c b7 54 00    	fld    DWORD PTR ds:0x54b73c
  50c0ce:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50c0d4:	d8 0d a8 b6 54 00    	fmul   DWORD PTR ds:0x54b6a8
  50c0da:	de e9                	fsubp  st(1),st
  50c0dc:	d9 45 a8             	fld    DWORD PTR [ebp-0x58]
  50c0df:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50c0e5:	d8 8d 54 ff ff ff    	fmul   DWORD PTR [ebp-0xac]
  50c0eb:	de e9                	fsubp  st(1),st
  50c0ed:	d8 05 78 b6 54 00    	fadd   DWORD PTR ds:0x54b678
  50c0f3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c0fa:	75 08                	jne    0x50c104
  50c0fc:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50c102:	eb 0b                	jmp    0x50c10f
  50c104:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50c10a:	e8 19 86 ef ff       	call   0x404728
  50c10f:	d9 9d 5c ff ff ff    	fstp   DWORD PTR [ebp-0xa4]
  50c115:	df e0                	fnstsw ax
  50c117:	a8 0d                	test   al,0xd
  50c119:	0f 85 16 19 00 00    	jne    0x50da35
  50c11f:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50c125:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50c12b:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50c131:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50c137:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50c13d:	de c1                	faddp  st(1),st
  50c13f:	d9 05 a8 b6 54 00    	fld    DWORD PTR ds:0x54b6a8
  50c145:	d8 85 54 ff ff ff    	fadd   DWORD PTR [ebp-0xac]
  50c14b:	d8 25 c4 b6 54 00    	fsub   DWORD PTR ds:0x54b6c4
  50c151:	de c9                	fmulp  st(1),st
  50c153:	d9 9d 78 ff ff ff    	fstp   DWORD PTR [ebp-0x88]
  50c159:	df e0                	fnstsw ax
  50c15b:	a8 0d                	test   al,0xd
  50c15d:	0f 85 d2 18 00 00    	jne    0x50da35
  50c163:	e9 1f 04 00 00       	jmp    0x50c587
  50c168:	66 3b d6             	cmp    dx,si
  50c16b:	0f 85 16 04 00 00    	jne    0x50c587
  50c171:	66 3b cb             	cmp    cx,bx
  50c174:	0f 85 2c 02 00 00    	jne    0x50c3a6
  50c17a:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50c180:	d8 0d a4 b4 54 00    	fmul   DWORD PTR ds:0x54b4a4
  50c186:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c18d:	75 08                	jne    0x50c197
  50c18f:	d8 35 9c b1 54 00    	fdiv   DWORD PTR ds:0x54b19c
  50c195:	eb 0b                	jmp    0x50c1a2
  50c197:	ff 35 9c b1 54 00    	push   DWORD PTR ds:0x54b19c
  50c19d:	e8 86 85 ef ff       	call   0x404728
  50c1a2:	d8 2d f8 13 40 00    	fsubr  DWORD PTR ds:0x4013f8
  50c1a8:	d9 1d a0 b4 54 00    	fstp   DWORD PTR ds:0x54b4a0
  50c1ae:	df e0                	fnstsw ax
  50c1b0:	a8 0d                	test   al,0xd
  50c1b2:	0f 85 7d 18 00 00    	jne    0x50da35
  50c1b8:	8b 95 50 ff ff ff    	mov    edx,DWORD PTR [ebp-0xb0]
  50c1be:	89 95 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],edx
  50c1c4:	d9 05 a0 b4 54 00    	fld    DWORD PTR ds:0x54b4a0
  50c1ca:	d8 1d 04 b4 54 00    	fcomp  DWORD PTR ds:0x54b404
  50c1d0:	df e0                	fnstsw ax
  50c1d2:	f6 c4 41             	test   ah,0x41
  50c1d5:	75 41                	jne    0x50c218
  50c1d7:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
  50c1da:	a3 a4 b6 54 00       	mov    ds:0x54b6a4,eax
  50c1df:	d9 05 c8 b6 54 00    	fld    DWORD PTR ds:0x54b6c8
  50c1e5:	d8 45 ac             	fadd   DWORD PTR [ebp-0x54]
  50c1e8:	d8 05 cc b6 54 00    	fadd   DWORD PTR ds:0x54b6cc
  50c1ee:	d8 05 b0 b6 54 00    	fadd   DWORD PTR ds:0x54b6b0
  50c1f4:	d8 05 d8 b6 54 00    	fadd   DWORD PTR ds:0x54b6d8
  50c1fa:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  50c200:	df e0                	fnstsw ax
  50c202:	a8 0d                	test   al,0xd
  50c204:	0f 85 2b 18 00 00    	jne    0x50da35
  50c20a:	8b 0d 34 b7 54 00    	mov    ecx,DWORD PTR ds:0x54b734
  50c210:	89 4d 88             	mov    DWORD PTR [ebp-0x78],ecx
  50c213:	e9 88 00 00 00       	jmp    0x50c2a0
  50c218:	d9 05 a0 b4 54 00    	fld    DWORD PTR ds:0x54b4a0
  50c21e:	d8 1d fc b3 54 00    	fcomp  DWORD PTR ds:0x54b3fc
  50c224:	df e0                	fnstsw ax
  50c226:	f6 c4 41             	test   ah,0x41
  50c229:	75 38                	jne    0x50c263
  50c22b:	8b 55 c0             	mov    edx,DWORD PTR [ebp-0x40]
  50c22e:	89 15 a4 b6 54 00    	mov    DWORD PTR ds:0x54b6a4,edx
  50c234:	d9 05 c8 b6 54 00    	fld    DWORD PTR ds:0x54b6c8
  50c23a:	d8 45 c0             	fadd   DWORD PTR [ebp-0x40]
  50c23d:	d8 05 cc b6 54 00    	fadd   DWORD PTR ds:0x54b6cc
  50c243:	d8 05 b0 b6 54 00    	fadd   DWORD PTR ds:0x54b6b0
  50c249:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  50c24f:	df e0                	fnstsw ax
  50c251:	a8 0d                	test   al,0xd
  50c253:	0f 85 dc 17 00 00    	jne    0x50da35
  50c259:	a1 28 b7 54 00       	mov    eax,ds:0x54b728
  50c25e:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
  50c261:	eb 3d                	jmp    0x50c2a0
  50c263:	8b 0d 68 b6 54 00    	mov    ecx,DWORD PTR ds:0x54b668
  50c269:	89 0d a4 b6 54 00    	mov    DWORD PTR ds:0x54b6a4,ecx
  50c26f:	d9 05 68 b6 54 00    	fld    DWORD PTR ds:0x54b668
  50c275:	d8 05 c8 b6 54 00    	fadd   DWORD PTR ds:0x54b6c8
  50c27b:	d8 05 cc b6 54 00    	fadd   DWORD PTR ds:0x54b6cc
  50c281:	d8 05 b0 b6 54 00    	fadd   DWORD PTR ds:0x54b6b0
  50c287:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  50c28d:	df e0                	fnstsw ax
  50c28f:	a8 0d                	test   al,0xd
  50c291:	0f 85 9e 17 00 00    	jne    0x50da35
  50c297:	8b 15 24 b7 54 00    	mov    edx,DWORD PTR ds:0x54b724
  50c29d:	89 55 88             	mov    DWORD PTR [ebp-0x78],edx
  50c2a0:	a1 9c b4 54 00       	mov    eax,ds:0x54b49c
  50c2a5:	a3 98 b4 54 00       	mov    ds:0x54b498,eax
  50c2aa:	d9 05 ac b4 54 00    	fld    DWORD PTR ds:0x54b4ac
  50c2b0:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50c2b6:	df e0                	fnstsw ax
  50c2b8:	f6 c4 41             	test   ah,0x41
  50c2bb:	74 4c                	je     0x50c309
  50c2bd:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50c2c3:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50c2c9:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50c2cf:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50c2d5:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50c2db:	de c1                	faddp  st(1),st
  50c2dd:	d9 05 a8 b6 54 00    	fld    DWORD PTR ds:0x54b6a8
  50c2e3:	d8 25 ac b4 54 00    	fsub   DWORD PTR ds:0x54b4ac
  50c2e9:	de c9                	fmulp  st(1),st
  50c2eb:	d9 9d 78 ff ff ff    	fstp   DWORD PTR [ebp-0x88]
  50c2f1:	df e0                	fnstsw ax
  50c2f3:	a8 0d                	test   al,0xd
  50c2f5:	0f 85 3a 17 00 00    	jne    0x50da35
  50c2fb:	8b 4d c8             	mov    ecx,DWORD PTR [ebp-0x38]
  50c2fe:	89 8d 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],ecx
  50c304:	e9 7e 02 00 00       	jmp    0x50c587
  50c309:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50c30f:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50c315:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50c31b:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50c321:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50c327:	df e0                	fnstsw ax
  50c329:	a8 0d                	test   al,0xd
  50c32b:	0f 85 04 17 00 00    	jne    0x50da35
  50c331:	de c1                	faddp  st(1),st
  50c333:	d8 0d a8 b6 54 00    	fmul   DWORD PTR ds:0x54b6a8
  50c339:	d8 05 88 b7 54 00    	fadd   DWORD PTR ds:0x54b788
  50c33f:	d9 9d 78 ff ff ff    	fstp   DWORD PTR [ebp-0x88]
  50c345:	df e0                	fnstsw ax
  50c347:	a8 0d                	test   al,0xd
  50c349:	0f 85 e6 16 00 00    	jne    0x50da35
  50c34f:	d9 05 88 b7 54 00    	fld    DWORD PTR ds:0x54b788
  50c355:	d8 0d 34 b3 54 00    	fmul   DWORD PTR ds:0x54b334
  50c35b:	d8 0d 94 b4 54 00    	fmul   DWORD PTR ds:0x54b494
  50c361:	d9 05 3c b7 54 00    	fld    DWORD PTR ds:0x54b73c
  50c367:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50c36d:	d8 0d a8 b6 54 00    	fmul   DWORD PTR ds:0x54b6a8
  50c373:	de e9                	fsubp  st(1),st
  50c375:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c37c:	75 08                	jne    0x50c386
  50c37e:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50c384:	eb 0b                	jmp    0x50c391
  50c386:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50c38c:	e8 97 83 ef ff       	call   0x404728
  50c391:	d9 9d 5c ff ff ff    	fstp   DWORD PTR [ebp-0xa4]
  50c397:	df e0                	fnstsw ax
  50c399:	a8 0d                	test   al,0xd
  50c39b:	0f 85 94 16 00 00    	jne    0x50da35
  50c3a1:	e9 e1 01 00 00       	jmp    0x50c587
  50c3a6:	66 3b d6             	cmp    dx,si
  50c3a9:	0f 85 d8 01 00 00    	jne    0x50c587
  50c3af:	66 3b ce             	cmp    cx,si
  50c3b2:	0f 85 cf 01 00 00    	jne    0x50c587
  50c3b8:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50c3be:	d8 0d a4 b4 54 00    	fmul   DWORD PTR ds:0x54b4a4
  50c3c4:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c3cb:	75 08                	jne    0x50c3d5
  50c3cd:	d8 35 9c b1 54 00    	fdiv   DWORD PTR ds:0x54b19c
  50c3d3:	eb 0b                	jmp    0x50c3e0
  50c3d5:	ff 35 9c b1 54 00    	push   DWORD PTR ds:0x54b19c
  50c3db:	e8 48 83 ef ff       	call   0x404728
  50c3e0:	d8 2d f8 13 40 00    	fsubr  DWORD PTR ds:0x4013f8
  50c3e6:	d9 1d a0 b4 54 00    	fstp   DWORD PTR ds:0x54b4a0
  50c3ec:	df e0                	fnstsw ax
  50c3ee:	a8 0d                	test   al,0xd
  50c3f0:	0f 85 3f 16 00 00    	jne    0x50da35
  50c3f6:	d9 05 a0 b4 54 00    	fld    DWORD PTR ds:0x54b4a0
  50c3fc:	d8 1d fc b3 54 00    	fcomp  DWORD PTR ds:0x54b3fc
  50c402:	df e0                	fnstsw ax
  50c404:	f6 c4 01             	test   ah,0x1
  50c407:	74 44                	je     0x50c44d
  50c409:	8b 15 68 b6 54 00    	mov    edx,DWORD PTR ds:0x54b668
  50c40f:	89 15 a4 b6 54 00    	mov    DWORD PTR ds:0x54b6a4,edx
  50c415:	d9 05 68 b6 54 00    	fld    DWORD PTR ds:0x54b668
  50c41b:	d8 05 c8 b6 54 00    	fadd   DWORD PTR ds:0x54b6c8
  50c421:	d8 05 cc b6 54 00    	fadd   DWORD PTR ds:0x54b6cc
  50c427:	d8 05 b0 b6 54 00    	fadd   DWORD PTR ds:0x54b6b0
  50c42d:	d8 05 d8 b6 54 00    	fadd   DWORD PTR ds:0x54b6d8
  50c433:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  50c439:	df e0                	fnstsw ax
  50c43b:	a8 0d                	test   al,0xd
  50c43d:	0f 85 f2 15 00 00    	jne    0x50da35
  50c443:	a1 24 b7 54 00       	mov    eax,ds:0x54b724
  50c448:	89 45 88             	mov    DWORD PTR [ebp-0x78],eax
  50c44b:	eb 3a                	jmp    0x50c487
  50c44d:	8b 4d b4             	mov    ecx,DWORD PTR [ebp-0x4c]
  50c450:	89 0d a4 b6 54 00    	mov    DWORD PTR ds:0x54b6a4,ecx
  50c456:	d9 05 c8 b6 54 00    	fld    DWORD PTR ds:0x54b6c8
  50c45c:	d8 45 b4             	fadd   DWORD PTR [ebp-0x4c]
  50c45f:	d8 05 cc b6 54 00    	fadd   DWORD PTR ds:0x54b6cc
  50c465:	d8 05 b0 b6 54 00    	fadd   DWORD PTR ds:0x54b6b0
  50c46b:	d8 05 d8 b6 54 00    	fadd   DWORD PTR ds:0x54b6d8
  50c471:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  50c477:	df e0                	fnstsw ax
  50c479:	a8 0d                	test   al,0xd
  50c47b:	0f 85 b4 15 00 00    	jne    0x50da35
  50c481:	8b 55 a8             	mov    edx,DWORD PTR [ebp-0x58]
  50c484:	89 55 88             	mov    DWORD PTR [ebp-0x78],edx
  50c487:	a1 90 b6 54 00       	mov    eax,ds:0x54b690
  50c48c:	a3 98 b4 54 00       	mov    ds:0x54b498,eax
  50c491:	a3 9c b4 54 00       	mov    ds:0x54b49c,eax
  50c496:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50c49c:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50c4a2:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50c4a8:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50c4ae:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50c4b4:	de c1                	faddp  st(1),st
  50c4b6:	d9 05 a8 b6 54 00    	fld    DWORD PTR ds:0x54b6a8
  50c4bc:	d8 85 54 ff ff ff    	fadd   DWORD PTR [ebp-0xac]
  50c4c2:	d8 25 c4 b6 54 00    	fsub   DWORD PTR ds:0x54b6c4
  50c4c8:	de c9                	fmulp  st(1),st
  50c4ca:	d9 9d 78 ff ff ff    	fstp   DWORD PTR [ebp-0x88]
  50c4d0:	df e0                	fnstsw ax
  50c4d2:	a8 0d                	test   al,0xd
  50c4d4:	0f 85 5b 15 00 00    	jne    0x50da35
  50c4da:	d9 05 2c b7 54 00    	fld    DWORD PTR ds:0x54b72c
  50c4e0:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50c4e6:	d8 0d c4 b6 54 00    	fmul   DWORD PTR ds:0x54b6c4
  50c4ec:	d9 05 3c b7 54 00    	fld    DWORD PTR ds:0x54b73c
  50c4f2:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50c4f8:	d8 0d a8 b6 54 00    	fmul   DWORD PTR ds:0x54b6a8
  50c4fe:	de e9                	fsubp  st(1),st
  50c500:	d9 45 88             	fld    DWORD PTR [ebp-0x78]
  50c503:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50c509:	d8 8d 54 ff ff ff    	fmul   DWORD PTR [ebp-0xac]
  50c50f:	de e9                	fsubp  st(1),st
  50c511:	d8 05 78 b6 54 00    	fadd   DWORD PTR ds:0x54b678
  50c517:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c51e:	75 08                	jne    0x50c528
  50c520:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50c526:	eb 0b                	jmp    0x50c533
  50c528:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50c52e:	e8 f5 81 ef ff       	call   0x404728
  50c533:	d9 9d 5c ff ff ff    	fstp   DWORD PTR [ebp-0xa4]
  50c539:	df e0                	fnstsw ax
  50c53b:	a8 0d                	test   al,0xd
  50c53d:	0f 85 f2 14 00 00    	jne    0x50da35
  50c543:	d9 05 f8 b2 54 00    	fld    DWORD PTR ds:0x54b2f8
  50c549:	d8 0d ac b1 54 00    	fmul   DWORD PTR ds:0x54b1ac
  50c54f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c556:	75 08                	jne    0x50c560
  50c558:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50c55e:	eb 0b                	jmp    0x50c56b
  50c560:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50c566:	e8 bd 81 ef ff       	call   0x404728
  50c56b:	d8 0d 78 b7 54 00    	fmul   DWORD PTR ds:0x54b778
  50c571:	d8 85 50 ff ff ff    	fadd   DWORD PTR [ebp-0xb0]
  50c577:	d9 9d 68 ff ff ff    	fstp   DWORD PTR [ebp-0x98]
  50c57d:	df e0                	fnstsw ax
  50c57f:	a8 0d                	test   al,0xd
  50c581:	0f 85 ae 14 00 00    	jne    0x50da35
  50c587:	68 9c b4 54 00       	push   0x54b49c
  50c58c:	e8 4f f8 f8 ff       	call   0x49bde0
  50c591:	d9 1d 84 b6 54 00    	fstp   DWORD PTR ds:0x54b684
  50c597:	68 9c b4 54 00       	push   0x54b49c
  50c59c:	68 94 b4 54 00       	push   0x54b494
  50c5a1:	e8 3a fc f8 ff       	call   0x49c1e0
  50c5a6:	d9 1d 54 b6 54 00    	fstp   DWORD PTR ds:0x54b654
  50c5ac:	68 ec b6 54 00       	push   0x54b6ec
  50c5b1:	68 dc b1 54 00       	push   0x54b1dc
  50c5b6:	68 d8 b1 54 00       	push   0x54b1d8
  50c5bb:	68 d0 b6 54 00       	push   0x54b6d0
  50c5c0:	8d 85 30 ff ff ff    	lea    eax,[ebp-0xd0]
  50c5c6:	50                   	push   eax
  50c5c7:	e8 84 43 ff ff       	call   0x500950
  50c5cc:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50c5d2:	51                   	push   ecx
  50c5d3:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  50c5d9:	dd d8                	fstp   st(0)
  50c5db:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50c5e1:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  50c5e7:	d9 05 c0 b6 54 00    	fld    DWORD PTR ds:0x54b6c0
  50c5ed:	d8 1d f0 34 40 00    	fcomp  DWORD PTR ds:0x4034f0
  50c5f3:	df e0                	fnstsw ax
  50c5f5:	f6 c4 41             	test   ah,0x41
  50c5f8:	74 09                	je     0x50c603
  50c5fa:	66 39 1d e2 b4 54 00 	cmp    WORD PTR ds:0x54b4e2,bx
  50c601:	75 07                	jne    0x50c60a
  50c603:	66 89 1d ec b6 54 00 	mov    WORD PTR ds:0x54b6ec,bx
  50c60a:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50c60f:	8b 10                	mov    edx,DWORD PTR [eax]
  50c611:	50                   	push   eax
  50c612:	ff 92 b8 05 00 00    	call   DWORD PTR [edx+0x5b8]
  50c618:	50                   	push   eax
  50c619:	8d 85 4c ff ff ff    	lea    eax,[ebp-0xb4]
  50c61f:	50                   	push   eax
  50c620:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50c626:	8b f0                	mov    esi,eax
  50c628:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50c62a:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  50c630:	52                   	push   edx
  50c631:	53                   	push   ebx
  50c632:	56                   	push   esi
  50c633:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50c636:	db e2                	fnclex
  50c638:	3b c3                	cmp    eax,ebx
  50c63a:	7d 0f                	jge    0x50c64b
  50c63c:	6a 40                	push   0x40
  50c63e:	68 68 c9 41 00       	push   0x41c968
  50c643:	56                   	push   esi
  50c644:	50                   	push   eax
  50c645:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50c64b:	53                   	push   ebx
  50c64c:	68 09 00 03 68       	push   0x68030009
  50c651:	8b 85 48 ff ff ff    	mov    eax,DWORD PTR [ebp-0xb8]
  50c657:	50                   	push   eax
  50c658:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50c65e:	51                   	push   ecx
  50c65f:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  50c665:	83 c4 10             	add    esp,0x10
  50c668:	50                   	push   eax
  50c669:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  50c66f:	0f bf d0             	movsx  edx,ax
  50c672:	89 95 88 fe ff ff    	mov    DWORD PTR [ebp-0x178],edx
  50c678:	db 85 88 fe ff ff    	fild   DWORD PTR [ebp-0x178]
  50c67e:	dd 9d 80 fe ff ff    	fstp   QWORD PTR [ebp-0x180]
  50c684:	dd 85 80 fe ff ff    	fld    QWORD PTR [ebp-0x180]
  50c68a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c691:	75 08                	jne    0x50c69b
  50c693:	dc 35 a0 28 40 00    	fdiv   QWORD PTR ds:0x4028a0
  50c699:	eb 11                	jmp    0x50c6ac
  50c69b:	ff 35 a4 28 40 00    	push   DWORD PTR ds:0x4028a4
  50c6a1:	ff 35 a0 28 40 00    	push   DWORD PTR ds:0x4028a0
  50c6a7:	e8 88 80 ef ff       	call   0x404734
  50c6ac:	df e0                	fnstsw ax
  50c6ae:	a8 0d                	test   al,0xd
  50c6b0:	0f 85 7f 13 00 00    	jne    0x50da35
  50c6b6:	ff 15 b4 10 40 00    	call   DWORD PTR ds:0x4010b4
  50c6bc:	0f bf 05 ec b6 54 00 	movsx  eax,WORD PTR ds:0x54b6ec
  50c6c3:	89 85 7c fe ff ff    	mov    DWORD PTR [ebp-0x184],eax
  50c6c9:	db 85 7c fe ff ff    	fild   DWORD PTR [ebp-0x184]
  50c6cf:	dd 9d 74 fe ff ff    	fstp   QWORD PTR [ebp-0x18c]
  50c6d5:	dc 9d 74 fe ff ff    	fcomp  QWORD PTR [ebp-0x18c]
  50c6db:	df e0                	fnstsw ax
  50c6dd:	f6 c4 40             	test   ah,0x40
  50c6e0:	75 07                	jne    0x50c6e9
  50c6e2:	bf 01 00 00 00       	mov    edi,0x1
  50c6e7:	eb 02                	jmp    0x50c6eb
  50c6e9:	33 ff                	xor    edi,edi
  50c6eb:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50c6f0:	8b 08                	mov    ecx,DWORD PTR [eax]
  50c6f2:	50                   	push   eax
  50c6f3:	ff 91 b8 05 00 00    	call   DWORD PTR [ecx+0x5b8]
  50c6f9:	50                   	push   eax
  50c6fa:	8d 95 44 ff ff ff    	lea    edx,[ebp-0xbc]
  50c700:	52                   	push   edx
  50c701:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50c707:	8b f0                	mov    esi,eax
  50c709:	89 b5 c0 fe ff ff    	mov    DWORD PTR [ebp-0x140],esi
  50c70f:	8b 06                	mov    eax,DWORD PTR [esi]
  50c711:	8d 8d 40 ff ff ff    	lea    ecx,[ebp-0xc0]
  50c717:	51                   	push   ecx
  50c718:	53                   	push   ebx
  50c719:	56                   	push   esi
  50c71a:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50c71d:	db e2                	fnclex
  50c71f:	3b c3                	cmp    eax,ebx
  50c721:	7d 0f                	jge    0x50c732
  50c723:	6a 40                	push   0x40
  50c725:	68 68 c9 41 00       	push   0x41c968
  50c72a:	56                   	push   esi
  50c72b:	50                   	push   eax
  50c72c:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50c732:	53                   	push   ebx
  50c733:	68 08 00 03 68       	push   0x68030008
  50c738:	8b 95 40 ff ff ff    	mov    edx,DWORD PTR [ebp-0xc0]
  50c73e:	52                   	push   edx
  50c73f:	8d 85 20 ff ff ff    	lea    eax,[ebp-0xe0]
  50c745:	50                   	push   eax
  50c746:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  50c74c:	83 c4 10             	add    esp,0x10
  50c74f:	50                   	push   eax
  50c750:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50c756:	66 8b f0             	mov    si,ax
  50c759:	f7 d6                	not    esi
  50c75b:	f7 df                	neg    edi
  50c75d:	23 f7                	and    esi,edi
  50c75f:	8d 8d 40 ff ff ff    	lea    ecx,[ebp-0xc0]
  50c765:	51                   	push   ecx
  50c766:	8d 95 44 ff ff ff    	lea    edx,[ebp-0xbc]
  50c76c:	52                   	push   edx
  50c76d:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  50c773:	50                   	push   eax
  50c774:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  50c77a:	51                   	push   ecx
  50c77b:	6a 04                	push   0x4
  50c77d:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50c783:	8d 95 20 ff ff ff    	lea    edx,[ebp-0xe0]
  50c789:	52                   	push   edx
  50c78a:	8d 85 30 ff ff ff    	lea    eax,[ebp-0xd0]
  50c790:	50                   	push   eax
  50c791:	6a 02                	push   0x2
  50c793:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50c799:	83 c4 20             	add    esp,0x20
  50c79c:	66 3b f3             	cmp    si,bx
  50c79f:	0f 84 ba 00 00 00    	je     0x50c85f
  50c7a5:	66 8b 0d ec b6 54 00 	mov    cx,WORD PTR ds:0x54b6ec
  50c7ac:	66 6b c9 64          	imul   cx,cx,0x64
  50c7b0:	0f 80 84 12 00 00    	jo     0x50da3a
  50c7b6:	66 89 8d f8 fe ff ff 	mov    WORD PTR [ebp-0x108],cx
  50c7bd:	c7 85 f0 fe ff ff 02 	mov    DWORD PTR [ebp-0x110],0x2
  50c7c4:	00 00 00 
  50c7c7:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50c7cc:	8b 10                	mov    edx,DWORD PTR [eax]
  50c7ce:	50                   	push   eax
  50c7cf:	ff 92 b8 05 00 00    	call   DWORD PTR [edx+0x5b8]
  50c7d5:	50                   	push   eax
  50c7d6:	8d 85 4c ff ff ff    	lea    eax,[ebp-0xb4]
  50c7dc:	50                   	push   eax
  50c7dd:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50c7e3:	8b f0                	mov    esi,eax
  50c7e5:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50c7e7:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  50c7ed:	52                   	push   edx
  50c7ee:	53                   	push   ebx
  50c7ef:	56                   	push   esi
  50c7f0:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50c7f3:	db e2                	fnclex
  50c7f5:	3b c3                	cmp    eax,ebx
  50c7f7:	7d 0f                	jge    0x50c808
  50c7f9:	6a 40                	push   0x40
  50c7fb:	68 68 c9 41 00       	push   0x41c968
  50c800:	56                   	push   esi
  50c801:	50                   	push   eax
  50c802:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50c808:	83 ec 10             	sub    esp,0x10
  50c80b:	8b c4                	mov    eax,esp
  50c80d:	8b 8d f0 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x110]
  50c813:	89 08                	mov    DWORD PTR [eax],ecx
  50c815:	8b 95 f4 fe ff ff    	mov    edx,DWORD PTR [ebp-0x10c]
  50c81b:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
  50c81e:	8b 8d f8 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x108]
  50c824:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
  50c827:	8b 95 fc fe ff ff    	mov    edx,DWORD PTR [ebp-0x104]
  50c82d:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
  50c830:	68 09 00 03 68       	push   0x68030009
  50c835:	8b 85 48 ff ff ff    	mov    eax,DWORD PTR [ebp-0xb8]
  50c83b:	50                   	push   eax
  50c83c:	8b 3d 64 12 40 00    	mov    edi,DWORD PTR ds:0x401264
  50c842:	ff d7                	call   edi
  50c844:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  50c84a:	51                   	push   ecx
  50c84b:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50c851:	52                   	push   edx
  50c852:	6a 02                	push   0x2
  50c854:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50c85a:	83 c4 0c             	add    esp,0xc
  50c85d:	eb 06                	jmp    0x50c865
  50c85f:	8b 3d 64 12 40 00    	mov    edi,DWORD PTR ds:0x401264
  50c865:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50c86a:	8b 08                	mov    ecx,DWORD PTR [eax]
  50c86c:	50                   	push   eax
  50c86d:	ff 91 b8 05 00 00    	call   DWORD PTR [ecx+0x5b8]
  50c873:	50                   	push   eax
  50c874:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50c87a:	52                   	push   edx
  50c87b:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50c881:	8b f0                	mov    esi,eax
  50c883:	8b 06                	mov    eax,DWORD PTR [esi]
  50c885:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  50c88b:	51                   	push   ecx
  50c88c:	53                   	push   ebx
  50c88d:	56                   	push   esi
  50c88e:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50c891:	db e2                	fnclex
  50c893:	3b c3                	cmp    eax,ebx
  50c895:	7d 0f                	jge    0x50c8a6
  50c897:	6a 40                	push   0x40
  50c899:	68 68 c9 41 00       	push   0x41c968
  50c89e:	56                   	push   esi
  50c89f:	50                   	push   eax
  50c8a0:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50c8a6:	53                   	push   ebx
  50c8a7:	68 09 00 03 68       	push   0x68030009
  50c8ac:	8b 95 48 ff ff ff    	mov    edx,DWORD PTR [ebp-0xb8]
  50c8b2:	52                   	push   edx
  50c8b3:	8d 85 30 ff ff ff    	lea    eax,[ebp-0xd0]
  50c8b9:	50                   	push   eax
  50c8ba:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  50c8c0:	83 c4 10             	add    esp,0x10
  50c8c3:	66 8b 0d e4 b4 54 00 	mov    cx,WORD PTR ds:0x54b4e4
  50c8ca:	66 03 0d e2 b4 54 00 	add    cx,WORD PTR ds:0x54b4e2
  50c8d1:	0f 80 63 11 00 00    	jo     0x50da3a
  50c8d7:	0f bf d1             	movsx  edx,cx
  50c8da:	89 95 70 fe ff ff    	mov    DWORD PTR [ebp-0x190],edx
  50c8e0:	db 85 70 fe ff ff    	fild   DWORD PTR [ebp-0x190]
  50c8e6:	dd 9d 68 fe ff ff    	fstp   QWORD PTR [ebp-0x198]
  50c8ec:	dd 85 68 fe ff ff    	fld    QWORD PTR [ebp-0x198]
  50c8f2:	dc 25 98 34 40 00    	fsub   QWORD PTR ds:0x403498
  50c8f8:	d9 9d d8 fe ff ff    	fstp   DWORD PTR [ebp-0x128]
  50c8fe:	df e0                	fnstsw ax
  50c900:	a8 0d                	test   al,0xd
  50c902:	0f 85 2d 11 00 00    	jne    0x50da35
  50c908:	8d 85 d8 fe ff ff    	lea    eax,[ebp-0x128]
  50c90e:	50                   	push   eax
  50c90f:	e8 6c f5 f8 ff       	call   0x49be80
  50c914:	d9 9d d4 fe ff ff    	fstp   DWORD PTR [ebp-0x12c]
  50c91a:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50c91f:	8b 08                	mov    ecx,DWORD PTR [eax]
  50c921:	50                   	push   eax
  50c922:	ff 91 b8 05 00 00    	call   DWORD PTR [ecx+0x5b8]
  50c928:	50                   	push   eax
  50c929:	8d 95 44 ff ff ff    	lea    edx,[ebp-0xbc]
  50c92f:	52                   	push   edx
  50c930:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50c936:	8b f0                	mov    esi,eax
  50c938:	89 b5 c0 fe ff ff    	mov    DWORD PTR [ebp-0x140],esi
  50c93e:	8b 06                	mov    eax,DWORD PTR [esi]
  50c940:	8d 8d 40 ff ff ff    	lea    ecx,[ebp-0xc0]
  50c946:	51                   	push   ecx
  50c947:	6a 01                	push   0x1
  50c949:	56                   	push   esi
  50c94a:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50c94d:	db e2                	fnclex
  50c94f:	3b c3                	cmp    eax,ebx
  50c951:	7d 0f                	jge    0x50c962
  50c953:	6a 40                	push   0x40
  50c955:	68 68 c9 41 00       	push   0x41c968
  50c95a:	56                   	push   esi
  50c95b:	50                   	push   eax
  50c95c:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50c962:	53                   	push   ebx
  50c963:	68 09 00 03 68       	push   0x68030009
  50c968:	8b 95 40 ff ff ff    	mov    edx,DWORD PTR [ebp-0xc0]
  50c96e:	52                   	push   edx
  50c96f:	8d 85 20 ff ff ff    	lea    eax,[ebp-0xe0]
  50c975:	50                   	push   eax
  50c976:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  50c97c:	83 c4 10             	add    esp,0x10
  50c97f:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50c985:	51                   	push   ecx
  50c986:	8b 35 a0 11 40 00    	mov    esi,DWORD PTR ds:0x4011a0
  50c98c:	ff d6                	call   esi
  50c98e:	0f bf d0             	movsx  edx,ax
  50c991:	89 95 64 fe ff ff    	mov    DWORD PTR [ebp-0x19c],edx
  50c997:	db 85 64 fe ff ff    	fild   DWORD PTR [ebp-0x19c]
  50c99d:	d9 9d 60 fe ff ff    	fstp   DWORD PTR [ebp-0x1a0]
  50c9a3:	d9 85 60 fe ff ff    	fld    DWORD PTR [ebp-0x1a0]
  50c9a9:	d8 0d d4 b1 54 00    	fmul   DWORD PTR ds:0x54b1d4
  50c9af:	d8 8d d4 fe ff ff    	fmul   DWORD PTR [ebp-0x12c]
  50c9b5:	df e0                	fnstsw ax
  50c9b7:	a8 0d                	test   al,0xd
  50c9b9:	0f 85 76 10 00 00    	jne    0x50da35
  50c9bf:	dd 9d 58 fe ff ff    	fstp   QWORD PTR [ebp-0x1a8]
  50c9c5:	8d 85 20 ff ff ff    	lea    eax,[ebp-0xe0]
  50c9cb:	50                   	push   eax
  50c9cc:	ff d6                	call   esi
  50c9ce:	0f bf c8             	movsx  ecx,ax
  50c9d1:	89 8d 54 fe ff ff    	mov    DWORD PTR [ebp-0x1ac],ecx
  50c9d7:	db 85 54 fe ff ff    	fild   DWORD PTR [ebp-0x1ac]
  50c9dd:	dd 9d 4c fe ff ff    	fstp   QWORD PTR [ebp-0x1b4]
  50c9e3:	dd 85 4c fe ff ff    	fld    QWORD PTR [ebp-0x1b4]
  50c9e9:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50c9f0:	75 08                	jne    0x50c9fa
  50c9f2:	dc 35 a0 28 40 00    	fdiv   QWORD PTR ds:0x4028a0
  50c9f8:	eb 11                	jmp    0x50ca0b
  50c9fa:	ff 35 a4 28 40 00    	push   DWORD PTR ds:0x4028a4
  50ca00:	ff 35 a0 28 40 00    	push   DWORD PTR ds:0x4028a0
  50ca06:	e8 29 7d ef ff       	call   0x404734
  50ca0b:	d8 0d 28 ba 54 00    	fmul   DWORD PTR ds:0x54ba28
  50ca11:	dc 85 58 fe ff ff    	fadd   QWORD PTR [ebp-0x1a8]
  50ca17:	d9 1d d8 b6 54 00    	fstp   DWORD PTR ds:0x54b6d8
  50ca1d:	df e0                	fnstsw ax
  50ca1f:	a8 0d                	test   al,0xd
  50ca21:	0f 85 0e 10 00 00    	jne    0x50da35
  50ca27:	8d 95 40 ff ff ff    	lea    edx,[ebp-0xc0]
  50ca2d:	52                   	push   edx
  50ca2e:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  50ca34:	50                   	push   eax
  50ca35:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  50ca3b:	51                   	push   ecx
  50ca3c:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50ca42:	52                   	push   edx
  50ca43:	6a 04                	push   0x4
  50ca45:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50ca4b:	8d 85 20 ff ff ff    	lea    eax,[ebp-0xe0]
  50ca51:	50                   	push   eax
  50ca52:	8d 8d 30 ff ff ff    	lea    ecx,[ebp-0xd0]
  50ca58:	51                   	push   ecx
  50ca59:	6a 02                	push   0x2
  50ca5b:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50ca61:	83 c4 20             	add    esp,0x20
  50ca64:	d9 05 ec 34 40 00    	fld    DWORD PTR ds:0x4034ec
  50ca6a:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50ca70:	d8 1d d8 b6 54 00    	fcomp  DWORD PTR ds:0x54b6d8
  50ca76:	df e0                	fnstsw ax
  50ca78:	f6 c4 01             	test   ah,0x1
  50ca7b:	74 05                	je     0x50ca82
  50ca7d:	83 c8 ff             	or     eax,0xffffffff
  50ca80:	eb 02                	jmp    0x50ca84
  50ca82:	33 c0                	xor    eax,eax
  50ca84:	89 85 f8 fe ff ff    	mov    DWORD PTR [ebp-0x108],eax
  50ca8a:	b9 0b 00 00 00       	mov    ecx,0xb
  50ca8f:	89 8d f0 fe ff ff    	mov    DWORD PTR [ebp-0x110],ecx
  50ca95:	83 ec 10             	sub    esp,0x10
  50ca98:	8b d4                	mov    edx,esp
  50ca9a:	89 0a                	mov    DWORD PTR [edx],ecx
  50ca9c:	8b 8d f4 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x10c]
  50caa2:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  50caa5:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  50caa8:	8b 85 fc fe ff ff    	mov    eax,DWORD PTR [ebp-0x104]
  50caae:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
  50cab1:	68 0c 00 03 68       	push   0x6803000c
  50cab6:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50cabb:	8b 08                	mov    ecx,DWORD PTR [eax]
  50cabd:	50                   	push   eax
  50cabe:	ff 91 54 04 00 00    	call   DWORD PTR [ecx+0x454]
  50cac4:	50                   	push   eax
  50cac5:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50cacb:	52                   	push   edx
  50cacc:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50cad2:	50                   	push   eax
  50cad3:	ff d7                	call   edi
  50cad5:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  50cadb:	8b 35 80 12 40 00    	mov    esi,DWORD PTR ds:0x401280
  50cae1:	ff d6                	call   esi
  50cae3:	68 d0 b1 54 00       	push   0x54b1d0
  50cae8:	68 00 b2 54 00       	push   0x54b200
  50caed:	68 ec b1 54 00       	push   0x54b1ec
  50caf2:	68 e0 b1 54 00       	push   0x54b1e0
  50caf7:	68 e8 b1 54 00       	push   0x54b1e8
  50cafc:	68 e4 b1 54 00       	push   0x54b1e4
  50cb01:	68 d4 b6 54 00       	push   0x54b6d4
  50cb06:	68 a0 b4 54 00       	push   0x54b4a0
  50cb0b:	68 d0 b6 54 00       	push   0x54b6d0
  50cb10:	e8 bb 40 ff ff       	call   0x500bd0
  50cb15:	d9 1d dc b6 54 00    	fstp   DWORD PTR ds:0x54b6dc
  50cb1b:	d9 05 dc b6 54 00    	fld    DWORD PTR ds:0x54b6dc
  50cb21:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cb28:	75 08                	jne    0x50cb32
  50cb2a:	d8 35 30 b3 54 00    	fdiv   DWORD PTR ds:0x54b330
  50cb30:	eb 0b                	jmp    0x50cb3d
  50cb32:	ff 35 30 b3 54 00    	push   DWORD PTR ds:0x54b330
  50cb38:	e8 eb 7b ef ff       	call   0x404728
  50cb3d:	d8 0d b8 28 40 00    	fmul   DWORD PTR ds:0x4028b8
  50cb43:	dd 9d f8 fe ff ff    	fstp   QWORD PTR [ebp-0x108]
  50cb49:	df e0                	fnstsw ax
  50cb4b:	a8 0d                	test   al,0xd
  50cb4d:	0f 85 e2 0e 00 00    	jne    0x50da35
  50cb53:	b8 05 00 00 00       	mov    eax,0x5
  50cb58:	89 85 f0 fe ff ff    	mov    DWORD PTR [ebp-0x110],eax
  50cb5e:	83 ec 10             	sub    esp,0x10
  50cb61:	8b cc                	mov    ecx,esp
  50cb63:	89 01                	mov    DWORD PTR [ecx],eax
  50cb65:	8b 95 f4 fe ff ff    	mov    edx,DWORD PTR [ebp-0x10c]
  50cb6b:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
  50cb6e:	8b 85 f8 fe ff ff    	mov    eax,DWORD PTR [ebp-0x108]
  50cb74:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
  50cb77:	8b 95 fc fe ff ff    	mov    edx,DWORD PTR [ebp-0x104]
  50cb7d:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  50cb80:	68 06 00 03 68       	push   0x68030006
  50cb85:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50cb8a:	8b 08                	mov    ecx,DWORD PTR [eax]
  50cb8c:	50                   	push   eax
  50cb8d:	ff 91 cc 05 00 00    	call   DWORD PTR [ecx+0x5cc]
  50cb93:	50                   	push   eax
  50cb94:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50cb9a:	52                   	push   edx
  50cb9b:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50cba1:	50                   	push   eax
  50cba2:	ff d7                	call   edi
  50cba4:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  50cbaa:	ff d6                	call   esi
  50cbac:	d9 05 e4 b6 54 00    	fld    DWORD PTR ds:0x54b6e4
  50cbb2:	d8 0d 30 b7 54 00    	fmul   DWORD PTR ds:0x54b730
  50cbb8:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cbbf:	75 08                	jne    0x50cbc9
  50cbc1:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50cbc7:	eb 0b                	jmp    0x50cbd4
  50cbc9:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  50cbcf:	e8 54 7b ef ff       	call   0x404728
  50cbd4:	d8 2d 34 b7 54 00    	fsubr  DWORD PTR ds:0x54b734
  50cbda:	d9 5d 94             	fstp   DWORD PTR [ebp-0x6c]
  50cbdd:	df e0                	fnstsw ax
  50cbdf:	a8 0d                	test   al,0xd
  50cbe1:	0f 85 4e 0e 00 00    	jne    0x50da35
  50cbe7:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50cbed:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50cbf3:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50cbf9:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50cbff:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50cc05:	de c1                	faddp  st(1),st
  50cc07:	d8 0d d8 b6 54 00    	fmul   DWORD PTR ds:0x54b6d8
  50cc0d:	d8 ad 78 ff ff ff    	fsubr  DWORD PTR [ebp-0x88]
  50cc13:	d9 9d 78 ff ff ff    	fstp   DWORD PTR [ebp-0x88]
  50cc19:	df e0                	fnstsw ax
  50cc1b:	a8 0d                	test   al,0xd
  50cc1d:	0f 85 12 0e 00 00    	jne    0x50da35
  50cc23:	d9 45 94             	fld    DWORD PTR [ebp-0x6c]
  50cc26:	d8 a5 74 ff ff ff    	fsub   DWORD PTR [ebp-0x8c]
  50cc2c:	d8 0d d8 b6 54 00    	fmul   DWORD PTR ds:0x54b6d8
  50cc32:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cc39:	75 08                	jne    0x50cc43
  50cc3b:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50cc41:	eb 0b                	jmp    0x50cc4e
  50cc43:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50cc49:	e8 da 7a ef ff       	call   0x404728
  50cc4e:	d8 85 5c ff ff ff    	fadd   DWORD PTR [ebp-0xa4]
  50cc54:	d9 05 dc b6 54 00    	fld    DWORD PTR ds:0x54b6dc
  50cc5a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cc61:	75 08                	jne    0x50cc6b
  50cc63:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50cc69:	eb 0b                	jmp    0x50cc76
  50cc6b:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50cc71:	e8 b2 7a ef ff       	call   0x404728
  50cc76:	de c1                	faddp  st(1),st
  50cc78:	d9 9d 5c ff ff ff    	fstp   DWORD PTR [ebp-0xa4]
  50cc7e:	df e0                	fnstsw ax
  50cc80:	a8 0d                	test   al,0xd
  50cc82:	0f 85 ad 0d 00 00    	jne    0x50da35
  50cc88:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50cc8e:	d8 25 4c b6 54 00    	fsub   DWORD PTR ds:0x54b64c
  50cc94:	d8 0d f0 b7 54 00    	fmul   DWORD PTR ds:0x54b7f0
  50cc9a:	d9 5d a4             	fstp   DWORD PTR [ebp-0x5c]
  50cc9d:	df e0                	fnstsw ax
  50cc9f:	a8 0d                	test   al,0xd
  50cca1:	0f 85 8e 0d 00 00    	jne    0x50da35
  50cca7:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50ccad:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50ccb3:	d8 0d 5c b6 54 00    	fmul   DWORD PTR ds:0x54b65c
  50ccb9:	d9 05 58 b6 54 00    	fld    DWORD PTR ds:0x54b658
  50ccbf:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50ccc5:	de c1                	faddp  st(1),st
  50ccc7:	d8 0d f0 b7 54 00    	fmul   DWORD PTR ds:0x54b7f0
  50cccd:	d9 5d 8c             	fstp   DWORD PTR [ebp-0x74]
  50ccd0:	df e0                	fnstsw ax
  50ccd2:	a8 0d                	test   al,0xd
  50ccd4:	0f 85 5b 0d 00 00    	jne    0x50da35
  50ccda:	d9 85 68 ff ff ff    	fld    DWORD PTR [ebp-0x98]
  50cce0:	d8 8d 78 ff ff ff    	fmul   DWORD PTR [ebp-0x88]
  50cce6:	d9 85 5c ff ff ff    	fld    DWORD PTR [ebp-0xa4]
  50ccec:	d8 4d 8c             	fmul   DWORD PTR [ebp-0x74]
  50ccef:	de e9                	fsubp  st(1),st
  50ccf1:	d9 85 68 ff ff ff    	fld    DWORD PTR [ebp-0x98]
  50ccf7:	d8 4d a4             	fmul   DWORD PTR [ebp-0x5c]
  50ccfa:	d9 05 d8 ba 54 00    	fld    DWORD PTR ds:0x54bad8
  50cd00:	d8 4d 8c             	fmul   DWORD PTR [ebp-0x74]
  50cd03:	de e9                	fsubp  st(1),st
  50cd05:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cd0c:	75 04                	jne    0x50cd12
  50cd0e:	de f9                	fdivp  st(1),st
  50cd10:	eb 09                	jmp    0x50cd1b
  50cd12:	50                   	push   eax
  50cd13:	b0 0d                	mov    al,0xd
  50cd15:	e8 20 7a ef ff       	call   0x40473a
  50cd1a:	58                   	pop    eax
  50cd1b:	d9 1d 7c b7 54 00    	fstp   DWORD PTR ds:0x54b77c
  50cd21:	df e0                	fnstsw ax
  50cd23:	a8 0d                	test   al,0xd
  50cd25:	0f 85 0a 0d 00 00    	jne    0x50da35
  50cd2b:	d9 05 e8 34 40 00    	fld    DWORD PTR ds:0x4034e8
  50cd31:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50cd37:	d8 1d a0 b4 54 00    	fcomp  DWORD PTR ds:0x54b4a0
  50cd3d:	df e0                	fnstsw ax
  50cd3f:	f6 c4 01             	test   ah,0x1
  50cd42:	75 07                	jne    0x50cd4b
  50cd44:	bb 01 00 00 00       	mov    ebx,0x1
  50cd49:	eb 02                	jmp    0x50cd4d
  50cd4b:	33 db                	xor    ebx,ebx
  50cd4d:	d9 05 a8 b6 54 00    	fld    DWORD PTR ds:0x54b6a8
  50cd53:	d8 85 54 ff ff ff    	fadd   DWORD PTR [ebp-0xac]
  50cd59:	df e0                	fnstsw ax
  50cd5b:	a8 0d                	test   al,0xd
  50cd5d:	0f 85 d2 0c 00 00    	jne    0x50da35
  50cd63:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50cd69:	d8 1d c4 b6 54 00    	fcomp  DWORD PTR ds:0x54b6c4
  50cd6f:	df e0                	fnstsw ax
  50cd71:	f6 c4 01             	test   ah,0x1
  50cd74:	75 1a                	jne    0x50cd90
  50cd76:	d9 05 ac b4 54 00    	fld    DWORD PTR ds:0x54b4ac
  50cd7c:	d8 1d a8 b6 54 00    	fcomp  DWORD PTR ds:0x54b6a8
  50cd82:	df e0                	fnstsw ax
  50cd84:	f6 c4 41             	test   ah,0x41
  50cd87:	74 07                	je     0x50cd90
  50cd89:	b9 01 00 00 00       	mov    ecx,0x1
  50cd8e:	eb 02                	jmp    0x50cd92
  50cd90:	33 c9                	xor    ecx,ecx
  50cd92:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50cd98:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50cd9e:	df e0                	fnstsw ax
  50cda0:	f6 c4 01             	test   ah,0x1
  50cda3:	75 07                	jne    0x50cdac
  50cda5:	b8 01 00 00 00       	mov    eax,0x1
  50cdaa:	eb 02                	jmp    0x50cdae
  50cdac:	33 c0                	xor    eax,eax
  50cdae:	0b d9                	or     ebx,ecx
  50cdb0:	f7 db                	neg    ebx
  50cdb2:	1b db                	sbb    ebx,ebx
  50cdb4:	f7 db                	neg    ebx
  50cdb6:	85 d8                	test   eax,ebx
  50cdb8:	d9 85 5c ff ff ff    	fld    DWORD PTR [ebp-0xa4]
  50cdbe:	d8 4d a4             	fmul   DWORD PTR [ebp-0x5c]
  50cdc1:	d9 05 d8 ba 54 00    	fld    DWORD PTR ds:0x54bad8
  50cdc7:	d8 8d 78 ff ff ff    	fmul   DWORD PTR [ebp-0x88]
  50cdcd:	de e9                	fsubp  st(1),st
  50cdcf:	d9 85 68 ff ff ff    	fld    DWORD PTR [ebp-0x98]
  50cdd5:	d8 4d a4             	fmul   DWORD PTR [ebp-0x5c]
  50cdd8:	d9 05 d8 ba 54 00    	fld    DWORD PTR ds:0x54bad8
  50cdde:	d8 4d 8c             	fmul   DWORD PTR [ebp-0x74]
  50cde1:	de e9                	fsubp  st(1),st
  50cde3:	9c                   	pushf
  50cde4:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cdeb:	75 04                	jne    0x50cdf1
  50cded:	de f9                	fdivp  st(1),st
  50cdef:	eb 09                	jmp    0x50cdfa
  50cdf1:	50                   	push   eax
  50cdf2:	b0 0d                	mov    al,0xd
  50cdf4:	e8 41 79 ef ff       	call   0x40473a
  50cdf9:	58                   	pop    eax
  50cdfa:	9d                   	popf
  50cdfb:	75 60                	jne    0x50ce5d
  50cdfd:	d9 05 c4 b6 54 00    	fld    DWORD PTR ds:0x54b6c4
  50ce03:	d8 a5 54 ff ff ff    	fsub   DWORD PTR [ebp-0xac]
  50ce09:	d8 25 a8 b6 54 00    	fsub   DWORD PTR ds:0x54b6a8
  50ce0f:	d9 e0                	fchs
  50ce11:	d8 0d 54 b6 54 00    	fmul   DWORD PTR ds:0x54b654
  50ce17:	d8 0d 54 b6 54 00    	fmul   DWORD PTR ds:0x54b654
  50ce1d:	d9 05 a0 b1 54 00    	fld    DWORD PTR ds:0x54b1a0
  50ce23:	d8 05 9c b1 54 00    	fadd   DWORD PTR ds:0x54b19c
  50ce29:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50ce30:	75 04                	jne    0x50ce36
  50ce32:	de f9                	fdivp  st(1),st
  50ce34:	eb 09                	jmp    0x50ce3f
  50ce36:	50                   	push   eax
  50ce37:	b0 0d                	mov    al,0xd
  50ce39:	e8 fc 78 ef ff       	call   0x40473a
  50ce3e:	58                   	pop    eax
  50ce3f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50ce46:	75 08                	jne    0x50ce50
  50ce48:	d8 35 0c b7 54 00    	fdiv   DWORD PTR ds:0x54b70c
  50ce4e:	eb 0b                	jmp    0x50ce5b
  50ce50:	ff 35 0c b7 54 00    	push   DWORD PTR ds:0x54b70c
  50ce56:	e8 cd 78 ef ff       	call   0x404728
  50ce5b:	de c1                	faddp  st(1),st
  50ce5d:	d9 1d 74 b7 54 00    	fstp   DWORD PTR ds:0x54b774
  50ce63:	df e0                	fnstsw ax
  50ce65:	a8 0d                	test   al,0xd
  50ce67:	0f 85 c8 0b 00 00    	jne    0x50da35
  50ce6d:	d9 45 e0             	fld    DWORD PTR [ebp-0x20]
  50ce70:	d8 25 34 b7 54 00    	fsub   DWORD PTR ds:0x54b734
  50ce76:	d8 0d ac b4 54 00    	fmul   DWORD PTR ds:0x54b4ac
  50ce7c:	d9 05 2c b7 54 00    	fld    DWORD PTR ds:0x54b72c
  50ce82:	d8 25 34 b7 54 00    	fsub   DWORD PTR ds:0x54b734
  50ce88:	d8 0d c4 b6 54 00    	fmul   DWORD PTR ds:0x54b6c4
  50ce8e:	de e9                	fsubp  st(1),st
  50ce90:	d9 45 88             	fld    DWORD PTR [ebp-0x78]
  50ce93:	d8 25 34 b7 54 00    	fsub   DWORD PTR ds:0x54b734
  50ce99:	d8 8d 54 ff ff ff    	fmul   DWORD PTR [ebp-0xac]
  50ce9f:	de c1                	faddp  st(1),st
  50cea1:	d8 25 78 b6 54 00    	fsub   DWORD PTR ds:0x54b678
  50cea7:	d9 5d b0             	fstp   DWORD PTR [ebp-0x50]
  50ceaa:	df e0                	fnstsw ax
  50ceac:	a8 0d                	test   al,0xd
  50ceae:	0f 85 81 0b 00 00    	jne    0x50da35
  50ceb4:	d9 45 b0             	fld    DWORD PTR [ebp-0x50]
  50ceb7:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cebe:	75 05                	jne    0x50cec5
  50cec0:	d8 75 b8             	fdiv   DWORD PTR [ebp-0x48]
  50cec3:	eb 08                	jmp    0x50cecd
  50cec5:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
  50cec8:	e8 5b 78 ef ff       	call   0x404728
  50cecd:	d9 05 74 b7 54 00    	fld    DWORD PTR ds:0x54b774
  50ced3:	d8 4d c4             	fmul   DWORD PTR [ebp-0x3c]
  50ced6:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cedd:	75 05                	jne    0x50cee4
  50cedf:	d8 75 b8             	fdiv   DWORD PTR [ebp-0x48]
  50cee2:	eb 08                	jmp    0x50ceec
  50cee4:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
  50cee7:	e8 3c 78 ef ff       	call   0x404728
  50ceec:	de e9                	fsubp  st(1),st
  50ceee:	d9 1d 70 b7 54 00    	fstp   DWORD PTR ds:0x54b770
  50cef4:	df e0                	fnstsw ax
  50cef6:	a8 0d                	test   al,0xd
  50cef8:	0f 85 37 0b 00 00    	jne    0x50da35
  50cefe:	d9 05 70 b7 54 00    	fld    DWORD PTR ds:0x54b770
  50cf04:	d8 4d d0             	fmul   DWORD PTR [ebp-0x30]
  50cf07:	d9 05 74 b7 54 00    	fld    DWORD PTR ds:0x54b774
  50cf0d:	d8 4d dc             	fmul   DWORD PTR [ebp-0x24]
  50cf10:	de c1                	faddp  st(1),st
  50cf12:	d9 5d cc             	fstp   DWORD PTR [ebp-0x34]
  50cf15:	df e0                	fnstsw ax
  50cf17:	a8 0d                	test   al,0xd
  50cf19:	0f 85 16 0b 00 00    	jne    0x50da35
  50cf1f:	d9 45 cc             	fld    DWORD PTR [ebp-0x34]
  50cf22:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cf29:	75 08                	jne    0x50cf33
  50cf2b:	d8 35 54 b6 54 00    	fdiv   DWORD PTR ds:0x54b654
  50cf31:	eb 0b                	jmp    0x50cf3e
  50cf33:	ff 35 54 b6 54 00    	push   DWORD PTR ds:0x54b654
  50cf39:	e8 ea 77 ef ff       	call   0x404728
  50cf3e:	d8 05 c4 b6 54 00    	fadd   DWORD PTR ds:0x54b6c4
  50cf44:	d8 a5 54 ff ff ff    	fsub   DWORD PTR [ebp-0xac]
  50cf4a:	d9 9d 70 ff ff ff    	fstp   DWORD PTR [ebp-0x90]
  50cf50:	df e0                	fnstsw ax
  50cf52:	a8 0d                	test   al,0xd
  50cf54:	0f 85 db 0a 00 00    	jne    0x50da35
  50cf5a:	d9 85 70 ff ff ff    	fld    DWORD PTR [ebp-0x90]
  50cf60:	d8 25 ac b4 54 00    	fsub   DWORD PTR ds:0x54b4ac
  50cf66:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cf6d:	75 08                	jne    0x50cf77
  50cf6f:	d8 35 14 b4 54 00    	fdiv   DWORD PTR ds:0x54b414
  50cf75:	eb 0b                	jmp    0x50cf82
  50cf77:	ff 35 14 b4 54 00    	push   DWORD PTR ds:0x54b414
  50cf7d:	e8 a6 77 ef ff       	call   0x404728
  50cf82:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cf89:	75 08                	jne    0x50cf93
  50cf8b:	d8 35 c0 30 40 00    	fdiv   DWORD PTR ds:0x4030c0
  50cf91:	eb 0b                	jmp    0x50cf9e
  50cf93:	ff 35 c0 30 40 00    	push   DWORD PTR ds:0x4030c0
  50cf99:	e8 8a 77 ef ff       	call   0x404728
  50cf9e:	d9 1d 84 b7 54 00    	fstp   DWORD PTR ds:0x54b784
  50cfa4:	df e0                	fnstsw ax
  50cfa6:	a8 0d                	test   al,0xd
  50cfa8:	0f 85 87 0a 00 00    	jne    0x50da35
  50cfae:	d9 05 a0 b4 54 00    	fld    DWORD PTR ds:0x54b4a0
  50cfb4:	d8 0d 9c b1 54 00    	fmul   DWORD PTR ds:0x54b19c
  50cfba:	d8 05 a0 b1 54 00    	fadd   DWORD PTR ds:0x54b1a0
  50cfc0:	d9 1d ac b6 54 00    	fstp   DWORD PTR ds:0x54b6ac
  50cfc6:	df e0                	fnstsw ax
  50cfc8:	a8 0d                	test   al,0xd
  50cfca:	0f 85 65 0a 00 00    	jne    0x50da35
  50cfd0:	d9 05 ac b6 54 00    	fld    DWORD PTR ds:0x54b6ac
  50cfd6:	d8 25 f0 b1 54 00    	fsub   DWORD PTR ds:0x54b1f0
  50cfdc:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50cfe3:	75 08                	jne    0x50cfed
  50cfe5:	d8 35 f4 b1 54 00    	fdiv   DWORD PTR ds:0x54b1f4
  50cfeb:	eb 0b                	jmp    0x50cff8
  50cfed:	ff 35 f4 b1 54 00    	push   DWORD PTR ds:0x54b1f4
  50cff3:	e8 30 77 ef ff       	call   0x404728
  50cff8:	d8 05 a4 bf 54 00    	fadd   DWORD PTR ds:0x54bfa4
  50cffe:	d9 1d 3c b5 54 00    	fstp   DWORD PTR ds:0x54b53c
  50d004:	df e0                	fnstsw ax
  50d006:	a8 0d                	test   al,0xd
  50d008:	0f 85 27 0a 00 00    	jne    0x50da35
  50d00e:	d9 05 3c b5 54 00    	fld    DWORD PTR ds:0x54b53c
  50d014:	d8 1d e4 34 40 00    	fcomp  DWORD PTR ds:0x4034e4
  50d01a:	df e0                	fnstsw ax
  50d01c:	f6 c4 41             	test   ah,0x41
  50d01f:	75 0a                	jne    0x50d02b
  50d021:	c7 05 3c b5 54 00 00 	mov    DWORD PTR ds:0x54b53c,0x41d00000
  50d028:	00 d0 41 
  50d02b:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50d031:	d8 25 34 ba 54 00    	fsub   DWORD PTR ds:0x54ba34
  50d037:	d9 9d f8 fe ff ff    	fstp   DWORD PTR [ebp-0x108]
  50d03d:	df e0                	fnstsw ax
  50d03f:	a8 0d                	test   al,0xd
  50d041:	0f 85 ee 09 00 00    	jne    0x50da35
  50d047:	b8 04 00 00 00       	mov    eax,0x4
  50d04c:	89 85 f0 fe ff ff    	mov    DWORD PTR [ebp-0x110],eax
  50d052:	83 ec 10             	sub    esp,0x10
  50d055:	8b cc                	mov    ecx,esp
  50d057:	89 01                	mov    DWORD PTR [ecx],eax
  50d059:	8b 95 f4 fe ff ff    	mov    edx,DWORD PTR [ebp-0x10c]
  50d05f:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
  50d062:	8b 85 f8 fe ff ff    	mov    eax,DWORD PTR [ebp-0x108]
  50d068:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
  50d06b:	8b 95 fc fe ff ff    	mov    edx,DWORD PTR [ebp-0x104]
  50d071:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  50d074:	68 04 00 03 68       	push   0x68030004
  50d079:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50d07e:	8b 08                	mov    ecx,DWORD PTR [eax]
  50d080:	50                   	push   eax
  50d081:	ff 91 8c 05 00 00    	call   DWORD PTR [ecx+0x58c]
  50d087:	50                   	push   eax
  50d088:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50d08e:	52                   	push   edx
  50d08f:	8b 1d 94 10 40 00    	mov    ebx,DWORD PTR ds:0x401094
  50d095:	ff d3                	call   ebx
  50d097:	50                   	push   eax
  50d098:	ff d7                	call   edi
  50d09a:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  50d0a0:	ff d6                	call   esi
  50d0a2:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50d0a8:	d8 25 34 ba 54 00    	fsub   DWORD PTR ds:0x54ba34
  50d0ae:	d9 9d f8 fe ff ff    	fstp   DWORD PTR [ebp-0x108]
  50d0b4:	df e0                	fnstsw ax
  50d0b6:	a8 0d                	test   al,0xd
  50d0b8:	0f 85 77 09 00 00    	jne    0x50da35
  50d0be:	b8 04 00 00 00       	mov    eax,0x4
  50d0c3:	89 85 f0 fe ff ff    	mov    DWORD PTR [ebp-0x110],eax
  50d0c9:	83 ec 10             	sub    esp,0x10
  50d0cc:	8b cc                	mov    ecx,esp
  50d0ce:	89 01                	mov    DWORD PTR [ecx],eax
  50d0d0:	8b 95 f4 fe ff ff    	mov    edx,DWORD PTR [ebp-0x10c]
  50d0d6:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
  50d0d9:	8b 85 f8 fe ff ff    	mov    eax,DWORD PTR [ebp-0x108]
  50d0df:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
  50d0e2:	8b 95 fc fe ff ff    	mov    edx,DWORD PTR [ebp-0x104]
  50d0e8:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  50d0eb:	68 05 00 03 68       	push   0x68030005
  50d0f0:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50d0f5:	8b 08                	mov    ecx,DWORD PTR [eax]
  50d0f7:	50                   	push   eax
  50d0f8:	ff 91 8c 05 00 00    	call   DWORD PTR [ecx+0x58c]
  50d0fe:	50                   	push   eax
  50d0ff:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50d105:	52                   	push   edx
  50d106:	ff d3                	call   ebx
  50d108:	50                   	push   eax
  50d109:	ff d7                	call   edi
  50d10b:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  50d111:	ff d6                	call   esi
  50d113:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
  50d116:	a3 38 b7 54 00       	mov    ds:0x54b738,eax
  50d11b:	d9 05 a0 b4 54 00    	fld    DWORD PTR ds:0x54b4a0
  50d121:	d8 0d c8 28 40 00    	fmul   DWORD PTR ds:0x4028c8
  50d127:	d9 1d c0 b6 54 00    	fstp   DWORD PTR ds:0x54b6c0
  50d12d:	df e0                	fnstsw ax
  50d12f:	a8 0d                	test   al,0xd
  50d131:	0f 85 fe 08 00 00    	jne    0x50da35
  50d137:	d9 05 c0 b6 54 00    	fld    DWORD PTR ds:0x54b6c0
  50d13d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d144:	75 08                	jne    0x50d14e
  50d146:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  50d14c:	eb 0b                	jmp    0x50d159
  50d14e:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  50d154:	e8 cf 75 ef ff       	call   0x404728
  50d159:	d9 9d f8 fe ff ff    	fstp   DWORD PTR [ebp-0x108]
  50d15f:	df e0                	fnstsw ax
  50d161:	a8 0d                	test   al,0xd
  50d163:	0f 85 cc 08 00 00    	jne    0x50da35
  50d169:	b8 04 00 00 00       	mov    eax,0x4
  50d16e:	89 85 f0 fe ff ff    	mov    DWORD PTR [ebp-0x110],eax
  50d174:	83 ec 10             	sub    esp,0x10
  50d177:	8b cc                	mov    ecx,esp
  50d179:	89 01                	mov    DWORD PTR [ecx],eax
  50d17b:	8b 95 f4 fe ff ff    	mov    edx,DWORD PTR [ebp-0x10c]
  50d181:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
  50d184:	8b 85 f8 fe ff ff    	mov    eax,DWORD PTR [ebp-0x108]
  50d18a:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
  50d18d:	8b 95 fc fe ff ff    	mov    edx,DWORD PTR [ebp-0x104]
  50d193:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  50d196:	68 0b 00 03 68       	push   0x6803000b
  50d19b:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50d1a0:	8b 08                	mov    ecx,DWORD PTR [eax]
  50d1a2:	50                   	push   eax
  50d1a3:	ff 91 54 04 00 00    	call   DWORD PTR [ecx+0x454]
  50d1a9:	50                   	push   eax
  50d1aa:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50d1b0:	52                   	push   edx
  50d1b1:	ff d3                	call   ebx
  50d1b3:	50                   	push   eax
  50d1b4:	ff d7                	call   edi
  50d1b6:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  50d1bc:	ff d6                	call   esi
  50d1be:	d9 05 98 b4 54 00    	fld    DWORD PTR ds:0x54b498
  50d1c4:	d8 1d 60 b1 54 00    	fcomp  DWORD PTR ds:0x54b160
  50d1ca:	df e0                	fnstsw ax
  50d1cc:	f6 c4 41             	test   ah,0x41
  50d1cf:	74 0a                	je     0x50d1db
  50d1d1:	a1 60 b1 54 00       	mov    eax,ds:0x54b160
  50d1d6:	a3 98 b4 54 00       	mov    ds:0x54b498,eax
  50d1db:	d9 05 c0 b6 54 00    	fld    DWORD PTR ds:0x54b6c0
  50d1e1:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50d1e7:	df e0                	fnstsw ax
  50d1e9:	f6 c4 01             	test   ah,0x1
  50d1ec:	74 0a                	je     0x50d1f8
  50d1ee:	c7 05 c0 b6 54 00 00 	mov    DWORD PTR ds:0x54b6c0,0x0
  50d1f5:	00 00 00 
  50d1f8:	d9 05 c0 b6 54 00    	fld    DWORD PTR ds:0x54b6c0
  50d1fe:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d205:	75 08                	jne    0x50d20f
  50d207:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  50d20d:	eb 0b                	jmp    0x50d21a
  50d20f:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  50d215:	e8 0e 75 ef ff       	call   0x404728
  50d21a:	d8 0d 9c b1 54 00    	fmul   DWORD PTR ds:0x54b19c
  50d220:	d8 2d ac b6 54 00    	fsubr  DWORD PTR ds:0x54b6ac
  50d226:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d22d:	75 08                	jne    0x50d237
  50d22f:	d8 35 a0 b1 54 00    	fdiv   DWORD PTR ds:0x54b1a0
  50d235:	eb 0b                	jmp    0x50d242
  50d237:	ff 35 a0 b1 54 00    	push   DWORD PTR ds:0x54b1a0
  50d23d:	e8 e6 74 ef ff       	call   0x404728
  50d242:	d8 2d f8 13 40 00    	fsubr  DWORD PTR ds:0x4013f8
  50d248:	d9 1d 34 ba 54 00    	fstp   DWORD PTR ds:0x54ba34
  50d24e:	df e0                	fnstsw ax
  50d250:	a8 0d                	test   al,0xd
  50d252:	0f 85 dd 07 00 00    	jne    0x50da35
  50d258:	d9 05 e4 b6 54 00    	fld    DWORD PTR ds:0x54b6e4
  50d25e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d265:	75 08                	jne    0x50d26f
  50d267:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50d26d:	eb 0b                	jmp    0x50d27a
  50d26f:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  50d275:	e8 ae 74 ef ff       	call   0x404728
  50d27a:	d8 2d 98 b4 54 00    	fsubr  DWORD PTR ds:0x54b498
  50d280:	d9 1d 9c b6 54 00    	fstp   DWORD PTR ds:0x54b69c
  50d286:	df e0                	fnstsw ax
  50d288:	a8 0d                	test   al,0xd
  50d28a:	0f 85 a5 07 00 00    	jne    0x50da35
  50d290:	d9 05 e8 b6 54 00    	fld    DWORD PTR ds:0x54b6e8
  50d296:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d29d:	75 08                	jne    0x50d2a7
  50d29f:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50d2a5:	eb 0b                	jmp    0x50d2b2
  50d2a7:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  50d2ad:	e8 76 74 ef ff       	call   0x404728
  50d2b2:	d8 2d 98 b4 54 00    	fsubr  DWORD PTR ds:0x54b498
  50d2b8:	d9 1d a0 b6 54 00    	fstp   DWORD PTR ds:0x54b6a0
  50d2be:	df e0                	fnstsw ax
  50d2c0:	a8 0d                	test   al,0xd
  50d2c2:	0f 85 6d 07 00 00    	jne    0x50da35
  50d2c8:	d9 05 9c b6 54 00    	fld    DWORD PTR ds:0x54b69c
  50d2ce:	d8 1d b8 b6 54 00    	fcomp  DWORD PTR ds:0x54b6b8
  50d2d4:	df e0                	fnstsw ax
  50d2d6:	f6 c4 01             	test   ah,0x1
  50d2d9:	74 1f                	je     0x50d2fa
  50d2db:	d9 05 98 b4 54 00    	fld    DWORD PTR ds:0x54b498
  50d2e1:	d8 1d b8 b6 54 00    	fcomp  DWORD PTR ds:0x54b6b8
  50d2e7:	df e0                	fnstsw ax
  50d2e9:	f6 c4 41             	test   ah,0x41
  50d2ec:	75 0c                	jne    0x50d2fa
  50d2ee:	8b 0d b8 b6 54 00    	mov    ecx,DWORD PTR ds:0x54b6b8
  50d2f4:	89 0d 9c b6 54 00    	mov    DWORD PTR ds:0x54b69c,ecx
  50d2fa:	d9 05 a0 b6 54 00    	fld    DWORD PTR ds:0x54b6a0
  50d300:	d8 1d bc b6 54 00    	fcomp  DWORD PTR ds:0x54b6bc
  50d306:	df e0                	fnstsw ax
  50d308:	f6 c4 01             	test   ah,0x1
  50d30b:	74 1f                	je     0x50d32c
  50d30d:	d9 05 98 b4 54 00    	fld    DWORD PTR ds:0x54b498
  50d313:	d8 1d bc b6 54 00    	fcomp  DWORD PTR ds:0x54b6bc
  50d319:	df e0                	fnstsw ax
  50d31b:	f6 c4 41             	test   ah,0x41
  50d31e:	75 0c                	jne    0x50d32c
  50d320:	8b 15 bc b6 54 00    	mov    edx,DWORD PTR ds:0x54b6bc
  50d326:	89 15 a0 b6 54 00    	mov    DWORD PTR ds:0x54b6a0,edx
  50d32c:	d9 05 e4 b6 54 00    	fld    DWORD PTR ds:0x54b6e4
  50d332:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d339:	75 08                	jne    0x50d343
  50d33b:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50d341:	eb 0b                	jmp    0x50d34e
  50d343:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  50d349:	e8 da 73 ef ff       	call   0x404728
  50d34e:	d8 05 98 b4 54 00    	fadd   DWORD PTR ds:0x54b498
  50d354:	d9 1d 94 b6 54 00    	fstp   DWORD PTR ds:0x54b694
  50d35a:	df e0                	fnstsw ax
  50d35c:	a8 0d                	test   al,0xd
  50d35e:	0f 85 d1 06 00 00    	jne    0x50da35
  50d364:	d9 05 e8 b6 54 00    	fld    DWORD PTR ds:0x54b6e8
  50d36a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d371:	75 08                	jne    0x50d37b
  50d373:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50d379:	eb 0b                	jmp    0x50d386
  50d37b:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  50d381:	e8 a2 73 ef ff       	call   0x404728
  50d386:	d8 05 98 b4 54 00    	fadd   DWORD PTR ds:0x54b498
  50d38c:	d9 1d 98 b6 54 00    	fstp   DWORD PTR ds:0x54b698
  50d392:	df e0                	fnstsw ax
  50d394:	a8 0d                	test   al,0xd
  50d396:	0f 85 99 06 00 00    	jne    0x50da35
  50d39c:	d9 05 30 b5 54 00    	fld    DWORD PTR ds:0x54b530
  50d3a2:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50d3a8:	df e0                	fnstsw ax
  50d3aa:	f6 c4 01             	test   ah,0x1
  50d3ad:	74 58                	je     0x50d407
  50d3af:	a1 a0 b6 54 00       	mov    eax,ds:0x54b6a0
  50d3b4:	a3 9c b6 54 00       	mov    ds:0x54b69c,eax
  50d3b9:	d9 05 a0 b6 54 00    	fld    DWORD PTR ds:0x54b6a0
  50d3bf:	d8 05 e4 b6 54 00    	fadd   DWORD PTR ds:0x54b6e4
  50d3c5:	d9 1d 94 b6 54 00    	fstp   DWORD PTR ds:0x54b694
  50d3cb:	df e0                	fnstsw ax
  50d3cd:	a8 0d                	test   al,0xd
  50d3cf:	0f 85 60 06 00 00    	jne    0x50da35
  50d3d5:	d9 05 94 b6 54 00    	fld    DWORD PTR ds:0x54b694
  50d3db:	d8 1d b8 b6 54 00    	fcomp  DWORD PTR ds:0x54b6b8
  50d3e1:	df e0                	fnstsw ax
  50d3e3:	f6 c4 01             	test   ah,0x1
  50d3e6:	74 1f                	je     0x50d407
  50d3e8:	d9 05 98 b4 54 00    	fld    DWORD PTR ds:0x54b498
  50d3ee:	d8 1d b8 b6 54 00    	fcomp  DWORD PTR ds:0x54b6b8
  50d3f4:	df e0                	fnstsw ax
  50d3f6:	f6 c4 41             	test   ah,0x41
  50d3f9:	75 0c                	jne    0x50d407
  50d3fb:	8b 0d b8 b6 54 00    	mov    ecx,DWORD PTR ds:0x54b6b8
  50d401:	89 0d 94 b6 54 00    	mov    DWORD PTR ds:0x54b694,ecx
  50d407:	d9 05 34 b5 54 00    	fld    DWORD PTR ds:0x54b534
  50d40d:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50d413:	df e0                	fnstsw ax
  50d415:	f6 c4 01             	test   ah,0x1
  50d418:	74 58                	je     0x50d472
  50d41a:	8b 15 9c b6 54 00    	mov    edx,DWORD PTR ds:0x54b69c
  50d420:	89 15 a0 b6 54 00    	mov    DWORD PTR ds:0x54b6a0,edx
  50d426:	d9 05 9c b6 54 00    	fld    DWORD PTR ds:0x54b69c
  50d42c:	d8 05 e8 b6 54 00    	fadd   DWORD PTR ds:0x54b6e8
  50d432:	d9 1d 98 b6 54 00    	fstp   DWORD PTR ds:0x54b698
  50d438:	df e0                	fnstsw ax
  50d43a:	a8 0d                	test   al,0xd
  50d43c:	0f 85 f3 05 00 00    	jne    0x50da35
  50d442:	d9 05 98 b6 54 00    	fld    DWORD PTR ds:0x54b698
  50d448:	d8 1d bc b6 54 00    	fcomp  DWORD PTR ds:0x54b6bc
  50d44e:	df e0                	fnstsw ax
  50d450:	f6 c4 01             	test   ah,0x1
  50d453:	74 1d                	je     0x50d472
  50d455:	d9 05 98 b4 54 00    	fld    DWORD PTR ds:0x54b498
  50d45b:	d8 1d bc b6 54 00    	fcomp  DWORD PTR ds:0x54b6bc
  50d461:	df e0                	fnstsw ax
  50d463:	f6 c4 41             	test   ah,0x41
  50d466:	75 0a                	jne    0x50d472
  50d468:	a1 bc b6 54 00       	mov    eax,ds:0x54b6bc
  50d46d:	a3 98 b6 54 00       	mov    ds:0x54b698,eax
  50d472:	d9 05 94 b6 54 00    	fld    DWORD PTR ds:0x54b694
  50d478:	d8 1d 90 b6 54 00    	fcomp  DWORD PTR ds:0x54b690
  50d47e:	df e0                	fnstsw ax
  50d480:	f6 c4 01             	test   ah,0x1
  50d483:	75 0c                	jne    0x50d491
  50d485:	8b 0d 90 b6 54 00    	mov    ecx,DWORD PTR ds:0x54b690
  50d48b:	89 0d 94 b6 54 00    	mov    DWORD PTR ds:0x54b694,ecx
  50d491:	d9 05 98 b6 54 00    	fld    DWORD PTR ds:0x54b698
  50d497:	d8 1d 90 b6 54 00    	fcomp  DWORD PTR ds:0x54b690
  50d49d:	df e0                	fnstsw ax
  50d49f:	f6 c4 01             	test   ah,0x1
  50d4a2:	75 0c                	jne    0x50d4b0
  50d4a4:	8b 15 90 b6 54 00    	mov    edx,DWORD PTR ds:0x54b690
  50d4aa:	89 15 98 b6 54 00    	mov    DWORD PTR ds:0x54b698,edx
  50d4b0:	d9 05 40 b7 54 00    	fld    DWORD PTR ds:0x54b740
  50d4b6:	d8 0d 2c b1 54 00    	fmul   DWORD PTR ds:0x54b12c
  50d4bc:	df e0                	fnstsw ax
  50d4be:	a8 0d                	test   al,0xd
  50d4c0:	0f 85 6f 05 00 00    	jne    0x50da35
  50d4c6:	d9 05 30 b5 54 00    	fld    DWORD PTR ds:0x54b530
  50d4cc:	d9 e1                	fabs
  50d4ce:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d4d5:	75 04                	jne    0x50d4db
  50d4d7:	de f9                	fdivp  st(1),st
  50d4d9:	eb 09                	jmp    0x50d4e4
  50d4db:	50                   	push   eax
  50d4dc:	b0 0d                	mov    al,0xd
  50d4de:	e8 57 72 ef ff       	call   0x40473a
  50d4e3:	58                   	pop    eax
  50d4e4:	df e0                	fnstsw ax
  50d4e6:	a8 0d                	test   al,0xd
  50d4e8:	0f 85 47 05 00 00    	jne    0x50da35
  50d4ee:	d9 9d 48 fe ff ff    	fstp   DWORD PTR [ebp-0x1b8]
  50d4f4:	d9 85 48 fe ff ff    	fld    DWORD PTR [ebp-0x1b8]
  50d4fa:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50d500:	d9 9d 44 fe ff ff    	fstp   DWORD PTR [ebp-0x1bc]
  50d506:	d9 05 a0 2f 40 00    	fld    DWORD PTR ds:0x402fa0
  50d50c:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50d512:	d8 9d 44 fe ff ff    	fcomp  DWORD PTR [ebp-0x1bc]
  50d518:	df e0                	fnstsw ax
  50d51a:	f6 c4 01             	test   ah,0x1
  50d51d:	74 43                	je     0x50d562
  50d51f:	d9 05 40 b7 54 00    	fld    DWORD PTR ds:0x54b740
  50d525:	d8 0d 2c b1 54 00    	fmul   DWORD PTR ds:0x54b12c
  50d52b:	df e0                	fnstsw ax
  50d52d:	a8 0d                	test   al,0xd
  50d52f:	0f 85 00 05 00 00    	jne    0x50da35
  50d535:	d9 05 30 b5 54 00    	fld    DWORD PTR ds:0x54b530
  50d53b:	d9 e1                	fabs
  50d53d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d544:	75 04                	jne    0x50d54a
  50d546:	de f9                	fdivp  st(1),st
  50d548:	eb 09                	jmp    0x50d553
  50d54a:	50                   	push   eax
  50d54b:	b0 0d                	mov    al,0xd
  50d54d:	e8 e8 71 ef ff       	call   0x40473a
  50d552:	58                   	pop    eax
  50d553:	d9 5d 98             	fstp   DWORD PTR [ebp-0x68]
  50d556:	df e0                	fnstsw ax
  50d558:	a8 0d                	test   al,0xd
  50d55a:	0f 85 d5 04 00 00    	jne    0x50da35
  50d560:	eb 07                	jmp    0x50d569
  50d562:	c7 45 98 00 00 a0 40 	mov    DWORD PTR [ebp-0x68],0x40a00000
  50d569:	d9 05 44 b7 54 00    	fld    DWORD PTR ds:0x54b744
  50d56f:	d8 0d 2c b1 54 00    	fmul   DWORD PTR ds:0x54b12c
  50d575:	df e0                	fnstsw ax
  50d577:	a8 0d                	test   al,0xd
  50d579:	0f 85 b6 04 00 00    	jne    0x50da35
  50d57f:	d9 05 34 b5 54 00    	fld    DWORD PTR ds:0x54b534
  50d585:	d9 e1                	fabs
  50d587:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d58e:	75 04                	jne    0x50d594
  50d590:	de f9                	fdivp  st(1),st
  50d592:	eb 09                	jmp    0x50d59d
  50d594:	50                   	push   eax
  50d595:	b0 0d                	mov    al,0xd
  50d597:	e8 9e 71 ef ff       	call   0x40473a
  50d59c:	58                   	pop    eax
  50d59d:	df e0                	fnstsw ax
  50d59f:	a8 0d                	test   al,0xd
  50d5a1:	0f 85 8e 04 00 00    	jne    0x50da35
  50d5a7:	d9 9d 40 fe ff ff    	fstp   DWORD PTR [ebp-0x1c0]
  50d5ad:	d9 85 40 fe ff ff    	fld    DWORD PTR [ebp-0x1c0]
  50d5b3:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50d5b9:	d9 9d 3c fe ff ff    	fstp   DWORD PTR [ebp-0x1c4]
  50d5bf:	d9 05 a0 2f 40 00    	fld    DWORD PTR ds:0x402fa0
  50d5c5:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50d5cb:	d8 9d 3c fe ff ff    	fcomp  DWORD PTR [ebp-0x1c4]
  50d5d1:	df e0                	fnstsw ax
  50d5d3:	f6 c4 01             	test   ah,0x1
  50d5d6:	74 43                	je     0x50d61b
  50d5d8:	d9 05 44 b7 54 00    	fld    DWORD PTR ds:0x54b744
  50d5de:	d8 0d 2c b1 54 00    	fmul   DWORD PTR ds:0x54b12c
  50d5e4:	df e0                	fnstsw ax
  50d5e6:	a8 0d                	test   al,0xd
  50d5e8:	0f 85 47 04 00 00    	jne    0x50da35
  50d5ee:	d9 05 34 b5 54 00    	fld    DWORD PTR ds:0x54b534
  50d5f4:	d9 e1                	fabs
  50d5f6:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d5fd:	75 04                	jne    0x50d603
  50d5ff:	de f9                	fdivp  st(1),st
  50d601:	eb 09                	jmp    0x50d60c
  50d603:	50                   	push   eax
  50d604:	b0 0d                	mov    al,0xd
  50d606:	e8 2f 71 ef ff       	call   0x40473a
  50d60b:	58                   	pop    eax
  50d60c:	d9 5d 80             	fstp   DWORD PTR [ebp-0x80]
  50d60f:	df e0                	fnstsw ax
  50d611:	a8 0d                	test   al,0xd
  50d613:	0f 85 1c 04 00 00    	jne    0x50da35
  50d619:	eb 07                	jmp    0x50d622
  50d61b:	c7 45 80 00 00 a0 40 	mov    DWORD PTR [ebp-0x80],0x40a00000
  50d622:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  50d628:	d8 1d 18 b4 54 00    	fcomp  DWORD PTR ds:0x54b418
  50d62e:	df e0                	fnstsw ax
  50d630:	f6 c4 41             	test   ah,0x41
  50d633:	74 2c                	je     0x50d661
  50d635:	a1 94 b6 54 00       	mov    eax,ds:0x54b694
  50d63a:	a3 b4 ba 54 00       	mov    ds:0x54bab4,eax
  50d63f:	8b 0d 98 b6 54 00    	mov    ecx,DWORD PTR ds:0x54b698
  50d645:	89 0d b8 ba 54 00    	mov    DWORD PTR ds:0x54bab8,ecx
  50d64b:	8b 15 9c b6 54 00    	mov    edx,DWORD PTR ds:0x54b69c
  50d651:	89 15 bc ba 54 00    	mov    DWORD PTR ds:0x54babc,edx
  50d657:	a1 a0 b6 54 00       	mov    eax,ds:0x54b6a0
  50d65c:	a3 c0 ba 54 00       	mov    ds:0x54bac0,eax
  50d661:	d9 45 98             	fld    DWORD PTR [ebp-0x68]
  50d664:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d66b:	75 08                	jne    0x50d675
  50d66d:	d8 35 14 b4 54 00    	fdiv   DWORD PTR ds:0x54b414
  50d673:	eb 0b                	jmp    0x50d680
  50d675:	ff 35 14 b4 54 00    	push   DWORD PTR ds:0x54b414
  50d67b:	e8 a8 70 ef ff       	call   0x404728
  50d680:	d8 0d b4 ba 54 00    	fmul   DWORD PTR ds:0x54bab4
  50d686:	d8 05 94 b6 54 00    	fadd   DWORD PTR ds:0x54b694
  50d68c:	d9 45 98             	fld    DWORD PTR [ebp-0x68]
  50d68f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d696:	75 08                	jne    0x50d6a0
  50d698:	d8 35 14 b4 54 00    	fdiv   DWORD PTR ds:0x54b414
  50d69e:	eb 0b                	jmp    0x50d6ab
  50d6a0:	ff 35 14 b4 54 00    	push   DWORD PTR ds:0x54b414
  50d6a6:	e8 7d 70 ef ff       	call   0x404728
  50d6ab:	d8 05 f8 13 40 00    	fadd   DWORD PTR ds:0x4013f8
  50d6b1:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d6b8:	75 04                	jne    0x50d6be
  50d6ba:	de f9                	fdivp  st(1),st
  50d6bc:	eb 09                	jmp    0x50d6c7
  50d6be:	50                   	push   eax
  50d6bf:	b0 0d                	mov    al,0xd
  50d6c1:	e8 74 70 ef ff       	call   0x40473a
  50d6c6:	58                   	pop    eax
  50d6c7:	d9 1d 94 b6 54 00    	fstp   DWORD PTR ds:0x54b694
  50d6cd:	df e0                	fnstsw ax
  50d6cf:	a8 0d                	test   al,0xd
  50d6d1:	0f 85 5e 03 00 00    	jne    0x50da35
  50d6d7:	d9 45 80             	fld    DWORD PTR [ebp-0x80]
  50d6da:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d6e1:	75 08                	jne    0x50d6eb
  50d6e3:	d8 35 14 b4 54 00    	fdiv   DWORD PTR ds:0x54b414
  50d6e9:	eb 0b                	jmp    0x50d6f6
  50d6eb:	ff 35 14 b4 54 00    	push   DWORD PTR ds:0x54b414
  50d6f1:	e8 32 70 ef ff       	call   0x404728
  50d6f6:	d8 0d b8 ba 54 00    	fmul   DWORD PTR ds:0x54bab8
  50d6fc:	d8 05 98 b6 54 00    	fadd   DWORD PTR ds:0x54b698
  50d702:	d9 45 80             	fld    DWORD PTR [ebp-0x80]
  50d705:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d70c:	75 08                	jne    0x50d716
  50d70e:	d8 35 14 b4 54 00    	fdiv   DWORD PTR ds:0x54b414
  50d714:	eb 0b                	jmp    0x50d721
  50d716:	ff 35 14 b4 54 00    	push   DWORD PTR ds:0x54b414
  50d71c:	e8 07 70 ef ff       	call   0x404728
  50d721:	d8 05 f8 13 40 00    	fadd   DWORD PTR ds:0x4013f8
  50d727:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d72e:	75 04                	jne    0x50d734
  50d730:	de f9                	fdivp  st(1),st
  50d732:	eb 09                	jmp    0x50d73d
  50d734:	50                   	push   eax
  50d735:	b0 0d                	mov    al,0xd
  50d737:	e8 fe 6f ef ff       	call   0x40473a
  50d73c:	58                   	pop    eax
  50d73d:	d9 1d 98 b6 54 00    	fstp   DWORD PTR ds:0x54b698
  50d743:	df e0                	fnstsw ax
  50d745:	a8 0d                	test   al,0xd
  50d747:	0f 85 e8 02 00 00    	jne    0x50da35
  50d74d:	d9 45 98             	fld    DWORD PTR [ebp-0x68]
  50d750:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d757:	75 08                	jne    0x50d761
  50d759:	d8 35 14 b4 54 00    	fdiv   DWORD PTR ds:0x54b414
  50d75f:	eb 0b                	jmp    0x50d76c
  50d761:	ff 35 14 b4 54 00    	push   DWORD PTR ds:0x54b414
  50d767:	e8 bc 6f ef ff       	call   0x404728
  50d76c:	d8 0d bc ba 54 00    	fmul   DWORD PTR ds:0x54babc
  50d772:	d8 05 9c b6 54 00    	fadd   DWORD PTR ds:0x54b69c
  50d778:	d9 45 98             	fld    DWORD PTR [ebp-0x68]
  50d77b:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d782:	75 08                	jne    0x50d78c
  50d784:	d8 35 14 b4 54 00    	fdiv   DWORD PTR ds:0x54b414
  50d78a:	eb 0b                	jmp    0x50d797
  50d78c:	ff 35 14 b4 54 00    	push   DWORD PTR ds:0x54b414
  50d792:	e8 91 6f ef ff       	call   0x404728
  50d797:	d8 05 f8 13 40 00    	fadd   DWORD PTR ds:0x4013f8
  50d79d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d7a4:	75 04                	jne    0x50d7aa
  50d7a6:	de f9                	fdivp  st(1),st
  50d7a8:	eb 09                	jmp    0x50d7b3
  50d7aa:	50                   	push   eax
  50d7ab:	b0 0d                	mov    al,0xd
  50d7ad:	e8 88 6f ef ff       	call   0x40473a
  50d7b2:	58                   	pop    eax
  50d7b3:	d9 1d 9c b6 54 00    	fstp   DWORD PTR ds:0x54b69c
  50d7b9:	df e0                	fnstsw ax
  50d7bb:	a8 0d                	test   al,0xd
  50d7bd:	0f 85 72 02 00 00    	jne    0x50da35
  50d7c3:	d9 45 80             	fld    DWORD PTR [ebp-0x80]
  50d7c6:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d7cd:	75 08                	jne    0x50d7d7
  50d7cf:	d8 35 14 b4 54 00    	fdiv   DWORD PTR ds:0x54b414
  50d7d5:	eb 0b                	jmp    0x50d7e2
  50d7d7:	ff 35 14 b4 54 00    	push   DWORD PTR ds:0x54b414
  50d7dd:	e8 46 6f ef ff       	call   0x404728
  50d7e2:	d8 0d c0 ba 54 00    	fmul   DWORD PTR ds:0x54bac0
  50d7e8:	d8 05 a0 b6 54 00    	fadd   DWORD PTR ds:0x54b6a0
  50d7ee:	d9 45 80             	fld    DWORD PTR [ebp-0x80]
  50d7f1:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d7f8:	75 08                	jne    0x50d802
  50d7fa:	d8 35 14 b4 54 00    	fdiv   DWORD PTR ds:0x54b414
  50d800:	eb 0b                	jmp    0x50d80d
  50d802:	ff 35 14 b4 54 00    	push   DWORD PTR ds:0x54b414
  50d808:	e8 1b 6f ef ff       	call   0x404728
  50d80d:	d8 05 f8 13 40 00    	fadd   DWORD PTR ds:0x4013f8
  50d813:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50d81a:	75 04                	jne    0x50d820
  50d81c:	de f9                	fdivp  st(1),st
  50d81e:	eb 09                	jmp    0x50d829
  50d820:	50                   	push   eax
  50d821:	b0 0d                	mov    al,0xd
  50d823:	e8 12 6f ef ff       	call   0x40473a
  50d828:	58                   	pop    eax
  50d829:	d9 1d a0 b6 54 00    	fstp   DWORD PTR ds:0x54b6a0
  50d82f:	df e0                	fnstsw ax
  50d831:	a8 0d                	test   al,0xd
  50d833:	0f 85 fc 01 00 00    	jne    0x50da35
  50d839:	8b 0d 94 b6 54 00    	mov    ecx,DWORD PTR ds:0x54b694
  50d83f:	89 0d b4 ba 54 00    	mov    DWORD PTR ds:0x54bab4,ecx
  50d845:	8b 15 98 b6 54 00    	mov    edx,DWORD PTR ds:0x54b698
  50d84b:	89 15 b8 ba 54 00    	mov    DWORD PTR ds:0x54bab8,edx
  50d851:	a1 9c b6 54 00       	mov    eax,ds:0x54b69c
  50d856:	a3 bc ba 54 00       	mov    ds:0x54babc,eax
  50d85b:	8b 0d a0 b6 54 00    	mov    ecx,DWORD PTR ds:0x54b6a0
  50d861:	89 0d c0 ba 54 00    	mov    DWORD PTR ds:0x54bac0,ecx
  50d867:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  50d86d:	50                   	push   eax
  50d86e:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50d874:	52                   	push   edx
  50d875:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50d87b:	8b f0                	mov    esi,eax
  50d87d:	8b 06                	mov    eax,DWORD PTR [esi]
  50d87f:	8d 8d d8 fe ff ff    	lea    ecx,[ebp-0x128]
  50d885:	51                   	push   ecx
  50d886:	56                   	push   esi
  50d887:	ff 50 1c             	call   DWORD PTR [eax+0x1c]
  50d88a:	db e2                	fnclex
  50d88c:	85 c0                	test   eax,eax
  50d88e:	7d 0f                	jge    0x50d89f
  50d890:	6a 1c                	push   0x1c
  50d892:	68 d0 b0 41 00       	push   0x41b0d0
  50d897:	56                   	push   esi
  50d898:	50                   	push   eax
  50d899:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50d89f:	33 d2                	xor    edx,edx
  50d8a1:	8b b5 d8 fe ff ff    	mov    esi,DWORD PTR [ebp-0x128]
  50d8a7:	85 f6                	test   esi,esi
  50d8a9:	0f 9f c2             	setg   dl
  50d8ac:	f7 da                	neg    edx
  50d8ae:	8b f2                	mov    esi,edx
  50d8b0:	89 b5 c0 fe ff ff    	mov    DWORD PTR [ebp-0x140],esi
  50d8b6:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  50d8bc:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  50d8c2:	66 85 f6             	test   si,si
  50d8c5:	0f 84 f6 00 00 00    	je     0x50d9c1
  50d8cb:	ba 84 42 42 00       	mov    edx,0x424284
  50d8d0:	b9 48 b6 54 00       	mov    ecx,0x54b648
  50d8d5:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  50d8db:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  50d8e0:	85 c0                	test   eax,eax
  50d8e2:	75 10                	jne    0x50d8f4
  50d8e4:	68 10 b0 54 00       	push   0x54b010
  50d8e9:	68 8c 7e 40 00       	push   0x407e8c
  50d8ee:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  50d8f4:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  50d8fa:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50d8ff:	89 85 e8 fe ff ff    	mov    DWORD PTR [ebp-0x118],eax
  50d905:	b9 09 00 00 00       	mov    ecx,0x9
  50d90a:	89 8d e0 fe ff ff    	mov    DWORD PTR [ebp-0x120],ecx
  50d910:	ba 01 00 00 00       	mov    edx,0x1
  50d915:	89 95 f8 fe ff ff    	mov    DWORD PTR [ebp-0x108],edx
  50d91b:	c7 85 f0 fe ff ff 03 	mov    DWORD PTR [ebp-0x110],0x3
  50d922:	00 00 00 
  50d925:	8b 3e                	mov    edi,DWORD PTR [esi]
  50d927:	83 ec 10             	sub    esp,0x10
  50d92a:	8b dc                	mov    ebx,esp
  50d92c:	89 0b                	mov    DWORD PTR [ebx],ecx
  50d92e:	8b 8d e4 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x11c]
  50d934:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  50d937:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  50d93a:	8b 85 ec fe ff ff    	mov    eax,DWORD PTR [ebp-0x114]
  50d940:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  50d943:	83 ec 10             	sub    esp,0x10
  50d946:	8b cc                	mov    ecx,esp
  50d948:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [ebp-0x110]
  50d94e:	89 01                	mov    DWORD PTR [ecx],eax
  50d950:	8b 85 f4 fe ff ff    	mov    eax,DWORD PTR [ebp-0x10c]
  50d956:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  50d959:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  50d95c:	8b 95 fc fe ff ff    	mov    edx,DWORD PTR [ebp-0x104]
  50d962:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  50d965:	56                   	push   esi
  50d966:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  50d96c:	db e2                	fnclex
  50d96e:	85 c0                	test   eax,eax
  50d970:	7d 12                	jge    0x50d984
  50d972:	68 b0 02 00 00       	push   0x2b0
  50d977:	68 d8 ae 41 00       	push   0x41aed8
  50d97c:	56                   	push   esi
  50d97d:	50                   	push   eax
  50d97e:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50d984:	c7 85 dc fe ff ff 00 	mov    DWORD PTR [ebp-0x124],0x0
  50d98b:	00 00 00 
  50d98e:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50d993:	8b 08                	mov    ecx,DWORD PTR [eax]
  50d995:	8d 95 dc fe ff ff    	lea    edx,[ebp-0x124]
  50d99b:	52                   	push   edx
  50d99c:	50                   	push   eax
  50d99d:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  50d9a3:	db e2                	fnclex
  50d9a5:	85 c0                	test   eax,eax
  50d9a7:	7d 18                	jge    0x50d9c1
  50d9a9:	68 fc 06 00 00       	push   0x6fc
  50d9ae:	68 34 e4 41 00       	push   0x41e434
  50d9b3:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  50d9b9:	51                   	push   ecx
  50d9ba:	50                   	push   eax
  50d9bb:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50d9c1:	6a 00                	push   0x0
  50d9c3:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  50d9c9:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  50d9cf:	9b                   	fwait
  50d9d0:	68 24 da 50 00       	push   0x50da24
  50d9d5:	eb 4c                	jmp    0x50da23
  50d9d7:	8d 95 40 ff ff ff    	lea    edx,[ebp-0xc0]
  50d9dd:	52                   	push   edx
  50d9de:	8d 85 44 ff ff ff    	lea    eax,[ebp-0xbc]
  50d9e4:	50                   	push   eax
  50d9e5:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  50d9eb:	51                   	push   ecx
  50d9ec:	8d 95 4c ff ff ff    	lea    edx,[ebp-0xb4]
  50d9f2:	52                   	push   edx
  50d9f3:	6a 04                	push   0x4
  50d9f5:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50d9fb:	8d 85 00 ff ff ff    	lea    eax,[ebp-0x100]
  50da01:	50                   	push   eax
  50da02:	8d 8d 10 ff ff ff    	lea    ecx,[ebp-0xf0]
  50da08:	51                   	push   ecx
  50da09:	8d 95 20 ff ff ff    	lea    edx,[ebp-0xe0]
  50da0f:	52                   	push   edx
  50da10:	8d 85 30 ff ff ff    	lea    eax,[ebp-0xd0]
  50da16:	50                   	push   eax
  50da17:	6a 04                	push   0x4
  50da19:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50da1f:	83 c4 28             	add    esp,0x28
  50da22:	c3                   	ret
  50da23:	c3                   	ret
  50da24:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  50da27:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  50da2e:	5f                   	pop    edi
  50da2f:	5e                   	pop    esi
  50da30:	5b                   	pop    ebx
  50da31:	8b e5                	mov    esp,ebp
  50da33:	5d                   	pop    ebp
  50da34:	c3                   	ret
  50da35:	e9 e2 6c ef ff       	jmp    0x40471c
  50da3a:	ff 15 b0 11 40 00    	call   DWORD PTR ds:0x4011b0
