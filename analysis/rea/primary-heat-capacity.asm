
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0050afe4 <.text+0x109fe4>:
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
