
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0050bae2 <.text+0x10aae2>:
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
