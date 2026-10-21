
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0050cc20 <.text+0x10bc20>:
  50cc20:	0e                   	push   cs
  50cc21:	00 00                	add    BYTE PTR [eax],al
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
  50cfdc:	83                   	.byte 0x83
  50cfdd:	3d                   	.byte 0x3d
  50cfde:	00                   	.byte 0
  50cfdf:	b0                   	.byte 0xb0
