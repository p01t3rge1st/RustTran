
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0051d9ca <.text+0x11c9ca>:
  51d9ca:	68 94 b4 54 00       	push   0x54b494
  51d9cf:	e8 bc e7 f7 ff       	call   0x49c190
  51d9d4:	d9 1d 50 b6 54 00    	fstp   DWORD PTR ds:0x54b650
  51d9da:	68 94 b4 54 00       	push   0x54b494
  51d9df:	e8 1c e5 f7 ff       	call   0x49bf00
  51d9e4:	d9 1d 4c b6 54 00    	fstp   DWORD PTR ds:0x54b64c
  51d9ea:	68 94 b4 54 00       	push   0x54b494
  51d9ef:	e8 1c d4 f7 ff       	call   0x49ae10
  51d9f4:	d9 1d 24 b7 54 00    	fstp   DWORD PTR ds:0x54b724
  51d9fa:	68 94 b4 54 00       	push   0x54b494
  51d9ff:	e8 6c d1 f7 ff       	call   0x49ab70
  51da04:	d9 1d 28 b7 54 00    	fstp   DWORD PTR ds:0x54b728
  51da0a:	8d 95 08 ff ff ff    	lea    edx,[ebp-0xf8]
  51da10:	c7 85 10 ff ff ff 94 	mov    DWORD PTR [ebp-0xf0],0x54b494
  51da17:	b4 54 00 
  51da1a:	52                   	push   edx
  51da1b:	c7 85 08 ff ff ff 04 	mov    DWORD PTR [ebp-0xf8],0x4004
  51da22:	40 00 00 
  51da25:	e8 c6 c9 f7 ff       	call   0x49a3f0
  51da2a:	d9 5d d0             	fstp   DWORD PTR [ebp-0x30]
  51da2d:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51da33:	d8 45 d0             	fadd   DWORD PTR [ebp-0x30]
  51da36:	d9 9d b0 fe ff ff    	fstp   DWORD PTR [ebp-0x150]
  51da3c:	df e0                	fnstsw ax
  51da3e:	a8 0d                	test   al,0xd
  51da40:	0f 85 e2 6b 00 00    	jne    0x524628
  51da46:	8d 85 b0 fe ff ff    	lea    eax,[ebp-0x150]
  51da4c:	50                   	push   eax
  51da4d:	e8 5e e4 f7 ff       	call   0x49beb0
  51da52:	d9 5d c4             	fstp   DWORD PTR [ebp-0x3c]
  51da55:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51da5b:	d8 65 d0             	fsub   DWORD PTR [ebp-0x30]
  51da5e:	8d 8d b0 fe ff ff    	lea    ecx,[ebp-0x150]
  51da64:	51                   	push   ecx
  51da65:	d9 9d b0 fe ff ff    	fstp   DWORD PTR [ebp-0x150]
  51da6b:	df e0                	fnstsw ax
  51da6d:	a8 0d                	test   al,0xd
  51da6f:	0f 85 b3 6b 00 00    	jne    0x524628
  51da75:	e8 36 e4 f7 ff       	call   0x49beb0
  51da7a:	d9 5d c8             	fstp   DWORD PTR [ebp-0x38]
  51da7d:	d9 45 c4             	fld    DWORD PTR [ebp-0x3c]
  51da80:	d8 65 c8             	fsub   DWORD PTR [ebp-0x38]
  51da83:	8d 95 ac fe ff ff    	lea    edx,[ebp-0x154]
  51da89:	52                   	push   edx
  51da8a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51da91:	75 08                	jne    0x51da9b
  51da93:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  51da99:	eb 0b                	jmp    0x51daa6
  51da9b:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  51daa1:	e8 82 6c ee ff       	call   0x404728
  51daa6:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51daad:	75 05                	jne    0x51dab4
  51daaf:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  51dab2:	eb 08                	jmp    0x51dabc
  51dab4:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  51dab7:	e8 6c 6c ee ff       	call   0x404728
  51dabc:	d9 1d 78 b7 54 00    	fstp   DWORD PTR ds:0x54b778
  51dac2:	df e0                	fnstsw ax
  51dac4:	a8 0d                	test   al,0xd
  51dac6:	0f 85 5c 6b 00 00    	jne    0x524628
  51dacc:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51dad2:	d8 65 d0             	fsub   DWORD PTR [ebp-0x30]
  51dad5:	d9 9d ac fe ff ff    	fstp   DWORD PTR [ebp-0x154]
  51dadb:	df e0                	fnstsw ax
  51dadd:	a8 0d                	test   al,0xd
  51dadf:	0f 85 43 6b 00 00    	jne    0x524628
  51dae5:	e8 26 d3 f7 ff       	call   0x49ae10
  51daea:	d9 9d a8 fe ff ff    	fstp   DWORD PTR [ebp-0x158]
  51daf0:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51daf6:	d8 45 d0             	fadd   DWORD PTR [ebp-0x30]
  51daf9:	d9 9d b0 fe ff ff    	fstp   DWORD PTR [ebp-0x150]
  51daff:	df e0                	fnstsw ax
  51db01:	a8 0d                	test   al,0xd
  51db03:	0f 85 1f 6b 00 00    	jne    0x524628
  51db09:	8d 85 b0 fe ff ff    	lea    eax,[ebp-0x150]
  51db0f:	50                   	push   eax
  51db10:	e8 fb d2 f7 ff       	call   0x49ae10
  51db15:	d8 a5 a8 fe ff ff    	fsub   DWORD PTR [ebp-0x158]
  51db1b:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51db22:	75 08                	jne    0x51db2c
  51db24:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  51db2a:	eb 0b                	jmp    0x51db37
  51db2c:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  51db32:	e8 f1 6b ee ff       	call   0x404728
  51db37:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51db3e:	75 05                	jne    0x51db45
  51db40:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  51db43:	eb 08                	jmp    0x51db4d
  51db45:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  51db48:	e8 db 6b ee ff       	call   0x404728
  51db4d:	d9 1d 1c b7 54 00    	fstp   DWORD PTR ds:0x54b71c
  51db53:	df e0                	fnstsw ax
  51db55:	a8 0d                	test   al,0xd
  51db57:	0f 85 cb 6a 00 00    	jne    0x524628
  51db5d:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51db63:	d8 65 d0             	fsub   DWORD PTR [ebp-0x30]
  51db66:	d9 9d ac fe ff ff    	fstp   DWORD PTR [ebp-0x154]
  51db6c:	df e0                	fnstsw ax
  51db6e:	a8 0d                	test   al,0xd
  51db70:	0f 85 b2 6a 00 00    	jne    0x524628
  51db76:	8d 8d ac fe ff ff    	lea    ecx,[ebp-0x154]
  51db7c:	51                   	push   ecx
  51db7d:	e8 0e e6 f7 ff       	call   0x49c190
  51db82:	d9 9d a8 fe ff ff    	fstp   DWORD PTR [ebp-0x158]
  51db88:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51db8e:	d8 45 d0             	fadd   DWORD PTR [ebp-0x30]
  51db91:	8d 95 b0 fe ff ff    	lea    edx,[ebp-0x150]
  51db97:	52                   	push   edx
  51db98:	d9 9d b0 fe ff ff    	fstp   DWORD PTR [ebp-0x150]
  51db9e:	df e0                	fnstsw ax
  51dba0:	a8 0d                	test   al,0xd
  51dba2:	0f 85 80 6a 00 00    	jne    0x524628
  51dba8:	e8 e3 e5 f7 ff       	call   0x49c190
  51dbad:	d8 a5 a8 fe ff ff    	fsub   DWORD PTR [ebp-0x158]
  51dbb3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51dbba:	75 08                	jne    0x51dbc4
  51dbbc:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  51dbc2:	eb 0b                	jmp    0x51dbcf
  51dbc4:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  51dbca:	e8 59 6b ee ff       	call   0x404728
  51dbcf:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51dbd6:	75 05                	jne    0x51dbdd
  51dbd8:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  51dbdb:	eb 08                	jmp    0x51dbe5
  51dbdd:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  51dbe0:	e8 43 6b ee ff       	call   0x404728
  51dbe5:	d9 1d 58 b6 54 00    	fstp   DWORD PTR ds:0x54b658
  51dbeb:	df e0                	fnstsw ax
  51dbed:	a8 0d                	test   al,0xd
  51dbef:	0f 85 33 6a 00 00    	jne    0x524628
  51dbf5:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51dbfb:	d8 65 d0             	fsub   DWORD PTR [ebp-0x30]
  51dbfe:	d9 9d ac fe ff ff    	fstp   DWORD PTR [ebp-0x154]
  51dc04:	df e0                	fnstsw ax
  51dc06:	a8 0d                	test   al,0xd
  51dc08:	0f 85 1a 6a 00 00    	jne    0x524628
  51dc0e:	8d 85 ac fe ff ff    	lea    eax,[ebp-0x154]
  51dc14:	50                   	push   eax
  51dc15:	e8 56 cf f7 ff       	call   0x49ab70
  51dc1a:	d9 9d a8 fe ff ff    	fstp   DWORD PTR [ebp-0x158]
  51dc20:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51dc26:	d8 45 d0             	fadd   DWORD PTR [ebp-0x30]
  51dc29:	8d 8d b0 fe ff ff    	lea    ecx,[ebp-0x150]
  51dc2f:	51                   	push   ecx
  51dc30:	d9 9d b0 fe ff ff    	fstp   DWORD PTR [ebp-0x150]
  51dc36:	df e0                	fnstsw ax
  51dc38:	a8 0d                	test   al,0xd
  51dc3a:	0f 85 e8 69 00 00    	jne    0x524628
  51dc40:	e8 2b cf f7 ff       	call   0x49ab70
  51dc45:	d8 a5 a8 fe ff ff    	fsub   DWORD PTR [ebp-0x158]
  51dc4b:	8d 95 ac fe ff ff    	lea    edx,[ebp-0x154]
  51dc51:	52                   	push   edx
  51dc52:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51dc59:	75 08                	jne    0x51dc63
  51dc5b:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  51dc61:	eb 0b                	jmp    0x51dc6e
  51dc63:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  51dc69:	e8 ba 6a ee ff       	call   0x404728
  51dc6e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51dc75:	75 05                	jne    0x51dc7c
  51dc77:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  51dc7a:	eb 08                	jmp    0x51dc84
  51dc7c:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  51dc7f:	e8 a4 6a ee ff       	call   0x404728
  51dc84:	d9 1d 20 b7 54 00    	fstp   DWORD PTR ds:0x54b720
  51dc8a:	df e0                	fnstsw ax
  51dc8c:	a8 0d                	test   al,0xd
  51dc8e:	0f 85 94 69 00 00    	jne    0x524628
  51dc94:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51dc9a:	d8 65 d0             	fsub   DWORD PTR [ebp-0x30]
  51dc9d:	d9 9d ac fe ff ff    	fstp   DWORD PTR [ebp-0x154]
  51dca3:	df e0                	fnstsw ax
  51dca5:	a8 0d                	test   al,0xd
  51dca7:	0f 85 7b 69 00 00    	jne    0x524628
  51dcad:	e8 4e e2 f7 ff       	call   0x49bf00
  51dcb2:	d9 9d a8 fe ff ff    	fstp   DWORD PTR [ebp-0x158]
  51dcb8:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  51dcbe:	d8 45 d0             	fadd   DWORD PTR [ebp-0x30]
  51dcc1:	d9 9d b0 fe ff ff    	fstp   DWORD PTR [ebp-0x150]
  51dcc7:	df e0                	fnstsw ax
  51dcc9:	a8 0d                	test   al,0xd
  51dccb:	0f 85 57 69 00 00    	jne    0x524628
  51dcd1:	8d 85 b0 fe ff ff    	lea    eax,[ebp-0x150]
  51dcd7:	50                   	push   eax
  51dcd8:	e8 23 e2 f7 ff       	call   0x49bf00
  51dcdd:	d8 a5 a8 fe ff ff    	fsub   DWORD PTR [ebp-0x158]
  51dce3:	6a 00                	push   0x0
  51dce5:	68 0f 00 03 68       	push   0x6803000f
  51dcea:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51dcf1:	75 08                	jne    0x51dcfb
  51dcf3:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  51dcf9:	eb 0b                	jmp    0x51dd06
  51dcfb:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  51dd01:	e8 22 6a ee ff       	call   0x404728
  51dd06:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51dd0d:	75 05                	jne    0x51dd14
  51dd0f:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  51dd12:	eb 08                	jmp    0x51dd1c
  51dd14:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  51dd17:	e8 0c 6a ee ff       	call   0x404728
  51dd1c:	d9 1d 5c b6 54 00    	fstp   DWORD PTR ds:0x54b65c
  51dd22:	df e0                	fnstsw ax
  51dd24:	a8 0d                	test   al,0xd
  51dd26:	0f 85 fc 68 00 00    	jne    0x524628
