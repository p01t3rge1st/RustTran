
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

00508960 <.text+0x107960>:
  508960:	55                   	push   ebp
  508961:	8b ec                	mov    ebp,esp
  508963:	83 ec 14             	sub    esp,0x14
  508966:	68 16 47 40 00       	push   0x404716
  50896b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  508971:	50                   	push   eax
  508972:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  508979:	81 ec c0 01 00 00    	sub    esp,0x1c0
  50897f:	53                   	push   ebx
  508980:	56                   	push   esi
  508981:	57                   	push   edi
  508982:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  508985:	c7 45 f0 70 34 40 00 	mov    DWORD PTR [ebp-0x10],0x403470
  50898c:	33 db                	xor    ebx,ebx
  50898e:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  508991:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
  508994:	89 5d e0             	mov    DWORD PTR [ebp-0x20],ebx
  508997:	89 5d dc             	mov    DWORD PTR [ebp-0x24],ebx
  50899a:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  50899d:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
  5089a0:	89 5d cc             	mov    DWORD PTR [ebp-0x34],ebx
  5089a3:	89 5d c8             	mov    DWORD PTR [ebp-0x38],ebx
  5089a6:	89 5d c0             	mov    DWORD PTR [ebp-0x40],ebx
  5089a9:	89 5d bc             	mov    DWORD PTR [ebp-0x44],ebx
  5089ac:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  5089af:	89 5d b4             	mov    DWORD PTR [ebp-0x4c],ebx
  5089b2:	89 5d b0             	mov    DWORD PTR [ebp-0x50],ebx
  5089b5:	89 5d ac             	mov    DWORD PTR [ebp-0x54],ebx
  5089b8:	89 5d 9c             	mov    DWORD PTR [ebp-0x64],ebx
  5089bb:	89 5d 8c             	mov    DWORD PTR [ebp-0x74],ebx
  5089be:	89 9d 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],ebx
  5089c4:	89 9d 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],ebx
  5089ca:	89 9d 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],ebx
  5089d0:	89 9d 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],ebx
  5089d6:	89 9d 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],ebx
  5089dc:	89 9d 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],ebx
  5089e2:	89 9d 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],ebx
  5089e8:	6a 01                	push   0x1
  5089ea:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  5089f0:	d9 05 08 b2 54 00    	fld    DWORD PTR ds:0x54b208
  5089f6:	8b bd a4 00 00 00    	mov    edi,DWORD PTR [ebp+0xa4]
  5089fc:	d8 0f                	fmul   DWORD PTR [edi]
  5089fe:	8b 75 1c             	mov    esi,DWORD PTR [ebp+0x1c]
  508a01:	d8 0e                	fmul   DWORD PTR [esi]
  508a03:	d9 5d cc             	fstp   DWORD PTR [ebp-0x34]
  508a06:	df e0                	fnstsw ax
  508a08:	a8 0d                	test   al,0xd
  508a0a:	0f 85 0e 25 00 00    	jne    0x50af1e
  508a10:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  508a13:	50                   	push   eax
  508a14:	e8 f7 23 f9 ff       	call   0x49ae10
  508a19:	8b 4d 6c             	mov    ecx,DWORD PTR [ebp+0x6c]
  508a1c:	d9 19                	fstp   DWORD PTR [ecx]
  508a1e:	d9 05 8c b1 54 00    	fld    DWORD PTR ds:0x54b18c
  508a24:	d8 0e                	fmul   DWORD PTR [esi]
  508a26:	d8 0f                	fmul   DWORD PTR [edi]
  508a28:	8b 55 38             	mov    edx,DWORD PTR [ebp+0x38]
  508a2b:	d8 0a                	fmul   DWORD PTR [edx]
  508a2d:	d9 5d d8             	fstp   DWORD PTR [ebp-0x28]
  508a30:	df e0                	fnstsw ax
  508a32:	a8 0d                	test   al,0xd
  508a34:	0f 85 e4 24 00 00    	jne    0x50af1e
  508a3a:	8b 45 48             	mov    eax,DWORD PTR [ebp+0x48]
  508a3d:	66 39 18             	cmp    WORD PTR [eax],bx
  508a40:	0f 85 a2 01 00 00    	jne    0x508be8
  508a46:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
  508a49:	d9 01                	fld    DWORD PTR [ecx]
  508a4b:	8b 75 30             	mov    esi,DWORD PTR [ebp+0x30]
  508a4e:	d8 1e                	fcomp  DWORD PTR [esi]
  508a50:	df e0                	fnstsw ax
  508a52:	f6 c4 41             	test   ah,0x41
  508a55:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [ebp-0xdc],0x1
  508a5c:	00 00 00 
  508a5f:	75 06                	jne    0x508a67
  508a61:	89 9d 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],ebx
  508a67:	d9 06                	fld    DWORD PTR [esi]
  508a69:	d8 05 94 2f 40 00    	fadd   DWORD PTR ds:0x402f94
  508a6f:	df e0                	fnstsw ax
  508a71:	a8 0d                	test   al,0xd
  508a73:	0f 85 a5 24 00 00    	jne    0x50af1e
  508a79:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  508a7f:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  508a82:	d8 1a                	fcomp  DWORD PTR [edx]
  508a84:	df e0                	fnstsw ax
  508a86:	f6 c4 01             	test   ah,0x1
  508a89:	74 05                	je     0x508a90
  508a8b:	bb 01 00 00 00       	mov    ebx,0x1
  508a90:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [ebp-0xdc]
  508a96:	0b c3                	or     eax,ebx
  508a98:	0f 85 1c 01 00 00    	jne    0x508bba
  508a9e:	68 00 00 00 40       	push   0x40000000
  508aa3:	6a 00                	push   0x0
  508aa5:	8b 5d 14             	mov    ebx,DWORD PTR [ebp+0x14]
  508aa8:	d9 03                	fld    DWORD PTR [ebx]
  508aaa:	d8 26                	fsub   DWORD PTR [esi]
  508aac:	d8 25 94 2f 40 00    	fsub   DWORD PTR ds:0x402f94
  508ab2:	df e0                	fnstsw ax
  508ab4:	a8 0d                	test   al,0xd
  508ab6:	0f 85 62 24 00 00    	jne    0x50af1e
  508abc:	83 ec 08             	sub    esp,0x8
  508abf:	dd 1c 24             	fstp   QWORD PTR [esp]
  508ac2:	ff 15 f4 11 40 00    	call   DWORD PTR ds:0x4011f4
  508ac8:	dd 9d 1c ff ff ff    	fstp   QWORD PTR [ebp-0xe4]
  508ace:	68 00 00 00 40       	push   0x40000000
  508ad3:	6a 00                	push   0x0
  508ad5:	d9 03                	fld    DWORD PTR [ebx]
  508ad7:	d8 26                	fsub   DWORD PTR [esi]
  508ad9:	d8 25 94 2f 40 00    	fsub   DWORD PTR ds:0x402f94
  508adf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  508ae2:	d8 20                	fsub   DWORD PTR [eax]
  508ae4:	df e0                	fnstsw ax
  508ae6:	a8 0d                	test   al,0xd
  508ae8:	0f 85 30 24 00 00    	jne    0x50af1e
  508aee:	83 ec 08             	sub    esp,0x8
  508af1:	dd 1c 24             	fstp   QWORD PTR [esp]
  508af4:	ff 15 f4 11 40 00    	call   DWORD PTR ds:0x4011f4
  508afa:	dc ad 1c ff ff ff    	fsubr  QWORD PTR [ebp-0xe4]
  508b00:	66 b9 02 00          	mov    cx,0x2
  508b04:	8b 95 8c 00 00 00    	mov    edx,DWORD PTR [ebp+0x8c]
  508b0a:	66 2b 0a             	sub    cx,WORD PTR [edx]
  508b0d:	0f 80 10 24 00 00    	jo     0x50af23
  508b13:	0f bf c1             	movsx  eax,cx
  508b16:	89 85 18 ff ff ff    	mov    DWORD PTR [ebp-0xe8],eax
  508b1c:	db 85 18 ff ff ff    	fild   DWORD PTR [ebp-0xe8]
  508b22:	d9 9d 14 ff ff ff    	fstp   DWORD PTR [ebp-0xec]
  508b28:	d9 85 14 ff ff ff    	fld    DWORD PTR [ebp-0xec]
  508b2e:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
  508b31:	d8 09                	fmul   DWORD PTR [ecx]
  508b33:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508b3a:	75 08                	jne    0x508b44
  508b3c:	d8 35 34 34 40 00    	fdiv   DWORD PTR ds:0x403434
  508b42:	eb 0b                	jmp    0x508b4f
  508b44:	ff 35 34 34 40 00    	push   DWORD PTR ds:0x403434
  508b4a:	e8 d9 bb ef ff       	call   0x404728
  508b4f:	d8 0f                	fmul   DWORD PTR [edi]
  508b51:	df e0                	fnstsw ax
  508b53:	a8 0d                	test   al,0xd
  508b55:	0f 85 c3 23 00 00    	jne    0x50af1e
  508b5b:	de c9                	fmulp  st(1),st
  508b5d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508b64:	75 08                	jne    0x508b6e
  508b66:	dc 35 68 34 40 00    	fdiv   QWORD PTR ds:0x403468
  508b6c:	eb 11                	jmp    0x508b7f
  508b6e:	ff 35 6c 34 40 00    	push   DWORD PTR ds:0x40346c
  508b74:	ff 35 68 34 40 00    	push   DWORD PTR ds:0x403468
  508b7a:	e8 b5 bb ef ff       	call   0x404734
  508b7f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508b86:	75 08                	jne    0x508b90
  508b88:	dc 35 68 34 40 00    	fdiv   QWORD PTR ds:0x403468
  508b8e:	eb 11                	jmp    0x508ba1
  508b90:	ff 35 6c 34 40 00    	push   DWORD PTR ds:0x40346c
  508b96:	ff 35 68 34 40 00    	push   DWORD PTR ds:0x403468
  508b9c:	e8 93 bb ef ff       	call   0x404734
  508ba1:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
  508ba4:	d8 06                	fadd   DWORD PTR [esi]
  508ba6:	d9 1e                	fstp   DWORD PTR [esi]
  508ba8:	df e0                	fnstsw ax
  508baa:	a8 0d                	test   al,0xd
  508bac:	0f 85 6c 23 00 00    	jne    0x50af1e
  508bb2:	8b 1d 34 11 40 00    	mov    ebx,DWORD PTR ds:0x401134
  508bb8:	eb 37                	jmp    0x508bf1
  508bba:	d9 06                	fld    DWORD PTR [esi]
  508bbc:	d8 05 94 2f 40 00    	fadd   DWORD PTR ds:0x402f94
  508bc2:	df e0                	fnstsw ax
  508bc4:	a8 0d                	test   al,0xd
  508bc6:	0f 85 52 23 00 00    	jne    0x50af1e
  508bcc:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  508bd2:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  508bd5:	d8 1a                	fcomp  DWORD PTR [edx]
  508bd7:	df e0                	fnstsw ax
  508bd9:	f6 c4 41             	test   ah,0x41
  508bdc:	0f 84 b6 00 00 00    	je     0x508c98
  508be2:	c7 06 80 4f c3 47    	mov    DWORD PTR [esi],0x47c34f80
  508be8:	8b 1d 34 11 40 00    	mov    ebx,DWORD PTR ds:0x401134
  508bee:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
  508bf1:	d9 06                	fld    DWORD PTR [esi]
  508bf3:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  508bf9:	df e0                	fnstsw ax
  508bfb:	f6 c4 01             	test   ah,0x1
  508bfe:	74 06                	je     0x508c06
  508c00:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
  508c06:	d9 06                	fld    DWORD PTR [esi]
  508c08:	d8 5d dc             	fcomp  DWORD PTR [ebp-0x24]
  508c0b:	df e0                	fnstsw ax
  508c0d:	f6 c4 41             	test   ah,0x41
  508c10:	75 05                	jne    0x508c17
  508c12:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  508c15:	89 16                	mov    DWORD PTR [esi],edx
  508c17:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  508c1a:	8b 8d 88 00 00 00    	mov    ecx,DWORD PTR [ebp+0x88]
  508c20:	89 01                	mov    DWORD PTR [ecx],eax
  508c22:	8b 55 40             	mov    edx,DWORD PTR [ebp+0x40]
  508c25:	66 83 3a 00          	cmp    WORD PTR [edx],0x0
  508c29:	0f 85 8b 04 00 00    	jne    0x5090ba
  508c2f:	a1 30 b6 54 00       	mov    eax,ds:0x54b630
  508c34:	66 83 78 10 00       	cmp    WORD PTR [eax+0x10],0x0
  508c39:	0f 85 17 03 00 00    	jne    0x508f56
  508c3f:	8b 8d 9c 00 00 00    	mov    ecx,DWORD PTR [ebp+0x9c]
  508c45:	66 83 39 00          	cmp    WORD PTR [ecx],0x0
  508c49:	0f 85 1c 02 00 00    	jne    0x508e6b
  508c4f:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  508c52:	d9 02                	fld    DWORD PTR [edx]
  508c54:	8b 45 28             	mov    eax,DWORD PTR [ebp+0x28]
  508c57:	d8 08                	fmul   DWORD PTR [eax]
  508c59:	8b 85 94 00 00 00    	mov    eax,DWORD PTR [ebp+0x94]
  508c5f:	d8 08                	fmul   DWORD PTR [eax]
  508c61:	d9 00                	fld    DWORD PTR [eax]
  508c63:	8b 8d 98 00 00 00    	mov    ecx,DWORD PTR [ebp+0x98]
  508c69:	d8 01                	fadd   DWORD PTR [ecx]
  508c6b:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508c72:	75 04                	jne    0x508c78
  508c74:	de f9                	fdivp  st(1),st
  508c76:	eb 09                	jmp    0x508c81
  508c78:	50                   	push   eax
  508c79:	b0 0d                	mov    al,0xd
  508c7b:	e8 ba ba ef ff       	call   0x40473a
  508c80:	58                   	pop    eax
  508c81:	8b 95 a8 00 00 00    	mov    edx,DWORD PTR [ebp+0xa8]
  508c87:	d9 1a                	fstp   DWORD PTR [edx]
  508c89:	df e0                	fnstsw ax
  508c8b:	a8 0d                	test   al,0xd
  508c8d:	0f 85 8b 22 00 00    	jne    0x50af1e
  508c93:	e9 17 02 00 00       	jmp    0x508eaf
  508c98:	8b 45 68             	mov    eax,DWORD PTR [ebp+0x68]
  508c9b:	d9 00                	fld    DWORD PTR [eax]
  508c9d:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
  508ca0:	d8 26                	fsub   DWORD PTR [esi]
  508ca2:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
  508ca5:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508cac:	75 04                	jne    0x508cb2
  508cae:	d8 31                	fdiv   DWORD PTR [ecx]
  508cb0:	eb 07                	jmp    0x508cb9
  508cb2:	ff 31                	push   DWORD PTR [ecx]
  508cb4:	e8 6f ba ef ff       	call   0x404728
  508cb9:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508cc0:	75 04                	jne    0x508cc6
  508cc2:	d8 37                	fdiv   DWORD PTR [edi]
  508cc4:	eb 07                	jmp    0x508ccd
  508cc6:	ff 37                	push   DWORD PTR [edi]
  508cc8:	e8 5b ba ef ff       	call   0x404728
  508ccd:	df e0                	fnstsw ax
  508ccf:	a8 0d                	test   al,0xd
  508cd1:	0f 85 47 22 00 00    	jne    0x50af1e
  508cd7:	8b 55 64             	mov    edx,DWORD PTR [ebp+0x64]
  508cda:	d9 02                	fld    DWORD PTR [edx]
  508cdc:	8b 45 24             	mov    eax,DWORD PTR [ebp+0x24]
  508cdf:	d8 20                	fsub   DWORD PTR [eax]
  508ce1:	df e0                	fnstsw ax
  508ce3:	a8 0d                	test   al,0xd
  508ce5:	0f 85 33 22 00 00    	jne    0x50af1e
  508ceb:	dc 0d b8 34 40 00    	fmul   QWORD PTR ds:0x4034b8
  508cf1:	de c1                	faddp  st(1),st
  508cf3:	d9 5d c8             	fstp   DWORD PTR [ebp-0x38]
  508cf6:	df e0                	fnstsw ax
  508cf8:	a8 0d                	test   al,0xd
  508cfa:	0f 85 1e 22 00 00    	jne    0x50af1e
  508d00:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  508d05:	8b 08                	mov    ecx,DWORD PTR [eax]
  508d07:	50                   	push   eax
  508d08:	ff 91 ac 05 00 00    	call   DWORD PTR [ecx+0x5ac]
  508d0e:	50                   	push   eax
  508d0f:	8d 55 c0             	lea    edx,[ebp-0x40]
  508d12:	52                   	push   edx
  508d13:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  508d19:	8b d8                	mov    ebx,eax
  508d1b:	8b 03                	mov    eax,DWORD PTR [ebx]
  508d1d:	8d 4d bc             	lea    ecx,[ebp-0x44]
  508d20:	51                   	push   ecx
  508d21:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  508d27:	66 8b 0a             	mov    cx,WORD PTR [edx]
  508d2a:	51                   	push   ecx
  508d2b:	53                   	push   ebx
  508d2c:	ff 50 40             	call   DWORD PTR [eax+0x40]
  508d2f:	db e2                	fnclex
  508d31:	85 c0                	test   eax,eax
  508d33:	7d 0f                	jge    0x508d44
  508d35:	6a 40                	push   0x40
  508d37:	68 68 c9 41 00       	push   0x41c968
  508d3c:	53                   	push   ebx
  508d3d:	50                   	push   eax
  508d3e:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  508d44:	6a 00                	push   0x0
  508d46:	68 09 00 03 68       	push   0x68030009
  508d4b:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  508d4e:	52                   	push   edx
  508d4f:	8d 45 9c             	lea    eax,[ebp-0x64]
  508d52:	50                   	push   eax
  508d53:	8b 1d 34 11 40 00    	mov    ebx,DWORD PTR ds:0x401134
  508d59:	ff d3                	call   ebx
  508d5b:	83 c4 10             	add    esp,0x10
  508d5e:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  508d61:	51                   	push   ecx
  508d62:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  508d68:	0f bf d0             	movsx  edx,ax
  508d6b:	89 95 10 ff ff ff    	mov    DWORD PTR [ebp-0xf0],edx
  508d71:	db 85 10 ff ff ff    	fild   DWORD PTR [ebp-0xf0]
  508d77:	d9 9d 0c ff ff ff    	fstp   DWORD PTR [ebp-0xf4]
  508d7d:	d9 45 c8             	fld    DWORD PTR [ebp-0x38]
  508d80:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  508d83:	d8 08                	fmul   DWORD PTR [eax]
  508d85:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508d8c:	75 08                	jne    0x508d96
  508d8e:	d8 35 94 2f 40 00    	fdiv   DWORD PTR ds:0x402f94
  508d94:	eb 0b                	jmp    0x508da1
  508d96:	ff 35 94 2f 40 00    	push   DWORD PTR ds:0x402f94
  508d9c:	e8 87 b9 ef ff       	call   0x404728
  508da1:	d9 45 c8             	fld    DWORD PTR [ebp-0x38]
  508da4:	8b 8d 88 00 00 00    	mov    ecx,DWORD PTR [ebp+0x88]
  508daa:	d8 21                	fsub   DWORD PTR [ecx]
  508dac:	de c1                	faddp  st(1),st
  508dae:	d9 05 84 b1 54 00    	fld    DWORD PTR ds:0x54b184
  508db4:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  508db7:	d8 0a                	fmul   DWORD PTR [edx]
  508db9:	d8 0f                	fmul   DWORD PTR [edi]
  508dbb:	de c9                	fmulp  st(1),st
  508dbd:	d8 06                	fadd   DWORD PTR [esi]
  508dbf:	d8 8d 0c ff ff ff    	fmul   DWORD PTR [ebp-0xf4]
  508dc5:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508dcc:	75 08                	jne    0x508dd6
  508dce:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  508dd4:	eb 0b                	jmp    0x508de1
  508dd6:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  508ddc:	e8 47 b9 ef ff       	call   0x404728
  508de1:	d9 1e                	fstp   DWORD PTR [esi]
  508de3:	df e0                	fnstsw ax
  508de5:	a8 0d                	test   al,0xd
  508de7:	0f 85 31 21 00 00    	jne    0x50af1e
  508ded:	8d 45 bc             	lea    eax,[ebp-0x44]
  508df0:	50                   	push   eax
  508df1:	8d 4d c0             	lea    ecx,[ebp-0x40]
  508df4:	51                   	push   ecx
  508df5:	6a 02                	push   0x2
  508df7:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  508dfd:	83 c4 0c             	add    esp,0xc
  508e00:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  508e03:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  508e09:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  508e0c:	d9 02                	fld    DWORD PTR [edx]
  508e0e:	dc 0d b0 34 40 00    	fmul   QWORD PTR ds:0x4034b0
  508e14:	d8 0f                	fmul   DWORD PTR [edi]
  508e16:	8b 85 8c 00 00 00    	mov    eax,DWORD PTR [ebp+0x8c]
  508e1c:	0f bf 08             	movsx  ecx,WORD PTR [eax]
  508e1f:	89 8d 08 ff ff ff    	mov    DWORD PTR [ebp-0xf8],ecx
  508e25:	db 85 08 ff ff ff    	fild   DWORD PTR [ebp-0xf8]
  508e2b:	dd 9d 00 ff ff ff    	fstp   QWORD PTR [ebp-0x100]
  508e31:	dc 8d 00 ff ff ff    	fmul   QWORD PTR [ebp-0x100]
  508e37:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508e3e:	75 08                	jne    0x508e48
  508e40:	dc 35 60 1c 40 00    	fdiv   QWORD PTR ds:0x401c60
  508e46:	eb 11                	jmp    0x508e59
  508e48:	ff 35 64 1c 40 00    	push   DWORD PTR ds:0x401c64
  508e4e:	ff 35 60 1c 40 00    	push   DWORD PTR ds:0x401c60
  508e54:	e8 db b8 ef ff       	call   0x404734
  508e59:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  508e5c:	df e0                	fnstsw ax
  508e5e:	a8 0d                	test   al,0xd
  508e60:	0f 85 b8 20 00 00    	jne    0x50af1e
  508e66:	e9 86 fd ff ff       	jmp    0x508bf1
  508e6b:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  508e6e:	d9 00                	fld    DWORD PTR [eax]
  508e70:	8b 4d 28             	mov    ecx,DWORD PTR [ebp+0x28]
  508e73:	d8 09                	fmul   DWORD PTR [ecx]
  508e75:	8b 85 98 00 00 00    	mov    eax,DWORD PTR [ebp+0x98]
  508e7b:	d8 08                	fmul   DWORD PTR [eax]
  508e7d:	8b 95 94 00 00 00    	mov    edx,DWORD PTR [ebp+0x94]
  508e83:	d9 02                	fld    DWORD PTR [edx]
  508e85:	d8 00                	fadd   DWORD PTR [eax]
  508e87:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508e8e:	75 04                	jne    0x508e94
  508e90:	de f9                	fdivp  st(1),st
  508e92:	eb 09                	jmp    0x508e9d
  508e94:	50                   	push   eax
  508e95:	b0 0d                	mov    al,0xd
  508e97:	e8 9e b8 ef ff       	call   0x40473a
  508e9c:	58                   	pop    eax
  508e9d:	8b 8d a8 00 00 00    	mov    ecx,DWORD PTR [ebp+0xa8]
  508ea3:	d9 19                	fstp   DWORD PTR [ecx]
  508ea5:	df e0                	fnstsw ax
  508ea7:	a8 0d                	test   al,0xd
  508ea9:	0f 85 6f 20 00 00    	jne    0x50af1e
  508eaf:	8b 4d 2c             	mov    ecx,DWORD PTR [ebp+0x2c]
  508eb2:	d9 01                	fld    DWORD PTR [ecx]
  508eb4:	d8 1d 0c b2 54 00    	fcomp  DWORD PTR ds:0x54b20c
  508eba:	df e0                	fnstsw ax
  508ebc:	f6 c4 41             	test   ah,0x41
  508ebf:	0f 85 80 00 00 00    	jne    0x508f45
  508ec5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  508ec8:	d9 02                	fld    DWORD PTR [edx]
  508eca:	8b 45 4c             	mov    eax,DWORD PTR [ebp+0x4c]
  508ecd:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508ed4:	75 04                	jne    0x508eda
  508ed6:	d8 30                	fdiv   DWORD PTR [eax]
  508ed8:	eb 07                	jmp    0x508ee1
  508eda:	ff 30                	push   DWORD PTR [eax]
  508edc:	e8 47 b8 ef ff       	call   0x404728
  508ee1:	d8 4d d8             	fmul   DWORD PTR [ebp-0x28]
  508ee4:	d9 01                	fld    DWORD PTR [ecx]
  508ee6:	d8 25 0c b2 54 00    	fsub   DWORD PTR ds:0x54b20c
  508eec:	de c9                	fmulp  st(1),st
  508eee:	d9 05 94 b1 54 00    	fld    DWORD PTR ds:0x54b194
  508ef4:	d8 25 0c b2 54 00    	fsub   DWORD PTR ds:0x54b20c
  508efa:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  508f01:	75 04                	jne    0x508f07
  508f03:	de f9                	fdivp  st(1),st
  508f05:	eb 09                	jmp    0x508f10
  508f07:	50                   	push   eax
  508f08:	b0 0d                	mov    al,0xd
  508f0a:	e8 2b b8 ef ff       	call   0x40473a
  508f0f:	58                   	pop    eax
  508f10:	8b 4d 3c             	mov    ecx,DWORD PTR [ebp+0x3c]
  508f13:	0f bf 11             	movsx  edx,WORD PTR [ecx]
  508f16:	89 95 fc fe ff ff    	mov    DWORD PTR [ebp-0x104],edx
  508f1c:	db 85 fc fe ff ff    	fild   DWORD PTR [ebp-0x104]
  508f22:	d9 9d f8 fe ff ff    	fstp   DWORD PTR [ebp-0x108]
  508f28:	d8 8d f8 fe ff ff    	fmul   DWORD PTR [ebp-0x108]
  508f2e:	8b 8d 90 00 00 00    	mov    ecx,DWORD PTR [ebp+0x90]
  508f34:	d9 19                	fstp   DWORD PTR [ecx]
  508f36:	df e0                	fnstsw ax
  508f38:	a8 0d                	test   al,0xd
  508f3a:	0f 85 de 1f 00 00    	jne    0x50af1e
  508f40:	e9 ce 02 00 00       	jmp    0x509213
  508f45:	8b 95 90 00 00 00    	mov    edx,DWORD PTR [ebp+0x90]
  508f4b:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
  508f51:	e9 bd 02 00 00       	jmp    0x509213
  508f56:	6a 00                	push   0x0
  508f58:	68 05 00 03 68       	push   0x68030005
  508f5d:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  508f62:	8b 08                	mov    ecx,DWORD PTR [eax]
  508f64:	50                   	push   eax
  508f65:	ff 91 48 05 00 00    	call   DWORD PTR [ecx+0x548]
  508f6b:	50                   	push   eax
  508f6c:	8d 55 c0             	lea    edx,[ebp-0x40]
  508f6f:	52                   	push   edx
  508f70:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  508f76:	50                   	push   eax
  508f77:	8d 45 9c             	lea    eax,[ebp-0x64]
  508f7a:	50                   	push   eax
  508f7b:	ff d3                	call   ebx
  508f7d:	83 c4 10             	add    esp,0x10
  508f80:	50                   	push   eax
  508f81:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  508f87:	66 8b f0             	mov    si,ax
  508f8a:	66 f7 de             	neg    si
  508f8d:	1b f6                	sbb    esi,esi
  508f8f:	46                   	inc    esi
  508f90:	f7 de                	neg    esi
  508f92:	8d 4d c0             	lea    ecx,[ebp-0x40]
  508f95:	8b 3d 80 12 40 00    	mov    edi,DWORD PTR ds:0x401280
  508f9b:	ff d7                	call   edi
  508f9d:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  508fa0:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  508fa6:	66 85 f6             	test   si,si
  508fa9:	74 5a                	je     0x509005
  508fab:	83 c8 ff             	or     eax,0xffffffff
  508fae:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  508fb4:	b9 0b 00 00 00       	mov    ecx,0xb
  508fb9:	89 8d 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],ecx
  508fbf:	83 ec 10             	sub    esp,0x10
  508fc2:	8b d4                	mov    edx,esp
  508fc4:	89 0a                	mov    DWORD PTR [edx],ecx
  508fc6:	8b 8d 70 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x90]
  508fcc:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  508fcf:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  508fd2:	8b 85 78 ff ff ff    	mov    eax,DWORD PTR [ebp-0x88]
  508fd8:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
  508fdb:	68 05 00 03 68       	push   0x68030005
  508fe0:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  508fe5:	8b 08                	mov    ecx,DWORD PTR [eax]
  508fe7:	50                   	push   eax
  508fe8:	ff 91 48 05 00 00    	call   DWORD PTR [ecx+0x548]
  508fee:	50                   	push   eax
  508fef:	8d 55 c0             	lea    edx,[ebp-0x40]
  508ff2:	52                   	push   edx
  508ff3:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  508ff9:	50                   	push   eax
  508ffa:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  509000:	8d 4d c0             	lea    ecx,[ebp-0x40]
  509003:	ff d7                	call   edi
  509005:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  509008:	d9 00                	fld    DWORD PTR [eax]
  50900a:	8b 4d 18             	mov    ecx,DWORD PTR [ebp+0x18]
  50900d:	d8 21                	fsub   DWORD PTR [ecx]
  50900f:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  509015:	df e0                	fnstsw ax
  509017:	a8 0d                	test   al,0xd
  509019:	0f 85 ff 1e 00 00    	jne    0x50af1e
  50901f:	8d 95 54 ff ff ff    	lea    edx,[ebp-0xac]
  509025:	52                   	push   edx
  509026:	e8 55 2e f9 ff       	call   0x49be80
  50902b:	d9 9d 50 ff ff ff    	fstp   DWORD PTR [ebp-0xb0]
  509031:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  509034:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  509037:	d8 08                	fmul   DWORD PTR [eax]
  509039:	8b 4d 4c             	mov    ecx,DWORD PTR [ebp+0x4c]
  50903c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509043:	75 04                	jne    0x509049
  509045:	d8 31                	fdiv   DWORD PTR [ecx]
  509047:	eb 07                	jmp    0x509050
  509049:	ff 31                	push   DWORD PTR [ecx]
  50904b:	e8 d8 b6 ef ff       	call   0x404728
  509050:	8b 55 2c             	mov    edx,DWORD PTR [ebp+0x2c]
  509053:	d8 0a                	fmul   DWORD PTR [edx]
  509055:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  509058:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50905f:	75 04                	jne    0x509065
  509061:	d8 30                	fdiv   DWORD PTR [eax]
  509063:	eb 07                	jmp    0x50906c
  509065:	ff 30                	push   DWORD PTR [eax]
  509067:	e8 bc b6 ef ff       	call   0x404728
  50906c:	d8 8d 50 ff ff ff    	fmul   DWORD PTR [ebp-0xb0]
  509072:	df e0                	fnstsw ax
  509074:	a8 0d                	test   al,0xd
  509076:	0f 85 a2 1e 00 00    	jne    0x50af1e
  50907c:	d9 9d f4 fe ff ff    	fstp   DWORD PTR [ebp-0x10c]
  509082:	8b 95 f4 fe ff ff    	mov    edx,DWORD PTR [ebp-0x10c]
  509088:	8b 8d 90 00 00 00    	mov    ecx,DWORD PTR [ebp+0x90]
  50908e:	89 11                	mov    DWORD PTR [ecx],edx
  509090:	d9 85 f4 fe ff ff    	fld    DWORD PTR [ebp-0x10c]
  509096:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50909c:	df e0                	fnstsw ax
  50909e:	f6 c4 41             	test   ah,0x41
  5090a1:	74 06                	je     0x5090a9
  5090a3:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
  5090a9:	8b 85 a8 00 00 00    	mov    eax,DWORD PTR [ebp+0xa8]
  5090af:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  5090b5:	e9 59 01 00 00       	jmp    0x509213
  5090ba:	8b 0d 30 b6 54 00    	mov    ecx,DWORD PTR ds:0x54b630
  5090c0:	66 83 79 10 ff       	cmp    WORD PTR [ecx+0x10],0xffff
  5090c5:	75 5e                	jne    0x509125
  5090c7:	c7 85 50 ff ff ff 00 	mov    DWORD PTR [ebp-0xb0],0x0
  5090ce:	00 00 00 
  5090d1:	c7 85 54 ff ff ff 00 	mov    DWORD PTR [ebp-0xac],0x42700000
  5090d8:	00 70 42 
  5090db:	8d 55 d8             	lea    edx,[ebp-0x28]
  5090de:	52                   	push   edx
  5090df:	8d 85 50 ff ff ff    	lea    eax,[ebp-0xb0]
  5090e5:	50                   	push   eax
  5090e6:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  5090e9:	51                   	push   ecx
  5090ea:	8d 95 54 ff ff ff    	lea    edx,[ebp-0xac]
  5090f0:	52                   	push   edx
  5090f1:	8d 45 cc             	lea    eax,[ebp-0x34]
  5090f4:	50                   	push   eax
  5090f5:	8b 8d 84 00 00 00    	mov    ecx,DWORD PTR [ebp+0x84]
  5090fb:	51                   	push   ecx
  5090fc:	8b 95 90 00 00 00    	mov    edx,DWORD PTR [ebp+0x90]
  509102:	52                   	push   edx
  509103:	8b 45 4c             	mov    eax,DWORD PTR [ebp+0x4c]
  509106:	50                   	push   eax
  509107:	8b 4d 34             	mov    ecx,DWORD PTR [ebp+0x34]
  50910a:	51                   	push   ecx
  50910b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  50910e:	52                   	push   edx
  50910f:	e8 7c 91 00 00       	call   0x512290
  509114:	8b 85 a8 00 00 00    	mov    eax,DWORD PTR [ebp+0xa8]
  50911a:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  509120:	e9 ee 00 00 00       	jmp    0x509213
  509125:	8b 8d 9c 00 00 00    	mov    ecx,DWORD PTR [ebp+0x9c]
  50912b:	66 83 39 00          	cmp    WORD PTR [ecx],0x0
  50912f:	75 46                	jne    0x509177
  509131:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  509134:	d9 02                	fld    DWORD PTR [edx]
  509136:	8b 45 28             	mov    eax,DWORD PTR [ebp+0x28]
  509139:	d8 08                	fmul   DWORD PTR [eax]
  50913b:	8b 85 94 00 00 00    	mov    eax,DWORD PTR [ebp+0x94]
  509141:	d8 08                	fmul   DWORD PTR [eax]
  509143:	d9 00                	fld    DWORD PTR [eax]
  509145:	8b 8d 98 00 00 00    	mov    ecx,DWORD PTR [ebp+0x98]
  50914b:	d8 01                	fadd   DWORD PTR [ecx]
  50914d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509154:	75 04                	jne    0x50915a
  509156:	de f9                	fdivp  st(1),st
  509158:	eb 09                	jmp    0x509163
  50915a:	50                   	push   eax
  50915b:	b0 0d                	mov    al,0xd
  50915d:	e8 d8 b5 ef ff       	call   0x40473a
  509162:	58                   	pop    eax
  509163:	8b 95 a8 00 00 00    	mov    edx,DWORD PTR [ebp+0xa8]
  509169:	d9 1a                	fstp   DWORD PTR [edx]
  50916b:	df e0                	fnstsw ax
  50916d:	a8 0d                	test   al,0xd
  50916f:	0f 85 a9 1d 00 00    	jne    0x50af1e
  509175:	eb 44                	jmp    0x5091bb
  509177:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  50917a:	d9 00                	fld    DWORD PTR [eax]
  50917c:	8b 4d 28             	mov    ecx,DWORD PTR [ebp+0x28]
  50917f:	d8 09                	fmul   DWORD PTR [ecx]
  509181:	8b 85 98 00 00 00    	mov    eax,DWORD PTR [ebp+0x98]
  509187:	d8 08                	fmul   DWORD PTR [eax]
  509189:	8b 95 94 00 00 00    	mov    edx,DWORD PTR [ebp+0x94]
  50918f:	d9 02                	fld    DWORD PTR [edx]
  509191:	d8 00                	fadd   DWORD PTR [eax]
  509193:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50919a:	75 04                	jne    0x5091a0
  50919c:	de f9                	fdivp  st(1),st
  50919e:	eb 09                	jmp    0x5091a9
  5091a0:	50                   	push   eax
  5091a1:	b0 0d                	mov    al,0xd
  5091a3:	e8 92 b5 ef ff       	call   0x40473a
  5091a8:	58                   	pop    eax
  5091a9:	8b 8d a8 00 00 00    	mov    ecx,DWORD PTR [ebp+0xa8]
  5091af:	d9 19                	fstp   DWORD PTR [ecx]
  5091b1:	df e0                	fnstsw ax
  5091b3:	a8 0d                	test   al,0xd
  5091b5:	0f 85 63 1d 00 00    	jne    0x50af1e
  5091bb:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  5091be:	d9 e0                	fchs
  5091c0:	d9 9d 50 ff ff ff    	fstp   DWORD PTR [ebp-0xb0]
  5091c6:	df e0                	fnstsw ax
  5091c8:	a8 0d                	test   al,0xd
  5091ca:	0f 85 4e 1d 00 00    	jne    0x50af1e
  5091d0:	c7 85 54 ff ff ff 00 	mov    DWORD PTR [ebp-0xac],0x41a00000
  5091d7:	00 a0 41 
  5091da:	8d 55 d8             	lea    edx,[ebp-0x28]
  5091dd:	52                   	push   edx
  5091de:	8d 85 50 ff ff ff    	lea    eax,[ebp-0xb0]
  5091e4:	50                   	push   eax
  5091e5:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  5091e8:	51                   	push   ecx
  5091e9:	8d 95 54 ff ff ff    	lea    edx,[ebp-0xac]
  5091ef:	52                   	push   edx
  5091f0:	8d 45 cc             	lea    eax,[ebp-0x34]
  5091f3:	50                   	push   eax
  5091f4:	8b 8d 84 00 00 00    	mov    ecx,DWORD PTR [ebp+0x84]
  5091fa:	51                   	push   ecx
  5091fb:	8b 95 90 00 00 00    	mov    edx,DWORD PTR [ebp+0x90]
  509201:	52                   	push   edx
  509202:	8b 45 4c             	mov    eax,DWORD PTR [ebp+0x4c]
  509205:	50                   	push   eax
  509206:	8b 4d 34             	mov    ecx,DWORD PTR [ebp+0x34]
  509209:	51                   	push   ecx
  50920a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  50920d:	52                   	push   edx
  50920e:	e8 7d 90 00 00       	call   0x512290
  509213:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  509216:	d9 00                	fld    DWORD PTR [eax]
  509218:	8b 4d 7c             	mov    ecx,DWORD PTR [ebp+0x7c]
  50921b:	d8 19                	fcomp  DWORD PTR [ecx]
  50921d:	df e0                	fnstsw ax
  50921f:	f6 c4 41             	test   ah,0x41
  509222:	75 07                	jne    0x50922b
  509224:	be 01 00 00 00       	mov    esi,0x1
  509229:	eb 02                	jmp    0x50922d
  50922b:	33 f6                	xor    esi,esi
  50922d:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509232:	8b 10                	mov    edx,DWORD PTR [eax]
  509234:	50                   	push   eax
  509235:	ff 92 30 05 00 00    	call   DWORD PTR [edx+0x530]
  50923b:	50                   	push   eax
  50923c:	8d 45 c0             	lea    eax,[ebp-0x40]
  50923f:	50                   	push   eax
  509240:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  509246:	8b f8                	mov    edi,eax
  509248:	8b 0f                	mov    ecx,DWORD PTR [edi]
  50924a:	8d 55 bc             	lea    edx,[ebp-0x44]
  50924d:	52                   	push   edx
  50924e:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  509254:	66 8b 10             	mov    dx,WORD PTR [eax]
  509257:	52                   	push   edx
  509258:	57                   	push   edi
  509259:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50925c:	db e2                	fnclex
  50925e:	85 c0                	test   eax,eax
  509260:	7d 0f                	jge    0x509271
  509262:	6a 40                	push   0x40
  509264:	68 68 c9 41 00       	push   0x41c968
  509269:	57                   	push   edi
  50926a:	50                   	push   eax
  50926b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509271:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509276:	8b 08                	mov    ecx,DWORD PTR [eax]
  509278:	50                   	push   eax
  509279:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  50927f:	50                   	push   eax
  509280:	8d 55 b8             	lea    edx,[ebp-0x48]
  509283:	52                   	push   edx
  509284:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50928a:	8b f8                	mov    edi,eax
  50928c:	89 bd 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],edi
  509292:	8b 07                	mov    eax,DWORD PTR [edi]
  509294:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  509297:	51                   	push   ecx
  509298:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50929e:	66 8b 0a             	mov    cx,WORD PTR [edx]
  5092a1:	51                   	push   ecx
  5092a2:	57                   	push   edi
  5092a3:	ff 50 40             	call   DWORD PTR [eax+0x40]
  5092a6:	db e2                	fnclex
  5092a8:	85 c0                	test   eax,eax
  5092aa:	7d 0f                	jge    0x5092bb
  5092ac:	6a 40                	push   0x40
  5092ae:	68 68 c9 41 00       	push   0x41c968
  5092b3:	57                   	push   edi
  5092b4:	50                   	push   eax
  5092b5:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5092bb:	6a 00                	push   0x0
  5092bd:	68 09 00 03 68       	push   0x68030009
  5092c2:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  5092c5:	52                   	push   edx
  5092c6:	8d 45 9c             	lea    eax,[ebp-0x64]
  5092c9:	50                   	push   eax
  5092ca:	ff d3                	call   ebx
  5092cc:	83 c4 10             	add    esp,0x10
  5092cf:	50                   	push   eax
  5092d0:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  5092d6:	33 d2                	xor    edx,edx
  5092d8:	66 3d 64 00          	cmp    ax,0x64
  5092dc:	0f 94 c2             	sete   dl
  5092df:	f7 da                	neg    edx
  5092e1:	6a 00                	push   0x0
  5092e3:	68 08 00 03 68       	push   0x68030008
  5092e8:	8b 4d b4             	mov    ecx,DWORD PTR [ebp-0x4c]
  5092eb:	51                   	push   ecx
  5092ec:	8d 45 8c             	lea    eax,[ebp-0x74]
  5092ef:	50                   	push   eax
  5092f0:	89 95 f0 fe ff ff    	mov    DWORD PTR [ebp-0x110],edx
  5092f6:	ff d3                	call   ebx
  5092f8:	83 c4 10             	add    esp,0x10
  5092fb:	50                   	push   eax
  5092fc:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  509302:	f7 d0                	not    eax
  509304:	8b 8d f0 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x110]
  50930a:	23 c8                	and    ecx,eax
  50930c:	f7 de                	neg    esi
  50930e:	23 ce                	and    ecx,esi
  509310:	66 8b f1             	mov    si,cx
  509313:	8d 55 b4             	lea    edx,[ebp-0x4c]
  509316:	52                   	push   edx
  509317:	8d 45 b8             	lea    eax,[ebp-0x48]
  50931a:	50                   	push   eax
  50931b:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50931e:	51                   	push   ecx
  50931f:	8d 55 c0             	lea    edx,[ebp-0x40]
  509322:	52                   	push   edx
  509323:	6a 04                	push   0x4
  509325:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50932b:	8d 45 8c             	lea    eax,[ebp-0x74]
  50932e:	50                   	push   eax
  50932f:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  509332:	51                   	push   ecx
  509333:	6a 02                	push   0x2
  509335:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50933b:	83 c4 20             	add    esp,0x20
  50933e:	66 85 f6             	test   si,si
  509341:	0f 84 9a 00 00 00    	je     0x5093e1
  509347:	33 ff                	xor    edi,edi
  509349:	89 bd 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],edi
  50934f:	c7 85 6c ff ff ff 02 	mov    DWORD PTR [ebp-0x94],0x2
  509356:	00 00 00 
  509359:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50935e:	8b 10                	mov    edx,DWORD PTR [eax]
  509360:	50                   	push   eax
  509361:	ff 92 30 05 00 00    	call   DWORD PTR [edx+0x530]
  509367:	50                   	push   eax
  509368:	8d 45 c0             	lea    eax,[ebp-0x40]
  50936b:	50                   	push   eax
  50936c:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  509372:	8b f0                	mov    esi,eax
  509374:	8b 0e                	mov    ecx,DWORD PTR [esi]
  509376:	8d 55 bc             	lea    edx,[ebp-0x44]
  509379:	52                   	push   edx
  50937a:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  509380:	66 8b 10             	mov    dx,WORD PTR [eax]
  509383:	52                   	push   edx
  509384:	56                   	push   esi
  509385:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  509388:	db e2                	fnclex
  50938a:	85 c0                	test   eax,eax
  50938c:	7d 0f                	jge    0x50939d
  50938e:	6a 40                	push   0x40
  509390:	68 68 c9 41 00       	push   0x41c968
  509395:	56                   	push   esi
  509396:	50                   	push   eax
  509397:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50939d:	83 ec 10             	sub    esp,0x10
  5093a0:	8b c4                	mov    eax,esp
  5093a2:	8b 8d 6c ff ff ff    	mov    ecx,DWORD PTR [ebp-0x94]
  5093a8:	89 08                	mov    DWORD PTR [eax],ecx
  5093aa:	8b 95 70 ff ff ff    	mov    edx,DWORD PTR [ebp-0x90]
  5093b0:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
  5093b3:	89 78 08             	mov    DWORD PTR [eax+0x8],edi
  5093b6:	8b 8d 78 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x88]
  5093bc:	89 48 0c             	mov    DWORD PTR [eax+0xc],ecx
  5093bf:	68 09 00 03 68       	push   0x68030009
  5093c4:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  5093c7:	52                   	push   edx
  5093c8:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  5093ce:	8d 45 bc             	lea    eax,[ebp-0x44]
  5093d1:	50                   	push   eax
  5093d2:	8d 4d c0             	lea    ecx,[ebp-0x40]
  5093d5:	51                   	push   ecx
  5093d6:	6a 02                	push   0x2
  5093d8:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  5093de:	83 c4 0c             	add    esp,0xc
  5093e1:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  5093e4:	d9 02                	fld    DWORD PTR [edx]
  5093e6:	8b 45 7c             	mov    eax,DWORD PTR [ebp+0x7c]
  5093e9:	d8 18                	fcomp  DWORD PTR [eax]
  5093eb:	df e0                	fnstsw ax
  5093ed:	f6 c4 41             	test   ah,0x41
  5093f0:	75 07                	jne    0x5093f9
  5093f2:	be 01 00 00 00       	mov    esi,0x1
  5093f7:	eb 02                	jmp    0x5093fb
  5093f9:	33 f6                	xor    esi,esi
  5093fb:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509400:	8b 08                	mov    ecx,DWORD PTR [eax]
  509402:	50                   	push   eax
  509403:	ff 91 ac 05 00 00    	call   DWORD PTR [ecx+0x5ac]
  509409:	50                   	push   eax
  50940a:	8d 55 c0             	lea    edx,[ebp-0x40]
  50940d:	52                   	push   edx
  50940e:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  509414:	8b f8                	mov    edi,eax
  509416:	8b 07                	mov    eax,DWORD PTR [edi]
  509418:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50941b:	51                   	push   ecx
  50941c:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  509422:	66 8b 0a             	mov    cx,WORD PTR [edx]
  509425:	51                   	push   ecx
  509426:	57                   	push   edi
  509427:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50942a:	db e2                	fnclex
  50942c:	85 c0                	test   eax,eax
  50942e:	7d 0f                	jge    0x50943f
  509430:	6a 40                	push   0x40
  509432:	68 68 c9 41 00       	push   0x41c968
  509437:	57                   	push   edi
  509438:	50                   	push   eax
  509439:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50943f:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509444:	8b 10                	mov    edx,DWORD PTR [eax]
  509446:	50                   	push   eax
  509447:	ff 92 ac 05 00 00    	call   DWORD PTR [edx+0x5ac]
  50944d:	50                   	push   eax
  50944e:	8d 45 b8             	lea    eax,[ebp-0x48]
  509451:	50                   	push   eax
  509452:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  509458:	8b f8                	mov    edi,eax
  50945a:	89 bd 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],edi
  509460:	8b 0f                	mov    ecx,DWORD PTR [edi]
  509462:	8d 55 b4             	lea    edx,[ebp-0x4c]
  509465:	52                   	push   edx
  509466:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  50946c:	66 8b 10             	mov    dx,WORD PTR [eax]
  50946f:	52                   	push   edx
  509470:	57                   	push   edi
  509471:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  509474:	db e2                	fnclex
  509476:	85 c0                	test   eax,eax
  509478:	7d 0f                	jge    0x509489
  50947a:	6a 40                	push   0x40
  50947c:	68 68 c9 41 00       	push   0x41c968
  509481:	57                   	push   edi
  509482:	50                   	push   eax
  509483:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509489:	6a 00                	push   0x0
  50948b:	68 09 00 03 68       	push   0x68030009
  509490:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  509493:	50                   	push   eax
  509494:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  509497:	51                   	push   ecx
  509498:	ff d3                	call   ebx
  50949a:	83 c4 10             	add    esp,0x10
  50949d:	50                   	push   eax
  50949e:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  5094a4:	33 d2                	xor    edx,edx
  5094a6:	66 3d 64 00          	cmp    ax,0x64
  5094aa:	0f 94 c2             	sete   dl
  5094ad:	f7 da                	neg    edx
  5094af:	6a 00                	push   0x0
  5094b1:	68 08 00 03 68       	push   0x68030008
  5094b6:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  5094b9:	50                   	push   eax
  5094ba:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  5094bd:	51                   	push   ecx
  5094be:	89 95 ec fe ff ff    	mov    DWORD PTR [ebp-0x114],edx
  5094c4:	ff d3                	call   ebx
  5094c6:	83 c4 10             	add    esp,0x10
  5094c9:	50                   	push   eax
  5094ca:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  5094d0:	f7 d0                	not    eax
  5094d2:	8b 95 ec fe ff ff    	mov    edx,DWORD PTR [ebp-0x114]
  5094d8:	23 d0                	and    edx,eax
  5094da:	f7 de                	neg    esi
  5094dc:	23 d6                	and    edx,esi
  5094de:	66 8b f2             	mov    si,dx
  5094e1:	8d 45 b4             	lea    eax,[ebp-0x4c]
  5094e4:	50                   	push   eax
  5094e5:	8d 4d b8             	lea    ecx,[ebp-0x48]
  5094e8:	51                   	push   ecx
  5094e9:	8d 55 bc             	lea    edx,[ebp-0x44]
  5094ec:	52                   	push   edx
  5094ed:	8d 45 c0             	lea    eax,[ebp-0x40]
  5094f0:	50                   	push   eax
  5094f1:	6a 04                	push   0x4
  5094f3:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  5094f9:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  5094fc:	51                   	push   ecx
  5094fd:	8d 55 9c             	lea    edx,[ebp-0x64]
  509500:	52                   	push   edx
  509501:	6a 02                	push   0x2
  509503:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  509509:	83 c4 20             	add    esp,0x20
  50950c:	66 85 f6             	test   si,si
  50950f:	0f 84 9a 00 00 00    	je     0x5095af
  509515:	33 ff                	xor    edi,edi
  509517:	89 bd 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],edi
  50951d:	c7 85 6c ff ff ff 02 	mov    DWORD PTR [ebp-0x94],0x2
  509524:	00 00 00 
  509527:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50952c:	8b 08                	mov    ecx,DWORD PTR [eax]
  50952e:	50                   	push   eax
  50952f:	ff 91 ac 05 00 00    	call   DWORD PTR [ecx+0x5ac]
  509535:	50                   	push   eax
  509536:	8d 55 c0             	lea    edx,[ebp-0x40]
  509539:	52                   	push   edx
  50953a:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  509540:	8b f0                	mov    esi,eax
  509542:	8b 06                	mov    eax,DWORD PTR [esi]
  509544:	8d 4d bc             	lea    ecx,[ebp-0x44]
  509547:	51                   	push   ecx
  509548:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50954e:	66 8b 0a             	mov    cx,WORD PTR [edx]
  509551:	51                   	push   ecx
  509552:	56                   	push   esi
  509553:	ff 50 40             	call   DWORD PTR [eax+0x40]
  509556:	db e2                	fnclex
  509558:	85 c0                	test   eax,eax
  50955a:	7d 0f                	jge    0x50956b
  50955c:	6a 40                	push   0x40
  50955e:	68 68 c9 41 00       	push   0x41c968
  509563:	56                   	push   esi
  509564:	50                   	push   eax
  509565:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50956b:	83 ec 10             	sub    esp,0x10
  50956e:	8b d4                	mov    edx,esp
  509570:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [ebp-0x94]
  509576:	89 02                	mov    DWORD PTR [edx],eax
  509578:	8b 8d 70 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x90]
  50957e:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  509581:	89 7a 08             	mov    DWORD PTR [edx+0x8],edi
  509584:	8b 85 78 ff ff ff    	mov    eax,DWORD PTR [ebp-0x88]
  50958a:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
  50958d:	68 09 00 03 68       	push   0x68030009
  509592:	8b 4d bc             	mov    ecx,DWORD PTR [ebp-0x44]
  509595:	51                   	push   ecx
  509596:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  50959c:	8d 55 bc             	lea    edx,[ebp-0x44]
  50959f:	52                   	push   edx
  5095a0:	8d 45 c0             	lea    eax,[ebp-0x40]
  5095a3:	50                   	push   eax
  5095a4:	6a 02                	push   0x2
  5095a6:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  5095ac:	83 c4 0c             	add    esp,0xc
  5095af:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
  5095b2:	d9 01                	fld    DWORD PTR [ecx]
  5095b4:	8b 55 7c             	mov    edx,DWORD PTR [ebp+0x7c]
  5095b7:	d8 1a                	fcomp  DWORD PTR [edx]
  5095b9:	df e0                	fnstsw ax
  5095bb:	f6 c4 41             	test   ah,0x41
  5095be:	c7 85 e8 fe ff ff 01 	mov    DWORD PTR [ebp-0x118],0x1
  5095c5:	00 00 00 
  5095c8:	74 0a                	je     0x5095d4
  5095ca:	c7 85 e8 fe ff ff 00 	mov    DWORD PTR [ebp-0x118],0x0
  5095d1:	00 00 00 
  5095d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  5095d7:	d9 00                	fld    DWORD PTR [eax]
  5095d9:	d8 1d 8c b5 54 00    	fcomp  DWORD PTR ds:0x54b58c
  5095df:	df e0                	fnstsw ax
  5095e1:	f6 c4 01             	test   ah,0x1
  5095e4:	74 07                	je     0x5095ed
  5095e6:	be 01 00 00 00       	mov    esi,0x1
  5095eb:	eb 02                	jmp    0x5095ef
  5095ed:	33 f6                	xor    esi,esi
  5095ef:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5095f4:	8b 08                	mov    ecx,DWORD PTR [eax]
  5095f6:	50                   	push   eax
  5095f7:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  5095fd:	50                   	push   eax
  5095fe:	8d 55 c0             	lea    edx,[ebp-0x40]
  509601:	52                   	push   edx
  509602:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  509608:	8b f8                	mov    edi,eax
  50960a:	8b 07                	mov    eax,DWORD PTR [edi]
  50960c:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50960f:	51                   	push   ecx
  509610:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  509616:	66 8b 0a             	mov    cx,WORD PTR [edx]
  509619:	51                   	push   ecx
  50961a:	57                   	push   edi
  50961b:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50961e:	db e2                	fnclex
  509620:	85 c0                	test   eax,eax
  509622:	7d 0f                	jge    0x509633
  509624:	6a 40                	push   0x40
  509626:	68 68 c9 41 00       	push   0x41c968
  50962b:	57                   	push   edi
  50962c:	50                   	push   eax
  50962d:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509633:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509638:	8b 10                	mov    edx,DWORD PTR [eax]
  50963a:	50                   	push   eax
  50963b:	ff 92 30 05 00 00    	call   DWORD PTR [edx+0x530]
  509641:	50                   	push   eax
  509642:	8d 45 b8             	lea    eax,[ebp-0x48]
  509645:	50                   	push   eax
  509646:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50964c:	8b f8                	mov    edi,eax
  50964e:	89 bd 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],edi
  509654:	8b 0f                	mov    ecx,DWORD PTR [edi]
  509656:	8d 55 b4             	lea    edx,[ebp-0x4c]
  509659:	52                   	push   edx
  50965a:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  509660:	66 8b 10             	mov    dx,WORD PTR [eax]
  509663:	52                   	push   edx
  509664:	57                   	push   edi
  509665:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  509668:	db e2                	fnclex
  50966a:	85 c0                	test   eax,eax
  50966c:	7d 0f                	jge    0x50967d
  50966e:	6a 40                	push   0x40
  509670:	68 68 c9 41 00       	push   0x41c968
  509675:	57                   	push   edi
  509676:	50                   	push   eax
  509677:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50967d:	6a 00                	push   0x0
  50967f:	68 09 00 03 68       	push   0x68030009
  509684:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  509687:	50                   	push   eax
  509688:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50968b:	51                   	push   ecx
  50968c:	ff d3                	call   ebx
  50968e:	83 c4 10             	add    esp,0x10
  509691:	50                   	push   eax
  509692:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  509698:	33 d2                	xor    edx,edx
  50969a:	66 3d 64 00          	cmp    ax,0x64
  50969e:	0f 94 c2             	sete   dl
  5096a1:	f7 da                	neg    edx
  5096a3:	6a 00                	push   0x0
  5096a5:	68 08 00 03 68       	push   0x68030008
  5096aa:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  5096ad:	50                   	push   eax
  5096ae:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  5096b1:	51                   	push   ecx
  5096b2:	89 95 e4 fe ff ff    	mov    DWORD PTR [ebp-0x11c],edx
  5096b8:	ff d3                	call   ebx
  5096ba:	83 c4 10             	add    esp,0x10
  5096bd:	50                   	push   eax
  5096be:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  5096c4:	f7 d0                	not    eax
  5096c6:	8b 95 e4 fe ff ff    	mov    edx,DWORD PTR [ebp-0x11c]
  5096cc:	23 d0                	and    edx,eax
  5096ce:	f7 de                	neg    esi
  5096d0:	8b 85 e8 fe ff ff    	mov    eax,DWORD PTR [ebp-0x118]
  5096d6:	f7 d8                	neg    eax
  5096d8:	0b f0                	or     esi,eax
  5096da:	23 d6                	and    edx,esi
  5096dc:	66 8b f2             	mov    si,dx
  5096df:	8d 45 b4             	lea    eax,[ebp-0x4c]
  5096e2:	50                   	push   eax
  5096e3:	8d 4d b8             	lea    ecx,[ebp-0x48]
  5096e6:	51                   	push   ecx
  5096e7:	8d 55 bc             	lea    edx,[ebp-0x44]
  5096ea:	52                   	push   edx
  5096eb:	8d 45 c0             	lea    eax,[ebp-0x40]
  5096ee:	50                   	push   eax
  5096ef:	6a 04                	push   0x4
  5096f1:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  5096f7:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  5096fa:	51                   	push   ecx
  5096fb:	8d 55 9c             	lea    edx,[ebp-0x64]
  5096fe:	52                   	push   edx
  5096ff:	6a 02                	push   0x2
  509701:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  509707:	83 c4 20             	add    esp,0x20
  50970a:	66 85 f6             	test   si,si
  50970d:	0f 84 a6 00 00 00    	je     0x5097b9
  509713:	c7 85 74 ff ff ff 00 	mov    DWORD PTR [ebp-0x8c],0x0
  50971a:	00 00 00 
  50971d:	c7 85 6c ff ff ff 02 	mov    DWORD PTR [ebp-0x94],0x2
  509724:	00 00 00 
  509727:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50972c:	8b 08                	mov    ecx,DWORD PTR [eax]
  50972e:	50                   	push   eax
  50972f:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  509735:	50                   	push   eax
  509736:	8d 55 c0             	lea    edx,[ebp-0x40]
  509739:	52                   	push   edx
  50973a:	8b 35 94 10 40 00    	mov    esi,DWORD PTR ds:0x401094
  509740:	ff d6                	call   esi
  509742:	8b f8                	mov    edi,eax
  509744:	8b 07                	mov    eax,DWORD PTR [edi]
  509746:	8d 4d bc             	lea    ecx,[ebp-0x44]
  509749:	51                   	push   ecx
  50974a:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  509750:	66 8b 0a             	mov    cx,WORD PTR [edx]
  509753:	51                   	push   ecx
  509754:	57                   	push   edi
  509755:	ff 50 40             	call   DWORD PTR [eax+0x40]
  509758:	db e2                	fnclex
  50975a:	85 c0                	test   eax,eax
  50975c:	7d 0f                	jge    0x50976d
  50975e:	6a 40                	push   0x40
  509760:	68 68 c9 41 00       	push   0x41c968
  509765:	57                   	push   edi
  509766:	50                   	push   eax
  509767:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50976d:	83 ec 10             	sub    esp,0x10
  509770:	8b d4                	mov    edx,esp
  509772:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [ebp-0x94]
  509778:	89 02                	mov    DWORD PTR [edx],eax
  50977a:	8b 8d 70 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x90]
  509780:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  509783:	8b 85 74 ff ff ff    	mov    eax,DWORD PTR [ebp-0x8c]
  509789:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  50978c:	8b 8d 78 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x88]
  509792:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  509795:	68 09 00 03 68       	push   0x68030009
  50979a:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  50979d:	52                   	push   edx
  50979e:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  5097a4:	8d 45 bc             	lea    eax,[ebp-0x44]
  5097a7:	50                   	push   eax
  5097a8:	8d 4d c0             	lea    ecx,[ebp-0x40]
  5097ab:	51                   	push   ecx
  5097ac:	6a 02                	push   0x2
  5097ae:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  5097b4:	83 c4 0c             	add    esp,0xc
  5097b7:	eb 06                	jmp    0x5097bf
  5097b9:	8b 35 94 10 40 00    	mov    esi,DWORD PTR ds:0x401094
  5097bf:	a1 30 b6 54 00       	mov    eax,ds:0x54b630
  5097c4:	66 83 78 04 00       	cmp    WORD PTR [eax+0x4],0x0
  5097c9:	0f 84 e3 02 00 00    	je     0x509ab2
  5097cf:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  5097d5:	66 83 3a 00          	cmp    WORD PTR [edx],0x0
  5097d9:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5097de:	8b 08                	mov    ecx,DWORD PTR [eax]
  5097e0:	50                   	push   eax
  5097e1:	0f 85 9e 01 00 00    	jne    0x509985
  5097e7:	ff 91 f8 04 00 00    	call   DWORD PTR [ecx+0x4f8]
  5097ed:	50                   	push   eax
  5097ee:	8d 55 c0             	lea    edx,[ebp-0x40]
  5097f1:	52                   	push   edx
  5097f2:	ff d6                	call   esi
  5097f4:	8b f8                	mov    edi,eax
  5097f6:	8b 07                	mov    eax,DWORD PTR [edi]
  5097f8:	8d 4d bc             	lea    ecx,[ebp-0x44]
  5097fb:	51                   	push   ecx
  5097fc:	6a 00                	push   0x0
  5097fe:	57                   	push   edi
  5097ff:	ff 50 40             	call   DWORD PTR [eax+0x40]
  509802:	db e2                	fnclex
  509804:	85 c0                	test   eax,eax
  509806:	7d 0f                	jge    0x509817
  509808:	6a 40                	push   0x40
  50980a:	68 68 c9 41 00       	push   0x41c968
  50980f:	57                   	push   edi
  509810:	50                   	push   eax
  509811:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509817:	6a 00                	push   0x0
  509819:	68 09 00 03 68       	push   0x68030009
  50981e:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  509821:	52                   	push   edx
  509822:	8d 45 9c             	lea    eax,[ebp-0x64]
  509825:	50                   	push   eax
  509826:	ff d3                	call   ebx
  509828:	83 c4 10             	add    esp,0x10
  50982b:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509830:	8b 08                	mov    ecx,DWORD PTR [eax]
  509832:	50                   	push   eax
  509833:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  509839:	50                   	push   eax
  50983a:	8d 55 b8             	lea    edx,[ebp-0x48]
  50983d:	52                   	push   edx
  50983e:	ff d6                	call   esi
  509840:	8b f0                	mov    esi,eax
  509842:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  509848:	8b 06                	mov    eax,DWORD PTR [esi]
  50984a:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  50984d:	51                   	push   ecx
  50984e:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  509854:	66 8b 0a             	mov    cx,WORD PTR [edx]
  509857:	51                   	push   ecx
  509858:	56                   	push   esi
  509859:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50985c:	db e2                	fnclex
  50985e:	85 c0                	test   eax,eax
  509860:	7d 0f                	jge    0x509871
  509862:	6a 40                	push   0x40
  509864:	68 68 c9 41 00       	push   0x41c968
  509869:	56                   	push   esi
  50986a:	50                   	push   eax
  50986b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509871:	6a 00                	push   0x0
  509873:	68 09 00 03 68       	push   0x68030009
  509878:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  50987b:	52                   	push   edx
  50987c:	8d 45 8c             	lea    eax,[ebp-0x74]
  50987f:	50                   	push   eax
  509880:	ff d3                	call   ebx
  509882:	83 c4 10             	add    esp,0x10
  509885:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  509888:	51                   	push   ecx
  509889:	8b 3d a0 11 40 00    	mov    edi,DWORD PTR ds:0x4011a0
  50988f:	ff d7                	call   edi
  509891:	0f bf d0             	movsx  edx,ax
  509894:	89 95 e0 fe ff ff    	mov    DWORD PTR [ebp-0x120],edx
  50989a:	db 85 e0 fe ff ff    	fild   DWORD PTR [ebp-0x120]
  5098a0:	d9 9d dc fe ff ff    	fstp   DWORD PTR [ebp-0x124]
  5098a6:	d9 85 dc fe ff ff    	fld    DWORD PTR [ebp-0x124]
  5098ac:	8b 85 90 00 00 00    	mov    eax,DWORD PTR [ebp+0x90]
  5098b2:	d8 08                	fmul   DWORD PTR [eax]
  5098b4:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5098bb:	75 08                	jne    0x5098c5
  5098bd:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  5098c3:	eb 0b                	jmp    0x5098d0
  5098c5:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  5098cb:	e8 58 ae ef ff       	call   0x404728
  5098d0:	8b b5 a8 00 00 00    	mov    esi,DWORD PTR [ebp+0xa8]
  5098d6:	d8 06                	fadd   DWORD PTR [esi]
  5098d8:	df e0                	fnstsw ax
  5098da:	a8 0d                	test   al,0xd
  5098dc:	0f 85 3c 16 00 00    	jne    0x50af1e
  5098e2:	d9 9d d8 fe ff ff    	fstp   DWORD PTR [ebp-0x128]
  5098e8:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  5098eb:	51                   	push   ecx
  5098ec:	ff d7                	call   edi
  5098ee:	0f bf d0             	movsx  edx,ax
  5098f1:	89 95 d4 fe ff ff    	mov    DWORD PTR [ebp-0x12c],edx
  5098f7:	db 85 d4 fe ff ff    	fild   DWORD PTR [ebp-0x12c]
  5098fd:	d9 9d d0 fe ff ff    	fstp   DWORD PTR [ebp-0x130]
  509903:	d9 85 d8 fe ff ff    	fld    DWORD PTR [ebp-0x128]
  509909:	d8 8d d0 fe ff ff    	fmul   DWORD PTR [ebp-0x130]
  50990f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509916:	75 08                	jne    0x509920
  509918:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  50991e:	eb 0b                	jmp    0x50992b
  509920:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  509926:	e8 fd ad ef ff       	call   0x404728
  50992b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  50992e:	d9 00                	fld    DWORD PTR [eax]
  509930:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509937:	75 08                	jne    0x509941
  509939:	d8 35 fc b4 54 00    	fdiv   DWORD PTR ds:0x54b4fc
  50993f:	eb 0b                	jmp    0x50994c
  509941:	ff 35 fc b4 54 00    	push   DWORD PTR ds:0x54b4fc
  509947:	e8 dc ad ef ff       	call   0x404728
  50994c:	d8 0d 50 bb 54 00    	fmul   DWORD PTR ds:0x54bb50
  509952:	de c1                	faddp  st(1),st
  509954:	d9 1e                	fstp   DWORD PTR [esi]
  509956:	df e0                	fnstsw ax
  509958:	a8 0d                	test   al,0xd
  50995a:	0f 85 be 15 00 00    	jne    0x50af1e
  509960:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  509963:	51                   	push   ecx
  509964:	8d 55 b8             	lea    edx,[ebp-0x48]
  509967:	52                   	push   edx
  509968:	8d 45 bc             	lea    eax,[ebp-0x44]
  50996b:	50                   	push   eax
  50996c:	8d 4d c0             	lea    ecx,[ebp-0x40]
  50996f:	51                   	push   ecx
  509970:	6a 04                	push   0x4
  509972:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  509978:	8d 55 8c             	lea    edx,[ebp-0x74]
  50997b:	52                   	push   edx
  50997c:	8d 45 9c             	lea    eax,[ebp-0x64]
  50997f:	50                   	push   eax
  509980:	e9 1d 05 00 00       	jmp    0x509ea2
  509985:	ff 91 f8 04 00 00    	call   DWORD PTR [ecx+0x4f8]
  50998b:	50                   	push   eax
  50998c:	8d 55 c0             	lea    edx,[ebp-0x40]
  50998f:	52                   	push   edx
  509990:	ff d6                	call   esi
  509992:	8b f8                	mov    edi,eax
  509994:	8b 07                	mov    eax,DWORD PTR [edi]
  509996:	8d 4d bc             	lea    ecx,[ebp-0x44]
  509999:	51                   	push   ecx
  50999a:	6a 00                	push   0x0
  50999c:	57                   	push   edi
  50999d:	ff 50 40             	call   DWORD PTR [eax+0x40]
  5099a0:	db e2                	fnclex
  5099a2:	85 c0                	test   eax,eax
  5099a4:	7d 0f                	jge    0x5099b5
  5099a6:	6a 40                	push   0x40
  5099a8:	68 68 c9 41 00       	push   0x41c968
  5099ad:	57                   	push   edi
  5099ae:	50                   	push   eax
  5099af:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5099b5:	6a 00                	push   0x0
  5099b7:	68 09 00 03 68       	push   0x68030009
  5099bc:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  5099bf:	52                   	push   edx
  5099c0:	8d 45 9c             	lea    eax,[ebp-0x64]
  5099c3:	50                   	push   eax
  5099c4:	ff d3                	call   ebx
  5099c6:	83 c4 10             	add    esp,0x10
  5099c9:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5099ce:	8b 08                	mov    ecx,DWORD PTR [eax]
  5099d0:	50                   	push   eax
  5099d1:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  5099d7:	50                   	push   eax
  5099d8:	8d 55 b8             	lea    edx,[ebp-0x48]
  5099db:	52                   	push   edx
  5099dc:	ff d6                	call   esi
  5099de:	8b f0                	mov    esi,eax
  5099e0:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  5099e6:	8b 06                	mov    eax,DWORD PTR [esi]
  5099e8:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  5099eb:	51                   	push   ecx
  5099ec:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  5099f2:	66 8b 0a             	mov    cx,WORD PTR [edx]
  5099f5:	51                   	push   ecx
  5099f6:	56                   	push   esi
  5099f7:	ff 50 40             	call   DWORD PTR [eax+0x40]
  5099fa:	db e2                	fnclex
  5099fc:	85 c0                	test   eax,eax
  5099fe:	7d 0f                	jge    0x509a0f
  509a00:	6a 40                	push   0x40
  509a02:	68 68 c9 41 00       	push   0x41c968
  509a07:	56                   	push   esi
  509a08:	50                   	push   eax
  509a09:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509a0f:	6a 00                	push   0x0
  509a11:	68 09 00 03 68       	push   0x68030009
  509a16:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  509a19:	52                   	push   edx
  509a1a:	8d 45 8c             	lea    eax,[ebp-0x74]
  509a1d:	50                   	push   eax
  509a1e:	ff d3                	call   ebx
  509a20:	83 c4 10             	add    esp,0x10
  509a23:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  509a26:	51                   	push   ecx
  509a27:	8b 3d a0 11 40 00    	mov    edi,DWORD PTR ds:0x4011a0
  509a2d:	ff d7                	call   edi
  509a2f:	0f bf d0             	movsx  edx,ax
  509a32:	89 95 cc fe ff ff    	mov    DWORD PTR [ebp-0x134],edx
  509a38:	db 85 cc fe ff ff    	fild   DWORD PTR [ebp-0x134]
  509a3e:	d9 9d c8 fe ff ff    	fstp   DWORD PTR [ebp-0x138]
  509a44:	d9 85 c8 fe ff ff    	fld    DWORD PTR [ebp-0x138]
  509a4a:	8b 85 90 00 00 00    	mov    eax,DWORD PTR [ebp+0x90]
  509a50:	d8 08                	fmul   DWORD PTR [eax]
  509a52:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509a59:	75 08                	jne    0x509a63
  509a5b:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  509a61:	eb 0b                	jmp    0x509a6e
  509a63:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  509a69:	e8 ba ac ef ff       	call   0x404728
  509a6e:	8b b5 a8 00 00 00    	mov    esi,DWORD PTR [ebp+0xa8]
  509a74:	d8 06                	fadd   DWORD PTR [esi]
  509a76:	df e0                	fnstsw ax
  509a78:	a8 0d                	test   al,0xd
  509a7a:	0f 85 9e 14 00 00    	jne    0x50af1e
  509a80:	d9 9d c4 fe ff ff    	fstp   DWORD PTR [ebp-0x13c]
  509a86:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  509a89:	51                   	push   ecx
  509a8a:	ff d7                	call   edi
  509a8c:	0f bf d0             	movsx  edx,ax
  509a8f:	89 95 c0 fe ff ff    	mov    DWORD PTR [ebp-0x140],edx
  509a95:	db 85 c0 fe ff ff    	fild   DWORD PTR [ebp-0x140]
  509a9b:	d9 9d bc fe ff ff    	fstp   DWORD PTR [ebp-0x144]
  509aa1:	d9 85 c4 fe ff ff    	fld    DWORD PTR [ebp-0x13c]
  509aa7:	d8 8d bc fe ff ff    	fmul   DWORD PTR [ebp-0x144]
  509aad:	e9 a8 03 00 00       	jmp    0x509e5a
  509ab2:	66 83 78 06 00       	cmp    WORD PTR [eax+0x6],0x0
  509ab7:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509abc:	8b 08                	mov    ecx,DWORD PTR [eax]
  509abe:	50                   	push   eax
  509abf:	0f 84 6d 02 00 00    	je     0x509d32
  509ac5:	ff 91 f8 04 00 00    	call   DWORD PTR [ecx+0x4f8]
  509acb:	50                   	push   eax
  509acc:	8d 55 c0             	lea    edx,[ebp-0x40]
  509acf:	52                   	push   edx
  509ad0:	ff d6                	call   esi
  509ad2:	8b f8                	mov    edi,eax
  509ad4:	8b 07                	mov    eax,DWORD PTR [edi]
  509ad6:	8d 4d bc             	lea    ecx,[ebp-0x44]
  509ad9:	51                   	push   ecx
  509ada:	6a 00                	push   0x0
  509adc:	57                   	push   edi
  509add:	ff 50 40             	call   DWORD PTR [eax+0x40]
  509ae0:	db e2                	fnclex
  509ae2:	85 c0                	test   eax,eax
  509ae4:	7d 0f                	jge    0x509af5
  509ae6:	6a 40                	push   0x40
  509ae8:	68 68 c9 41 00       	push   0x41c968
  509aed:	57                   	push   edi
  509aee:	50                   	push   eax
  509aef:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509af5:	6a 00                	push   0x0
  509af7:	68 09 00 03 68       	push   0x68030009
  509afc:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  509aff:	52                   	push   edx
  509b00:	8d 45 9c             	lea    eax,[ebp-0x64]
  509b03:	50                   	push   eax
  509b04:	ff d3                	call   ebx
  509b06:	83 c4 10             	add    esp,0x10
  509b09:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509b0e:	8b 08                	mov    ecx,DWORD PTR [eax]
  509b10:	50                   	push   eax
  509b11:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  509b17:	50                   	push   eax
  509b18:	8d 55 b8             	lea    edx,[ebp-0x48]
  509b1b:	52                   	push   edx
  509b1c:	ff d6                	call   esi
  509b1e:	8b f8                	mov    edi,eax
  509b20:	89 bd 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],edi
  509b26:	8b 07                	mov    eax,DWORD PTR [edi]
  509b28:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  509b2b:	51                   	push   ecx
  509b2c:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  509b32:	66 8b 0a             	mov    cx,WORD PTR [edx]
  509b35:	51                   	push   ecx
  509b36:	57                   	push   edi
  509b37:	ff 50 40             	call   DWORD PTR [eax+0x40]
  509b3a:	db e2                	fnclex
  509b3c:	85 c0                	test   eax,eax
  509b3e:	7d 0f                	jge    0x509b4f
  509b40:	6a 40                	push   0x40
  509b42:	68 68 c9 41 00       	push   0x41c968
  509b47:	57                   	push   edi
  509b48:	50                   	push   eax
  509b49:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509b4f:	6a 00                	push   0x0
  509b51:	68 09 00 03 68       	push   0x68030009
  509b56:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  509b59:	52                   	push   edx
  509b5a:	8d 45 8c             	lea    eax,[ebp-0x74]
  509b5d:	50                   	push   eax
  509b5e:	ff d3                	call   ebx
  509b60:	83 c4 10             	add    esp,0x10
  509b63:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509b68:	8b 08                	mov    ecx,DWORD PTR [eax]
  509b6a:	50                   	push   eax
  509b6b:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  509b71:	50                   	push   eax
  509b72:	8d 55 b0             	lea    edx,[ebp-0x50]
  509b75:	52                   	push   edx
  509b76:	ff d6                	call   esi
  509b78:	8b f0                	mov    esi,eax
  509b7a:	8b 06                	mov    eax,DWORD PTR [esi]
  509b7c:	8d 4d ac             	lea    ecx,[ebp-0x54]
  509b7f:	51                   	push   ecx
  509b80:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  509b86:	66 8b 0a             	mov    cx,WORD PTR [edx]
  509b89:	51                   	push   ecx
  509b8a:	56                   	push   esi
  509b8b:	ff 50 40             	call   DWORD PTR [eax+0x40]
  509b8e:	db e2                	fnclex
  509b90:	85 c0                	test   eax,eax
  509b92:	7d 0f                	jge    0x509ba3
  509b94:	6a 40                	push   0x40
  509b96:	68 68 c9 41 00       	push   0x41c968
  509b9b:	56                   	push   esi
  509b9c:	50                   	push   eax
  509b9d:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509ba3:	6a 00                	push   0x0
  509ba5:	68 09 00 03 68       	push   0x68030009
  509baa:	8b 55 ac             	mov    edx,DWORD PTR [ebp-0x54]
  509bad:	52                   	push   edx
  509bae:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  509bb4:	50                   	push   eax
  509bb5:	ff d3                	call   ebx
  509bb7:	83 c4 10             	add    esp,0x10
  509bba:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  509bbd:	51                   	push   ecx
  509bbe:	8b 3d a0 11 40 00    	mov    edi,DWORD PTR ds:0x4011a0
  509bc4:	ff d7                	call   edi
  509bc6:	0f bf d0             	movsx  edx,ax
  509bc9:	89 95 b8 fe ff ff    	mov    DWORD PTR [ebp-0x148],edx
  509bcf:	db 85 b8 fe ff ff    	fild   DWORD PTR [ebp-0x148]
  509bd5:	d9 9d b4 fe ff ff    	fstp   DWORD PTR [ebp-0x14c]
  509bdb:	d9 85 b4 fe ff ff    	fld    DWORD PTR [ebp-0x14c]
  509be1:	8b 85 90 00 00 00    	mov    eax,DWORD PTR [ebp+0x90]
  509be7:	d8 08                	fmul   DWORD PTR [eax]
  509be9:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509bf0:	75 08                	jne    0x509bfa
  509bf2:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  509bf8:	eb 0b                	jmp    0x509c05
  509bfa:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  509c00:	e8 23 ab ef ff       	call   0x404728
  509c05:	8b b5 a8 00 00 00    	mov    esi,DWORD PTR [ebp+0xa8]
  509c0b:	d8 06                	fadd   DWORD PTR [esi]
  509c0d:	df e0                	fnstsw ax
  509c0f:	a8 0d                	test   al,0xd
  509c11:	0f 85 07 13 00 00    	jne    0x50af1e
  509c17:	d9 9d b0 fe ff ff    	fstp   DWORD PTR [ebp-0x150]
  509c1d:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  509c20:	51                   	push   ecx
  509c21:	ff d7                	call   edi
  509c23:	0f bf d0             	movsx  edx,ax
  509c26:	89 95 ac fe ff ff    	mov    DWORD PTR [ebp-0x154],edx
  509c2c:	db 85 ac fe ff ff    	fild   DWORD PTR [ebp-0x154]
  509c32:	d9 9d a8 fe ff ff    	fstp   DWORD PTR [ebp-0x158]
  509c38:	d9 85 b0 fe ff ff    	fld    DWORD PTR [ebp-0x150]
  509c3e:	d8 8d a8 fe ff ff    	fmul   DWORD PTR [ebp-0x158]
  509c44:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509c4b:	75 08                	jne    0x509c55
  509c4d:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  509c53:	eb 0b                	jmp    0x509c60
  509c55:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  509c5b:	e8 c8 aa ef ff       	call   0x404728
  509c60:	df e0                	fnstsw ax
  509c62:	a8 0d                	test   al,0xd
  509c64:	0f 85 b4 12 00 00    	jne    0x50af1e
  509c6a:	d9 9d a4 fe ff ff    	fstp   DWORD PTR [ebp-0x15c]
  509c70:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  509c76:	50                   	push   eax
  509c77:	ff d7                	call   edi
  509c79:	0f bf c8             	movsx  ecx,ax
  509c7c:	89 8d a0 fe ff ff    	mov    DWORD PTR [ebp-0x160],ecx
  509c82:	db 85 a0 fe ff ff    	fild   DWORD PTR [ebp-0x160]
  509c88:	d9 9d 9c fe ff ff    	fstp   DWORD PTR [ebp-0x164]
  509c8e:	d9 05 54 bb 54 00    	fld    DWORD PTR ds:0x54bb54
  509c94:	8b 95 a4 00 00 00    	mov    edx,DWORD PTR [ebp+0xa4]
  509c9a:	d8 0a                	fmul   DWORD PTR [edx]
  509c9c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  509c9f:	d9 00                	fld    DWORD PTR [eax]
  509ca1:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509ca8:	75 08                	jne    0x509cb2
  509caa:	d8 35 fc b4 54 00    	fdiv   DWORD PTR ds:0x54b4fc
  509cb0:	eb 0b                	jmp    0x509cbd
  509cb2:	ff 35 fc b4 54 00    	push   DWORD PTR ds:0x54b4fc
  509cb8:	e8 6b aa ef ff       	call   0x404728
  509cbd:	de c9                	fmulp  st(1),st
  509cbf:	d8 8d 9c fe ff ff    	fmul   DWORD PTR [ebp-0x164]
  509cc5:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509ccc:	75 08                	jne    0x509cd6
  509cce:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  509cd4:	eb 0b                	jmp    0x509ce1
  509cd6:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  509cdc:	e8 47 aa ef ff       	call   0x404728
  509ce1:	d8 85 a4 fe ff ff    	fadd   DWORD PTR [ebp-0x15c]
  509ce7:	d9 1e                	fstp   DWORD PTR [esi]
  509ce9:	df e0                	fnstsw ax
  509ceb:	a8 0d                	test   al,0xd
  509ced:	0f 85 2b 12 00 00    	jne    0x50af1e
  509cf3:	8d 4d ac             	lea    ecx,[ebp-0x54]
  509cf6:	51                   	push   ecx
  509cf7:	8d 55 b0             	lea    edx,[ebp-0x50]
  509cfa:	52                   	push   edx
  509cfb:	8d 45 b4             	lea    eax,[ebp-0x4c]
  509cfe:	50                   	push   eax
  509cff:	8d 4d b8             	lea    ecx,[ebp-0x48]
  509d02:	51                   	push   ecx
  509d03:	8d 55 bc             	lea    edx,[ebp-0x44]
  509d06:	52                   	push   edx
  509d07:	8d 45 c0             	lea    eax,[ebp-0x40]
  509d0a:	50                   	push   eax
  509d0b:	6a 06                	push   0x6
  509d0d:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  509d13:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  509d19:	51                   	push   ecx
  509d1a:	8d 55 8c             	lea    edx,[ebp-0x74]
  509d1d:	52                   	push   edx
  509d1e:	8d 45 9c             	lea    eax,[ebp-0x64]
  509d21:	50                   	push   eax
  509d22:	6a 03                	push   0x3
  509d24:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  509d2a:	83 c4 2c             	add    esp,0x2c
  509d2d:	e9 7b 01 00 00       	jmp    0x509ead
  509d32:	ff 91 f8 04 00 00    	call   DWORD PTR [ecx+0x4f8]
  509d38:	50                   	push   eax
  509d39:	8d 55 c0             	lea    edx,[ebp-0x40]
  509d3c:	52                   	push   edx
  509d3d:	ff d6                	call   esi
  509d3f:	8b f8                	mov    edi,eax
  509d41:	8b 07                	mov    eax,DWORD PTR [edi]
  509d43:	8d 4d bc             	lea    ecx,[ebp-0x44]
  509d46:	51                   	push   ecx
  509d47:	6a 00                	push   0x0
  509d49:	57                   	push   edi
  509d4a:	ff 50 40             	call   DWORD PTR [eax+0x40]
  509d4d:	db e2                	fnclex
  509d4f:	85 c0                	test   eax,eax
  509d51:	7d 0f                	jge    0x509d62
  509d53:	6a 40                	push   0x40
  509d55:	68 68 c9 41 00       	push   0x41c968
  509d5a:	57                   	push   edi
  509d5b:	50                   	push   eax
  509d5c:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509d62:	6a 00                	push   0x0
  509d64:	68 09 00 03 68       	push   0x68030009
  509d69:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  509d6c:	52                   	push   edx
  509d6d:	8d 45 9c             	lea    eax,[ebp-0x64]
  509d70:	50                   	push   eax
  509d71:	ff d3                	call   ebx
  509d73:	83 c4 10             	add    esp,0x10
  509d76:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509d7b:	8b 08                	mov    ecx,DWORD PTR [eax]
  509d7d:	50                   	push   eax
  509d7e:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  509d84:	50                   	push   eax
  509d85:	8d 55 b8             	lea    edx,[ebp-0x48]
  509d88:	52                   	push   edx
  509d89:	ff d6                	call   esi
  509d8b:	8b f0                	mov    esi,eax
  509d8d:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  509d93:	8b 06                	mov    eax,DWORD PTR [esi]
  509d95:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  509d98:	51                   	push   ecx
  509d99:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  509d9f:	66 8b 0a             	mov    cx,WORD PTR [edx]
  509da2:	51                   	push   ecx
  509da3:	56                   	push   esi
  509da4:	ff 50 40             	call   DWORD PTR [eax+0x40]
  509da7:	db e2                	fnclex
  509da9:	85 c0                	test   eax,eax
  509dab:	7d 0f                	jge    0x509dbc
  509dad:	6a 40                	push   0x40
  509daf:	68 68 c9 41 00       	push   0x41c968
  509db4:	56                   	push   esi
  509db5:	50                   	push   eax
  509db6:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509dbc:	6a 00                	push   0x0
  509dbe:	68 09 00 03 68       	push   0x68030009
  509dc3:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  509dc6:	52                   	push   edx
  509dc7:	8d 45 8c             	lea    eax,[ebp-0x74]
  509dca:	50                   	push   eax
  509dcb:	ff d3                	call   ebx
  509dcd:	83 c4 10             	add    esp,0x10
  509dd0:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  509dd3:	51                   	push   ecx
  509dd4:	8b 3d a0 11 40 00    	mov    edi,DWORD PTR ds:0x4011a0
  509dda:	ff d7                	call   edi
  509ddc:	0f bf d0             	movsx  edx,ax
  509ddf:	89 95 98 fe ff ff    	mov    DWORD PTR [ebp-0x168],edx
  509de5:	db 85 98 fe ff ff    	fild   DWORD PTR [ebp-0x168]
  509deb:	d9 9d 94 fe ff ff    	fstp   DWORD PTR [ebp-0x16c]
  509df1:	d9 85 94 fe ff ff    	fld    DWORD PTR [ebp-0x16c]
  509df7:	8b 85 90 00 00 00    	mov    eax,DWORD PTR [ebp+0x90]
  509dfd:	d8 08                	fmul   DWORD PTR [eax]
  509dff:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509e06:	75 08                	jne    0x509e10
  509e08:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  509e0e:	eb 0b                	jmp    0x509e1b
  509e10:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  509e16:	e8 0d a9 ef ff       	call   0x404728
  509e1b:	8b b5 a8 00 00 00    	mov    esi,DWORD PTR [ebp+0xa8]
  509e21:	d8 06                	fadd   DWORD PTR [esi]
  509e23:	df e0                	fnstsw ax
  509e25:	a8 0d                	test   al,0xd
  509e27:	0f 85 f1 10 00 00    	jne    0x50af1e
  509e2d:	d9 9d 90 fe ff ff    	fstp   DWORD PTR [ebp-0x170]
  509e33:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  509e36:	51                   	push   ecx
  509e37:	ff d7                	call   edi
  509e39:	0f bf d0             	movsx  edx,ax
  509e3c:	89 95 8c fe ff ff    	mov    DWORD PTR [ebp-0x174],edx
  509e42:	db 85 8c fe ff ff    	fild   DWORD PTR [ebp-0x174]
  509e48:	d9 9d 88 fe ff ff    	fstp   DWORD PTR [ebp-0x178]
  509e4e:	d9 85 90 fe ff ff    	fld    DWORD PTR [ebp-0x170]
  509e54:	d8 8d 88 fe ff ff    	fmul   DWORD PTR [ebp-0x178]
  509e5a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  509e61:	75 08                	jne    0x509e6b
  509e63:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  509e69:	eb 0b                	jmp    0x509e76
  509e6b:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  509e71:	e8 b2 a8 ef ff       	call   0x404728
  509e76:	d9 1e                	fstp   DWORD PTR [esi]
  509e78:	df e0                	fnstsw ax
  509e7a:	a8 0d                	test   al,0xd
  509e7c:	0f 85 9c 10 00 00    	jne    0x50af1e
  509e82:	8d 45 b4             	lea    eax,[ebp-0x4c]
  509e85:	50                   	push   eax
  509e86:	8d 4d b8             	lea    ecx,[ebp-0x48]
  509e89:	51                   	push   ecx
  509e8a:	8d 55 bc             	lea    edx,[ebp-0x44]
  509e8d:	52                   	push   edx
  509e8e:	8d 45 c0             	lea    eax,[ebp-0x40]
  509e91:	50                   	push   eax
  509e92:	6a 04                	push   0x4
  509e94:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  509e9a:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  509e9d:	51                   	push   ecx
  509e9e:	8d 55 9c             	lea    edx,[ebp-0x64]
  509ea1:	52                   	push   edx
  509ea2:	6a 02                	push   0x2
  509ea4:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  509eaa:	83 c4 20             	add    esp,0x20
  509ead:	8b 4d 68             	mov    ecx,DWORD PTR [ebp+0x68]
  509eb0:	d9 01                	fld    DWORD PTR [ecx]
  509eb2:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  509eb8:	df e0                	fnstsw ax
  509eba:	f6 c4 01             	test   ah,0x1
  509ebd:	74 06                	je     0x509ec5
  509ebf:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
  509ec5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  509ec8:	d9 00                	fld    DWORD PTR [eax]
  509eca:	d8 1d 64 b1 54 00    	fcomp  DWORD PTR ds:0x54b164
  509ed0:	df e0                	fnstsw ax
  509ed2:	f6 c4 41             	test   ah,0x41
  509ed5:	c7 85 84 fe ff ff 01 	mov    DWORD PTR [ebp-0x17c],0x1
  509edc:	00 00 00 
  509edf:	74 0a                	je     0x509eeb
  509ee1:	c7 85 84 fe ff ff 00 	mov    DWORD PTR [ebp-0x17c],0x0
  509ee8:	00 00 00 
  509eeb:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509ef0:	8b 08                	mov    ecx,DWORD PTR [eax]
  509ef2:	50                   	push   eax
  509ef3:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  509ef9:	50                   	push   eax
  509efa:	8d 55 c0             	lea    edx,[ebp-0x40]
  509efd:	52                   	push   edx
  509efe:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  509f04:	8b f0                	mov    esi,eax
  509f06:	8b 06                	mov    eax,DWORD PTR [esi]
  509f08:	8d 4d bc             	lea    ecx,[ebp-0x44]
  509f0b:	51                   	push   ecx
  509f0c:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  509f12:	66 8b 0a             	mov    cx,WORD PTR [edx]
  509f15:	51                   	push   ecx
  509f16:	56                   	push   esi
  509f17:	ff 50 40             	call   DWORD PTR [eax+0x40]
  509f1a:	db e2                	fnclex
  509f1c:	85 c0                	test   eax,eax
  509f1e:	7d 0f                	jge    0x509f2f
  509f20:	6a 40                	push   0x40
  509f22:	68 68 c9 41 00       	push   0x41c968
  509f27:	56                   	push   esi
  509f28:	50                   	push   eax
  509f29:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509f2f:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  509f34:	8b 10                	mov    edx,DWORD PTR [eax]
  509f36:	50                   	push   eax
  509f37:	ff 92 88 05 00 00    	call   DWORD PTR [edx+0x588]
  509f3d:	50                   	push   eax
  509f3e:	8d 45 b8             	lea    eax,[ebp-0x48]
  509f41:	50                   	push   eax
  509f42:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  509f48:	8b f0                	mov    esi,eax
  509f4a:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  509f50:	8b 0e                	mov    ecx,DWORD PTR [esi]
  509f52:	8d 55 b4             	lea    edx,[ebp-0x4c]
  509f55:	52                   	push   edx
  509f56:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  509f5c:	66 8b 10             	mov    dx,WORD PTR [eax]
  509f5f:	52                   	push   edx
  509f60:	56                   	push   esi
  509f61:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  509f64:	db e2                	fnclex
  509f66:	85 c0                	test   eax,eax
  509f68:	7d 0f                	jge    0x509f79
  509f6a:	6a 40                	push   0x40
  509f6c:	68 68 c9 41 00       	push   0x41c968
  509f71:	56                   	push   esi
  509f72:	50                   	push   eax
  509f73:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  509f79:	6a 00                	push   0x0
  509f7b:	68 09 00 03 68       	push   0x68030009
  509f80:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  509f83:	50                   	push   eax
  509f84:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  509f87:	51                   	push   ecx
  509f88:	ff d3                	call   ebx
  509f8a:	83 c4 10             	add    esp,0x10
  509f8d:	50                   	push   eax
  509f8e:	ff d7                	call   edi
  509f90:	66 8b f0             	mov    si,ax
  509f93:	66 f7 de             	neg    si
  509f96:	1b f6                	sbb    esi,esi
  509f98:	46                   	inc    esi
  509f99:	f7 de                	neg    esi
  509f9b:	6a 00                	push   0x0
  509f9d:	68 08 00 03 68       	push   0x68030008
  509fa2:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  509fa5:	52                   	push   edx
  509fa6:	8d 45 8c             	lea    eax,[ebp-0x74]
  509fa9:	50                   	push   eax
  509faa:	ff d3                	call   ebx
  509fac:	83 c4 10             	add    esp,0x10
  509faf:	50                   	push   eax
  509fb0:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  509fb6:	f7 d0                	not    eax
  509fb8:	23 f0                	and    esi,eax
  509fba:	8b 85 84 fe ff ff    	mov    eax,DWORD PTR [ebp-0x17c]
  509fc0:	f7 d8                	neg    eax
  509fc2:	23 f0                	and    esi,eax
  509fc4:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  509fc7:	51                   	push   ecx
  509fc8:	8d 55 b8             	lea    edx,[ebp-0x48]
  509fcb:	52                   	push   edx
  509fcc:	8d 45 bc             	lea    eax,[ebp-0x44]
  509fcf:	50                   	push   eax
  509fd0:	8d 4d c0             	lea    ecx,[ebp-0x40]
  509fd3:	51                   	push   ecx
  509fd4:	6a 04                	push   0x4
  509fd6:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  509fdc:	8d 55 8c             	lea    edx,[ebp-0x74]
  509fdf:	52                   	push   edx
  509fe0:	8d 45 9c             	lea    eax,[ebp-0x64]
  509fe3:	50                   	push   eax
  509fe4:	6a 02                	push   0x2
  509fe6:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  509fec:	83 c4 20             	add    esp,0x20
  509fef:	66 85 f6             	test   si,si
  509ff2:	74 52                	je     0x50a046
  509ff4:	c7 85 74 ff ff ff 64 	mov    DWORD PTR [ebp-0x8c],0x64
  509ffb:	00 00 00 
  509ffe:	c7 85 6c ff ff ff 02 	mov    DWORD PTR [ebp-0x94],0x2
  50a005:	00 00 00 
  50a008:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a00d:	8b 08                	mov    ecx,DWORD PTR [eax]
  50a00f:	50                   	push   eax
  50a010:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  50a016:	50                   	push   eax
  50a017:	8d 55 c0             	lea    edx,[ebp-0x40]
  50a01a:	52                   	push   edx
  50a01b:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a021:	8b f0                	mov    esi,eax
  50a023:	8b 06                	mov    eax,DWORD PTR [esi]
  50a025:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50a028:	51                   	push   ecx
  50a029:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50a02f:	66 8b 0a             	mov    cx,WORD PTR [edx]
  50a032:	51                   	push   ecx
  50a033:	56                   	push   esi
  50a034:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50a037:	db e2                	fnclex
  50a039:	85 c0                	test   eax,eax
  50a03b:	0f 8d c1 01 00 00    	jge    0x50a202
  50a041:	e9 ad 01 00 00       	jmp    0x50a1f3
  50a046:	d9 05 64 b1 54 00    	fld    DWORD PTR ds:0x54b164
  50a04c:	dc 25 a8 34 40 00    	fsub   QWORD PTR ds:0x4034a8
  50a052:	df e0                	fnstsw ax
  50a054:	a8 0d                	test   al,0xd
  50a056:	0f 85 c2 0e 00 00    	jne    0x50af1e
  50a05c:	d9 9d 80 fe ff ff    	fstp   DWORD PTR [ebp-0x180]
  50a062:	d9 85 80 fe ff ff    	fld    DWORD PTR [ebp-0x180]
  50a068:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50a06e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  50a071:	d8 1a                	fcomp  DWORD PTR [edx]
  50a073:	df e0                	fnstsw ax
  50a075:	f6 c4 41             	test   ah,0x41
  50a078:	c7 85 7c fe ff ff 01 	mov    DWORD PTR [ebp-0x184],0x1
  50a07f:	00 00 00 
  50a082:	74 0a                	je     0x50a08e
  50a084:	c7 85 7c fe ff ff 00 	mov    DWORD PTR [ebp-0x184],0x0
  50a08b:	00 00 00 
  50a08e:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a093:	8b 08                	mov    ecx,DWORD PTR [eax]
  50a095:	50                   	push   eax
  50a096:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  50a09c:	50                   	push   eax
  50a09d:	8d 55 c0             	lea    edx,[ebp-0x40]
  50a0a0:	52                   	push   edx
  50a0a1:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a0a7:	8b f0                	mov    esi,eax
  50a0a9:	8b 06                	mov    eax,DWORD PTR [esi]
  50a0ab:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50a0ae:	51                   	push   ecx
  50a0af:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50a0b5:	66 8b 0a             	mov    cx,WORD PTR [edx]
  50a0b8:	51                   	push   ecx
  50a0b9:	56                   	push   esi
  50a0ba:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50a0bd:	db e2                	fnclex
  50a0bf:	85 c0                	test   eax,eax
  50a0c1:	7d 0f                	jge    0x50a0d2
  50a0c3:	6a 40                	push   0x40
  50a0c5:	68 68 c9 41 00       	push   0x41c968
  50a0ca:	56                   	push   esi
  50a0cb:	50                   	push   eax
  50a0cc:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a0d2:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a0d7:	8b 10                	mov    edx,DWORD PTR [eax]
  50a0d9:	50                   	push   eax
  50a0da:	ff 92 88 05 00 00    	call   DWORD PTR [edx+0x588]
  50a0e0:	50                   	push   eax
  50a0e1:	8d 45 b8             	lea    eax,[ebp-0x48]
  50a0e4:	50                   	push   eax
  50a0e5:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a0eb:	8b f0                	mov    esi,eax
  50a0ed:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  50a0f3:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50a0f5:	8d 55 b4             	lea    edx,[ebp-0x4c]
  50a0f8:	52                   	push   edx
  50a0f9:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  50a0ff:	66 8b 10             	mov    dx,WORD PTR [eax]
  50a102:	52                   	push   edx
  50a103:	56                   	push   esi
  50a104:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50a107:	db e2                	fnclex
  50a109:	85 c0                	test   eax,eax
  50a10b:	7d 0f                	jge    0x50a11c
  50a10d:	6a 40                	push   0x40
  50a10f:	68 68 c9 41 00       	push   0x41c968
  50a114:	56                   	push   esi
  50a115:	50                   	push   eax
  50a116:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a11c:	6a 00                	push   0x0
  50a11e:	68 09 00 03 68       	push   0x68030009
  50a123:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  50a126:	50                   	push   eax
  50a127:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50a12a:	51                   	push   ecx
  50a12b:	ff d3                	call   ebx
  50a12d:	83 c4 10             	add    esp,0x10
  50a130:	50                   	push   eax
  50a131:	ff d7                	call   edi
  50a133:	33 d2                	xor    edx,edx
  50a135:	66 3d 64 00          	cmp    ax,0x64
  50a139:	0f 94 c2             	sete   dl
  50a13c:	f7 da                	neg    edx
  50a13e:	6a 00                	push   0x0
  50a140:	68 08 00 03 68       	push   0x68030008
  50a145:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  50a148:	50                   	push   eax
  50a149:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  50a14c:	51                   	push   ecx
  50a14d:	89 95 78 fe ff ff    	mov    DWORD PTR [ebp-0x188],edx
  50a153:	ff d3                	call   ebx
  50a155:	83 c4 10             	add    esp,0x10
  50a158:	50                   	push   eax
  50a159:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50a15f:	f7 d0                	not    eax
  50a161:	8b 95 78 fe ff ff    	mov    edx,DWORD PTR [ebp-0x188]
  50a167:	23 d0                	and    edx,eax
  50a169:	8b 85 7c fe ff ff    	mov    eax,DWORD PTR [ebp-0x184]
  50a16f:	f7 d8                	neg    eax
  50a171:	23 d0                	and    edx,eax
  50a173:	66 8b f2             	mov    si,dx
  50a176:	8d 45 b4             	lea    eax,[ebp-0x4c]
  50a179:	50                   	push   eax
  50a17a:	8d 4d b8             	lea    ecx,[ebp-0x48]
  50a17d:	51                   	push   ecx
  50a17e:	8d 55 bc             	lea    edx,[ebp-0x44]
  50a181:	52                   	push   edx
  50a182:	8d 45 c0             	lea    eax,[ebp-0x40]
  50a185:	50                   	push   eax
  50a186:	6a 04                	push   0x4
  50a188:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50a18e:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  50a191:	51                   	push   ecx
  50a192:	8d 55 9c             	lea    edx,[ebp-0x64]
  50a195:	52                   	push   edx
  50a196:	6a 02                	push   0x2
  50a198:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50a19e:	83 c4 20             	add    esp,0x20
  50a1a1:	66 85 f6             	test   si,si
  50a1a4:	0f 84 a2 00 00 00    	je     0x50a24c
  50a1aa:	c7 85 74 ff ff ff 00 	mov    DWORD PTR [ebp-0x8c],0x0
  50a1b1:	00 00 00 
  50a1b4:	c7 85 6c ff ff ff 02 	mov    DWORD PTR [ebp-0x94],0x2
  50a1bb:	00 00 00 
  50a1be:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a1c3:	8b 08                	mov    ecx,DWORD PTR [eax]
  50a1c5:	50                   	push   eax
  50a1c6:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  50a1cc:	50                   	push   eax
  50a1cd:	8d 55 c0             	lea    edx,[ebp-0x40]
  50a1d0:	52                   	push   edx
  50a1d1:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a1d7:	8b f0                	mov    esi,eax
  50a1d9:	8b 06                	mov    eax,DWORD PTR [esi]
  50a1db:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50a1de:	51                   	push   ecx
  50a1df:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50a1e5:	66 8b 0a             	mov    cx,WORD PTR [edx]
  50a1e8:	51                   	push   ecx
  50a1e9:	56                   	push   esi
  50a1ea:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50a1ed:	db e2                	fnclex
  50a1ef:	85 c0                	test   eax,eax
  50a1f1:	7d 0f                	jge    0x50a202
  50a1f3:	6a 40                	push   0x40
  50a1f5:	68 68 c9 41 00       	push   0x41c968
  50a1fa:	56                   	push   esi
  50a1fb:	50                   	push   eax
  50a1fc:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a202:	83 ec 10             	sub    esp,0x10
  50a205:	8b d4                	mov    edx,esp
  50a207:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [ebp-0x94]
  50a20d:	89 02                	mov    DWORD PTR [edx],eax
  50a20f:	8b 8d 70 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x90]
  50a215:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  50a218:	8b 85 74 ff ff ff    	mov    eax,DWORD PTR [ebp-0x8c]
  50a21e:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  50a221:	8b 8d 78 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x88]
  50a227:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  50a22a:	68 09 00 03 68       	push   0x68030009
  50a22f:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  50a232:	52                   	push   edx
  50a233:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  50a239:	8d 45 bc             	lea    eax,[ebp-0x44]
  50a23c:	50                   	push   eax
  50a23d:	8d 4d c0             	lea    ecx,[ebp-0x40]
  50a240:	51                   	push   ecx
  50a241:	6a 02                	push   0x2
  50a243:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50a249:	83 c4 0c             	add    esp,0xc
  50a24c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  50a24f:	d9 02                	fld    DWORD PTR [edx]
  50a251:	d8 1d ac b2 54 00    	fcomp  DWORD PTR ds:0x54b2ac
  50a257:	df e0                	fnstsw ax
  50a259:	f6 c4 41             	test   ah,0x41
  50a25c:	c7 85 74 fe ff ff 01 	mov    DWORD PTR [ebp-0x18c],0x1
  50a263:	00 00 00 
  50a266:	74 0a                	je     0x50a272
  50a268:	c7 85 74 fe ff ff 00 	mov    DWORD PTR [ebp-0x18c],0x0
  50a26f:	00 00 00 
  50a272:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a277:	8b 08                	mov    ecx,DWORD PTR [eax]
  50a279:	50                   	push   eax
  50a27a:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  50a280:	50                   	push   eax
  50a281:	8d 55 c0             	lea    edx,[ebp-0x40]
  50a284:	52                   	push   edx
  50a285:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a28b:	8b f0                	mov    esi,eax
  50a28d:	8b 06                	mov    eax,DWORD PTR [esi]
  50a28f:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50a292:	51                   	push   ecx
  50a293:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50a299:	66 8b 0a             	mov    cx,WORD PTR [edx]
  50a29c:	66 83 c1 02          	add    cx,0x2
  50a2a0:	0f 80 7d 0c 00 00    	jo     0x50af23
  50a2a6:	51                   	push   ecx
  50a2a7:	56                   	push   esi
  50a2a8:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50a2ab:	db e2                	fnclex
  50a2ad:	85 c0                	test   eax,eax
  50a2af:	7d 0f                	jge    0x50a2c0
  50a2b1:	6a 40                	push   0x40
  50a2b3:	68 68 c9 41 00       	push   0x41c968
  50a2b8:	56                   	push   esi
  50a2b9:	50                   	push   eax
  50a2ba:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a2c0:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a2c5:	8b 10                	mov    edx,DWORD PTR [eax]
  50a2c7:	50                   	push   eax
  50a2c8:	ff 92 88 05 00 00    	call   DWORD PTR [edx+0x588]
  50a2ce:	50                   	push   eax
  50a2cf:	8d 45 b8             	lea    eax,[ebp-0x48]
  50a2d2:	50                   	push   eax
  50a2d3:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a2d9:	8b f0                	mov    esi,eax
  50a2db:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  50a2e1:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50a2e3:	8d 55 b4             	lea    edx,[ebp-0x4c]
  50a2e6:	52                   	push   edx
  50a2e7:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  50a2ed:	66 8b 10             	mov    dx,WORD PTR [eax]
  50a2f0:	66 83 c2 02          	add    dx,0x2
  50a2f4:	0f 80 29 0c 00 00    	jo     0x50af23
  50a2fa:	52                   	push   edx
  50a2fb:	56                   	push   esi
  50a2fc:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50a2ff:	db e2                	fnclex
  50a301:	85 c0                	test   eax,eax
  50a303:	7d 0f                	jge    0x50a314
  50a305:	6a 40                	push   0x40
  50a307:	68 68 c9 41 00       	push   0x41c968
  50a30c:	56                   	push   esi
  50a30d:	50                   	push   eax
  50a30e:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a314:	6a 00                	push   0x0
  50a316:	68 09 00 03 68       	push   0x68030009
  50a31b:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  50a31e:	50                   	push   eax
  50a31f:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50a322:	51                   	push   ecx
  50a323:	ff d3                	call   ebx
  50a325:	83 c4 10             	add    esp,0x10
  50a328:	50                   	push   eax
  50a329:	ff d7                	call   edi
  50a32b:	66 8b f0             	mov    si,ax
  50a32e:	66 f7 de             	neg    si
  50a331:	1b f6                	sbb    esi,esi
  50a333:	46                   	inc    esi
  50a334:	f7 de                	neg    esi
  50a336:	6a 00                	push   0x0
  50a338:	68 08 00 03 68       	push   0x68030008
  50a33d:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  50a340:	52                   	push   edx
  50a341:	8d 45 8c             	lea    eax,[ebp-0x74]
  50a344:	50                   	push   eax
  50a345:	ff d3                	call   ebx
  50a347:	83 c4 10             	add    esp,0x10
  50a34a:	50                   	push   eax
  50a34b:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50a351:	f7 d0                	not    eax
  50a353:	23 f0                	and    esi,eax
  50a355:	8b 85 74 fe ff ff    	mov    eax,DWORD PTR [ebp-0x18c]
  50a35b:	f7 d8                	neg    eax
  50a35d:	23 f0                	and    esi,eax
  50a35f:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  50a362:	51                   	push   ecx
  50a363:	8d 55 b8             	lea    edx,[ebp-0x48]
  50a366:	52                   	push   edx
  50a367:	8d 45 bc             	lea    eax,[ebp-0x44]
  50a36a:	50                   	push   eax
  50a36b:	8d 4d c0             	lea    ecx,[ebp-0x40]
  50a36e:	51                   	push   ecx
  50a36f:	6a 04                	push   0x4
  50a371:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50a377:	8d 55 8c             	lea    edx,[ebp-0x74]
  50a37a:	52                   	push   edx
  50a37b:	8d 45 9c             	lea    eax,[ebp-0x64]
  50a37e:	50                   	push   eax
  50a37f:	6a 02                	push   0x2
  50a381:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50a387:	83 c4 20             	add    esp,0x20
  50a38a:	66 85 f6             	test   si,si
  50a38d:	74 5c                	je     0x50a3eb
  50a38f:	c7 85 74 ff ff ff 64 	mov    DWORD PTR [ebp-0x8c],0x64
  50a396:	00 00 00 
  50a399:	c7 85 6c ff ff ff 02 	mov    DWORD PTR [ebp-0x94],0x2
  50a3a0:	00 00 00 
  50a3a3:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a3a8:	8b 08                	mov    ecx,DWORD PTR [eax]
  50a3aa:	50                   	push   eax
  50a3ab:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  50a3b1:	50                   	push   eax
  50a3b2:	8d 55 c0             	lea    edx,[ebp-0x40]
  50a3b5:	52                   	push   edx
  50a3b6:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a3bc:	8b f0                	mov    esi,eax
  50a3be:	8b 06                	mov    eax,DWORD PTR [esi]
  50a3c0:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50a3c3:	51                   	push   ecx
  50a3c4:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50a3ca:	66 8b 0a             	mov    cx,WORD PTR [edx]
  50a3cd:	66 83 c1 02          	add    cx,0x2
  50a3d1:	0f 80 4c 0b 00 00    	jo     0x50af23
  50a3d7:	51                   	push   ecx
  50a3d8:	56                   	push   esi
  50a3d9:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50a3dc:	db e2                	fnclex
  50a3de:	85 c0                	test   eax,eax
  50a3e0:	0f 8d df 01 00 00    	jge    0x50a5c5
  50a3e6:	e9 cb 01 00 00       	jmp    0x50a5b6
  50a3eb:	d9 05 ac b2 54 00    	fld    DWORD PTR ds:0x54b2ac
  50a3f1:	dc 25 a8 34 40 00    	fsub   QWORD PTR ds:0x4034a8
  50a3f7:	df e0                	fnstsw ax
  50a3f9:	a8 0d                	test   al,0xd
  50a3fb:	0f 85 1d 0b 00 00    	jne    0x50af1e
  50a401:	d9 9d 70 fe ff ff    	fstp   DWORD PTR [ebp-0x190]
  50a407:	d9 85 70 fe ff ff    	fld    DWORD PTR [ebp-0x190]
  50a40d:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50a413:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  50a416:	d8 1a                	fcomp  DWORD PTR [edx]
  50a418:	df e0                	fnstsw ax
  50a41a:	f6 c4 41             	test   ah,0x41
  50a41d:	c7 85 6c fe ff ff 01 	mov    DWORD PTR [ebp-0x194],0x1
  50a424:	00 00 00 
  50a427:	74 0a                	je     0x50a433
  50a429:	c7 85 6c fe ff ff 00 	mov    DWORD PTR [ebp-0x194],0x0
  50a430:	00 00 00 
  50a433:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a438:	8b 08                	mov    ecx,DWORD PTR [eax]
  50a43a:	50                   	push   eax
  50a43b:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  50a441:	50                   	push   eax
  50a442:	8d 55 c0             	lea    edx,[ebp-0x40]
  50a445:	52                   	push   edx
  50a446:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a44c:	8b f0                	mov    esi,eax
  50a44e:	8b 06                	mov    eax,DWORD PTR [esi]
  50a450:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50a453:	51                   	push   ecx
  50a454:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50a45a:	66 8b 0a             	mov    cx,WORD PTR [edx]
  50a45d:	66 83 c1 02          	add    cx,0x2
  50a461:	0f 80 bc 0a 00 00    	jo     0x50af23
  50a467:	51                   	push   ecx
  50a468:	56                   	push   esi
  50a469:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50a46c:	db e2                	fnclex
  50a46e:	85 c0                	test   eax,eax
  50a470:	7d 0f                	jge    0x50a481
  50a472:	6a 40                	push   0x40
  50a474:	68 68 c9 41 00       	push   0x41c968
  50a479:	56                   	push   esi
  50a47a:	50                   	push   eax
  50a47b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a481:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a486:	8b 10                	mov    edx,DWORD PTR [eax]
  50a488:	50                   	push   eax
  50a489:	ff 92 88 05 00 00    	call   DWORD PTR [edx+0x588]
  50a48f:	50                   	push   eax
  50a490:	8d 45 b8             	lea    eax,[ebp-0x48]
  50a493:	50                   	push   eax
  50a494:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a49a:	8b f0                	mov    esi,eax
  50a49c:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  50a4a2:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50a4a4:	8d 55 b4             	lea    edx,[ebp-0x4c]
  50a4a7:	52                   	push   edx
  50a4a8:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  50a4ae:	66 8b 10             	mov    dx,WORD PTR [eax]
  50a4b1:	66 83 c2 02          	add    dx,0x2
  50a4b5:	0f 80 68 0a 00 00    	jo     0x50af23
  50a4bb:	52                   	push   edx
  50a4bc:	56                   	push   esi
  50a4bd:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50a4c0:	db e2                	fnclex
  50a4c2:	85 c0                	test   eax,eax
  50a4c4:	7d 0f                	jge    0x50a4d5
  50a4c6:	6a 40                	push   0x40
  50a4c8:	68 68 c9 41 00       	push   0x41c968
  50a4cd:	56                   	push   esi
  50a4ce:	50                   	push   eax
  50a4cf:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a4d5:	6a 00                	push   0x0
  50a4d7:	68 09 00 03 68       	push   0x68030009
  50a4dc:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  50a4df:	50                   	push   eax
  50a4e0:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50a4e3:	51                   	push   ecx
  50a4e4:	ff d3                	call   ebx
  50a4e6:	83 c4 10             	add    esp,0x10
  50a4e9:	50                   	push   eax
  50a4ea:	ff d7                	call   edi
  50a4ec:	33 d2                	xor    edx,edx
  50a4ee:	66 3d 64 00          	cmp    ax,0x64
  50a4f2:	0f 94 c2             	sete   dl
  50a4f5:	f7 da                	neg    edx
  50a4f7:	6a 00                	push   0x0
  50a4f9:	68 08 00 03 68       	push   0x68030008
  50a4fe:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  50a501:	50                   	push   eax
  50a502:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  50a505:	51                   	push   ecx
  50a506:	89 95 68 fe ff ff    	mov    DWORD PTR [ebp-0x198],edx
  50a50c:	ff d3                	call   ebx
  50a50e:	83 c4 10             	add    esp,0x10
  50a511:	50                   	push   eax
  50a512:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50a518:	f7 d0                	not    eax
  50a51a:	8b 95 68 fe ff ff    	mov    edx,DWORD PTR [ebp-0x198]
  50a520:	23 d0                	and    edx,eax
  50a522:	8b 85 6c fe ff ff    	mov    eax,DWORD PTR [ebp-0x194]
  50a528:	f7 d8                	neg    eax
  50a52a:	23 d0                	and    edx,eax
  50a52c:	66 8b f2             	mov    si,dx
  50a52f:	8d 45 b4             	lea    eax,[ebp-0x4c]
  50a532:	50                   	push   eax
  50a533:	8d 4d b8             	lea    ecx,[ebp-0x48]
  50a536:	51                   	push   ecx
  50a537:	8d 55 bc             	lea    edx,[ebp-0x44]
  50a53a:	52                   	push   edx
  50a53b:	8d 45 c0             	lea    eax,[ebp-0x40]
  50a53e:	50                   	push   eax
  50a53f:	6a 04                	push   0x4
  50a541:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50a547:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  50a54a:	51                   	push   ecx
  50a54b:	8d 55 9c             	lea    edx,[ebp-0x64]
  50a54e:	52                   	push   edx
  50a54f:	6a 02                	push   0x2
  50a551:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50a557:	83 c4 20             	add    esp,0x20
  50a55a:	66 85 f6             	test   si,si
  50a55d:	0f 84 ac 00 00 00    	je     0x50a60f
  50a563:	c7 85 74 ff ff ff 00 	mov    DWORD PTR [ebp-0x8c],0x0
  50a56a:	00 00 00 
  50a56d:	c7 85 6c ff ff ff 02 	mov    DWORD PTR [ebp-0x94],0x2
  50a574:	00 00 00 
  50a577:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a57c:	8b 08                	mov    ecx,DWORD PTR [eax]
  50a57e:	50                   	push   eax
  50a57f:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  50a585:	50                   	push   eax
  50a586:	8d 55 c0             	lea    edx,[ebp-0x40]
  50a589:	52                   	push   edx
  50a58a:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a590:	8b f0                	mov    esi,eax
  50a592:	8b 06                	mov    eax,DWORD PTR [esi]
  50a594:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50a597:	51                   	push   ecx
  50a598:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50a59e:	66 8b 0a             	mov    cx,WORD PTR [edx]
  50a5a1:	66 83 c1 02          	add    cx,0x2
  50a5a5:	0f 80 78 09 00 00    	jo     0x50af23
  50a5ab:	51                   	push   ecx
  50a5ac:	56                   	push   esi
  50a5ad:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50a5b0:	db e2                	fnclex
  50a5b2:	85 c0                	test   eax,eax
  50a5b4:	7d 0f                	jge    0x50a5c5
  50a5b6:	6a 40                	push   0x40
  50a5b8:	68 68 c9 41 00       	push   0x41c968
  50a5bd:	56                   	push   esi
  50a5be:	50                   	push   eax
  50a5bf:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a5c5:	83 ec 10             	sub    esp,0x10
  50a5c8:	8b d4                	mov    edx,esp
  50a5ca:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [ebp-0x94]
  50a5d0:	89 02                	mov    DWORD PTR [edx],eax
  50a5d2:	8b 8d 70 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x90]
  50a5d8:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  50a5db:	8b 85 74 ff ff ff    	mov    eax,DWORD PTR [ebp-0x8c]
  50a5e1:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  50a5e4:	8b 8d 78 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x88]
  50a5ea:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  50a5ed:	68 09 00 03 68       	push   0x68030009
  50a5f2:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  50a5f5:	52                   	push   edx
  50a5f6:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  50a5fc:	8d 45 bc             	lea    eax,[ebp-0x44]
  50a5ff:	50                   	push   eax
  50a600:	8d 4d c0             	lea    ecx,[ebp-0x40]
  50a603:	51                   	push   ecx
  50a604:	6a 02                	push   0x2
  50a606:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50a60c:	83 c4 0c             	add    esp,0xc
  50a60f:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a614:	8b 10                	mov    edx,DWORD PTR [eax]
  50a616:	50                   	push   eax
  50a617:	ff 92 88 05 00 00    	call   DWORD PTR [edx+0x588]
  50a61d:	50                   	push   eax
  50a61e:	8d 45 c0             	lea    eax,[ebp-0x40]
  50a621:	50                   	push   eax
  50a622:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a628:	8b f0                	mov    esi,eax
  50a62a:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50a62c:	8d 55 bc             	lea    edx,[ebp-0x44]
  50a62f:	52                   	push   edx
  50a630:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  50a636:	66 8b 10             	mov    dx,WORD PTR [eax]
  50a639:	52                   	push   edx
  50a63a:	56                   	push   esi
  50a63b:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50a63e:	db e2                	fnclex
  50a640:	85 c0                	test   eax,eax
  50a642:	7d 0f                	jge    0x50a653
  50a644:	6a 40                	push   0x40
  50a646:	68 68 c9 41 00       	push   0x41c968
  50a64b:	56                   	push   esi
  50a64c:	50                   	push   eax
  50a64d:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a653:	6a 00                	push   0x0
  50a655:	68 09 00 03 68       	push   0x68030009
  50a65a:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  50a65d:	50                   	push   eax
  50a65e:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50a661:	51                   	push   ecx
  50a662:	ff d3                	call   ebx
  50a664:	83 c4 10             	add    esp,0x10
  50a667:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a66c:	8b 10                	mov    edx,DWORD PTR [eax]
  50a66e:	50                   	push   eax
  50a66f:	ff 92 88 05 00 00    	call   DWORD PTR [edx+0x588]
  50a675:	50                   	push   eax
  50a676:	8d 45 b8             	lea    eax,[ebp-0x48]
  50a679:	50                   	push   eax
  50a67a:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a680:	8b f0                	mov    esi,eax
  50a682:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  50a688:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50a68a:	8d 55 b4             	lea    edx,[ebp-0x4c]
  50a68d:	52                   	push   edx
  50a68e:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  50a694:	66 8b 10             	mov    dx,WORD PTR [eax]
  50a697:	66 83 c2 02          	add    dx,0x2
  50a69b:	0f 80 82 08 00 00    	jo     0x50af23
  50a6a1:	52                   	push   edx
  50a6a2:	56                   	push   esi
  50a6a3:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50a6a6:	db e2                	fnclex
  50a6a8:	85 c0                	test   eax,eax
  50a6aa:	7d 0f                	jge    0x50a6bb
  50a6ac:	6a 40                	push   0x40
  50a6ae:	68 68 c9 41 00       	push   0x41c968
  50a6b3:	56                   	push   esi
  50a6b4:	50                   	push   eax
  50a6b5:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a6bb:	6a 00                	push   0x0
  50a6bd:	68 09 00 03 68       	push   0x68030009
  50a6c2:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  50a6c5:	50                   	push   eax
  50a6c6:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  50a6c9:	51                   	push   ecx
  50a6ca:	ff d3                	call   ebx
  50a6cc:	83 c4 10             	add    esp,0x10
  50a6cf:	8d 55 8c             	lea    edx,[ebp-0x74]
  50a6d2:	52                   	push   edx
  50a6d3:	ff d7                	call   edi
  50a6d5:	0f bf c0             	movsx  eax,ax
  50a6d8:	89 85 64 fe ff ff    	mov    DWORD PTR [ebp-0x19c],eax
  50a6de:	db 85 64 fe ff ff    	fild   DWORD PTR [ebp-0x19c]
  50a6e4:	d9 9d 60 fe ff ff    	fstp   DWORD PTR [ebp-0x1a0]
  50a6ea:	d9 05 a8 b2 54 00    	fld    DWORD PTR ds:0x54b2a8
  50a6f0:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50a6f7:	75 08                	jne    0x50a701
  50a6f9:	d8 35 ac b2 54 00    	fdiv   DWORD PTR ds:0x54b2ac
  50a6ff:	eb 0b                	jmp    0x50a70c
  50a701:	ff 35 ac b2 54 00    	push   DWORD PTR ds:0x54b2ac
  50a707:	e8 1c a0 ef ff       	call   0x404728
  50a70c:	d8 8d 60 fe ff ff    	fmul   DWORD PTR [ebp-0x1a0]
  50a712:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50a719:	75 08                	jne    0x50a723
  50a71b:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  50a721:	eb 0b                	jmp    0x50a72e
  50a723:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  50a729:	e8 fa 9f ef ff       	call   0x404728
  50a72e:	df e0                	fnstsw ax
  50a730:	a8 0d                	test   al,0xd
  50a732:	0f 85 e6 07 00 00    	jne    0x50af1e
  50a738:	d9 9d 5c fe ff ff    	fstp   DWORD PTR [ebp-0x1a4]
  50a73e:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50a741:	51                   	push   ecx
  50a742:	ff d7                	call   edi
  50a744:	0f bf d0             	movsx  edx,ax
  50a747:	89 95 58 fe ff ff    	mov    DWORD PTR [ebp-0x1a8],edx
  50a74d:	db 85 58 fe ff ff    	fild   DWORD PTR [ebp-0x1a8]
  50a753:	d9 9d 54 fe ff ff    	fstp   DWORD PTR [ebp-0x1ac]
  50a759:	d9 05 68 b1 54 00    	fld    DWORD PTR ds:0x54b168
  50a75f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50a766:	75 08                	jne    0x50a770
  50a768:	d8 35 64 b1 54 00    	fdiv   DWORD PTR ds:0x54b164
  50a76e:	eb 0b                	jmp    0x50a77b
  50a770:	ff 35 64 b1 54 00    	push   DWORD PTR ds:0x54b164
  50a776:	e8 ad 9f ef ff       	call   0x404728
  50a77b:	d8 8d 54 fe ff ff    	fmul   DWORD PTR [ebp-0x1ac]
  50a781:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50a788:	75 08                	jne    0x50a792
  50a78a:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  50a790:	eb 0b                	jmp    0x50a79d
  50a792:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  50a798:	e8 8b 9f ef ff       	call   0x404728
  50a79d:	d8 85 5c fe ff ff    	fadd   DWORD PTR [ebp-0x1a4]
  50a7a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  50a7a6:	d8 08                	fmul   DWORD PTR [eax]
  50a7a8:	8b 8d a4 00 00 00    	mov    ecx,DWORD PTR [ebp+0xa4]
  50a7ae:	d8 09                	fmul   DWORD PTR [ecx]
  50a7b0:	8b b5 a0 00 00 00    	mov    esi,DWORD PTR [ebp+0xa0]
  50a7b6:	d9 1e                	fstp   DWORD PTR [esi]
  50a7b8:	df e0                	fnstsw ax
  50a7ba:	a8 0d                	test   al,0xd
  50a7bc:	0f 85 5c 07 00 00    	jne    0x50af1e
  50a7c2:	8d 55 b4             	lea    edx,[ebp-0x4c]
  50a7c5:	52                   	push   edx
  50a7c6:	8d 45 b8             	lea    eax,[ebp-0x48]
  50a7c9:	50                   	push   eax
  50a7ca:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50a7cd:	51                   	push   ecx
  50a7ce:	8d 55 c0             	lea    edx,[ebp-0x40]
  50a7d1:	52                   	push   edx
  50a7d2:	6a 04                	push   0x4
  50a7d4:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50a7da:	8d 45 8c             	lea    eax,[ebp-0x74]
  50a7dd:	50                   	push   eax
  50a7de:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50a7e1:	51                   	push   ecx
  50a7e2:	6a 02                	push   0x2
  50a7e4:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50a7ea:	83 c4 20             	add    esp,0x20
  50a7ed:	d9 06                	fld    DWORD PTR [esi]
  50a7ef:	8b 8d a8 00 00 00    	mov    ecx,DWORD PTR [ebp+0xa8]
  50a7f5:	d8 01                	fadd   DWORD PTR [ecx]
  50a7f7:	8b 95 ac 00 00 00    	mov    edx,DWORD PTR [ebp+0xac]
  50a7fd:	d8 02                	fadd   DWORD PTR [edx]
  50a7ff:	8b 75 68             	mov    esi,DWORD PTR [ebp+0x68]
  50a802:	d9 1e                	fstp   DWORD PTR [esi]
  50a804:	df e0                	fnstsw ax
  50a806:	a8 0d                	test   al,0xd
  50a808:	0f 85 10 07 00 00    	jne    0x50af1e
  50a80e:	8b 45 78             	mov    eax,DWORD PTR [ebp+0x78]
  50a811:	d9 00                	fld    DWORD PTR [eax]
  50a813:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  50a816:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50a81d:	75 04                	jne    0x50a823
  50a81f:	d8 32                	fdiv   DWORD PTR [edx]
  50a821:	eb 07                	jmp    0x50a82a
  50a823:	ff 32                	push   DWORD PTR [edx]
  50a825:	e8 fe 9e ef ff       	call   0x404728
  50a82a:	d9 5d d0             	fstp   DWORD PTR [ebp-0x30]
  50a82d:	df e0                	fnstsw ax
  50a82f:	a8 0d                	test   al,0xd
  50a831:	0f 85 e7 06 00 00    	jne    0x50af1e
  50a837:	a1 14 b7 54 00       	mov    eax,ds:0x54b714
  50a83c:	a3 18 b7 54 00       	mov    ds:0x54b718,eax
  50a841:	d9 06                	fld    DWORD PTR [esi]
  50a843:	d8 5d d0             	fcomp  DWORD PTR [ebp-0x30]
  50a846:	df e0                	fnstsw ax
  50a848:	f6 c4 41             	test   ah,0x41
  50a84b:	75 59                	jne    0x50a8a6
  50a84d:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  50a850:	89 06                	mov    DWORD PTR [esi],eax
  50a852:	89 01                	mov    DWORD PTR [ecx],eax
  50a854:	8b 8d a0 00 00 00    	mov    ecx,DWORD PTR [ebp+0xa0]
  50a85a:	89 01                	mov    DWORD PTR [ecx],eax
  50a85c:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50a862:	66 83 3a 00          	cmp    WORD PTR [edx],0x0
  50a866:	75 1f                	jne    0x50a887
  50a868:	8b 45 6c             	mov    eax,DWORD PTR [ebp+0x6c]
  50a86b:	d9 00                	fld    DWORD PTR [eax]
  50a86d:	d8 25 18 b7 54 00    	fsub   DWORD PTR ds:0x54b718
  50a873:	d8 0e                	fmul   DWORD PTR [esi]
  50a875:	df e0                	fnstsw ax
  50a877:	a8 0d                	test   al,0xd
  50a879:	0f 85 9f 06 00 00    	jne    0x50af1e
  50a87f:	8b 8d 94 00 00 00    	mov    ecx,DWORD PTR [ebp+0x94]
  50a885:	eb 1d                	jmp    0x50a8a4
  50a887:	8b 55 6c             	mov    edx,DWORD PTR [ebp+0x6c]
  50a88a:	d9 02                	fld    DWORD PTR [edx]
  50a88c:	d8 25 18 b7 54 00    	fsub   DWORD PTR ds:0x54b718
  50a892:	d8 0e                	fmul   DWORD PTR [esi]
  50a894:	df e0                	fnstsw ax
  50a896:	a8 0d                	test   al,0xd
  50a898:	0f 85 80 06 00 00    	jne    0x50af1e
  50a89e:	8b 8d 98 00 00 00    	mov    ecx,DWORD PTR [ebp+0x98]
  50a8a4:	d9 19                	fstp   DWORD PTR [ecx]
  50a8a6:	8b 55 48             	mov    edx,DWORD PTR [ebp+0x48]
  50a8a9:	0f bf 02             	movsx  eax,WORD PTR [edx]
  50a8ac:	89 85 50 fe ff ff    	mov    DWORD PTR [ebp-0x1b0],eax
  50a8b2:	db 85 50 fe ff ff    	fild   DWORD PTR [ebp-0x1b0]
  50a8b8:	dd 9d 48 fe ff ff    	fstp   QWORD PTR [ebp-0x1b8]
  50a8be:	8b 85 48 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1b8]
  50a8c4:	85 c0                	test   eax,eax
  50a8c6:	75 0c                	jne    0x50a8d4
  50a8c8:	81 bd 4c fe ff ff 00 	cmp    DWORD PTR [ebp-0x1b4],0x3ff00000
  50a8cf:	00 f0 3f 
  50a8d2:	74 07                	je     0x50a8db
  50a8d4:	b8 01 00 00 00       	mov    eax,0x1
  50a8d9:	eb 02                	jmp    0x50a8dd
  50a8db:	33 c0                	xor    eax,eax
  50a8dd:	33 c9                	xor    ecx,ecx
  50a8df:	8b 55 44             	mov    edx,DWORD PTR [ebp+0x44]
  50a8e2:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  50a8e6:	0f 95 c1             	setne  cl
  50a8e9:	85 c8                	test   eax,ecx
  50a8eb:	0f 85 40 03 00 00    	jne    0x50ac31
  50a8f1:	a1 2c b7 54 00       	mov    eax,ds:0x54b72c
  50a8f6:	a3 18 b7 54 00       	mov    ds:0x54b718,eax
  50a8fb:	8b 4d 68             	mov    ecx,DWORD PTR [ebp+0x68]
  50a8fe:	d9 01                	fld    DWORD PTR [ecx]
  50a900:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
  50a903:	d8 22                	fsub   DWORD PTR [edx]
  50a905:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  50a908:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50a90f:	75 04                	jne    0x50a915
  50a911:	d8 30                	fdiv   DWORD PTR [eax]
  50a913:	eb 07                	jmp    0x50a91c
  50a915:	ff 30                	push   DWORD PTR [eax]
  50a917:	e8 0c 9e ef ff       	call   0x404728
  50a91c:	8b 8d a4 00 00 00    	mov    ecx,DWORD PTR [ebp+0xa4]
  50a922:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50a929:	75 04                	jne    0x50a92f
  50a92b:	d8 31                	fdiv   DWORD PTR [ecx]
  50a92d:	eb 07                	jmp    0x50a936
  50a92f:	ff 31                	push   DWORD PTR [ecx]
  50a931:	e8 f2 9d ef ff       	call   0x404728
  50a936:	df e0                	fnstsw ax
  50a938:	a8 0d                	test   al,0xd
  50a93a:	0f 85 de 05 00 00    	jne    0x50af1e
  50a940:	8b 55 64             	mov    edx,DWORD PTR [ebp+0x64]
  50a943:	d9 02                	fld    DWORD PTR [edx]
  50a945:	8b 45 24             	mov    eax,DWORD PTR [ebp+0x24]
  50a948:	d8 20                	fsub   DWORD PTR [eax]
  50a94a:	df e0                	fnstsw ax
  50a94c:	a8 0d                	test   al,0xd
  50a94e:	0f 85 ca 05 00 00    	jne    0x50af1e
  50a954:	dc 0d b8 34 40 00    	fmul   QWORD PTR ds:0x4034b8
  50a95a:	de c1                	faddp  st(1),st
  50a95c:	d9 5d c8             	fstp   DWORD PTR [ebp-0x38]
  50a95f:	df e0                	fnstsw ax
  50a961:	a8 0d                	test   al,0xd
  50a963:	0f 85 b5 05 00 00    	jne    0x50af1e
  50a969:	8b 55 5c             	mov    edx,DWORD PTR [ebp+0x5c]
  50a96c:	d9 02                	fld    DWORD PTR [edx]
  50a96e:	d8 09                	fmul   DWORD PTR [ecx]
  50a970:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  50a973:	df e0                	fnstsw ax
  50a975:	a8 0d                	test   al,0xd
  50a977:	0f 85 a1 05 00 00    	jne    0x50af1e
  50a97d:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a982:	8b 08                	mov    ecx,DWORD PTR [eax]
  50a984:	50                   	push   eax
  50a985:	ff 91 ac 05 00 00    	call   DWORD PTR [ecx+0x5ac]
  50a98b:	50                   	push   eax
  50a98c:	8d 55 c0             	lea    edx,[ebp-0x40]
  50a98f:	52                   	push   edx
  50a990:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a996:	8b f0                	mov    esi,eax
  50a998:	8b 06                	mov    eax,DWORD PTR [esi]
  50a99a:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50a99d:	51                   	push   ecx
  50a99e:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50a9a4:	66 8b 0a             	mov    cx,WORD PTR [edx]
  50a9a7:	66 83 c1 02          	add    cx,0x2
  50a9ab:	0f 80 72 05 00 00    	jo     0x50af23
  50a9b1:	51                   	push   ecx
  50a9b2:	56                   	push   esi
  50a9b3:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50a9b6:	db e2                	fnclex
  50a9b8:	85 c0                	test   eax,eax
  50a9ba:	7d 0f                	jge    0x50a9cb
  50a9bc:	6a 40                	push   0x40
  50a9be:	68 68 c9 41 00       	push   0x41c968
  50a9c3:	56                   	push   esi
  50a9c4:	50                   	push   eax
  50a9c5:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50a9cb:	6a 00                	push   0x0
  50a9cd:	68 09 00 03 68       	push   0x68030009
  50a9d2:	8b 55 bc             	mov    edx,DWORD PTR [ebp-0x44]
  50a9d5:	52                   	push   edx
  50a9d6:	8d 45 9c             	lea    eax,[ebp-0x64]
  50a9d9:	50                   	push   eax
  50a9da:	ff d3                	call   ebx
  50a9dc:	83 c4 10             	add    esp,0x10
  50a9df:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50a9e4:	8b 08                	mov    ecx,DWORD PTR [eax]
  50a9e6:	50                   	push   eax
  50a9e7:	ff 91 ac 05 00 00    	call   DWORD PTR [ecx+0x5ac]
  50a9ed:	50                   	push   eax
  50a9ee:	8d 55 b8             	lea    edx,[ebp-0x48]
  50a9f1:	52                   	push   edx
  50a9f2:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50a9f8:	8b f0                	mov    esi,eax
  50a9fa:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  50aa00:	8b 06                	mov    eax,DWORD PTR [esi]
  50aa02:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  50aa05:	51                   	push   ecx
  50aa06:	8b 95 9c 00 00 00    	mov    edx,DWORD PTR [ebp+0x9c]
  50aa0c:	66 8b 0a             	mov    cx,WORD PTR [edx]
  50aa0f:	66 83 c1 02          	add    cx,0x2
  50aa13:	0f 80 0a 05 00 00    	jo     0x50af23
  50aa19:	51                   	push   ecx
  50aa1a:	56                   	push   esi
  50aa1b:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50aa1e:	db e2                	fnclex
  50aa20:	85 c0                	test   eax,eax
  50aa22:	7d 0f                	jge    0x50aa33
  50aa24:	6a 40                	push   0x40
  50aa26:	68 68 c9 41 00       	push   0x41c968
  50aa2b:	56                   	push   esi
  50aa2c:	50                   	push   eax
  50aa2d:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50aa33:	6a 00                	push   0x0
  50aa35:	68 09 00 03 68       	push   0x68030009
  50aa3a:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  50aa3d:	52                   	push   edx
  50aa3e:	8d 45 8c             	lea    eax,[ebp-0x74]
  50aa41:	50                   	push   eax
  50aa42:	ff d3                	call   ebx
  50aa44:	83 c4 10             	add    esp,0x10
  50aa47:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50aa4c:	8b 08                	mov    ecx,DWORD PTR [eax]
  50aa4e:	50                   	push   eax
  50aa4f:	ff 91 ac 05 00 00    	call   DWORD PTR [ecx+0x5ac]
  50aa55:	50                   	push   eax
  50aa56:	8d 55 b0             	lea    edx,[ebp-0x50]
  50aa59:	52                   	push   edx
  50aa5a:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50aa60:	8b f0                	mov    esi,eax
  50aa62:	8b 06                	mov    eax,DWORD PTR [esi]
  50aa64:	8d 4d ac             	lea    ecx,[ebp-0x54]
  50aa67:	51                   	push   ecx
  50aa68:	66 ba 03 00          	mov    dx,0x3
  50aa6c:	8b 8d 9c 00 00 00    	mov    ecx,DWORD PTR [ebp+0x9c]
  50aa72:	66 2b 11             	sub    dx,WORD PTR [ecx]
  50aa75:	0f 80 a8 04 00 00    	jo     0x50af23
  50aa7b:	52                   	push   edx
  50aa7c:	56                   	push   esi
  50aa7d:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50aa80:	db e2                	fnclex
  50aa82:	85 c0                	test   eax,eax
  50aa84:	7d 0f                	jge    0x50aa95
  50aa86:	6a 40                	push   0x40
  50aa88:	68 68 c9 41 00       	push   0x41c968
  50aa8d:	56                   	push   esi
  50aa8e:	50                   	push   eax
  50aa8f:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50aa95:	6a 00                	push   0x0
  50aa97:	68 09 00 03 68       	push   0x68030009
  50aa9c:	8b 55 ac             	mov    edx,DWORD PTR [ebp-0x54]
  50aa9f:	52                   	push   edx
  50aaa0:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  50aaa6:	50                   	push   eax
  50aaa7:	ff d3                	call   ebx
  50aaa9:	83 c4 10             	add    esp,0x10
  50aaac:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50aaaf:	51                   	push   ecx
  50aab0:	ff d7                	call   edi
  50aab2:	0f bf d0             	movsx  edx,ax
  50aab5:	89 95 44 fe ff ff    	mov    DWORD PTR [ebp-0x1bc],edx
  50aabb:	db 85 44 fe ff ff    	fild   DWORD PTR [ebp-0x1bc]
  50aac1:	d9 9d 40 fe ff ff    	fstp   DWORD PTR [ebp-0x1c0]
  50aac7:	d9 45 c8             	fld    DWORD PTR [ebp-0x38]
  50aaca:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  50aacd:	d8 08                	fmul   DWORD PTR [eax]
  50aacf:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50aad6:	75 08                	jne    0x50aae0
  50aad8:	d8 35 94 2f 40 00    	fdiv   DWORD PTR ds:0x402f94
  50aade:	eb 0b                	jmp    0x50aaeb
  50aae0:	ff 35 94 2f 40 00    	push   DWORD PTR ds:0x402f94
  50aae6:	e8 3d 9c ef ff       	call   0x404728
  50aaeb:	d9 45 c8             	fld    DWORD PTR [ebp-0x38]
  50aaee:	8b 9d 88 00 00 00    	mov    ebx,DWORD PTR [ebp+0x88]
  50aaf4:	d8 23                	fsub   DWORD PTR [ebx]
  50aaf6:	de c1                	faddp  st(1),st
  50aaf8:	d8 0d 84 b1 54 00    	fmul   DWORD PTR ds:0x54b184
  50aafe:	8b 4d 5c             	mov    ecx,DWORD PTR [ebp+0x5c]
  50ab01:	d8 09                	fmul   DWORD PTR [ecx]
  50ab03:	8b b5 a4 00 00 00    	mov    esi,DWORD PTR [ebp+0xa4]
  50ab09:	d8 0e                	fmul   DWORD PTR [esi]
  50ab0b:	d8 8d 40 fe ff ff    	fmul   DWORD PTR [ebp-0x1c0]
  50ab11:	df e0                	fnstsw ax
  50ab13:	a8 0d                	test   al,0xd
  50ab15:	0f 85 03 04 00 00    	jne    0x50af1e
  50ab1b:	dd 9d 38 fe ff ff    	fstp   QWORD PTR [ebp-0x1c8]
  50ab21:	8d 95 7c ff ff ff    	lea    edx,[ebp-0x84]
  50ab27:	52                   	push   edx
  50ab28:	ff d7                	call   edi
  50ab2a:	0f bf c0             	movsx  eax,ax
  50ab2d:	89 85 34 fe ff ff    	mov    DWORD PTR [ebp-0x1cc],eax
  50ab33:	db 85 34 fe ff ff    	fild   DWORD PTR [ebp-0x1cc]
  50ab39:	d9 9d 30 fe ff ff    	fstp   DWORD PTR [ebp-0x1d0]
  50ab3f:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50ab45:	d8 26                	fsub   DWORD PTR [esi]
  50ab47:	d8 8d 30 fe ff ff    	fmul   DWORD PTR [ebp-0x1d0]
  50ab4d:	df e0                	fnstsw ax
  50ab4f:	a8 0d                	test   al,0xd
  50ab51:	0f 85 c7 03 00 00    	jne    0x50af1e
  50ab57:	d9 9d 2c fe ff ff    	fstp   DWORD PTR [ebp-0x1d4]
  50ab5d:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  50ab60:	51                   	push   ecx
  50ab61:	ff d7                	call   edi
  50ab63:	0f bf d0             	movsx  edx,ax
  50ab66:	89 95 28 fe ff ff    	mov    DWORD PTR [ebp-0x1d8],edx
  50ab6c:	db 85 28 fe ff ff    	fild   DWORD PTR [ebp-0x1d8]
  50ab72:	d9 9d 24 fe ff ff    	fstp   DWORD PTR [ebp-0x1dc]
  50ab78:	d9 85 24 fe ff ff    	fld    DWORD PTR [ebp-0x1dc]
  50ab7e:	d8 0e                	fmul   DWORD PTR [esi]
  50ab80:	d8 85 2c fe ff ff    	fadd   DWORD PTR [ebp-0x1d4]
  50ab86:	df e0                	fnstsw ax
  50ab88:	a8 0d                	test   al,0xd
  50ab8a:	0f 85 8e 03 00 00    	jne    0x50af1e
  50ab90:	dc 05 a0 34 40 00    	fadd   QWORD PTR ds:0x4034a0
  50ab96:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50ab9d:	75 08                	jne    0x50aba7
  50ab9f:	dc bd 38 fe ff ff    	fdivr  QWORD PTR [ebp-0x1c8]
  50aba5:	eb 11                	jmp    0x50abb8
  50aba7:	ff b5 3c fe ff ff    	push   DWORD PTR [ebp-0x1c4]
  50abad:	ff b5 38 fe ff ff    	push   DWORD PTR [ebp-0x1c8]
  50abb3:	e8 9a 9b ef ff       	call   0x404752
  50abb8:	8b 75 20             	mov    esi,DWORD PTR [ebp+0x20]
  50abbb:	d8 06                	fadd   DWORD PTR [esi]
  50abbd:	d9 1e                	fstp   DWORD PTR [esi]
  50abbf:	df e0                	fnstsw ax
  50abc1:	a8 0d                	test   al,0xd
  50abc3:	0f 85 55 03 00 00    	jne    0x50af1e
  50abc9:	8d 45 ac             	lea    eax,[ebp-0x54]
  50abcc:	50                   	push   eax
  50abcd:	8d 4d b0             	lea    ecx,[ebp-0x50]
  50abd0:	51                   	push   ecx
  50abd1:	8d 55 b4             	lea    edx,[ebp-0x4c]
  50abd4:	52                   	push   edx
  50abd5:	8d 45 b8             	lea    eax,[ebp-0x48]
  50abd8:	50                   	push   eax
  50abd9:	8d 4d bc             	lea    ecx,[ebp-0x44]
  50abdc:	51                   	push   ecx
  50abdd:	8d 55 c0             	lea    edx,[ebp-0x40]
  50abe0:	52                   	push   edx
  50abe1:	6a 06                	push   0x6
  50abe3:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50abe9:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  50abef:	50                   	push   eax
  50abf0:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  50abf3:	51                   	push   ecx
  50abf4:	8d 55 9c             	lea    edx,[ebp-0x64]
  50abf7:	52                   	push   edx
  50abf8:	6a 03                	push   0x3
  50abfa:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50ac00:	83 c4 2c             	add    esp,0x2c
  50ac03:	d9 06                	fld    DWORD PTR [esi]
  50ac05:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50ac0b:	df e0                	fnstsw ax
  50ac0d:	f6 c4 01             	test   ah,0x1
  50ac10:	74 06                	je     0x50ac18
  50ac12:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
  50ac18:	d9 06                	fld    DWORD PTR [esi]
  50ac1a:	d8 5d dc             	fcomp  DWORD PTR [ebp-0x24]
  50ac1d:	df e0                	fnstsw ax
  50ac1f:	f6 c4 41             	test   ah,0x41
  50ac22:	75 05                	jne    0x50ac29
  50ac24:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  50ac27:	89 06                	mov    DWORD PTR [esi],eax
  50ac29:	8b 4d c8             	mov    ecx,DWORD PTR [ebp-0x38]
  50ac2c:	89 0b                	mov    DWORD PTR [ebx],ecx
  50ac2e:	8b 75 68             	mov    esi,DWORD PTR [ebp+0x68]
  50ac31:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
  50ac34:	d9 02                	fld    DWORD PTR [edx]
  50ac36:	8b 4d 50             	mov    ecx,DWORD PTR [ebp+0x50]
  50ac39:	d8 01                	fadd   DWORD PTR [ecx]
  50ac3b:	d9 5d d4             	fstp   DWORD PTR [ebp-0x2c]
  50ac3e:	df e0                	fnstsw ax
  50ac40:	a8 0d                	test   al,0xd
  50ac42:	0f 85 d6 02 00 00    	jne    0x50af1e
  50ac48:	d9 05 34 b7 54 00    	fld    DWORD PTR ds:0x54b734
  50ac4e:	d8 09                	fmul   DWORD PTR [ecx]
  50ac50:	d9 05 18 b7 54 00    	fld    DWORD PTR ds:0x54b718
  50ac56:	d8 0a                	fmul   DWORD PTR [edx]
  50ac58:	de c1                	faddp  st(1),st
  50ac5a:	df e0                	fnstsw ax
  50ac5c:	a8 0d                	test   al,0xd
  50ac5e:	0f 85 ba 02 00 00    	jne    0x50af1e
  50ac64:	d9 45 d4             	fld    DWORD PTR [ebp-0x2c]
  50ac67:	dc 05 98 34 40 00    	fadd   QWORD PTR ds:0x403498
  50ac6d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50ac74:	75 04                	jne    0x50ac7a
  50ac76:	de f9                	fdivp  st(1),st
  50ac78:	eb 09                	jmp    0x50ac83
  50ac7a:	50                   	push   eax
  50ac7b:	b0 0d                	mov    al,0xd
  50ac7d:	e8 b8 9a ef ff       	call   0x40473a
  50ac82:	58                   	pop    eax
  50ac83:	d9 5d e0             	fstp   DWORD PTR [ebp-0x20]
  50ac86:	df e0                	fnstsw ax
  50ac88:	a8 0d                	test   al,0xd
  50ac8a:	0f 85 8e 02 00 00    	jne    0x50af1e
  50ac90:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  50ac93:	d9 01                	fld    DWORD PTR [ecx]
  50ac95:	d8 1d 44 b5 54 00    	fcomp  DWORD PTR ds:0x54b544
  50ac9b:	df e0                	fnstsw ax
  50ac9d:	f6 c4 01             	test   ah,0x1
  50aca0:	74 0e                	je     0x50acb0
  50aca2:	8b 15 44 b5 54 00    	mov    edx,DWORD PTR ds:0x54b544
  50aca8:	89 11                	mov    DWORD PTR [ecx],edx
  50acaa:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
  50acb0:	8b 85 9c 00 00 00    	mov    eax,DWORD PTR [ebp+0x9c]
  50acb6:	66 83 38 00          	cmp    WORD PTR [eax],0x0
  50acba:	75 49                	jne    0x50ad05
  50acbc:	8b 8d 80 00 00 00    	mov    ecx,DWORD PTR [ebp+0x80]
  50acc2:	d9 01                	fld    DWORD PTR [ecx]
  50acc4:	8b 95 a4 00 00 00    	mov    edx,DWORD PTR [ebp+0xa4]
  50acca:	d8 0a                	fmul   DWORD PTR [edx]
  50accc:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  50acd2:	df e0                	fnstsw ax
  50acd4:	a8 0d                	test   al,0xd
  50acd6:	0f 85 42 02 00 00    	jne    0x50af1e
  50acdc:	8d 85 54 ff ff ff    	lea    eax,[ebp-0xac]
  50ace2:	50                   	push   eax
  50ace3:	8b 8d 94 00 00 00    	mov    ecx,DWORD PTR [ebp+0x94]
  50ace9:	51                   	push   ecx
  50acea:	56                   	push   esi
  50aceb:	8d 55 e0             	lea    edx,[ebp-0x20]
  50acee:	52                   	push   edx
  50acef:	8d 45 d4             	lea    eax,[ebp-0x2c]
  50acf2:	50                   	push   eax
  50acf3:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  50acf6:	51                   	push   ecx
  50acf7:	8b 55 60             	mov    edx,DWORD PTR [ebp+0x60]
  50acfa:	52                   	push   edx
  50acfb:	8b 45 70             	mov    eax,DWORD PTR [ebp+0x70]
  50acfe:	50                   	push   eax
  50acff:	8b 4d 74             	mov    ecx,DWORD PTR [ebp+0x74]
  50ad02:	51                   	push   ecx
  50ad03:	eb 47                	jmp    0x50ad4c
  50ad05:	8b 95 80 00 00 00    	mov    edx,DWORD PTR [ebp+0x80]
  50ad0b:	d9 02                	fld    DWORD PTR [edx]
  50ad0d:	8b 85 a4 00 00 00    	mov    eax,DWORD PTR [ebp+0xa4]
  50ad13:	d8 08                	fmul   DWORD PTR [eax]
  50ad15:	d9 9d 54 ff ff ff    	fstp   DWORD PTR [ebp-0xac]
  50ad1b:	df e0                	fnstsw ax
  50ad1d:	a8 0d                	test   al,0xd
  50ad1f:	0f 85 f9 01 00 00    	jne    0x50af1e
  50ad25:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  50ad2b:	51                   	push   ecx
  50ad2c:	8b 95 98 00 00 00    	mov    edx,DWORD PTR [ebp+0x98]
  50ad32:	52                   	push   edx
  50ad33:	56                   	push   esi
  50ad34:	8d 45 e0             	lea    eax,[ebp-0x20]
  50ad37:	50                   	push   eax
  50ad38:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  50ad3b:	51                   	push   ecx
  50ad3c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  50ad3f:	52                   	push   edx
  50ad40:	8b 45 60             	mov    eax,DWORD PTR [ebp+0x60]
  50ad43:	50                   	push   eax
  50ad44:	8b 4d 70             	mov    ecx,DWORD PTR [ebp+0x70]
  50ad47:	51                   	push   ecx
  50ad48:	8b 55 74             	mov    edx,DWORD PTR [ebp+0x74]
  50ad4b:	52                   	push   edx
  50ad4c:	e8 0f 71 ff ff       	call   0x501e60
  50ad51:	d9 45 d4             	fld    DWORD PTR [ebp-0x2c]
  50ad54:	d8 26                	fsub   DWORD PTR [esi]
  50ad56:	8b 4d 58             	mov    ecx,DWORD PTR [ebp+0x58]
  50ad59:	d9 19                	fstp   DWORD PTR [ecx]
  50ad5b:	df e0                	fnstsw ax
  50ad5d:	a8 0d                	test   al,0xd
  50ad5f:	0f 85 b9 01 00 00    	jne    0x50af1e
  50ad65:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  50ad6b:	50                   	push   eax
  50ad6c:	8d 55 c0             	lea    edx,[ebp-0x40]
  50ad6f:	52                   	push   edx
  50ad70:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50ad76:	8b f0                	mov    esi,eax
  50ad78:	8b 06                	mov    eax,DWORD PTR [esi]
  50ad7a:	8d 8d 54 ff ff ff    	lea    ecx,[ebp-0xac]
  50ad80:	51                   	push   ecx
  50ad81:	56                   	push   esi
  50ad82:	ff 50 1c             	call   DWORD PTR [eax+0x1c]
  50ad85:	db e2                	fnclex
  50ad87:	85 c0                	test   eax,eax
  50ad89:	7d 0f                	jge    0x50ad9a
  50ad8b:	6a 1c                	push   0x1c
  50ad8d:	68 d0 b0 41 00       	push   0x41b0d0
  50ad92:	56                   	push   esi
  50ad93:	50                   	push   eax
  50ad94:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50ad9a:	33 d2                	xor    edx,edx
  50ad9c:	8b b5 54 ff ff ff    	mov    esi,DWORD PTR [ebp-0xac]
  50ada2:	85 f6                	test   esi,esi
  50ada4:	0f 9f c2             	setg   dl
  50ada7:	f7 da                	neg    edx
  50ada9:	8b f2                	mov    esi,edx
  50adab:	89 b5 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],esi
  50adb1:	8d 4d c0             	lea    ecx,[ebp-0x40]
  50adb4:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  50adba:	66 85 f6             	test   si,si
  50adbd:	0f 84 f6 00 00 00    	je     0x50aeb9
  50adc3:	ba 74 42 42 00       	mov    edx,0x424274
  50adc8:	b9 48 b6 54 00       	mov    ecx,0x54b648
  50adcd:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  50add3:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  50add8:	85 c0                	test   eax,eax
  50adda:	75 10                	jne    0x50adec
  50addc:	68 10 b0 54 00       	push   0x54b010
  50ade1:	68 8c 7e 40 00       	push   0x407e8c
  50ade6:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  50adec:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  50adf2:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50adf7:	89 85 64 ff ff ff    	mov    DWORD PTR [ebp-0x9c],eax
  50adfd:	b9 09 00 00 00       	mov    ecx,0x9
  50ae02:	89 8d 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],ecx
  50ae08:	ba 01 00 00 00       	mov    edx,0x1
  50ae0d:	89 95 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],edx
  50ae13:	c7 85 6c ff ff ff 03 	mov    DWORD PTR [ebp-0x94],0x3
  50ae1a:	00 00 00 
  50ae1d:	8b 3e                	mov    edi,DWORD PTR [esi]
  50ae1f:	83 ec 10             	sub    esp,0x10
  50ae22:	8b dc                	mov    ebx,esp
  50ae24:	89 0b                	mov    DWORD PTR [ebx],ecx
  50ae26:	8b 8d 60 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xa0]
  50ae2c:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  50ae2f:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  50ae32:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [ebp-0x98]
  50ae38:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  50ae3b:	83 ec 10             	sub    esp,0x10
  50ae3e:	8b cc                	mov    ecx,esp
  50ae40:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [ebp-0x94]
  50ae46:	89 01                	mov    DWORD PTR [ecx],eax
  50ae48:	8b 85 70 ff ff ff    	mov    eax,DWORD PTR [ebp-0x90]
  50ae4e:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  50ae51:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  50ae54:	8b 95 78 ff ff ff    	mov    edx,DWORD PTR [ebp-0x88]
  50ae5a:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  50ae5d:	56                   	push   esi
  50ae5e:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  50ae64:	db e2                	fnclex
  50ae66:	85 c0                	test   eax,eax
  50ae68:	7d 12                	jge    0x50ae7c
  50ae6a:	68 b0 02 00 00       	push   0x2b0
  50ae6f:	68 d8 ae 41 00       	push   0x41aed8
  50ae74:	56                   	push   esi
  50ae75:	50                   	push   eax
  50ae76:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50ae7c:	c7 85 58 ff ff ff 00 	mov    DWORD PTR [ebp-0xa8],0x0
  50ae83:	00 00 00 
  50ae86:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50ae8b:	8b 08                	mov    ecx,DWORD PTR [eax]
  50ae8d:	8d 95 58 ff ff ff    	lea    edx,[ebp-0xa8]
  50ae93:	52                   	push   edx
  50ae94:	50                   	push   eax
  50ae95:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  50ae9b:	db e2                	fnclex
  50ae9d:	85 c0                	test   eax,eax
  50ae9f:	7d 18                	jge    0x50aeb9
  50aea1:	68 fc 06 00 00       	push   0x6fc
  50aea6:	68 34 e4 41 00       	push   0x41e434
  50aeab:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  50aeb1:	51                   	push   ecx
  50aeb2:	50                   	push   eax
  50aeb3:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50aeb9:	6a 00                	push   0x0
  50aebb:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  50aec1:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  50aec7:	9b                   	fwait
  50aec8:	68 0b af 50 00       	push   0x50af0b
  50aecd:	eb 3b                	jmp    0x50af0a
  50aecf:	8d 55 ac             	lea    edx,[ebp-0x54]
  50aed2:	52                   	push   edx
  50aed3:	8d 45 b0             	lea    eax,[ebp-0x50]
  50aed6:	50                   	push   eax
  50aed7:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  50aeda:	51                   	push   ecx
  50aedb:	8d 55 b8             	lea    edx,[ebp-0x48]
  50aede:	52                   	push   edx
  50aedf:	8d 45 bc             	lea    eax,[ebp-0x44]
  50aee2:	50                   	push   eax
  50aee3:	8d 4d c0             	lea    ecx,[ebp-0x40]
  50aee6:	51                   	push   ecx
  50aee7:	6a 06                	push   0x6
  50aee9:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50aeef:	8d 95 7c ff ff ff    	lea    edx,[ebp-0x84]
  50aef5:	52                   	push   edx
  50aef6:	8d 45 8c             	lea    eax,[ebp-0x74]
  50aef9:	50                   	push   eax
  50aefa:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50aefd:	51                   	push   ecx
  50aefe:	6a 03                	push   0x3
  50af00:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50af06:	83 c4 2c             	add    esp,0x2c
  50af09:	c3                   	ret
  50af0a:	c3                   	ret
  50af0b:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  50af0e:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  50af15:	5f                   	pop    edi
  50af16:	5e                   	pop    esi
  50af17:	5b                   	pop    ebx
  50af18:	8b e5                	mov    esp,ebp
  50af1a:	5d                   	pop    ebp
  50af1b:	c2 a8 00             	ret    0xa8
  50af1e:	e9 f9 97 ef ff       	jmp    0x40471c
  50af23:	ff 15 b0 11 40 00    	call   DWORD PTR ds:0x4011b0
  50af29:	90                   	nop
  50af2a:	90                   	nop
  50af2b:	90                   	nop
  50af2c:	90                   	nop
  50af2d:	90                   	nop
  50af2e:	90                   	nop
  50af2f:	90                   	nop
