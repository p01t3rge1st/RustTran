
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0050bdd9 <.text+0x10add9>:
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
