
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0050cbac <.text+0x10bbac>:
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
