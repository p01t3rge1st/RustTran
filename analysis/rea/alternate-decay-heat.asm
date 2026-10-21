
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0052cbc0 <.text+0x12bbc0>:
  52cbc0:	55                   	push   ebp
  52cbc1:	8b ec                	mov    ebp,esp
  52cbc3:	83 ec 14             	sub    esp,0x14
  52cbc6:	68 16 47 40 00       	push   0x404716
  52cbcb:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  52cbd1:	50                   	push   eax
  52cbd2:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  52cbd9:	81 ec e4 00 00 00    	sub    esp,0xe4
  52cbdf:	53                   	push   ebx
  52cbe0:	56                   	push   esi
  52cbe1:	57                   	push   edi
  52cbe2:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  52cbe5:	c7 45 f0 c0 3c 40 00 	mov    DWORD PTR [ebp-0x10],0x403cc0
  52cbec:	33 db                	xor    ebx,ebx
  52cbee:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  52cbf1:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
  52cbf4:	89 5d dc             	mov    DWORD PTR [ebp-0x24],ebx
  52cbf7:	89 5d e0             	mov    DWORD PTR [ebp-0x20],ebx
  52cbfa:	89 9d 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],ebx
  52cc00:	89 9d 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],ebx
  52cc06:	89 9d 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],ebx
  52cc0c:	89 9d 54 ff ff ff    	mov    DWORD PTR [ebp-0xac],ebx
  52cc12:	89 9d 50 ff ff ff    	mov    DWORD PTR [ebp-0xb0],ebx
  52cc18:	89 9d 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],ebx
  52cc1e:	6a 05                	push   0x5
  52cc20:	68 10 4d 42 00       	push   0x424d10
  52cc25:	8d 45 ac             	lea    eax,[ebp-0x54]
  52cc28:	50                   	push   eax
  52cc29:	8b 35 f8 10 40 00    	mov    esi,DWORD PTR ds:0x4010f8
  52cc2f:	ff d6                	call   esi
  52cc31:	6a 05                	push   0x5
  52cc33:	68 10 4d 42 00       	push   0x424d10
  52cc38:	8d 4d 90             	lea    ecx,[ebp-0x70]
  52cc3b:	51                   	push   ecx
  52cc3c:	ff d6                	call   esi
  52cc3e:	6a 01                	push   0x1
  52cc40:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  52cc46:	b8 66 66 66 66       	mov    eax,0x66666666
  52cc4b:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  52cc51:	c7 45 80 66 66 ee 3f 	mov    DWORD PTR [ebp-0x80],0x3fee6666
  52cc58:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52cc5b:	c7 02 89 41 60 e5    	mov    DWORD PTR [edx],0xe5604189
  52cc61:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
  52cc64:	c7 41 04 d0 22 e3 3f 	mov    DWORD PTR [ecx+0x4],0x3fe322d0
  52cc6b:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52cc6e:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  52cc71:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  52cc74:	c7 40 0c 66 66 fa 3f 	mov    DWORD PTR [eax+0xc],0x3ffa6666
  52cc7b:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
  52cc7e:	c7 41 10 cd cc cc cc 	mov    DWORD PTR [ecx+0x10],0xcccccccd
  52cc85:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52cc88:	c7 42 14 cc cc 08 40 	mov    DWORD PTR [edx+0x14],0x4008cccc
  52cc8f:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  52cc92:	c7 40 18 f6 28 5c 8f 	mov    DWORD PTR [eax+0x18],0x8f5c28f6
  52cc99:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
  52cc9c:	c7 41 1c c2 f5 0e 40 	mov    DWORD PTR [ecx+0x1c],0x400ef5c2
  52cca3:	b8 a4 70 3d 0a       	mov    eax,0xa3d70a4
  52cca8:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52ccab:	89 42 20             	mov    DWORD PTR [edx+0x20],eax
  52ccae:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
  52ccb1:	c7 41 24 d7 a3 02 40 	mov    DWORD PTR [ecx+0x24],0x4002a3d7
  52ccb8:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52ccbb:	89 42 28             	mov    DWORD PTR [edx+0x28],eax
  52ccbe:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  52ccc1:	c7 40 2c d7 a3 f4 3f 	mov    DWORD PTR [eax+0x2c],0x3ff4a3d7
  52ccc8:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
  52cccb:	c7 41 30 c5 20 b0 72 	mov    DWORD PTR [ecx+0x30],0x72b020c5
  52ccd2:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52ccd5:	c7 42 34 68 91 dd 3f 	mov    DWORD PTR [edx+0x34],0x3fdd9168
  52ccdc:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  52ccdf:	c7 40 38 cb a1 45 b6 	mov    DWORD PTR [eax+0x38],0xb645a1cb
  52cce6:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
  52cce9:	c7 41 3c f3 fd d4 3f 	mov    DWORD PTR [ecx+0x3c],0x3fd4fdf3
  52ccf0:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52ccf3:	c7 42 40 c3 f5 28 5c 	mov    DWORD PTR [edx+0x40],0x5c28f5c3
  52ccfa:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  52ccfd:	c7 40 44 8f c2 c5 3f 	mov    DWORD PTR [eax+0x44],0x3fc5c28f
  52cd04:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
  52cd07:	c7 41 48 be 9f 1a 2f 	mov    DWORD PTR [ecx+0x48],0x2f1a9fbe
  52cd0e:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52cd11:	c7 42 4c dd 24 b6 3f 	mov    DWORD PTR [edx+0x4c],0x3fb624dd
  52cd18:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  52cd1b:	c7 40 50 c9 76 be 9f 	mov    DWORD PTR [eax+0x50],0x9fbe76c9
  52cd22:	8b 4d 9c             	mov    ecx,DWORD PTR [ebp-0x64]
  52cd25:	c7 41 54 1a 2f bd 3f 	mov    DWORD PTR [ecx+0x54],0x3fbd2f1a
  52cd2c:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  52cd2f:	c7 02 27 31 08 ac    	mov    DWORD PTR [edx],0xac083127
  52cd35:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  52cd38:	c7 40 04 1c 5a fc 3f 	mov    DWORD PTR [eax+0x4],0x3ffc5a1c
  52cd3f:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  52cd42:	c7 41 08 99 bb 96 90 	mov    DWORD PTR [ecx+0x8],0x9096bb99
  52cd49:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  52cd4c:	c7 42 0c 0f 7a e2 3f 	mov    DWORD PTR [edx+0xc],0x3fe27a0f
  52cd53:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  52cd56:	c7 40 10 89 ef c4 ac 	mov    DWORD PTR [eax+0x10],0xacc4ef89
  52cd5d:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  52cd60:	c7 41 14 17 43 b1 3f 	mov    DWORD PTR [ecx+0x14],0x3fb14317
  52cd67:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  52cd6a:	c7 42 18 43 00 70 ec 	mov    DWORD PTR [edx+0x18],0xec700043
  52cd71:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  52cd74:	c7 40 1c d9 73 79 3f 	mov    DWORD PTR [eax+0x1c],0x3f7973d9
  52cd7b:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  52cd7e:	c7 41 20 0d 2e 67 00 	mov    DWORD PTR [ecx+0x20],0x672e0d
  52cd85:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  52cd88:	c7 42 24 b9 0e 3f 3f 	mov    DWORD PTR [edx+0x24],0x3f3f0eb9
  52cd8f:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  52cd92:	c7 40 28 ab 42 5e 6a 	mov    DWORD PTR [eax+0x28],0x6a5e42ab
  52cd99:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  52cd9c:	c7 41 2c df 37 09 3f 	mov    DWORD PTR [ecx+0x2c],0x3f0937df
  52cda3:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  52cda6:	c7 42 30 f6 ab e2 88 	mov    DWORD PTR [edx+0x30],0x88e2abf6
  52cdad:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  52cdb0:	c7 40 34 13 6a d6 3e 	mov    DWORD PTR [eax+0x34],0x3ed66a13
  52cdb7:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  52cdba:	c7 41 38 c2 28 60 b1 	mov    DWORD PTR [ecx+0x38],0xb16028c2
  52cdc1:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  52cdc4:	c7 42 3c 01 2e a3 3e 	mov    DWORD PTR [edx+0x3c],0x3ea32e01
  52cdcb:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  52cdce:	c7 40 40 f4 44 65 79 	mov    DWORD PTR [eax+0x40],0x796544f4
  52cdd5:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  52cdd8:	c7 41 44 56 cf 7b 3e 	mov    DWORD PTR [ecx+0x44],0x3e7bcf56
  52cddf:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  52cde2:	c7 42 48 33 44 e5 23 	mov    DWORD PTR [edx+0x48],0x23e54433
  52cde9:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  52cdec:	c7 40 4c a3 c5 5f 3e 	mov    DWORD PTR [eax+0x4c],0x3e5fc5a3
  52cdf3:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  52cdf6:	c7 41 50 02 45 9f 28 	mov    DWORD PTR [ecx+0x50],0x289f4502
  52cdfd:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  52ce00:	c7 42 54 d6 0f 0a 3e 	mov    DWORD PTR [edx+0x54],0x3e0a0fd6
  52ce07:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
  52ce0a:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  52ce0d:	89 9d 20 ff ff ff    	mov    DWORD PTR [ebp-0xe0],ebx
  52ce13:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [ebp-0xdc],0x40260000
  52ce1a:	00 26 40 
  52ce1d:	89 9d 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],ebx
  52ce23:	b9 00 00 f0 3f       	mov    ecx,0x3ff00000
  52ce28:	89 8d 2c ff ff ff    	mov    DWORD PTR [ebp-0xd4],ecx
  52ce2e:	89 5d 84             	mov    DWORD PTR [ebp-0x7c],ebx
  52ce31:	89 4d 88             	mov    DWORD PTR [ebp-0x78],ecx
  52ce34:	8b 3d 3c 12 40 00    	mov    edi,DWORD PTR ds:0x40123c
  52ce3a:	dd 45 84             	fld    QWORD PTR [ebp-0x7c]
  52ce3d:	dc 9d 20 ff ff ff    	fcomp  QWORD PTR [ebp-0xe0]
  52ce43:	df e0                	fnstsw ax
  52ce45:	f6 c4 41             	test   ah,0x41
  52ce48:	0f 84 8b 00 00 00    	je     0x52ced9
  52ce4e:	dd 45 84             	fld    QWORD PTR [ebp-0x7c]
  52ce51:	ff d7                	call   edi
  52ce53:	8b f0                	mov    esi,eax
  52ce55:	4e                   	dec    esi
  52ce56:	83 fe 0b             	cmp    esi,0xb
  52ce59:	72 06                	jb     0x52ce61
  52ce5b:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  52ce61:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  52ce64:	dd 04 f0             	fld    QWORD PTR [eax+esi*8]
  52ce67:	d9 e0                	fchs
  52ce69:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  52ce6c:	dc 09                	fmul   QWORD PTR [ecx]
  52ce6e:	df e0                	fnstsw ax
  52ce70:	a8 0d                	test   al,0xd
  52ce72:	0f 85 72 04 00 00    	jne    0x52d2ea
  52ce78:	83 ec 08             	sub    esp,0x8
  52ce7b:	dd 1c 24             	fstp   QWORD PTR [esp]
  52ce7e:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  52ce84:	dd 9d 44 ff ff ff    	fstp   QWORD PTR [ebp-0xbc]
  52ce8a:	dd 45 84             	fld    QWORD PTR [ebp-0x7c]
  52ce8d:	ff d7                	call   edi
  52ce8f:	8b f0                	mov    esi,eax
  52ce91:	4e                   	dec    esi
  52ce92:	83 fe 0b             	cmp    esi,0xb
  52ce95:	72 06                	jb     0x52ce9d
  52ce97:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  52ce9d:	dd 85 44 ff ff ff    	fld    QWORD PTR [ebp-0xbc]
  52cea3:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52cea6:	dc 0c f2             	fmul   QWORD PTR [edx+esi*8]
  52cea9:	dc 45 d4             	fadd   QWORD PTR [ebp-0x2c]
  52ceac:	dd 5d d4             	fstp   QWORD PTR [ebp-0x2c]
  52ceaf:	df e0                	fnstsw ax
  52ceb1:	a8 0d                	test   al,0xd
  52ceb3:	0f 85 31 04 00 00    	jne    0x52d2ea
  52ceb9:	dd 85 28 ff ff ff    	fld    QWORD PTR [ebp-0xd8]
  52cebf:	dc 45 84             	fadd   QWORD PTR [ebp-0x7c]
  52cec2:	dd 5d 84             	fstp   QWORD PTR [ebp-0x7c]
  52cec5:	df e0                	fnstsw ax
  52cec7:	a8 0d                	test   al,0xd
  52cec9:	0f 85 1b 04 00 00    	jne    0x52d2ea
  52cecf:	b9 00 00 f0 3f       	mov    ecx,0x3ff00000
  52ced4:	e9 61 ff ff ff       	jmp    0x52ce3a
  52ced9:	89 5d cc             	mov    DWORD PTR [ebp-0x34],ebx
  52cedc:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
  52cedf:	dd 05 20 3d 40 00    	fld    QWORD PTR ds:0x403d20
  52cee5:	dd 5d c4             	fstp   QWORD PTR [ebp-0x3c]
  52cee8:	df e0                	fnstsw ax
  52ceea:	a8 0d                	test   al,0xd
  52ceec:	0f 85 f8 03 00 00    	jne    0x52d2ea
  52cef2:	89 9d 10 ff ff ff    	mov    DWORD PTR [ebp-0xf0],ebx
  52cef8:	c7 85 14 ff ff ff 00 	mov    DWORD PTR [ebp-0xec],0x40260000
  52ceff:	00 26 40 
  52cf02:	89 9d 18 ff ff ff    	mov    DWORD PTR [ebp-0xe8],ebx
  52cf08:	89 8d 1c ff ff ff    	mov    DWORD PTR [ebp-0xe4],ecx
  52cf0e:	89 5d 84             	mov    DWORD PTR [ebp-0x7c],ebx
  52cf11:	89 4d 88             	mov    DWORD PTR [ebp-0x78],ecx
  52cf14:	dd 45 84             	fld    QWORD PTR [ebp-0x7c]
  52cf17:	dc 9d 10 ff ff ff    	fcomp  QWORD PTR [ebp-0xf0]
  52cf1d:	df e0                	fnstsw ax
  52cf1f:	f6 c4 41             	test   ah,0x41
  52cf22:	0f 84 8b 00 00 00    	je     0x52cfb3
  52cf28:	dd 45 84             	fld    QWORD PTR [ebp-0x7c]
  52cf2b:	ff d7                	call   edi
  52cf2d:	8b f0                	mov    esi,eax
  52cf2f:	4e                   	dec    esi
  52cf30:	83 fe 0b             	cmp    esi,0xb
  52cf33:	72 06                	jb     0x52cf3b
  52cf35:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  52cf3b:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  52cf3e:	dd 04 f0             	fld    QWORD PTR [eax+esi*8]
  52cf41:	d9 e0                	fchs
  52cf43:	dd 45 c4             	fld    QWORD PTR [ebp-0x3c]
  52cf46:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  52cf49:	dc 01                	fadd   QWORD PTR [ecx]
  52cf4b:	de c9                	fmulp  st(1),st
  52cf4d:	df e0                	fnstsw ax
  52cf4f:	a8 0d                	test   al,0xd
  52cf51:	0f 85 93 03 00 00    	jne    0x52d2ea
  52cf57:	83 ec 08             	sub    esp,0x8
  52cf5a:	dd 1c 24             	fstp   QWORD PTR [esp]
  52cf5d:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  52cf63:	dd 9d 44 ff ff ff    	fstp   QWORD PTR [ebp-0xbc]
  52cf69:	dd 45 84             	fld    QWORD PTR [ebp-0x7c]
  52cf6c:	ff d7                	call   edi
  52cf6e:	8b f0                	mov    esi,eax
  52cf70:	4e                   	dec    esi
  52cf71:	83 fe 0b             	cmp    esi,0xb
  52cf74:	72 06                	jb     0x52cf7c
  52cf76:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  52cf7c:	dd 85 44 ff ff ff    	fld    QWORD PTR [ebp-0xbc]
  52cf82:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  52cf85:	dc 0c f2             	fmul   QWORD PTR [edx+esi*8]
  52cf88:	dc 45 cc             	fadd   QWORD PTR [ebp-0x34]
  52cf8b:	dd 5d cc             	fstp   QWORD PTR [ebp-0x34]
  52cf8e:	df e0                	fnstsw ax
  52cf90:	a8 0d                	test   al,0xd
  52cf92:	0f 85 52 03 00 00    	jne    0x52d2ea
  52cf98:	dd 85 18 ff ff ff    	fld    QWORD PTR [ebp-0xe8]
  52cf9e:	dc 45 84             	fadd   QWORD PTR [ebp-0x7c]
  52cfa1:	dd 5d 84             	fstp   QWORD PTR [ebp-0x7c]
  52cfa4:	df e0                	fnstsw ax
  52cfa6:	a8 0d                	test   al,0xd
  52cfa8:	0f 85 3c 03 00 00    	jne    0x52d2ea
  52cfae:	e9 61 ff ff ff       	jmp    0x52cf14
  52cfb3:	dd 45 d4             	fld    QWORD PTR [ebp-0x2c]
  52cfb6:	dc 0d 18 3d 40 00    	fmul   QWORD PTR ds:0x403d18
  52cfbc:	dc 65 cc             	fsub   QWORD PTR [ebp-0x34]
  52cfbf:	dc 0d 10 3d 40 00    	fmul   QWORD PTR ds:0x403d10
  52cfc5:	dd 5d dc             	fstp   QWORD PTR [ebp-0x24]
  52cfc8:	df e0                	fnstsw ax
  52cfca:	a8 0d                	test   al,0xd
  52cfcc:	0f 85 18 03 00 00    	jne    0x52d2ea
  52cfd2:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  52cfd5:	dd 06                	fld    QWORD PTR [esi]
  52cfd7:	dc 1d 08 3d 40 00    	fcomp  QWORD PTR ds:0x403d08
  52cfdd:	df e0                	fnstsw ax
  52cfdf:	f6 c4 41             	test   ah,0x41
  52cfe2:	75 40                	jne    0x52d024
  52cfe4:	dd 06                	fld    QWORD PTR [esi]
  52cfe6:	dc 0d 00 3d 40 00    	fmul   QWORD PTR ds:0x403d00
  52cfec:	df e0                	fnstsw ax
  52cfee:	a8 0d                	test   al,0xd
  52cff0:	0f 85 f4 02 00 00    	jne    0x52d2ea
  52cff6:	83 ec 08             	sub    esp,0x8
  52cff9:	dd 1c 24             	fstp   QWORD PTR [esp]
  52cffc:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  52d002:	dd 9d 44 ff ff ff    	fstp   QWORD PTR [ebp-0xbc]
  52d008:	dd 85 44 ff ff ff    	fld    QWORD PTR [ebp-0xbc]
  52d00e:	dc 0d f8 3c 40 00    	fmul   QWORD PTR ds:0x403cf8
  52d014:	dc 45 dc             	fadd   QWORD PTR [ebp-0x24]
  52d017:	dd 5d dc             	fstp   QWORD PTR [ebp-0x24]
  52d01a:	df e0                	fnstsw ax
  52d01c:	a8 0d                	test   al,0xd
  52d01e:	0f 85 c6 02 00 00    	jne    0x52d2ea
  52d024:	dd 06                	fld    QWORD PTR [esi]
  52d026:	dc 1d f0 3c 40 00    	fcomp  QWORD PTR ds:0x403cf0
  52d02c:	df e0                	fnstsw ax
  52d02e:	f6 c4 01             	test   ah,0x1
  52d031:	74 07                	je     0x52d03a
  52d033:	b9 01 00 00 00       	mov    ecx,0x1
  52d038:	eb 02                	jmp    0x52d03c
  52d03a:	33 c9                	xor    ecx,ecx
  52d03c:	dd 06                	fld    QWORD PTR [esi]
  52d03e:	dc 1d 08 3d 40 00    	fcomp  QWORD PTR ds:0x403d08
  52d044:	df e0                	fnstsw ax
  52d046:	f6 c4 41             	test   ah,0x41
  52d049:	75 05                	jne    0x52d050
  52d04b:	bb 01 00 00 00       	mov    ebx,0x1
  52d050:	0b cb                	or     ecx,ebx
  52d052:	0f 85 92 00 00 00    	jne    0x52d0ea
  52d058:	dd 06                	fld    QWORD PTR [esi]
  52d05a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  52d061:	75 08                	jne    0x52d06b
  52d063:	dc 35 f0 3c 40 00    	fdiv   QWORD PTR ds:0x403cf0
  52d069:	eb 11                	jmp    0x52d07c
  52d06b:	ff 35 f4 3c 40 00    	push   DWORD PTR ds:0x403cf4
  52d071:	ff 35 f0 3c 40 00    	push   DWORD PTR ds:0x403cf0
  52d077:	e8 b8 76 ed ff       	call   0x404734
  52d07c:	dc 25 38 30 40 00    	fsub   QWORD PTR ds:0x403038
  52d082:	dc 0d e8 3a 40 00    	fmul   QWORD PTR ds:0x403ae8
  52d088:	df e0                	fnstsw ax
  52d08a:	a8 0d                	test   al,0xd
  52d08c:	0f 85 58 02 00 00    	jne    0x52d2ea
  52d092:	83 ec 08             	sub    esp,0x8
  52d095:	dd 1c 24             	fstp   QWORD PTR [esp]
  52d098:	ff 15 28 12 40 00    	call   DWORD PTR ds:0x401228
  52d09e:	dd 9d 44 ff ff ff    	fstp   QWORD PTR [ebp-0xbc]
  52d0a4:	dd 06                	fld    QWORD PTR [esi]
  52d0a6:	dc 0d 00 3d 40 00    	fmul   QWORD PTR ds:0x403d00
  52d0ac:	df e0                	fnstsw ax
  52d0ae:	a8 0d                	test   al,0xd
  52d0b0:	0f 85 34 02 00 00    	jne    0x52d2ea
  52d0b6:	83 ec 08             	sub    esp,0x8
  52d0b9:	dd 1c 24             	fstp   QWORD PTR [esp]
  52d0bc:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  52d0c2:	dd 9d 3c ff ff ff    	fstp   QWORD PTR [ebp-0xc4]
  52d0c8:	dd 85 44 ff ff ff    	fld    QWORD PTR [ebp-0xbc]
  52d0ce:	dc 0d f8 3c 40 00    	fmul   QWORD PTR ds:0x403cf8
  52d0d4:	dc 8d 3c ff ff ff    	fmul   QWORD PTR [ebp-0xc4]
  52d0da:	dc 45 dc             	fadd   QWORD PTR [ebp-0x24]
  52d0dd:	dd 5d dc             	fstp   QWORD PTR [ebp-0x24]
  52d0e0:	df e0                	fnstsw ax
  52d0e2:	a8 0d                	test   al,0xd
  52d0e4:	0f 85 00 02 00 00    	jne    0x52d2ea
  52d0ea:	dd 85 7c ff ff ff    	fld    QWORD PTR [ebp-0x84]
  52d0f0:	dc 4d dc             	fmul   QWORD PTR [ebp-0x24]
  52d0f3:	dc 0d c0 28 40 00    	fmul   QWORD PTR ds:0x4028c0
  52d0f9:	d8 0d 20 b1 54 00    	fmul   DWORD PTR ds:0x54b120
  52d0ff:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  52d106:	75 08                	jne    0x52d110
  52d108:	dc 35 e8 3c 40 00    	fdiv   QWORD PTR ds:0x403ce8
  52d10e:	eb 11                	jmp    0x52d121
  52d110:	ff 35 ec 3c 40 00    	push   DWORD PTR ds:0x403cec
  52d116:	ff 35 e8 3c 40 00    	push   DWORD PTR ds:0x403ce8
  52d11c:	e8 13 76 ed ff       	call   0x404734
  52d121:	dd 5d dc             	fstp   QWORD PTR [ebp-0x24]
  52d124:	df e0                	fnstsw ax
  52d126:	a8 0d                	test   al,0xd
  52d128:	0f 85 bc 01 00 00    	jne    0x52d2ea
