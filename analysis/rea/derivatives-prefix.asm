
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

004fa8e0 <.text+0xf98e0>:
  4fa8e0:	55                   	push   ebp
  4fa8e1:	8b ec                	mov    ebp,esp
  4fa8e3:	83 ec 14             	sub    esp,0x14
  4fa8e6:	68 16 47 40 00       	push   0x404716
  4fa8eb:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4fa8f1:	50                   	push   eax
  4fa8f2:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  4fa8f9:	81 ec 18 03 00 00    	sub    esp,0x318
  4fa8ff:	53                   	push   ebx
  4fa900:	56                   	push   esi
  4fa901:	57                   	push   edi
  4fa902:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  4fa905:	c7 45 f0 00 30 40 00 	mov    DWORD PTR [ebp-0x10],0x403000
  4fa90c:	33 db                	xor    ebx,ebx
  4fa90e:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  4fa911:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
  4fa914:	89 5d dc             	mov    DWORD PTR [ebp-0x24],ebx
  4fa917:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  4fa91a:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
  4fa91d:	89 5d ac             	mov    DWORD PTR [ebp-0x54],ebx
  4fa920:	89 5d a8             	mov    DWORD PTR [ebp-0x58],ebx
  4fa923:	89 5d a4             	mov    DWORD PTR [ebp-0x5c],ebx
  4fa926:	89 5d a0             	mov    DWORD PTR [ebp-0x60],ebx
  4fa929:	89 5d 9c             	mov    DWORD PTR [ebp-0x64],ebx
  4fa92c:	89 5d 98             	mov    DWORD PTR [ebp-0x68],ebx
  4fa92f:	89 5d 94             	mov    DWORD PTR [ebp-0x6c],ebx
  4fa932:	89 5d 90             	mov    DWORD PTR [ebp-0x70],ebx
  4fa935:	89 5d 8c             	mov    DWORD PTR [ebp-0x74],ebx
  4fa938:	89 5d 88             	mov    DWORD PTR [ebp-0x78],ebx
  4fa93b:	89 9d 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],ebx
  4fa941:	89 9d 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],ebx
  4fa947:	89 9d 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],ebx
  4fa94d:	89 9d 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],ebx
  4fa953:	89 9d 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],ebx
  4fa959:	89 9d 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],ebx
  4fa95f:	89 9d 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],ebx
  4fa965:	89 9d 20 ff ff ff    	mov    DWORD PTR [ebp-0xe0],ebx
  4fa96b:	89 9d 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],ebx
  4fa971:	6a 01                	push   0x1
  4fa973:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  4fa979:	c7 45 c8 00 3a dd 46 	mov    DWORD PTR [ebp-0x38],0x46dd3a00
  4fa980:	c7 45 d4 cd cc e2 43 	mov    DWORD PTR [ebp-0x2c],0x43e2cccd
  4fa987:	c7 45 b0 00 24 74 49 	mov    DWORD PTR [ebp-0x50],0x49742400
  4fa98e:	c7 85 20 ff ff ff 00 	mov    DWORD PTR [ebp-0xe0],0x41700000
  4fa995:	00 70 41 
  4fa998:	8d 85 20 ff ff ff    	lea    eax,[ebp-0xe0]
  4fa99e:	50                   	push   eax
  4fa99f:	e8 ec 17 fa ff       	call   0x49c190
  4fa9a4:	d9 5d c4             	fstp   DWORD PTR [ebp-0x3c]
  4fa9a7:	53                   	push   ebx
  4fa9a8:	68 09 00 03 68       	push   0x68030009
  4fa9ad:	a1 38 b0 54 00       	mov    eax,ds:0x54b038
  4fa9b2:	8b 08                	mov    ecx,DWORD PTR [eax]
  4fa9b4:	50                   	push   eax
  4fa9b5:	ff 91 c8 03 00 00    	call   DWORD PTR [ecx+0x3c8]
  4fa9bb:	50                   	push   eax
  4fa9bc:	8d 55 a8             	lea    edx,[ebp-0x58]
  4fa9bf:	52                   	push   edx
  4fa9c0:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  4fa9c6:	50                   	push   eax
  4fa9c7:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  4fa9cd:	50                   	push   eax
  4fa9ce:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  4fa9d4:	83 c4 10             	add    esp,0x10
  4fa9d7:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  4fa9dd:	51                   	push   ecx
  4fa9de:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  4fa9e4:	0f bf d0             	movsx  edx,ax
  4fa9e7:	89 95 98 fe ff ff    	mov    DWORD PTR [ebp-0x168],edx
  4fa9ed:	db 85 98 fe ff ff    	fild   DWORD PTR [ebp-0x168]
  4fa9f3:	d9 9d 94 fe ff ff    	fstp   DWORD PTR [ebp-0x16c]
  4fa9f9:	d9 05 6c b1 54 00    	fld    DWORD PTR ds:0x54b16c
  4fa9ff:	a1 14 b6 54 00       	mov    eax,ds:0x54b614
  4faa04:	d8 48 4c             	fmul   DWORD PTR [eax+0x4c]
  4faa07:	d8 8d 94 fe ff ff    	fmul   DWORD PTR [ebp-0x16c]
  4faa0d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4faa14:	75 08                	jne    0x4faa1e
  4faa16:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  4faa1c:	eb 0b                	jmp    0x4faa29
  4faa1e:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  4faa24:	e8 ff 9c f0 ff       	call   0x404728
  4faa29:	d9 1d b4 b6 54 00    	fstp   DWORD PTR ds:0x54b6b4
  4faa2f:	df e0                	fnstsw ax
  4faa31:	a8 0d                	test   al,0xd
  4faa33:	0f 85 85 5a 00 00    	jne    0x5004be
  4faa39:	8d 4d a8             	lea    ecx,[ebp-0x58]
  4faa3c:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  4faa42:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  4faa48:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  4faa4e:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4faa54:	d8 1d 18 b4 54 00    	fcomp  DWORD PTR ds:0x54b418
  4faa5a:	df e0                	fnstsw ax
  4faa5c:	f6 c4 41             	test   ah,0x41
  4faa5f:	0f 84 ee 0a 00 00    	je     0x4fb553
  4faa65:	8b 0d 44 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b944
  4faa6b:	89 8d d4 fe ff ff    	mov    DWORD PTR [ebp-0x12c],ecx
  4faa71:	b8 01 00 00 00       	mov    eax,0x1
  4faa76:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4faa79:	8b 35 e8 10 40 00    	mov    esi,DWORD PTR ds:0x4010e8
  4faa7f:	66 3b 85 d4 fe ff ff 	cmp    ax,WORD PTR [ebp-0x12c]
  4faa86:	0f 8f 0b 06 00 00    	jg     0x4fb097
  4faa8c:	8b 0d ac b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9ac
  4faa92:	3b cb                	cmp    ecx,ebx
  4faa94:	74 1c                	je     0x4faab2
  4faa96:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4faa9a:	75 16                	jne    0x4faab2
  4faa9c:	0f bf f8             	movsx  edi,ax
  4faa9f:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4faaa2:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4faaa5:	72 02                	jb     0x4faaa9
  4faaa7:	ff d6                	call   esi
  4faaa9:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4faab0:	eb 04                	jmp    0x4faab6
  4faab2:	ff d6                	call   esi
  4faab4:	8b d8                	mov    ebx,eax
  4faab6:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4faabc:	85 c9                	test   ecx,ecx
  4faabe:	74 1f                	je     0x4faadf
  4faac0:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4faac4:	75 19                	jne    0x4faadf
  4faac6:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4faaca:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4faacd:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4faad0:	72 08                	jb     0x4faada
  4faad2:	ff d6                	call   esi
  4faad4:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4faada:	c1 e7 02             	shl    edi,0x2
  4faadd:	eb 0a                	jmp    0x4faae9
  4faadf:	ff d6                	call   esi
  4faae1:	8b f8                	mov    edi,eax
  4faae3:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4faae9:	8b 15 ac b9 54 00    	mov    edx,DWORD PTR ds:0x54b9ac
  4faaef:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
  4faaf2:	d9 05 bc b2 54 00    	fld    DWORD PTR ds:0x54b2bc
  4faaf8:	d8 0d b8 b2 54 00    	fmul   DWORD PTR ds:0x54b2b8
  4faafe:	d8                   	.byte 0xd8
  4faaff:	0c                   	.byte 0xc
