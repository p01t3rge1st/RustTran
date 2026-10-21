
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
  4faafe:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fab01:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fab08:	75 08                	jne    0x4fab12
  4fab0a:	d8 35 c0 b2 54 00    	fdiv   DWORD PTR ds:0x54b2c0
  4fab10:	eb 0b                	jmp    0x4fab1d
  4fab12:	ff 35 c0 b2 54 00    	push   DWORD PTR ds:0x54b2c0
  4fab18:	e8 0b 9c f0 ff       	call   0x404728
  4fab1d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fab24:	75 05                	jne    0x4fab2b
  4fab26:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fab29:	eb 08                	jmp    0x4fab33
  4fab2b:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fab2e:	e8 f5 9b f0 ff       	call   0x404728
  4fab33:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fab36:	df e0                	fnstsw ax
  4fab38:	a8 0d                	test   al,0xd
  4fab3a:	0f 85 7e 59 00 00    	jne    0x5004be
  4fab40:	dc 0d 78 30 40 00    	fmul   QWORD PTR ds:0x403078
  4fab46:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fab4d:	75 08                	jne    0x4fab57
  4fab4f:	dc 35 c0 28 40 00    	fdiv   QWORD PTR ds:0x4028c0
  4fab55:	eb 11                	jmp    0x4fab68
  4fab57:	ff 35 c4 28 40 00    	push   DWORD PTR ds:0x4028c4
  4fab5d:	ff 35 c0 28 40 00    	push   DWORD PTR ds:0x4028c0
  4fab63:	e8 cc 9b f0 ff       	call   0x404734
  4fab68:	d9 9d 90 fe ff ff    	fstp   DWORD PTR [ebp-0x170]
  4fab6e:	df e0                	fnstsw ax
  4fab70:	a8 0d                	test   al,0xd
  4fab72:	0f 85 46 59 00 00    	jne    0x5004be
  4fab78:	d9 85 90 fe ff ff    	fld    DWORD PTR [ebp-0x170]
  4fab7e:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fab81:	d9 1c 39             	fstp   DWORD PTR [ecx+edi*1]
  4fab84:	a1 50 b9 54 00       	mov    eax,ds:0x54b950
  4fab89:	85 c0                	test   eax,eax
  4fab8b:	74 1d                	je     0x4fabaa
  4fab8d:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fab91:	75 17                	jne    0x4fabaa
  4fab93:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fab97:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fab9a:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fab9d:	72 02                	jb     0x4faba1
  4fab9f:	ff d6                	call   esi
  4faba1:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4faba8:	eb 04                	jmp    0x4fabae
  4fabaa:	ff d6                	call   esi
  4fabac:	8b d8                	mov    ebx,eax
  4fabae:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fabb4:	85 c9                	test   ecx,ecx
  4fabb6:	74 1f                	je     0x4fabd7
  4fabb8:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fabbc:	75 19                	jne    0x4fabd7
  4fabbe:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fabc2:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fabc5:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fabc8:	72 08                	jb     0x4fabd2
  4fabca:	ff d6                	call   esi
  4fabcc:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fabd2:	c1 e7 02             	shl    edi,0x2
  4fabd5:	eb 0a                	jmp    0x4fabe1
  4fabd7:	ff d6                	call   esi
  4fabd9:	8b f8                	mov    edi,eax
  4fabdb:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fabe1:	8b 15 50 b9 54 00    	mov    edx,DWORD PTR ds:0x54b950
  4fabe7:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
  4fabea:	d9 04 18             	fld    DWORD PTR [eax+ebx*1]
  4fabed:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fabf4:	75 08                	jne    0x4fabfe
  4fabf6:	dc 3d 70 30 40 00    	fdivr  QWORD PTR ds:0x403070
  4fabfc:	eb 11                	jmp    0x4fac0f
  4fabfe:	ff 35 74 30 40 00    	push   DWORD PTR ds:0x403074
  4fac04:	ff 35 70 30 40 00    	push   DWORD PTR ds:0x403070
  4fac0a:	e8 43 9b f0 ff       	call   0x404752
  4fac0f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fac16:	75 08                	jne    0x4fac20
  4fac18:	d8 35 18 b3 54 00    	fdiv   DWORD PTR ds:0x54b318
  4fac1e:	eb 0b                	jmp    0x4fac2b
  4fac20:	ff 35 18 b3 54 00    	push   DWORD PTR ds:0x54b318
  4fac26:	e8 fd 9a f0 ff       	call   0x404728
  4fac2b:	d9 9d 8c fe ff ff    	fstp   DWORD PTR [ebp-0x174]
  4fac31:	df e0                	fnstsw ax
  4fac33:	a8 0d                	test   al,0xd
  4fac35:	0f 85 83 58 00 00    	jne    0x5004be
  4fac3b:	d9 85 8c fe ff ff    	fld    DWORD PTR [ebp-0x174]
  4fac41:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fac44:	d9 1c 39             	fstp   DWORD PTR [ecx+edi*1]
  4fac47:	a1 54 b9 54 00       	mov    eax,ds:0x54b954
  4fac4c:	85 c0                	test   eax,eax
  4fac4e:	74 23                	je     0x4fac73
  4fac50:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fac54:	75 1d                	jne    0x4fac73
  4fac56:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fac5a:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fac5d:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fac60:	72 02                	jb     0x4fac64
  4fac62:	ff d6                	call   esi
  4fac64:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fac6b:	89 95 88 fe ff ff    	mov    DWORD PTR [ebp-0x178],edx
  4fac71:	eb 08                	jmp    0x4fac7b
  4fac73:	ff d6                	call   esi
  4fac75:	89 85 88 fe ff ff    	mov    DWORD PTR [ebp-0x178],eax
  4fac7b:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fac80:	85 c0                	test   eax,eax
  4fac82:	74 23                	je     0x4faca7
  4fac84:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fac88:	75 1d                	jne    0x4faca7
  4fac8a:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fac8e:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fac91:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fac97:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fac9a:	72 02                	jb     0x4fac9e
  4fac9c:	ff d6                	call   esi
  4fac9e:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4faca5:	eb 04                	jmp    0x4facab
  4faca7:	ff d6                	call   esi
  4faca9:	8b d8                	mov    ebx,eax
  4facab:	8b 0d 5c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b95c
  4facb1:	85 c9                	test   ecx,ecx
  4facb3:	74 23                	je     0x4facd8
  4facb5:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4facb9:	75 1d                	jne    0x4facd8
  4facbb:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4facbf:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4facc2:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4facc5:	72 08                	jb     0x4faccf
  4facc7:	ff d6                	call   esi
  4facc9:	8b 0d 5c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b95c
  4faccf:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4facd6:	eb 0a                	jmp    0x4face2
  4facd8:	ff d6                	call   esi
  4facda:	8b d0                	mov    edx,eax
  4facdc:	8b 0d 5c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b95c
  4face2:	a1 54 b9 54 00       	mov    eax,ds:0x54b954
  4face7:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4facea:	d9 05 b0 b6 54 00    	fld    DWORD PTR ds:0x54b6b0
  4facf0:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4facf7:	75 08                	jne    0x4fad01
  4facf9:	d8 35 38 bb 54 00    	fdiv   DWORD PTR ds:0x54bb38
  4facff:	eb 0b                	jmp    0x4fad0c
  4fad01:	ff 35 38 bb 54 00    	push   DWORD PTR ds:0x54bb38
  4fad07:	e8 1c 9a f0 ff       	call   0x404728
  4fad0c:	8b bd 88 fe ff ff    	mov    edi,DWORD PTR [ebp-0x178]
  4fad12:	d8 04 38             	fadd   DWORD PTR [eax+edi*1]
  4fad15:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fad1a:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fad1d:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fad20:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fad23:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fad26:	df e0                	fnstsw ax
  4fad28:	a8 0d                	test   al,0xd
  4fad2a:	0f 85 8e 57 00 00    	jne    0x5004be
  4fad30:	a1 b4 b9 54 00       	mov    eax,ds:0x54b9b4
  4fad35:	85 c0                	test   eax,eax
  4fad37:	74 1d                	je     0x4fad56
  4fad39:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fad3d:	75 17                	jne    0x4fad56
  4fad3f:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fad43:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fad46:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fad49:	72 02                	jb     0x4fad4d
  4fad4b:	ff d6                	call   esi
  4fad4d:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fad54:	eb 04                	jmp    0x4fad5a
  4fad56:	ff d6                	call   esi
  4fad58:	8b d8                	mov    ebx,eax
  4fad5a:	8b 0d b8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b8
  4fad60:	85 c9                	test   ecx,ecx
  4fad62:	74 1f                	je     0x4fad83
  4fad64:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fad68:	75 19                	jne    0x4fad83
  4fad6a:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fad6e:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fad71:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fad74:	72 08                	jb     0x4fad7e
  4fad76:	ff d6                	call   esi
  4fad78:	8b 0d b8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b8
  4fad7e:	c1 e7 02             	shl    edi,0x2
  4fad81:	eb 0a                	jmp    0x4fad8d
  4fad83:	ff d6                	call   esi
  4fad85:	8b f8                	mov    edi,eax
  4fad87:	8b 0d b8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b8
  4fad8d:	8b 15 b4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b4
  4fad93:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
  4fad96:	d9 45 d4             	fld    DWORD PTR [ebp-0x2c]
  4fad99:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fad9c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fada3:	75 05                	jne    0x4fadaa
  4fada5:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fada8:	eb 08                	jmp    0x4fadb2
  4fadaa:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fadad:	e8 76 99 f0 ff       	call   0x404728
  4fadb2:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fadb9:	75 05                	jne    0x4fadc0
  4fadbb:	d8 75 c4             	fdiv   DWORD PTR [ebp-0x3c]
  4fadbe:	eb 08                	jmp    0x4fadc8
  4fadc0:	ff 75 c4             	push   DWORD PTR [ebp-0x3c]
  4fadc3:	e8 60 99 f0 ff       	call   0x404728
  4fadc8:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fadcb:	d9 1c 39             	fstp   DWORD PTR [ecx+edi*1]
  4fadce:	df e0                	fnstsw ax
  4fadd0:	a8 0d                	test   al,0xd
  4fadd2:	0f 85 e6 56 00 00    	jne    0x5004be
  4fadd8:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4faddd:	85 c0                	test   eax,eax
  4faddf:	74 1d                	je     0x4fadfe
  4fade1:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fade5:	75 17                	jne    0x4fadfe
  4fade7:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fadeb:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fadee:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fadf1:	72 02                	jb     0x4fadf5
  4fadf3:	ff d6                	call   esi
  4fadf5:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fadfc:	eb 04                	jmp    0x4fae02
  4fadfe:	ff d6                	call   esi
  4fae00:	8b d8                	mov    ebx,eax
  4fae02:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fae08:	85 c9                	test   ecx,ecx
  4fae0a:	74 23                	je     0x4fae2f
  4fae0c:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fae10:	75 1d                	jne    0x4fae2f
  4fae12:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fae16:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fae19:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fae1c:	72 08                	jb     0x4fae26
  4fae1e:	ff d6                	call   esi
  4fae20:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fae26:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fae2d:	eb 08                	jmp    0x4fae37
  4fae2f:	ff d6                	call   esi
  4fae31:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fae37:	8b 15 b0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b0
  4fae3d:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fae40:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fae43:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4fae46:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4fae49:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fae4e:	85 c0                	test   eax,eax
  4fae50:	74 1d                	je     0x4fae6f
  4fae52:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fae56:	75 17                	jne    0x4fae6f
  4fae58:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fae5c:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fae5f:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fae62:	72 02                	jb     0x4fae66
  4fae64:	ff d6                	call   esi
  4fae66:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fae6d:	eb 04                	jmp    0x4fae73
  4fae6f:	ff d6                	call   esi
  4fae71:	8b d8                	mov    ebx,eax
  4fae73:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fae79:	85 c9                	test   ecx,ecx
  4fae7b:	74 23                	je     0x4faea0
  4fae7d:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fae81:	75 1d                	jne    0x4faea0
  4fae83:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fae87:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fae8a:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fae8d:	72 08                	jb     0x4fae97
  4fae8f:	ff d6                	call   esi
  4fae91:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fae97:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fae9e:	eb 08                	jmp    0x4faea8
  4faea0:	ff d6                	call   esi
  4faea2:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4faea8:	8b 15 ac b9 54 00    	mov    edx,DWORD PTR ds:0x54b9ac
  4faeae:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4faeb1:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4faeb4:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4faeb7:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4faeba:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4faebf:	85 c0                	test   eax,eax
  4faec1:	74 1d                	je     0x4faee0
  4faec3:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4faec7:	75 17                	jne    0x4faee0
  4faec9:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4faecd:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4faed0:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4faed3:	72 02                	jb     0x4faed7
  4faed5:	ff d6                	call   esi
  4faed7:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4faede:	eb 04                	jmp    0x4faee4
  4faee0:	ff d6                	call   esi
  4faee2:	8b d8                	mov    ebx,eax
  4faee4:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4faeea:	85 c9                	test   ecx,ecx
  4faeec:	74 23                	je     0x4faf11
  4faeee:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4faef2:	75 1d                	jne    0x4faf11
  4faef4:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4faef8:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4faefb:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4faefe:	72 08                	jb     0x4faf08
  4faf00:	ff d6                	call   esi
  4faf02:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4faf08:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4faf0f:	eb 08                	jmp    0x4faf19
  4faf11:	ff d6                	call   esi
  4faf13:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4faf19:	8b 15 b0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b0
  4faf1f:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4faf22:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4faf25:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4faf28:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4faf2b:	a1 b4 b9 54 00       	mov    eax,ds:0x54b9b4
  4faf30:	85 c0                	test   eax,eax
  4faf32:	74 1d                	je     0x4faf51
  4faf34:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4faf38:	75 17                	jne    0x4faf51
  4faf3a:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4faf3e:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4faf41:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4faf44:	72 02                	jb     0x4faf48
  4faf46:	ff d6                	call   esi
  4faf48:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4faf4f:	eb 04                	jmp    0x4faf55
  4faf51:	ff d6                	call   esi
  4faf53:	8b d8                	mov    ebx,eax
  4faf55:	8b 0d 68 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b968
  4faf5b:	85 c9                	test   ecx,ecx
  4faf5d:	74 23                	je     0x4faf82
  4faf5f:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4faf63:	75 1d                	jne    0x4faf82
  4faf65:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4faf69:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4faf6c:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4faf6f:	72 08                	jb     0x4faf79
  4faf71:	ff d6                	call   esi
  4faf73:	8b 0d 68 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b968
  4faf79:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4faf80:	eb 08                	jmp    0x4faf8a
  4faf82:	ff d6                	call   esi
  4faf84:	8b 0d 68 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b968
  4faf8a:	8b 15 b4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b4
  4faf90:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4faf93:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4faf96:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4faf99:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4faf9c:	a1 b8 b9 54 00       	mov    eax,ds:0x54b9b8
  4fafa1:	85 c0                	test   eax,eax
  4fafa3:	74 1d                	je     0x4fafc2
  4fafa5:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fafa9:	75 17                	jne    0x4fafc2
  4fafab:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fafaf:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fafb2:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fafb5:	72 02                	jb     0x4fafb9
  4fafb7:	ff d6                	call   esi
  4fafb9:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fafc0:	eb 04                	jmp    0x4fafc6
  4fafc2:	ff d6                	call   esi
  4fafc4:	8b d8                	mov    ebx,eax
  4fafc6:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fafcc:	85 c9                	test   ecx,ecx
  4fafce:	74 23                	je     0x4faff3
  4fafd0:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fafd4:	75 1d                	jne    0x4faff3
  4fafd6:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fafda:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fafdd:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fafe0:	72 08                	jb     0x4fafea
  4fafe2:	ff d6                	call   esi
  4fafe4:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fafea:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4faff1:	eb 08                	jmp    0x4faffb
  4faff3:	ff d6                	call   esi
  4faff5:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4faffb:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fb001:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fb004:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fb007:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4fb00a:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4fb00d:	a1 bc b9 54 00       	mov    eax,ds:0x54b9bc
  4fb012:	85 c0                	test   eax,eax
  4fb014:	74 1d                	je     0x4fb033
  4fb016:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fb01a:	75 17                	jne    0x4fb033
  4fb01c:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb020:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fb023:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fb026:	72 02                	jb     0x4fb02a
  4fb028:	ff d6                	call   esi
  4fb02a:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fb031:	eb 04                	jmp    0x4fb037
  4fb033:	ff d6                	call   esi
  4fb035:	8b d8                	mov    ebx,eax
  4fb037:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fb03d:	85 c9                	test   ecx,ecx
  4fb03f:	74 23                	je     0x4fb064
  4fb041:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fb045:	75 1d                	jne    0x4fb064
  4fb047:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb04b:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fb04e:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fb051:	72 08                	jb     0x4fb05b
  4fb053:	ff d6                	call   esi
  4fb055:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fb05b:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fb062:	eb 08                	jmp    0x4fb06c
  4fb064:	ff d6                	call   esi
  4fb066:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fb06c:	8b 15 bc b9 54 00    	mov    edx,DWORD PTR ds:0x54b9bc
  4fb072:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fb075:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fb078:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4fb07b:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4fb07e:	b8 01 00 00 00       	mov    eax,0x1
  4fb083:	66 03 45 e0          	add    ax,WORD PTR [ebp-0x20]
  4fb087:	0f 80 36 54 00 00    	jo     0x5004c3
  4fb08d:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4fb090:	33 db                	xor    ebx,ebx
  4fb092:	e9 e8 f9 ff ff       	jmp    0x4faa7f
  4fb097:	d9 05 94 b8 54 00    	fld    DWORD PTR ds:0x54b894
  4fb09d:	83 ec 08             	sub    esp,0x8
  4fb0a0:	dd 1c 24             	fstp   QWORD PTR [esp]
  4fb0a3:	ff 15 28 10 40 00    	call   DWORD PTR ds:0x401028
  4fb0a9:	d9 e0                	fchs
  4fb0ab:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb0b2:	75 08                	jne    0x4fb0bc
  4fb0b4:	d8 35 38 b9 54 00    	fdiv   DWORD PTR ds:0x54b938
  4fb0ba:	eb 0b                	jmp    0x4fb0c7
  4fb0bc:	ff 35 38 b9 54 00    	push   DWORD PTR ds:0x54b938
  4fb0c2:	e8 61 96 f0 ff       	call   0x404728
  4fb0c7:	d8 0d 18 b3 54 00    	fmul   DWORD PTR ds:0x54b318
  4fb0cd:	d9 1d 8c bf 54 00    	fstp   DWORD PTR ds:0x54bf8c
  4fb0d3:	df e0                	fnstsw ax
  4fb0d5:	a8 0d                	test   al,0xd
  4fb0d7:	0f 85 e1 53 00 00    	jne    0x5004be
  4fb0dd:	d9 05 98 b8 54 00    	fld    DWORD PTR ds:0x54b898
  4fb0e3:	83 ec 08             	sub    esp,0x8
  4fb0e6:	dd 1c 24             	fstp   QWORD PTR [esp]
  4fb0e9:	ff 15 28 10 40 00    	call   DWORD PTR ds:0x401028
  4fb0ef:	d9 e0                	fchs
  4fb0f1:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb0f8:	75 08                	jne    0x4fb102
  4fb0fa:	d8 35 3c b9 54 00    	fdiv   DWORD PTR ds:0x54b93c
  4fb100:	eb 0b                	jmp    0x4fb10d
  4fb102:	ff 35 3c b9 54 00    	push   DWORD PTR ds:0x54b93c
  4fb108:	e8 1b 96 f0 ff       	call   0x404728
  4fb10d:	d8 0d 18 b3 54 00    	fmul   DWORD PTR ds:0x54b318
  4fb113:	d9 1d 90 bf 54 00    	fstp   DWORD PTR ds:0x54bf90
  4fb119:	df e0                	fnstsw ax
  4fb11b:	a8 0d                	test   al,0xd
  4fb11d:	0f 85 9b 53 00 00    	jne    0x5004be
  4fb123:	d9 05 9c b8 54 00    	fld    DWORD PTR ds:0x54b89c
  4fb129:	83 ec 08             	sub    esp,0x8
  4fb12c:	dd 1c 24             	fstp   QWORD PTR [esp]
  4fb12f:	ff 15 28 10 40 00    	call   DWORD PTR ds:0x401028
  4fb135:	d9 e0                	fchs
  4fb137:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb13e:	75 08                	jne    0x4fb148
  4fb140:	d8 35 40 b9 54 00    	fdiv   DWORD PTR ds:0x54b940
  4fb146:	eb 0b                	jmp    0x4fb153
  4fb148:	ff 35 40 b9 54 00    	push   DWORD PTR ds:0x54b940
  4fb14e:	e8 d5 95 f0 ff       	call   0x404728
  4fb153:	d8 0d 18 b3 54 00    	fmul   DWORD PTR ds:0x54b318
  4fb159:	d9 1d 94 bf 54 00    	fstp   DWORD PTR ds:0x54bf94
  4fb15f:	df e0                	fnstsw ax
  4fb161:	a8 0d                	test   al,0xd
  4fb163:	0f 85 55 53 00 00    	jne    0x5004be
  4fb169:	b9 01 00 00 00       	mov    ecx,0x1
  4fb16e:	89 4d e0             	mov    DWORD PTR [ebp-0x20],ecx
  4fb171:	b8 05 00 00 00       	mov    eax,0x5
  4fb176:	66 3b c8             	cmp    cx,ax
  4fb179:	0f 8f c7 00 00 00    	jg     0x4fb246
  4fb17f:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4fb184:	3b c3                	cmp    eax,ebx
  4fb186:	74 27                	je     0x4fb1af
  4fb188:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fb18c:	75 21                	jne    0x4fb1af
  4fb18e:	0f bf f9             	movsx  edi,cx
  4fb191:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fb194:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fb197:	72 07                	jb     0x4fb1a0
  4fb199:	ff d6                	call   esi
  4fb19b:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4fb1a0:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fb1a7:	89 8d 84 fe ff ff    	mov    DWORD PTR [ebp-0x17c],ecx
  4fb1ad:	eb 0d                	jmp    0x4fb1bc
  4fb1af:	ff d6                	call   esi
  4fb1b1:	89 85 84 fe ff ff    	mov    DWORD PTR [ebp-0x17c],eax
  4fb1b7:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4fb1bc:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb1c0:	8d 5f ff             	lea    ebx,[edi-0x1]
  4fb1c3:	83 fb 05             	cmp    ebx,0x5
  4fb1c6:	72 07                	jb     0x4fb1cf
  4fb1c8:	ff d6                	call   esi
  4fb1ca:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4fb1cf:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  4fb1d2:	8b 85 84 fe ff ff    	mov    eax,DWORD PTR [ebp-0x17c]
  4fb1d8:	8b 0c 02             	mov    ecx,DWORD PTR [edx+eax*1]
  4fb1db:	8b 15 7c b9 54 00    	mov    edx,DWORD PTR ds:0x54b97c
  4fb1e1:	89 0c 9a             	mov    DWORD PTR [edx+ebx*4],ecx
  4fb1e4:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4fb1e9:	85 c0                	test   eax,eax
  4fb1eb:	74 1a                	je     0x4fb207
  4fb1ed:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fb1f1:	75 14                	jne    0x4fb207
  4fb1f3:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fb1f6:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fb1f9:	72 07                	jb     0x4fb202
  4fb1fb:	ff d6                	call   esi
  4fb1fd:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4fb202:	c1 e7 02             	shl    edi,0x2
  4fb205:	eb 09                	jmp    0x4fb210
  4fb207:	ff d6                	call   esi
  4fb209:	8b f8                	mov    edi,eax
  4fb20b:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4fb210:	83 fb 05             	cmp    ebx,0x5
  4fb213:	72 07                	jb     0x4fb21c
  4fb215:	ff d6                	call   esi
  4fb217:	a1 b0 b9 54 00       	mov    eax,ds:0x54b9b0
  4fb21c:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fb21f:	8b 0c 38             	mov    ecx,DWORD PTR [eax+edi*1]
  4fb222:	8b 15 98 b9 54 00    	mov    edx,DWORD PTR ds:0x54b998
  4fb228:	89 0c 9a             	mov    DWORD PTR [edx+ebx*4],ecx
  4fb22b:	b8 01 00 00 00       	mov    eax,0x1
  4fb230:	66 03 45 e0          	add    ax,WORD PTR [ebp-0x20]
  4fb234:	0f 80 89 52 00 00    	jo     0x5004c3
  4fb23a:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4fb23d:	8b c8                	mov    ecx,eax
  4fb23f:	33 db                	xor    ebx,ebx
  4fb241:	e9 2b ff ff ff       	jmp    0x4fb171
  4fb246:	a1 44 b9 54 00       	mov    eax,ds:0x54b944
  4fb24b:	89 85 c4 fe ff ff    	mov    DWORD PTR [ebp-0x13c],eax
  4fb251:	b8 01 00 00 00       	mov    eax,0x1
  4fb256:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4fb259:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb25f:	66 3b 85 c4 fe ff ff 	cmp    ax,WORD PTR [ebp-0x13c]
  4fb266:	0f 8f 35 02 00 00    	jg     0x4fb4a1
  4fb26c:	8b 15 b0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b0
  4fb272:	3b d3                	cmp    edx,ebx
  4fb274:	74 22                	je     0x4fb298
  4fb276:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fb27a:	75 1c                	jne    0x4fb298
  4fb27c:	0f bf f8             	movsx  edi,ax
  4fb27f:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fb282:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fb285:	72 08                	jb     0x4fb28f
  4fb287:	ff d6                	call   esi
  4fb289:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb28f:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fb296:	eb 0a                	jmp    0x4fb2a2
  4fb298:	ff d6                	call   esi
  4fb29a:	8b d8                	mov    ebx,eax
  4fb29c:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb2a2:	85 c9                	test   ecx,ecx
  4fb2a4:	74 23                	je     0x4fb2c9
  4fb2a6:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fb2aa:	75 1d                	jne    0x4fb2c9
  4fb2ac:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb2b0:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fb2b3:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fb2b6:	72 08                	jb     0x4fb2c0
  4fb2b8:	ff d6                	call   esi
  4fb2ba:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb2c0:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fb2c7:	eb 08                	jmp    0x4fb2d1
  4fb2c9:	ff d6                	call   esi
  4fb2cb:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb2d1:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fb2d4:	8b 3d b0 b9 54 00    	mov    edi,DWORD PTR ds:0x54b9b0
  4fb2da:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4fb2dd:	d9 04 02             	fld    DWORD PTR [edx+eax*1]
  4fb2e0:	d8 0c 1f             	fmul   DWORD PTR [edi+ebx*1]
  4fb2e3:	d8 45 ac             	fadd   DWORD PTR [ebp-0x54]
  4fb2e6:	d9 5d ac             	fstp   DWORD PTR [ebp-0x54]
  4fb2e9:	df e0                	fnstsw ax
  4fb2eb:	a8 0d                	test   al,0xd
  4fb2ed:	0f 85 cb 51 00 00    	jne    0x5004be
  4fb2f3:	a1 b4 b9 54 00       	mov    eax,ds:0x54b9b4
  4fb2f8:	85 c0                	test   eax,eax
  4fb2fa:	74 23                	je     0x4fb31f
  4fb2fc:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fb300:	75 1d                	jne    0x4fb31f
  4fb302:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb306:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fb309:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fb30c:	72 08                	jb     0x4fb316
  4fb30e:	ff d6                	call   esi
  4fb310:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb316:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fb31d:	eb 0a                	jmp    0x4fb329
  4fb31f:	ff d6                	call   esi
  4fb321:	8b d8                	mov    ebx,eax
  4fb323:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb329:	85 c9                	test   ecx,ecx
  4fb32b:	74 23                	je     0x4fb350
  4fb32d:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fb331:	75 1d                	jne    0x4fb350
  4fb333:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb337:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fb33a:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fb33d:	72 08                	jb     0x4fb347
  4fb33f:	ff d6                	call   esi
  4fb341:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb347:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fb34e:	eb 08                	jmp    0x4fb358
  4fb350:	ff d6                	call   esi
  4fb352:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb358:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fb35b:	8b 3d b4 b9 54 00    	mov    edi,DWORD PTR ds:0x54b9b4
  4fb361:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4fb364:	d9 04 02             	fld    DWORD PTR [edx+eax*1]
  4fb367:	d8 0c 1f             	fmul   DWORD PTR [edi+ebx*1]
  4fb36a:	d8 45 dc             	fadd   DWORD PTR [ebp-0x24]
  4fb36d:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  4fb370:	df e0                	fnstsw ax
  4fb372:	a8 0d                	test   al,0xd
  4fb374:	0f 85 44 51 00 00    	jne    0x5004be
  4fb37a:	a1 b8 b9 54 00       	mov    eax,ds:0x54b9b8
  4fb37f:	85 c0                	test   eax,eax
  4fb381:	74 23                	je     0x4fb3a6
  4fb383:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fb387:	75 1d                	jne    0x4fb3a6
  4fb389:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb38d:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fb390:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fb393:	72 08                	jb     0x4fb39d
  4fb395:	ff d6                	call   esi
  4fb397:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb39d:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fb3a4:	eb 0a                	jmp    0x4fb3b0
  4fb3a6:	ff d6                	call   esi
  4fb3a8:	8b d8                	mov    ebx,eax
  4fb3aa:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb3b0:	85 c9                	test   ecx,ecx
  4fb3b2:	74 23                	je     0x4fb3d7
  4fb3b4:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fb3b8:	75 1d                	jne    0x4fb3d7
  4fb3ba:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb3be:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fb3c1:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fb3c4:	72 08                	jb     0x4fb3ce
  4fb3c6:	ff d6                	call   esi
  4fb3c8:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb3ce:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fb3d5:	eb 08                	jmp    0x4fb3df
  4fb3d7:	ff d6                	call   esi
  4fb3d9:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb3df:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fb3e2:	8b 3d b8 b9 54 00    	mov    edi,DWORD PTR ds:0x54b9b8
  4fb3e8:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4fb3eb:	d9 04 02             	fld    DWORD PTR [edx+eax*1]
  4fb3ee:	d8 0c 1f             	fmul   DWORD PTR [edi+ebx*1]
  4fb3f1:	d8 45 d8             	fadd   DWORD PTR [ebp-0x28]
  4fb3f4:	d9 5d d8             	fstp   DWORD PTR [ebp-0x28]
  4fb3f7:	df e0                	fnstsw ax
  4fb3f9:	a8 0d                	test   al,0xd
  4fb3fb:	0f 85 bd 50 00 00    	jne    0x5004be
  4fb401:	a1 bc b9 54 00       	mov    eax,ds:0x54b9bc
  4fb406:	85 c0                	test   eax,eax
  4fb408:	74 23                	je     0x4fb42d
  4fb40a:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fb40e:	75 1d                	jne    0x4fb42d
  4fb410:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb414:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fb417:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fb41a:	72 08                	jb     0x4fb424
  4fb41c:	ff d6                	call   esi
  4fb41e:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb424:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fb42b:	eb 0a                	jmp    0x4fb437
  4fb42d:	ff d6                	call   esi
  4fb42f:	8b d8                	mov    ebx,eax
  4fb431:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb437:	85 c9                	test   ecx,ecx
  4fb439:	74 23                	je     0x4fb45e
  4fb43b:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fb43f:	75 1d                	jne    0x4fb45e
  4fb441:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb445:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fb448:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fb44b:	72 08                	jb     0x4fb455
  4fb44d:	ff d6                	call   esi
  4fb44f:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb455:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fb45c:	eb 08                	jmp    0x4fb466
  4fb45e:	ff d6                	call   esi
  4fb460:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb466:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fb469:	8b 3d bc b9 54 00    	mov    edi,DWORD PTR ds:0x54b9bc
  4fb46f:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4fb472:	d9 04 02             	fld    DWORD PTR [edx+eax*1]
  4fb475:	d8 0c 1f             	fmul   DWORD PTR [edi+ebx*1]
  4fb478:	d8 45 d0             	fadd   DWORD PTR [ebp-0x30]
  4fb47b:	d9 5d d0             	fstp   DWORD PTR [ebp-0x30]
  4fb47e:	df e0                	fnstsw ax
  4fb480:	a8 0d                	test   al,0xd
  4fb482:	0f 85 36 50 00 00    	jne    0x5004be
  4fb488:	b8 01 00 00 00       	mov    eax,0x1
  4fb48d:	66 03 45 e0          	add    ax,WORD PTR [ebp-0x20]
  4fb491:	0f 80 2c 50 00 00    	jo     0x5004c3
  4fb497:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4fb49a:	33 db                	xor    ebx,ebx
  4fb49c:	e9 be fd ff ff       	jmp    0x4fb25f
  4fb4a1:	d9 05 18 b9 54 00    	fld    DWORD PTR ds:0x54b918
  4fb4a7:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb4ae:	75 05                	jne    0x4fb4b5
  4fb4b0:	d8 75 ac             	fdiv   DWORD PTR [ebp-0x54]
  4fb4b3:	eb 08                	jmp    0x4fb4bd
  4fb4b5:	ff 75 ac             	push   DWORD PTR [ebp-0x54]
  4fb4b8:	e8 6b 92 f0 ff       	call   0x404728
  4fb4bd:	d9 1d 0c b1 54 00    	fstp   DWORD PTR ds:0x54b10c
  4fb4c3:	df e0                	fnstsw ax
  4fb4c5:	a8 0d                	test   al,0xd
  4fb4c7:	0f 85 f1 4f 00 00    	jne    0x5004be
  4fb4cd:	d9 05 1c b9 54 00    	fld    DWORD PTR ds:0x54b91c
  4fb4d3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb4da:	75 05                	jne    0x4fb4e1
  4fb4dc:	d8 75 dc             	fdiv   DWORD PTR [ebp-0x24]
  4fb4df:	eb 08                	jmp    0x4fb4e9
  4fb4e1:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
  4fb4e4:	e8 3f 92 f0 ff       	call   0x404728
  4fb4e9:	d9 1d 10 b1 54 00    	fstp   DWORD PTR ds:0x54b110
  4fb4ef:	df e0                	fnstsw ax
  4fb4f1:	a8 0d                	test   al,0xd
  4fb4f3:	0f 85 c5 4f 00 00    	jne    0x5004be
  4fb4f9:	d9 05 20 b9 54 00    	fld    DWORD PTR ds:0x54b920
  4fb4ff:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb506:	75 05                	jne    0x4fb50d
  4fb508:	d8 75 d8             	fdiv   DWORD PTR [ebp-0x28]
  4fb50b:	eb 08                	jmp    0x4fb515
  4fb50d:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
  4fb510:	e8 13 92 f0 ff       	call   0x404728
  4fb515:	d9 1d 14 b1 54 00    	fstp   DWORD PTR ds:0x54b114
  4fb51b:	df e0                	fnstsw ax
  4fb51d:	a8 0d                	test   al,0xd
  4fb51f:	0f 85 99 4f 00 00    	jne    0x5004be
  4fb525:	d9 05 24 b9 54 00    	fld    DWORD PTR ds:0x54b924
  4fb52b:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb532:	75 05                	jne    0x4fb539
  4fb534:	d8 75 d0             	fdiv   DWORD PTR [ebp-0x30]
  4fb537:	eb 08                	jmp    0x4fb541
  4fb539:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
  4fb53c:	e8 e7 91 f0 ff       	call   0x404728
  4fb541:	d9 1d 18 b1 54 00    	fstp   DWORD PTR ds:0x54b118
  4fb547:	df e0                	fnstsw ax
  4fb549:	a8 0d                	test   al,0xd
  4fb54b:	0f 85 6d 4f 00 00    	jne    0x5004be
  4fb551:	eb 06                	jmp    0x4fb559
  4fb553:	8b 35 e8 10 40 00    	mov    esi,DWORD PTR ds:0x4010e8
  4fb559:	d9 05 68 30 40 00    	fld    DWORD PTR ds:0x403068
  4fb55f:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  4fb565:	d8 1d 44 b5 54 00    	fcomp  DWORD PTR ds:0x54b544
  4fb56b:	df e0                	fnstsw ax
  4fb56d:	f6 c4 41             	test   ah,0x41
  4fb570:	75 0a                	jne    0x4fb57c
  4fb572:	c7 05 44 b5 54 00 33 	mov    DWORD PTR ds:0x54b544,0x416b3333
  4fb579:	33 6b 41 
  4fb57c:	d9 05 4c b5 54 00    	fld    DWORD PTR ds:0x54b54c
  4fb582:	d8 0d bc b2 54 00    	fmul   DWORD PTR ds:0x54b2bc
  4fb588:	d8 2d c0 b2 54 00    	fsubr  DWORD PTR ds:0x54b2c0
  4fb58e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb595:	75 08                	jne    0x4fb59f
  4fb597:	d8 35 60 b6 54 00    	fdiv   DWORD PTR ds:0x54b660
  4fb59d:	eb 0b                	jmp    0x4fb5aa
  4fb59f:	ff 35 60 b6 54 00    	push   DWORD PTR ds:0x54b660
  4fb5a5:	e8 7e 91 f0 ff       	call   0x404728
  4fb5aa:	d9 1d 2c bb 54 00    	fstp   DWORD PTR ds:0x54bb2c
  4fb5b0:	df e0                	fnstsw ax
  4fb5b2:	a8 0d                	test   al,0xd
  4fb5b4:	0f 85 04 4f 00 00    	jne    0x5004be
  4fb5ba:	d9 05 4c b5 54 00    	fld    DWORD PTR ds:0x54b54c
  4fb5c0:	d8 0d bc b2 54 00    	fmul   DWORD PTR ds:0x54b2bc
  4fb5c6:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb5cd:	75 08                	jne    0x4fb5d7
  4fb5cf:	d8 35 64 b6 54 00    	fdiv   DWORD PTR ds:0x54b664
  4fb5d5:	eb 0b                	jmp    0x4fb5e2
  4fb5d7:	ff 35 64 b6 54 00    	push   DWORD PTR ds:0x54b664
  4fb5dd:	e8 46 91 f0 ff       	call   0x404728
  4fb5e2:	d9 1d 30 bb 54 00    	fstp   DWORD PTR ds:0x54bb30
  4fb5e8:	df e0                	fnstsw ax
  4fb5ea:	a8 0d                	test   al,0xd
  4fb5ec:	0f 85 cc 4e 00 00    	jne    0x5004be
  4fb5f2:	d9 05 44 b5 54 00    	fld    DWORD PTR ds:0x54b544
  4fb5f8:	d8 25 20 bb 54 00    	fsub   DWORD PTR ds:0x54bb20
  4fb5fe:	d8 0d c0 b2 54 00    	fmul   DWORD PTR ds:0x54b2c0
  4fb604:	df e0                	fnstsw ax
  4fb606:	a8 0d                	test   al,0xd
  4fb608:	0f 85 b0 4e 00 00    	jne    0x5004be
  4fb60e:	d9 05 48 b5 54 00    	fld    DWORD PTR ds:0x54b548
  4fb614:	dc 05 60 30 40 00    	fadd   QWORD PTR ds:0x403060
  4fb61a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb621:	75 04                	jne    0x4fb627
  4fb623:	de f9                	fdivp  st(1),st
  4fb625:	eb 09                	jmp    0x4fb630
  4fb627:	50                   	push   eax
  4fb628:	b0 0d                	mov    al,0xd
  4fb62a:	e8 0b 91 f0 ff       	call   0x40473a
  4fb62f:	58                   	pop    eax
  4fb630:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb637:	75 08                	jne    0x4fb641
  4fb639:	dc 35 58 30 40 00    	fdiv   QWORD PTR ds:0x403058
  4fb63f:	eb 11                	jmp    0x4fb652
  4fb641:	ff 35 5c 30 40 00    	push   DWORD PTR ds:0x40305c
  4fb647:	ff 35 58 30 40 00    	push   DWORD PTR ds:0x403058
  4fb64d:	e8 e2 90 f0 ff       	call   0x404734
  4fb652:	dc 0d 50 30 40 00    	fmul   QWORD PTR ds:0x403050
  4fb658:	d9 1d 34 bb 54 00    	fstp   DWORD PTR ds:0x54bb34
  4fb65e:	df e0                	fnstsw ax
  4fb660:	a8 0d                	test   al,0xd
  4fb662:	0f 85 56 4e 00 00    	jne    0x5004be
  4fb668:	d9 05 14 bb 54 00    	fld    DWORD PTR ds:0x54bb14
  4fb66e:	d8 1d f8 13 40 00    	fcomp  DWORD PTR ds:0x4013f8
  4fb674:	df e0                	fnstsw ax
  4fb676:	f6 c4 41             	test   ah,0x41
  4fb679:	0f 85 43 01 00 00    	jne    0x4fb7c2
  4fb67f:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fb685:	d8 25 8c bf 54 00    	fsub   DWORD PTR ds:0x54bf8c
  4fb68b:	d9 9d 20 ff ff ff    	fstp   DWORD PTR [ebp-0xe0]
  4fb691:	df e0                	fnstsw ax
  4fb693:	a8 0d                	test   al,0xd
  4fb695:	0f 85 23 4e 00 00    	jne    0x5004be
  4fb69b:	8d 85 20 ff ff ff    	lea    eax,[ebp-0xe0]
  4fb6a1:	50                   	push   eax
  4fb6a2:	e8 d9 07 fa ff       	call   0x49be80
  4fb6a7:	d9 9d 1c ff ff ff    	fstp   DWORD PTR [ebp-0xe4]
  4fb6ad:	d9 05 38 b9 54 00    	fld    DWORD PTR ds:0x54b938
  4fb6b3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb6ba:	75 08                	jne    0x4fb6c4
  4fb6bc:	d8 35 18 b3 54 00    	fdiv   DWORD PTR ds:0x54b318
  4fb6c2:	eb 0b                	jmp    0x4fb6cf
  4fb6c4:	ff 35 18 b3 54 00    	push   DWORD PTR ds:0x54b318
  4fb6ca:	e8 59 90 f0 ff       	call   0x404728
  4fb6cf:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  4fb6d5:	d8 a5 1c ff ff ff    	fsub   DWORD PTR [ebp-0xe4]
  4fb6db:	de c9                	fmulp  st(1),st
  4fb6dd:	d9 5d cc             	fstp   DWORD PTR [ebp-0x34]
  4fb6e0:	df e0                	fnstsw ax
  4fb6e2:	a8 0d                	test   al,0xd
  4fb6e4:	0f 85 d4 4d 00 00    	jne    0x5004be
  4fb6ea:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fb6f0:	d8 25 90 bf 54 00    	fsub   DWORD PTR ds:0x54bf90
  4fb6f6:	d9 9d 20 ff ff ff    	fstp   DWORD PTR [ebp-0xe0]
  4fb6fc:	df e0                	fnstsw ax
  4fb6fe:	a8 0d                	test   al,0xd
  4fb700:	0f 85 b8 4d 00 00    	jne    0x5004be
  4fb706:	8d 8d 20 ff ff ff    	lea    ecx,[ebp-0xe0]
  4fb70c:	51                   	push   ecx
  4fb70d:	e8 6e 07 fa ff       	call   0x49be80
  4fb712:	d9 9d 1c ff ff ff    	fstp   DWORD PTR [ebp-0xe4]
  4fb718:	d9 05 3c b9 54 00    	fld    DWORD PTR ds:0x54b93c
  4fb71e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb725:	75 08                	jne    0x4fb72f
  4fb727:	d8 35 18 b3 54 00    	fdiv   DWORD PTR ds:0x54b318
  4fb72d:	eb 0b                	jmp    0x4fb73a
  4fb72f:	ff 35 18 b3 54 00    	push   DWORD PTR ds:0x54b318
  4fb735:	e8 ee 8f f0 ff       	call   0x404728
  4fb73a:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  4fb740:	d8 a5 1c ff ff ff    	fsub   DWORD PTR [ebp-0xe4]
  4fb746:	de c9                	fmulp  st(1),st
  4fb748:	d9 5d b4             	fstp   DWORD PTR [ebp-0x4c]
  4fb74b:	df e0                	fnstsw ax
  4fb74d:	a8 0d                	test   al,0xd
  4fb74f:	0f 85 69 4d 00 00    	jne    0x5004be
  4fb755:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fb75b:	d8 25 94 bf 54 00    	fsub   DWORD PTR ds:0x54bf94
  4fb761:	d9 9d 20 ff ff ff    	fstp   DWORD PTR [ebp-0xe0]
  4fb767:	df e0                	fnstsw ax
  4fb769:	a8 0d                	test   al,0xd
  4fb76b:	0f 85 4d 4d 00 00    	jne    0x5004be
  4fb771:	8d 95 20 ff ff ff    	lea    edx,[ebp-0xe0]
  4fb777:	52                   	push   edx
  4fb778:	e8 03 07 fa ff       	call   0x49be80
  4fb77d:	d9 9d 1c ff ff ff    	fstp   DWORD PTR [ebp-0xe4]
  4fb783:	d9 05 40 b9 54 00    	fld    DWORD PTR ds:0x54b940
  4fb789:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb790:	75 08                	jne    0x4fb79a
  4fb792:	d8 35 18 b3 54 00    	fdiv   DWORD PTR ds:0x54b318
  4fb798:	eb 0b                	jmp    0x4fb7a5
  4fb79a:	ff 35 18 b3 54 00    	push   DWORD PTR ds:0x54b318
  4fb7a0:	e8 83 8f f0 ff       	call   0x404728
  4fb7a5:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  4fb7ab:	d8 a5 1c ff ff ff    	fsub   DWORD PTR [ebp-0xe4]
  4fb7b1:	de c9                	fmulp  st(1),st
  4fb7b3:	d9 5d b8             	fstp   DWORD PTR [ebp-0x48]
  4fb7b6:	df e0                	fnstsw ax
  4fb7b8:	a8 0d                	test   al,0xd
  4fb7ba:	0f 85 fe 4c 00 00    	jne    0x5004be
  4fb7c0:	eb 0e                	jmp    0x4fb7d0
  4fb7c2:	b8 17 b7 d1 38       	mov    eax,0x38d1b717
  4fb7c7:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  4fb7ca:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  4fb7cd:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  4fb7d0:	89 1d b0 b8 54 00    	mov    DWORD PTR ds:0x54b8b0,ebx
  4fb7d6:	89 1d b4 b8 54 00    	mov    DWORD PTR ds:0x54b8b4,ebx
  4fb7dc:	89 1d b8 b8 54 00    	mov    DWORD PTR ds:0x54b8b8,ebx
  4fb7e2:	89 1d bc b8 54 00    	mov    DWORD PTR ds:0x54b8bc,ebx
  4fb7e8:	d9 05 34 bb 54 00    	fld    DWORD PTR ds:0x54bb34
  4fb7ee:	d8 05 2c bb 54 00    	fadd   DWORD PTR ds:0x54bb2c
  4fb7f4:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb7fb:	75 08                	jne    0x4fb805
  4fb7fd:	d8 3d c0 b2 54 00    	fdivr  DWORD PTR ds:0x54b2c0
  4fb803:	eb 0b                	jmp    0x4fb810
  4fb805:	ff 35 c0 b2 54 00    	push   DWORD PTR ds:0x54b2c0
  4fb80b:	e8 36 8f f0 ff       	call   0x404746
  4fb810:	d9 5d c0             	fstp   DWORD PTR [ebp-0x40]
  4fb813:	df e0                	fnstsw ax
  4fb815:	a8 0d                	test   al,0xd
  4fb817:	0f 85 a1 4c 00 00    	jne    0x5004be
  4fb81d:	dd 05 48 30 40 00    	fld    QWORD PTR ds:0x403048
  4fb823:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb82a:	75 08                	jne    0x4fb834
  4fb82c:	dc 35 40 30 40 00    	fdiv   QWORD PTR ds:0x403040
  4fb832:	eb 11                	jmp    0x4fb845
  4fb834:	ff 35 44 30 40 00    	push   DWORD PTR ds:0x403044
  4fb83a:	ff 35 40 30 40 00    	push   DWORD PTR ds:0x403040
  4fb840:	e8 ef 8e f0 ff       	call   0x404734
  4fb845:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fb84c:	75 08                	jne    0x4fb856
  4fb84e:	dc 35 50 30 40 00    	fdiv   QWORD PTR ds:0x403050
  4fb854:	eb 11                	jmp    0x4fb867
  4fb856:	ff 35 54 30 40 00    	push   DWORD PTR ds:0x403054
  4fb85c:	ff 35 50 30 40 00    	push   DWORD PTR ds:0x403050
  4fb862:	e8 cd 8e f0 ff       	call   0x404734
  4fb867:	d9 5d bc             	fstp   DWORD PTR [ebp-0x44]
  4fb86a:	df e0                	fnstsw ax
  4fb86c:	a8 0d                	test   al,0xd
  4fb86e:	0f 85 4a 4c 00 00    	jne    0x5004be
  4fb874:	d9 05 cc b6 54 00    	fld    DWORD PTR ds:0x54b6cc
  4fb87a:	d8 05 c8 b6 54 00    	fadd   DWORD PTR ds:0x54b6c8
  4fb880:	d9 1d 88 ba 54 00    	fstp   DWORD PTR ds:0x54ba88
  4fb886:	df e0                	fnstsw ax
  4fb888:	a8 0d                	test   al,0xd
  4fb88a:	0f 85 2e 4c 00 00    	jne    0x5004be
  4fb890:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  4fb893:	0f bf 07             	movsx  eax,WORD PTR [edi]
  4fb896:	89 85 80 fe ff ff    	mov    DWORD PTR [ebp-0x180],eax
  4fb89c:	db 85 80 fe ff ff    	fild   DWORD PTR [ebp-0x180]
  4fb8a2:	d9 9d 7c fe ff ff    	fstp   DWORD PTR [ebp-0x184]
  4fb8a8:	d9 85 7c fe ff ff    	fld    DWORD PTR [ebp-0x184]
  4fb8ae:	d8 0d 08 b9 54 00    	fmul   DWORD PTR ds:0x54b908
  4fb8b4:	df e0                	fnstsw ax
  4fb8b6:	a8 0d                	test   al,0xd
  4fb8b8:	0f 85 00 4c 00 00    	jne    0x5004be
  4fb8be:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  4fb8c4:	d8 1d 88 ba 54 00    	fcomp  DWORD PTR ds:0x54ba88
  4fb8ca:	df e0                	fnstsw ax
  4fb8cc:	f6 c4 41             	test   ah,0x41
  4fb8cf:	75 31                	jne    0x4fb902
  4fb8d1:	0f bf 0f             	movsx  ecx,WORD PTR [edi]
  4fb8d4:	89 8d 78 fe ff ff    	mov    DWORD PTR [ebp-0x188],ecx
  4fb8da:	db 85 78 fe ff ff    	fild   DWORD PTR [ebp-0x188]
  4fb8e0:	d9 9d 74 fe ff ff    	fstp   DWORD PTR [ebp-0x18c]
  4fb8e6:	d9 85 74 fe ff ff    	fld    DWORD PTR [ebp-0x18c]
  4fb8ec:	d8 0d 08 b9 54 00    	fmul   DWORD PTR ds:0x54b908
  4fb8f2:	d9 1d 88 ba 54 00    	fstp   DWORD PTR ds:0x54ba88
  4fb8f8:	df e0                	fnstsw ax
  4fb8fa:	a8 0d                	test   al,0xd
  4fb8fc:	0f 85 bc 4b 00 00    	jne    0x5004be
  4fb902:	c7 45 e0 01 00 00 00 	mov    DWORD PTR [ebp-0x20],0x1
  4fb909:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fb90f:	b8 05 00 00 00       	mov    eax,0x5
  4fb914:	66 39 45 e0          	cmp    WORD PTR [ebp-0x20],ax
  4fb918:	0f 8f 36 1b 00 00    	jg     0x4fd454
  4fb91e:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fb924:	3b cb                	cmp    ecx,ebx
  4fb926:	74 23                	je     0x4fb94b
  4fb928:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fb92c:	75 1d                	jne    0x4fb94b
  4fb92e:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb932:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fb935:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fb938:	72 08                	jb     0x4fb942
  4fb93a:	ff d6                	call   esi
  4fb93c:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fb942:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fb949:	eb 08                	jmp    0x4fb953
  4fb94b:	ff d6                	call   esi
  4fb94d:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fb953:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fb956:	d9 04 02             	fld    DWORD PTR [edx+eax*1]
  4fb959:	d9 e0                	fchs
  4fb95b:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fb961:	d8 25 4c b4 54 00    	fsub   DWORD PTR ds:0x54b44c
  4fb967:	de c9                	fmulp  st(1),st
  4fb969:	df e0                	fnstsw ax
  4fb96b:	a8 0d                	test   al,0xd
  4fb96d:	0f 85 4b 4b 00 00    	jne    0x5004be
  4fb973:	83 ec 08             	sub    esp,0x8
  4fb976:	dd 1c 24             	fstp   QWORD PTR [esp]
  4fb979:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  4fb97f:	dd 9d 14 ff ff ff    	fstp   QWORD PTR [ebp-0xec]
  4fb985:	a1 58 b9 54 00       	mov    eax,ds:0x54b958
  4fb98a:	3b c3                	cmp    eax,ebx
  4fb98c:	74 23                	je     0x4fb9b1
  4fb98e:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fb992:	75 1d                	jne    0x4fb9b1
  4fb994:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb998:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fb99b:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fb9a1:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fb9a4:	72 02                	jb     0x4fb9a8
  4fb9a6:	ff d6                	call   esi
  4fb9a8:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fb9af:	eb 04                	jmp    0x4fb9b5
  4fb9b1:	ff d6                	call   esi
  4fb9b3:	8b d8                	mov    ebx,eax
  4fb9b5:	8b 0d 60 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b960
  4fb9bb:	85 c9                	test   ecx,ecx
  4fb9bd:	74 23                	je     0x4fb9e2
  4fb9bf:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fb9c3:	75 1d                	jne    0x4fb9e2
  4fb9c5:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fb9c9:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fb9cc:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fb9cf:	72 08                	jb     0x4fb9d9
  4fb9d1:	ff d6                	call   esi
  4fb9d3:	8b 0d 60 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b960
  4fb9d9:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fb9e0:	eb 0a                	jmp    0x4fb9ec
  4fb9e2:	ff d6                	call   esi
  4fb9e4:	8b d0                	mov    edx,eax
  4fb9e6:	8b 0d 60 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b960
  4fb9ec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4fb9ef:	66 8b 00             	mov    ax,WORD PTR [eax]
  4fb9f2:	0f bf f8             	movsx  edi,ax
  4fb9f5:	89 bd 70 fe ff ff    	mov    DWORD PTR [ebp-0x190],edi
  4fb9fb:	db 85 70 fe ff ff    	fild   DWORD PTR [ebp-0x190]
  4fba01:	dd 9d 68 fe ff ff    	fstp   QWORD PTR [ebp-0x198]
  4fba07:	dd 85 68 fe ff ff    	fld    QWORD PTR [ebp-0x198]
  4fba0d:	dc 8d 14 ff ff ff    	fmul   QWORD PTR [ebp-0xec]
  4fba13:	66 bf 01 00          	mov    di,0x1
  4fba17:	66 2b f8             	sub    di,ax
  4fba1a:	0f 80 a3 4a 00 00    	jo     0x5004c3
  4fba20:	0f bf c7             	movsx  eax,di
  4fba23:	89 85 64 fe ff ff    	mov    DWORD PTR [ebp-0x19c],eax
  4fba29:	db 85 64 fe ff ff    	fild   DWORD PTR [ebp-0x19c]
  4fba2f:	dd 9d 5c fe ff ff    	fstp   QWORD PTR [ebp-0x1a4]
  4fba35:	dc 85 5c fe ff ff    	fadd   QWORD PTR [ebp-0x1a4]
  4fba3b:	a1 58 b9 54 00       	mov    eax,ds:0x54b958
  4fba40:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fba43:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fba46:	d9 9d 58 fe ff ff    	fstp   DWORD PTR [ebp-0x1a8]
  4fba4c:	df e0                	fnstsw ax
  4fba4e:	a8 0d                	test   al,0xd
  4fba50:	0f 85 68 4a 00 00    	jne    0x5004be
  4fba56:	d9 85 58 fe ff ff    	fld    DWORD PTR [ebp-0x1a8]
  4fba5c:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fba5f:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fba62:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4fba65:	66 83 3a 00          	cmp    WORD PTR [edx],0x0
  4fba69:	0f 85 23 01 00 00    	jne    0x4fbb92
  4fba6f:	a1 58 b9 54 00       	mov    eax,ds:0x54b958
  4fba74:	85 c0                	test   eax,eax
  4fba76:	74 1d                	je     0x4fba95
  4fba78:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fba7c:	75 17                	jne    0x4fba95
  4fba7e:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fba82:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fba85:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fba88:	72 02                	jb     0x4fba8c
  4fba8a:	ff d6                	call   esi
  4fba8c:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fba93:	eb 02                	jmp    0x4fba97
  4fba95:	ff d6                	call   esi
  4fba97:	89 85 54 fe ff ff    	mov    DWORD PTR [ebp-0x1ac],eax
  4fba9d:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fbaa2:	85 c0                	test   eax,eax
  4fbaa4:	74 23                	je     0x4fbac9
  4fbaa6:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fbaaa:	75 1d                	jne    0x4fbac9
  4fbaac:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fbab0:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fbab3:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fbab9:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fbabc:	72 02                	jb     0x4fbac0
  4fbabe:	ff d6                	call   esi
  4fbac0:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fbac7:	eb 04                	jmp    0x4fbacd
  4fbac9:	ff d6                	call   esi
  4fbacb:	8b d8                	mov    ebx,eax
  4fbacd:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fbad3:	85 c9                	test   ecx,ecx
  4fbad5:	74 23                	je     0x4fbafa
  4fbad7:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fbadb:	75 1d                	jne    0x4fbafa
  4fbadd:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fbae1:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fbae4:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fbae7:	72 08                	jb     0x4fbaf1
  4fbae9:	ff d6                	call   esi
  4fbaeb:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fbaf1:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fbaf8:	eb 0a                	jmp    0x4fbb04
  4fbafa:	ff d6                	call   esi
  4fbafc:	8b d0                	mov    edx,eax
  4fbafe:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fbb04:	a1 58 b9 54 00       	mov    eax,ds:0x54b958
  4fbb09:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fbb0c:	d9 05 bc b4 54 00    	fld    DWORD PTR ds:0x54b4bc
  4fbb12:	8b bd 54 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1ac]
  4fbb18:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fbb1b:	d8 0d a0 b8 54 00    	fmul   DWORD PTR ds:0x54b8a0
  4fbb21:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fbb28:	75 08                	jne    0x4fbb32
  4fbb2a:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  4fbb30:	eb 0b                	jmp    0x4fbb3d
  4fbb32:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  4fbb38:	e8 eb 8b f0 ff       	call   0x404728
  4fbb3d:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4fbb40:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fbb47:	75 08                	jne    0x4fbb51
  4fbb49:	d8 35 38 bb 54 00    	fdiv   DWORD PTR ds:0x54bb38
  4fbb4f:	eb 0b                	jmp    0x4fbb5c
  4fbb51:	ff 35 38 bb 54 00    	push   DWORD PTR ds:0x54bb38
  4fbb57:	e8 cc 8b f0 ff       	call   0x404728
  4fbb5c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fbb63:	75 05                	jne    0x4fbb6a
  4fbb65:	d8 75 d4             	fdiv   DWORD PTR [ebp-0x2c]
  4fbb68:	eb 08                	jmp    0x4fbb72
  4fbb6a:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
  4fbb6d:	e8 b6 8b f0 ff       	call   0x404728
  4fbb72:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fbb77:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fbb7a:	d8 04 18             	fadd   DWORD PTR [eax+ebx*1]
  4fbb7d:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fbb80:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fbb83:	df e0                	fnstsw ax
  4fbb85:	a8 0d                	test   al,0xd
  4fbb87:	0f 85 31 49 00 00    	jne    0x5004be
  4fbb8d:	e9 c7 02 00 00       	jmp    0x4fbe59
  4fbb92:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fbb98:	85 c9                	test   ecx,ecx
  4fbb9a:	74 25                	je     0x4fbbc1
  4fbb9c:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fbba0:	75 1f                	jne    0x4fbbc1
  4fbba2:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fbba5:	0f bf fb             	movsx  edi,bx
  4fbba8:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fbbab:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fbbae:	72 08                	jb     0x4fbbb8
  4fbbb0:	ff d6                	call   esi
  4fbbb2:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fbbb8:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fbbbf:	eb 0b                	jmp    0x4fbbcc
  4fbbc1:	ff d6                	call   esi
  4fbbc3:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fbbc9:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fbbcc:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fbbcf:	d9 04 02             	fld    DWORD PTR [edx+eax*1]
  4fbbd2:	d9 e0                	fchs
  4fbbd4:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fbbda:	d8 25 4c b4 54 00    	fsub   DWORD PTR ds:0x54b44c
  4fbbe0:	de c9                	fmulp  st(1),st
  4fbbe2:	df e0                	fnstsw ax
  4fbbe4:	a8 0d                	test   al,0xd
  4fbbe6:	0f 85 d2 48 00 00    	jne    0x5004be
  4fbbec:	83 ec 08             	sub    esp,0x8
  4fbbef:	dd 1c 24             	fstp   QWORD PTR [esp]
  4fbbf2:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  4fbbf8:	dd 9d 14 ff ff ff    	fstp   QWORD PTR [ebp-0xec]
  4fbbfe:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fbc04:	85 c9                	test   ecx,ecx
  4fbc06:	74 22                	je     0x4fbc2a
  4fbc08:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fbc0c:	75 1c                	jne    0x4fbc2a
  4fbc0e:	0f bf fb             	movsx  edi,bx
  4fbc11:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fbc14:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fbc17:	72 08                	jb     0x4fbc21
  4fbc19:	ff d6                	call   esi
  4fbc1b:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fbc21:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fbc28:	eb 08                	jmp    0x4fbc32
  4fbc2a:	ff d6                	call   esi
  4fbc2c:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fbc32:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fbc35:	d9 04 01             	fld    DWORD PTR [ecx+eax*1]
  4fbc38:	d9 e0                	fchs
  4fbc3a:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fbc40:	d8 25 4c b4 54 00    	fsub   DWORD PTR ds:0x54b44c
  4fbc46:	de c9                	fmulp  st(1),st
  4fbc48:	df e0                	fnstsw ax
  4fbc4a:	a8 0d                	test   al,0xd
  4fbc4c:	0f 85 6c 48 00 00    	jne    0x5004be
  4fbc52:	83 ec 08             	sub    esp,0x8
  4fbc55:	dd 1c 24             	fstp   QWORD PTR [esp]
  4fbc58:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  4fbc5e:	dd 9d 0c ff ff ff    	fstp   QWORD PTR [ebp-0xf4]
  4fbc64:	a1 60 b9 54 00       	mov    eax,ds:0x54b960
  4fbc69:	85 c0                	test   eax,eax
  4fbc6b:	74 22                	je     0x4fbc8f
  4fbc6d:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fbc71:	75 1c                	jne    0x4fbc8f
  4fbc73:	0f bf fb             	movsx  edi,bx
  4fbc76:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fbc79:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fbc7c:	72 02                	jb     0x4fbc80
  4fbc7e:	ff d6                	call   esi
  4fbc80:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fbc87:	89 95 50 fe ff ff    	mov    DWORD PTR [ebp-0x1b0],edx
  4fbc8d:	eb 08                	jmp    0x4fbc97
  4fbc8f:	ff d6                	call   esi
  4fbc91:	89 85 50 fe ff ff    	mov    DWORD PTR [ebp-0x1b0],eax
  4fbc97:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fbc9c:	85 c0                	test   eax,eax
  4fbc9e:	74 1c                	je     0x4fbcbc
  4fbca0:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fbca4:	75 16                	jne    0x4fbcbc
  4fbca6:	0f bf fb             	movsx  edi,bx
  4fbca9:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fbcac:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fbcaf:	72 02                	jb     0x4fbcb3
  4fbcb1:	ff d6                	call   esi
  4fbcb3:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fbcba:	eb 02                	jmp    0x4fbcbe
  4fbcbc:	ff d6                	call   esi
  4fbcbe:	89 85 4c fe ff ff    	mov    DWORD PTR [ebp-0x1b4],eax
  4fbcc4:	a1 5c b9 54 00       	mov    eax,ds:0x54b95c
  4fbcc9:	85 c0                	test   eax,eax
  4fbccb:	74 22                	je     0x4fbcef
  4fbccd:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fbcd1:	75 1c                	jne    0x4fbcef
  4fbcd3:	0f bf fb             	movsx  edi,bx
  4fbcd6:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fbcd9:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fbcdc:	72 02                	jb     0x4fbce0
  4fbcde:	ff d6                	call   esi
  4fbce0:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fbce7:	89 8d 48 fe ff ff    	mov    DWORD PTR [ebp-0x1b8],ecx
  4fbced:	eb 08                	jmp    0x4fbcf7
  4fbcef:	ff d6                	call   esi
  4fbcf1:	89 85 48 fe ff ff    	mov    DWORD PTR [ebp-0x1b8],eax
  4fbcf7:	a1 54 b9 54 00       	mov    eax,ds:0x54b954
  4fbcfc:	85 c0                	test   eax,eax
  4fbcfe:	74 1c                	je     0x4fbd1c
  4fbd00:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fbd04:	75 16                	jne    0x4fbd1c
  4fbd06:	0f bf fb             	movsx  edi,bx
  4fbd09:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fbd0c:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fbd0f:	72 02                	jb     0x4fbd13
  4fbd11:	ff d6                	call   esi
  4fbd13:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fbd1a:	eb 04                	jmp    0x4fbd20
  4fbd1c:	ff d6                	call   esi
  4fbd1e:	8b d8                	mov    ebx,eax
  4fbd20:	8b 15 64 b9 54 00    	mov    edx,DWORD PTR ds:0x54b964
  4fbd26:	85 d2                	test   edx,edx
  4fbd28:	74 29                	je     0x4fbd53
  4fbd2a:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fbd2e:	75 23                	jne    0x4fbd53
  4fbd30:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fbd34:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fbd37:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fbd3d:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fbd40:	72 08                	jb     0x4fbd4a
  4fbd42:	ff d6                	call   esi
  4fbd44:	8b 15 64 b9 54 00    	mov    edx,DWORD PTR ds:0x54b964
  4fbd4a:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fbd51:	eb 0a                	jmp    0x4fbd5d
  4fbd53:	ff d6                	call   esi
  4fbd55:	8b c8                	mov    ecx,eax
  4fbd57:	8b 15 64 b9 54 00    	mov    edx,DWORD PTR ds:0x54b964
  4fbd5d:	a1 60 b9 54 00       	mov    eax,ds:0x54b960
  4fbd62:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fbd65:	d9 05 bc b4 54 00    	fld    DWORD PTR ds:0x54b4bc
  4fbd6b:	8b bd 50 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1b0]
  4fbd71:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fbd74:	d8 0d a0 b8 54 00    	fmul   DWORD PTR ds:0x54b8a0
  4fbd7a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fbd81:	75 08                	jne    0x4fbd8b
  4fbd83:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  4fbd89:	eb 0b                	jmp    0x4fbd96
  4fbd8b:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  4fbd91:	e8 92 89 f0 ff       	call   0x404728
  4fbd96:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4fbd99:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fbda0:	75 08                	jne    0x4fbdaa
  4fbda2:	d8 35 38 bb 54 00    	fdiv   DWORD PTR ds:0x54bb38
  4fbda8:	eb 0b                	jmp    0x4fbdb5
  4fbdaa:	ff 35 38 bb 54 00    	push   DWORD PTR ds:0x54bb38
  4fbdb0:	e8 73 89 f0 ff       	call   0x404728
  4fbdb5:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fbdbc:	75 05                	jne    0x4fbdc3
  4fbdbe:	d8 75 d4             	fdiv   DWORD PTR [ebp-0x2c]
  4fbdc1:	eb 08                	jmp    0x4fbdcb
  4fbdc3:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
  4fbdc6:	e8 5d 89 f0 ff       	call   0x404728
  4fbdcb:	df e0                	fnstsw ax
  4fbdcd:	a8 0d                	test   al,0xd
  4fbdcf:	0f 85 e9 46 00 00    	jne    0x5004be
  4fbdd5:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fbdda:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fbddd:	8b bd 4c fe ff ff    	mov    edi,DWORD PTR [ebp-0x1b4]
  4fbde3:	d9 04 38             	fld    DWORD PTR [eax+edi*1]
  4fbde6:	dc 8d 14 ff ff ff    	fmul   QWORD PTR [ebp-0xec]
  4fbdec:	de c1                	faddp  st(1),st
  4fbdee:	a1 5c b9 54 00       	mov    eax,ds:0x54b95c
  4fbdf3:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fbdf6:	d9 05 f0 b8 54 00    	fld    DWORD PTR ds:0x54b8f0
  4fbdfc:	8b bd 48 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1b8]
  4fbe02:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fbe05:	df e0                	fnstsw ax
  4fbe07:	a8 0d                	test   al,0xd
  4fbe09:	0f 85 af 46 00 00    	jne    0x5004be
  4fbe0f:	dd 05 38 30 40 00    	fld    QWORD PTR ds:0x403038
  4fbe15:	dc a5 0c ff ff ff    	fsub   QWORD PTR [ebp-0xf4]
  4fbe1b:	de c9                	fmulp  st(1),st
  4fbe1d:	a1 54 b9 54 00       	mov    eax,ds:0x54b954
  4fbe22:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fbe25:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fbe2c:	75 05                	jne    0x4fbe33
  4fbe2e:	d8 34 18             	fdiv   DWORD PTR [eax+ebx*1]
  4fbe31:	eb 08                	jmp    0x4fbe3b
  4fbe33:	ff 34 18             	push   DWORD PTR [eax+ebx*1]
  4fbe36:	e8 ed 88 f0 ff       	call   0x404728
  4fbe3b:	de c1                	faddp  st(1),st
  4fbe3d:	d9 9d 44 fe ff ff    	fstp   DWORD PTR [ebp-0x1bc]
  4fbe43:	df e0                	fnstsw ax
  4fbe45:	a8 0d                	test   al,0xd
  4fbe47:	0f 85 71 46 00 00    	jne    0x5004be
  4fbe4d:	d9 85 44 fe ff ff    	fld    DWORD PTR [ebp-0x1bc]
  4fbe53:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fbe56:	d9 1c 0a             	fstp   DWORD PTR [edx+ecx*1]
  4fbe59:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbe5e:	85 c0                	test   eax,eax
  4fbe60:	74 2a                	je     0x4fbe8c
  4fbe62:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fbe66:	75 24                	jne    0x4fbe8c
  4fbe68:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fbe6b:	0f bf fb             	movsx  edi,bx
  4fbe6e:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fbe71:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fbe74:	72 07                	jb     0x4fbe7d
  4fbe76:	ff d6                	call   esi
  4fbe78:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbe7d:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fbe84:	89 8d 40 fe ff ff    	mov    DWORD PTR [ebp-0x1c0],ecx
  4fbe8a:	eb 10                	jmp    0x4fbe9c
  4fbe8c:	ff d6                	call   esi
  4fbe8e:	89 85 40 fe ff ff    	mov    DWORD PTR [ebp-0x1c0],eax
  4fbe94:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbe99:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fbe9c:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fbea2:	85 c9                	test   ecx,ecx
  4fbea4:	74 2d                	je     0x4fbed3
  4fbea6:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fbeaa:	75 27                	jne    0x4fbed3
  4fbeac:	0f bf fb             	movsx  edi,bx
  4fbeaf:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fbeb2:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fbeb8:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fbebb:	72 07                	jb     0x4fbec4
  4fbebd:	ff d6                	call   esi
  4fbebf:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbec4:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fbecb:	89 95 3c fe ff ff    	mov    DWORD PTR [ebp-0x1c4],edx
  4fbed1:	eb 0d                	jmp    0x4fbee0
  4fbed3:	ff d6                	call   esi
  4fbed5:	89 85 3c fe ff ff    	mov    DWORD PTR [ebp-0x1c4],eax
  4fbedb:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbee0:	85 c0                	test   eax,eax
  4fbee2:	74 21                	je     0x4fbf05
  4fbee4:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fbee8:	75 1b                	jne    0x4fbf05
  4fbeea:	0f bf fb             	movsx  edi,bx
  4fbeed:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fbef0:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fbef3:	72 07                	jb     0x4fbefc
  4fbef5:	ff d6                	call   esi
  4fbef7:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbefc:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fbf03:	eb 09                	jmp    0x4fbf0e
  4fbf05:	ff d6                	call   esi
  4fbf07:	8b d8                	mov    ebx,eax
  4fbf09:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbf0e:	85 c0                	test   eax,eax
  4fbf10:	74 22                	je     0x4fbf34
  4fbf12:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fbf16:	75 1c                	jne    0x4fbf34
  4fbf18:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fbf1c:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fbf1f:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fbf22:	72 07                	jb     0x4fbf2b
  4fbf24:	ff d6                	call   esi
  4fbf26:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbf2b:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fbf32:	eb 09                	jmp    0x4fbf3d
  4fbf34:	ff d6                	call   esi
  4fbf36:	8b d0                	mov    edx,eax
  4fbf38:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbf3d:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4fbf40:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fbf45:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fbf48:	d9 05 88 ba 54 00    	fld    DWORD PTR ds:0x54ba88
  4fbf4e:	8b bd 3c fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c4]
  4fbf54:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fbf57:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fbf5d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fbf64:	75 08                	jne    0x4fbf6e
  4fbf66:	d8 35 a4 b1 54 00    	fdiv   DWORD PTR ds:0x54b1a4
  4fbf6c:	eb 0b                	jmp    0x4fbf79
  4fbf6e:	ff 35 a4 b1 54 00    	push   DWORD PTR ds:0x54b1a4
  4fbf74:	e8 af 87 f0 ff       	call   0x404728
  4fbf79:	d8 0d e4 b8 54 00    	fmul   DWORD PTR ds:0x54b8e4
  4fbf7f:	8b 85 40 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1c0]
  4fbf85:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4fbf88:	d9 05 54 bb 54 00    	fld    DWORD PTR ds:0x54bb54
  4fbf8e:	d8 05 a4 bb 54 00    	fadd   DWORD PTR ds:0x54bba4
  4fbf94:	d8 05 7c b8 54 00    	fadd   DWORD PTR ds:0x54b87c
  4fbf9a:	d8 0c 19             	fmul   DWORD PTR [ecx+ebx*1]
  4fbf9d:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fbfa3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fbfaa:	75 08                	jne    0x4fbfb4
  4fbfac:	d8 35 a4 b1 54 00    	fdiv   DWORD PTR ds:0x54b1a4
  4fbfb2:	eb 0b                	jmp    0x4fbfbf
  4fbfb4:	ff 35 a4 b1 54 00    	push   DWORD PTR ds:0x54b1a4
  4fbfba:	e8 69 87 f0 ff       	call   0x404728
  4fbfbf:	de e9                	fsubp  st(1),st
  4fbfc1:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fbfc4:	df e0                	fnstsw ax
  4fbfc6:	a8 0d                	test   al,0xd
  4fbfc8:	0f 85 f0 44 00 00    	jne    0x5004be
  4fbfce:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fbfd3:	85 c0                	test   eax,eax
  4fbfd5:	74 1d                	je     0x4fbff4
  4fbfd7:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fbfdb:	75 17                	jne    0x4fbff4
  4fbfdd:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fbfe1:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fbfe4:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fbfe7:	72 02                	jb     0x4fbfeb
  4fbfe9:	ff d6                	call   esi
  4fbfeb:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fbff2:	eb 04                	jmp    0x4fbff8
  4fbff4:	ff d6                	call   esi
  4fbff6:	8b d8                	mov    ebx,eax
  4fbff8:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fbffd:	85 c0                	test   eax,eax
  4fbfff:	74 1d                	je     0x4fc01e
  4fc001:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc005:	75 17                	jne    0x4fc01e
  4fc007:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fc00b:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc00e:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc011:	72 02                	jb     0x4fc015
  4fc013:	ff d6                	call   esi
  4fc015:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fc01c:	eb 02                	jmp    0x4fc020
  4fc01e:	ff d6                	call   esi
  4fc020:	8b 0d 68 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b968
  4fc026:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fc029:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fc02f:	8b 79 0c             	mov    edi,DWORD PTR [ecx+0xc]
  4fc032:	d9 04 1a             	fld    DWORD PTR [edx+ebx*1]
  4fc035:	d8 1c 07             	fcomp  DWORD PTR [edi+eax*1]
  4fc038:	df e0                	fnstsw ax
  4fc03a:	f6 c4 41             	test   ah,0x41
  4fc03d:	75 65                	jne    0x4fc0a4
  4fc03f:	85 c9                	test   ecx,ecx
  4fc041:	74 1d                	je     0x4fc060
  4fc043:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fc047:	75 17                	jne    0x4fc060
  4fc049:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fc04d:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fc050:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fc053:	72 02                	jb     0x4fc057
  4fc055:	ff d6                	call   esi
  4fc057:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fc05e:	eb 04                	jmp    0x4fc064
  4fc060:	ff d6                	call   esi
  4fc062:	8b d8                	mov    ebx,eax
  4fc064:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fc069:	85 c0                	test   eax,eax
  4fc06b:	74 1d                	je     0x4fc08a
  4fc06d:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc071:	75 17                	jne    0x4fc08a
  4fc073:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fc077:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc07a:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc07d:	72 02                	jb     0x4fc081
  4fc07f:	ff d6                	call   esi
  4fc081:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fc088:	eb 02                	jmp    0x4fc08c
  4fc08a:	ff d6                	call   esi
  4fc08c:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fc092:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fc095:	8b 0d 68 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b968
  4fc09b:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fc09e:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4fc0a1:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4fc0a4:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fc0a8:	89 bd 38 fe ff ff    	mov    DWORD PTR [ebp-0x1c8],edi
  4fc0ae:	4f                   	dec    edi
  4fc0af:	83 ff 05             	cmp    edi,0x5
  4fc0b2:	72 02                	jb     0x4fc0b6
  4fc0b4:	ff d6                	call   esi
  4fc0b6:	8b c7                	mov    eax,edi
  4fc0b8:	89 85 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],eax
  4fc0be:	83 f8 05             	cmp    eax,0x5
  4fc0c1:	72 02                	jb     0x4fc0c5
  4fc0c3:	ff d6                	call   esi
  4fc0c5:	83 ff 05             	cmp    edi,0x5
  4fc0c8:	72 02                	jb     0x4fc0cc
  4fc0ca:	ff d6                	call   esi
  4fc0cc:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fc0d1:	85 c0                	test   eax,eax
  4fc0d3:	74 1f                	je     0x4fc0f4
  4fc0d5:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc0d9:	75 19                	jne    0x4fc0f4
  4fc0db:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fc0e1:	2b 58 14             	sub    ebx,DWORD PTR [eax+0x14]
  4fc0e4:	3b 58 10             	cmp    ebx,DWORD PTR [eax+0x10]
  4fc0e7:	72 02                	jb     0x4fc0eb
  4fc0e9:	ff d6                	call   esi
  4fc0eb:	8d 04 9d 00 00 00 00 	lea    eax,[ebx*4+0x0]
  4fc0f2:	eb 02                	jmp    0x4fc0f6
  4fc0f4:	ff d6                	call   esi
  4fc0f6:	89 85 34 fe ff ff    	mov    DWORD PTR [ebp-0x1cc],eax
  4fc0fc:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fc101:	85 c0                	test   eax,eax
  4fc103:	74 25                	je     0x4fc12a
  4fc105:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc109:	75 1f                	jne    0x4fc12a
  4fc10b:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fc111:	2b 58 14             	sub    ebx,DWORD PTR [eax+0x14]
  4fc114:	3b 58 10             	cmp    ebx,DWORD PTR [eax+0x10]
  4fc117:	72 02                	jb     0x4fc11b
  4fc119:	ff d6                	call   esi
  4fc11b:	8d 0c 9d 00 00 00 00 	lea    ecx,[ebx*4+0x0]
  4fc122:	89 8d 30 fe ff ff    	mov    DWORD PTR [ebp-0x1d0],ecx
  4fc128:	eb 08                	jmp    0x4fc132
  4fc12a:	ff d6                	call   esi
  4fc12c:	89 85 30 fe ff ff    	mov    DWORD PTR [ebp-0x1d0],eax
  4fc132:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fc137:	85 c0                	test   eax,eax
  4fc139:	74 1b                	je     0x4fc156
  4fc13b:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc13f:	75 15                	jne    0x4fc156
  4fc141:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fc147:	2b 58 14             	sub    ebx,DWORD PTR [eax+0x14]
  4fc14a:	3b 58 10             	cmp    ebx,DWORD PTR [eax+0x10]
  4fc14d:	72 02                	jb     0x4fc151
  4fc14f:	ff d6                	call   esi
  4fc151:	c1 e3 02             	shl    ebx,0x2
  4fc154:	eb 04                	jmp    0x4fc15a
  4fc156:	ff d6                	call   esi
  4fc158:	8b d8                	mov    ebx,eax
  4fc15a:	83 ff 05             	cmp    edi,0x5
  4fc15d:	72 02                	jb     0x4fc161
  4fc15f:	ff d6                	call   esi
  4fc161:	d9 05 30 b9 54 00    	fld    DWORD PTR ds:0x54b930
  4fc167:	d8 4d b4             	fmul   DWORD PTR [ebp-0x4c]
  4fc16a:	d9 05 2c b9 54 00    	fld    DWORD PTR ds:0x54b92c
  4fc170:	d8 4d cc             	fmul   DWORD PTR [ebp-0x34]
  4fc173:	de c1                	faddp  st(1),st
  4fc175:	d9 05 34 b9 54 00    	fld    DWORD PTR ds:0x54b934
  4fc17b:	d8 4d b8             	fmul   DWORD PTR [ebp-0x48]
  4fc17e:	de c1                	faddp  st(1),st
  4fc180:	d9 05 50 b7 54 00    	fld    DWORD PTR ds:0x54b750
  4fc186:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc18d:	75 08                	jne    0x4fc197
  4fc18f:	d8 35 cc b2 54 00    	fdiv   DWORD PTR ds:0x54b2cc
  4fc195:	eb 0b                	jmp    0x4fc1a2
  4fc197:	ff 35 cc b2 54 00    	push   DWORD PTR ds:0x54b2cc
  4fc19d:	e8 86 85 f0 ff       	call   0x404728
  4fc1a2:	d8 0d a8 b8 54 00    	fmul   DWORD PTR ds:0x54b8a8
  4fc1a8:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc1af:	75 08                	jne    0x4fc1b9
  4fc1b1:	d8 35 c0 b2 54 00    	fdiv   DWORD PTR ds:0x54b2c0
  4fc1b7:	eb 0b                	jmp    0x4fc1c4
  4fc1b9:	ff 35 c0 b2 54 00    	push   DWORD PTR ds:0x54b2c0
  4fc1bf:	e8 64 85 f0 ff       	call   0x404728
  4fc1c4:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc1cb:	75 05                	jne    0x4fc1d2
  4fc1cd:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fc1d0:	eb 08                	jmp    0x4fc1da
  4fc1d2:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fc1d5:	e8 4e 85 f0 ff       	call   0x404728
  4fc1da:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4fc1dd:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc1e4:	75 08                	jne    0x4fc1ee
  4fc1e6:	d8 35 90 b8 54 00    	fdiv   DWORD PTR ds:0x54b890
  4fc1ec:	eb 0b                	jmp    0x4fc1f9
  4fc1ee:	ff 35 90 b8 54 00    	push   DWORD PTR ds:0x54b890
  4fc1f4:	e8 2f 85 f0 ff       	call   0x404728
  4fc1f9:	de c1                	faddp  st(1),st
  4fc1fb:	8b 0d 7c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b97c
  4fc201:	8b 95 00 ff ff ff    	mov    edx,DWORD PTR [ebp-0x100]
  4fc207:	d8 0c 91             	fmul   DWORD PTR [ecx+edx*4]
  4fc20a:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fc210:	d8 2c b9             	fsubr  DWORD PTR [ecx+edi*4]
  4fc213:	d9 05 50 b7 54 00    	fld    DWORD PTR ds:0x54b750
  4fc219:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc220:	75 08                	jne    0x4fc22a
  4fc222:	d8 35 cc b2 54 00    	fdiv   DWORD PTR ds:0x54b2cc
  4fc228:	eb 0b                	jmp    0x4fc235
  4fc22a:	ff 35 cc b2 54 00    	push   DWORD PTR ds:0x54b2cc
  4fc230:	e8 f3 84 f0 ff       	call   0x404728
  4fc235:	d8 0d a8 b8 54 00    	fmul   DWORD PTR ds:0x54b8a8
  4fc23b:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc242:	75 08                	jne    0x4fc24c
  4fc244:	d8 35 c0 b2 54 00    	fdiv   DWORD PTR ds:0x54b2c0
  4fc24a:	eb 0b                	jmp    0x4fc257
  4fc24c:	ff 35 c0 b2 54 00    	push   DWORD PTR ds:0x54b2c0
  4fc252:	e8 d1 84 f0 ff       	call   0x404728
  4fc257:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc25e:	75 05                	jne    0x4fc265
  4fc260:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fc263:	eb 08                	jmp    0x4fc26d
  4fc265:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fc268:	e8 bb 84 f0 ff       	call   0x404728
  4fc26d:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4fc270:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc277:	75 08                	jne    0x4fc281
  4fc279:	d8 35 90 b8 54 00    	fdiv   DWORD PTR ds:0x54b890
  4fc27f:	eb 0b                	jmp    0x4fc28c
  4fc281:	ff 35 90 b8 54 00    	push   DWORD PTR ds:0x54b890
  4fc287:	e8 9c 84 f0 ff       	call   0x404728
  4fc28c:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fc292:	a1 98 b9 54 00       	mov    eax,ds:0x54b998
  4fc297:	d8 0c b8             	fmul   DWORD PTR [eax+edi*4]
  4fc29a:	de c1                	faddp  st(1),st
  4fc29c:	d9 05 9c bf 54 00    	fld    DWORD PTR ds:0x54bf9c
  4fc2a2:	d8 05 a4 b6 54 00    	fadd   DWORD PTR ds:0x54b6a4
  4fc2a8:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fc2ae:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fc2b1:	8b 15 64 b9 54 00    	mov    edx,DWORD PTR ds:0x54b964
  4fc2b7:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
  4fc2ba:	8b 95 34 fe ff ff    	mov    edx,DWORD PTR [ebp-0x1cc]
  4fc2c0:	d8 0c 10             	fmul   DWORD PTR [eax+edx*1]
  4fc2c3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc2ca:	75 08                	jne    0x4fc2d4
  4fc2cc:	d8 35 30 bb 54 00    	fdiv   DWORD PTR ds:0x54bb30
  4fc2d2:	eb 0b                	jmp    0x4fc2df
  4fc2d4:	ff 35 30 bb 54 00    	push   DWORD PTR ds:0x54bb30
  4fc2da:	e8 49 84 f0 ff       	call   0x404728
  4fc2df:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc2e6:	75 05                	jne    0x4fc2ed
  4fc2e8:	d8 75 c0             	fdiv   DWORD PTR [ebp-0x40]
  4fc2eb:	eb 08                	jmp    0x4fc2f5
  4fc2ed:	ff 75 c0             	push   DWORD PTR [ebp-0x40]
  4fc2f0:	e8 33 84 f0 ff       	call   0x404728
  4fc2f5:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc2fc:	75 05                	jne    0x4fc303
  4fc2fe:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fc301:	eb 08                	jmp    0x4fc30b
  4fc303:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fc306:	e8 1d 84 f0 ff       	call   0x404728
  4fc30b:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fc310:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  4fc313:	8b 85 30 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1d0]
  4fc319:	d9 04 02             	fld    DWORD PTR [edx+eax*1]
  4fc31c:	8b 15 14 b6 54 00    	mov    edx,DWORD PTR ds:0x54b614
  4fc322:	d8 4a 44             	fmul   DWORD PTR [edx+0x44]
  4fc325:	de c1                	faddp  st(1),st
  4fc327:	d9 05 a4 bb 54 00    	fld    DWORD PTR ds:0x54bba4
  4fc32d:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fc333:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fc336:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fc33b:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  4fc33e:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4fc341:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc348:	75 08                	jne    0x4fc352
  4fc34a:	d8 35 c0 b2 54 00    	fdiv   DWORD PTR ds:0x54b2c0
  4fc350:	eb 0b                	jmp    0x4fc35d
  4fc352:	ff 35 c0 b2 54 00    	push   DWORD PTR ds:0x54b2c0
  4fc358:	e8 cb 83 f0 ff       	call   0x404728
  4fc35d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc364:	75 05                	jne    0x4fc36b
  4fc366:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fc369:	eb 08                	jmp    0x4fc373
  4fc36b:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fc36e:	e8 b5 83 f0 ff       	call   0x404728
  4fc373:	de c1                	faddp  st(1),st
  4fc375:	d8 0d e0 b8 54 00    	fmul   DWORD PTR ds:0x54b8e0
  4fc37b:	de c1                	faddp  st(1),st
  4fc37d:	d9 1c b9             	fstp   DWORD PTR [ecx+edi*4]
  4fc380:	df e0                	fnstsw ax
  4fc382:	a8 0d                	test   al,0xd
  4fc384:	0f 85 34 41 00 00    	jne    0x5004be
  4fc38a:	83 ff 05             	cmp    edi,0x5
  4fc38d:	72 02                	jb     0x4fc391
  4fc38f:	ff d6                	call   esi
  4fc391:	8b c7                	mov    eax,edi
  4fc393:	89 85 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],eax
  4fc399:	83 f8 05             	cmp    eax,0x5
  4fc39c:	72 02                	jb     0x4fc3a0
  4fc39e:	ff d6                	call   esi
  4fc3a0:	83 ff 05             	cmp    edi,0x5
  4fc3a3:	72 02                	jb     0x4fc3a7
  4fc3a5:	ff d6                	call   esi
  4fc3a7:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fc3ac:	85 c0                	test   eax,eax
  4fc3ae:	74 1f                	je     0x4fc3cf
  4fc3b0:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc3b4:	75 19                	jne    0x4fc3cf
  4fc3b6:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fc3bc:	2b 58 14             	sub    ebx,DWORD PTR [eax+0x14]
  4fc3bf:	3b 58 10             	cmp    ebx,DWORD PTR [eax+0x10]
  4fc3c2:	72 02                	jb     0x4fc3c6
  4fc3c4:	ff d6                	call   esi
  4fc3c6:	8d 04 9d 00 00 00 00 	lea    eax,[ebx*4+0x0]
  4fc3cd:	eb 02                	jmp    0x4fc3d1
  4fc3cf:	ff d6                	call   esi
  4fc3d1:	89 85 2c fe ff ff    	mov    DWORD PTR [ebp-0x1d4],eax
  4fc3d7:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fc3dc:	85 c0                	test   eax,eax
  4fc3de:	74 25                	je     0x4fc405
  4fc3e0:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc3e4:	75 1f                	jne    0x4fc405
  4fc3e6:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fc3ec:	2b 58 14             	sub    ebx,DWORD PTR [eax+0x14]
  4fc3ef:	3b 58 10             	cmp    ebx,DWORD PTR [eax+0x10]
  4fc3f2:	72 02                	jb     0x4fc3f6
  4fc3f4:	ff d6                	call   esi
  4fc3f6:	8d 0c 9d 00 00 00 00 	lea    ecx,[ebx*4+0x0]
  4fc3fd:	89 8d 28 fe ff ff    	mov    DWORD PTR [ebp-0x1d8],ecx
  4fc403:	eb 08                	jmp    0x4fc40d
  4fc405:	ff d6                	call   esi
  4fc407:	89 85 28 fe ff ff    	mov    DWORD PTR [ebp-0x1d8],eax
  4fc40d:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fc412:	85 c0                	test   eax,eax
  4fc414:	74 20                	je     0x4fc436
  4fc416:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc41a:	75 1a                	jne    0x4fc436
  4fc41c:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fc422:	2b 58 14             	sub    ebx,DWORD PTR [eax+0x14]
  4fc425:	3b 58 10             	cmp    ebx,DWORD PTR [eax+0x10]
  4fc428:	72 07                	jb     0x4fc431
  4fc42a:	ff d6                	call   esi
  4fc42c:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fc431:	c1 e3 02             	shl    ebx,0x2
  4fc434:	eb 09                	jmp    0x4fc43f
  4fc436:	ff d6                	call   esi
  4fc438:	8b d8                	mov    ebx,eax
  4fc43a:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fc43f:	83 ff 05             	cmp    edi,0x5
  4fc442:	72 07                	jb     0x4fc44b
  4fc444:	ff d6                	call   esi
  4fc446:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fc44b:	d9 05 9c bf 54 00    	fld    DWORD PTR ds:0x54bf9c
  4fc451:	d8 05 a4 b6 54 00    	fadd   DWORD PTR ds:0x54b6a4
  4fc457:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fc45d:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fc460:	8b 15 64 b9 54 00    	mov    edx,DWORD PTR ds:0x54b964
  4fc466:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  4fc469:	8b 95 2c fe ff ff    	mov    edx,DWORD PTR [ebp-0x1d4]
  4fc46f:	d8 0c 11             	fmul   DWORD PTR [ecx+edx*1]
  4fc472:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc479:	75 08                	jne    0x4fc483
  4fc47b:	d8 35 30 bb 54 00    	fdiv   DWORD PTR ds:0x54bb30
  4fc481:	eb 0b                	jmp    0x4fc48e
  4fc483:	ff 35 30 bb 54 00    	push   DWORD PTR ds:0x54bb30
  4fc489:	e8 9a 82 f0 ff       	call   0x404728
  4fc48e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc495:	75 05                	jne    0x4fc49c
  4fc497:	d8 75 c0             	fdiv   DWORD PTR [ebp-0x40]
  4fc49a:	eb 08                	jmp    0x4fc4a4
  4fc49c:	ff 75 c0             	push   DWORD PTR [ebp-0x40]
  4fc49f:	e8 84 82 f0 ff       	call   0x404728
  4fc4a4:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc4ab:	75 05                	jne    0x4fc4b2
  4fc4ad:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fc4b0:	eb 08                	jmp    0x4fc4ba
  4fc4b2:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fc4b5:	e8 6e 82 f0 ff       	call   0x404728
  4fc4ba:	8b 0d ac b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9ac
  4fc4c0:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fc4c3:	8b 8d 28 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x1d8]
  4fc4c9:	d9 04 0a             	fld    DWORD PTR [edx+ecx*1]
  4fc4cc:	8b 15 14 b6 54 00    	mov    edx,DWORD PTR ds:0x54b614
  4fc4d2:	d8 4a 44             	fmul   DWORD PTR [edx+0x44]
  4fc4d5:	de c1                	faddp  st(1),st
  4fc4d7:	d9 05 a4 bb 54 00    	fld    DWORD PTR ds:0x54bba4
  4fc4dd:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fc4e3:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fc4e6:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fc4e9:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fc4ec:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc4f3:	75 08                	jne    0x4fc4fd
  4fc4f5:	d8 35 c0 b2 54 00    	fdiv   DWORD PTR ds:0x54b2c0
  4fc4fb:	eb 0b                	jmp    0x4fc508
  4fc4fd:	ff 35 c0 b2 54 00    	push   DWORD PTR ds:0x54b2c0
  4fc503:	e8 20 82 f0 ff       	call   0x404728
  4fc508:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc50f:	75 05                	jne    0x4fc516
  4fc511:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fc514:	eb 08                	jmp    0x4fc51e
  4fc516:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fc519:	e8 0a 82 f0 ff       	call   0x404728
  4fc51e:	de c1                	faddp  st(1),st
  4fc520:	d8 0d e0 b8 54 00    	fmul   DWORD PTR ds:0x54b8e0
  4fc526:	d9 05 50 b7 54 00    	fld    DWORD PTR ds:0x54b750
  4fc52c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc533:	75 08                	jne    0x4fc53d
  4fc535:	d8 35 cc b2 54 00    	fdiv   DWORD PTR ds:0x54b2cc
  4fc53b:	eb 0b                	jmp    0x4fc548
  4fc53d:	ff 35 cc b2 54 00    	push   DWORD PTR ds:0x54b2cc
  4fc543:	e8 e0 81 f0 ff       	call   0x404728
  4fc548:	d8 0d a8 b8 54 00    	fmul   DWORD PTR ds:0x54b8a8
  4fc54e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc555:	75 08                	jne    0x4fc55f
  4fc557:	d8 35 c0 b2 54 00    	fdiv   DWORD PTR ds:0x54b2c0
  4fc55d:	eb 0b                	jmp    0x4fc56a
  4fc55f:	ff 35 c0 b2 54 00    	push   DWORD PTR ds:0x54b2c0
  4fc565:	e8 be 81 f0 ff       	call   0x404728
  4fc56a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc571:	75 05                	jne    0x4fc578
  4fc573:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fc576:	eb 08                	jmp    0x4fc580
  4fc578:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fc57b:	e8 a8 81 f0 ff       	call   0x404728
  4fc580:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4fc583:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  4fc589:	d8 25 90 b8 54 00    	fsub   DWORD PTR ds:0x54b890
  4fc58f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fc596:	75 04                	jne    0x4fc59c
  4fc598:	de f9                	fdivp  st(1),st
  4fc59a:	eb 09                	jmp    0x4fc5a5
  4fc59c:	50                   	push   eax
  4fc59d:	b0 0d                	mov    al,0xd
  4fc59f:	e8 96 81 f0 ff       	call   0x40473a
  4fc5a4:	58                   	pop    eax
  4fc5a5:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fc5ab:	8b 0d 7c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b97c
  4fc5b1:	8b 95 00 ff ff ff    	mov    edx,DWORD PTR [ebp-0x100]
  4fc5b7:	d9 04 91             	fld    DWORD PTR [ecx+edx*4]
  4fc5ba:	8b 0d 98 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b998
  4fc5c0:	d8 24 b9             	fsub   DWORD PTR [ecx+edi*4]
  4fc5c3:	de c9                	fmulp  st(1),st
  4fc5c5:	d8 04 b9             	fadd   DWORD PTR [ecx+edi*4]
  4fc5c8:	de c1                	faddp  st(1),st
  4fc5ca:	d9 1c b9             	fstp   DWORD PTR [ecx+edi*4]
  4fc5cd:	df e0                	fnstsw ax
  4fc5cf:	a8 0d                	test   al,0xd
  4fc5d1:	0f 85 e7 3e 00 00    	jne    0x5004be
  4fc5d7:	83 ff 05             	cmp    edi,0x5
  4fc5da:	72 02                	jb     0x4fc5de
  4fc5dc:	ff d6                	call   esi
  4fc5de:	8b c7                	mov    eax,edi
  4fc5e0:	89 85 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],eax
  4fc5e6:	83 f8 05             	cmp    eax,0x5
  4fc5e9:	72 02                	jb     0x4fc5ed
  4fc5eb:	ff d6                	call   esi
  4fc5ed:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4fc5f3:	85 c9                	test   ecx,ecx
  4fc5f5:	74 21                	je     0x4fc618
  4fc5f7:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fc5fb:	75 1b                	jne    0x4fc618
  4fc5fd:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fc603:	2b 59 14             	sub    ebx,DWORD PTR [ecx+0x14]
  4fc606:	3b 59 10             	cmp    ebx,DWORD PTR [ecx+0x10]
  4fc609:	72 08                	jb     0x4fc613
  4fc60b:	ff d6                	call   esi
  4fc60d:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4fc613:	c1 e3 02             	shl    ebx,0x2
  4fc616:	eb 0a                	jmp    0x4fc622
  4fc618:	ff d6                	call   esi
  4fc61a:	8b d8                	mov    ebx,eax
  4fc61c:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4fc622:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  4fc628:	d8 25 90 b8 54 00    	fsub   DWORD PTR ds:0x54b890
  4fc62e:	a1 98 b9 54 00       	mov    eax,ds:0x54b998
  4fc633:	8b 95 00 ff ff ff    	mov    edx,DWORD PTR [ebp-0x100]
  4fc639:	d8 0c 90             	fmul   DWORD PTR [eax+edx*4]
  4fc63c:	d9 05 90 b8 54 00    	fld    DWORD PTR ds:0x54b890
  4fc642:	a1 7c b9 54 00       	mov    eax,ds:0x54b97c
  4fc647:	d8 0c b8             	fmul   DWORD PTR [eax+edi*4]
  4fc64a:	de c1                	faddp  st(1),st
  4fc64c:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fc64f:	d9 1c 19             	fstp   DWORD PTR [ecx+ebx*1]
  4fc652:	df e0                	fnstsw ax
  4fc654:	a8 0d                	test   al,0xd
  4fc656:	0f 85 62 3e 00 00    	jne    0x5004be
  4fc65c:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fc662:	85 d2                	test   edx,edx
  4fc664:	74 25                	je     0x4fc68b
  4fc666:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fc66a:	75 1f                	jne    0x4fc68b
  4fc66c:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fc672:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fc675:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fc678:	72 08                	jb     0x4fc682
  4fc67a:	ff d6                	call   esi
  4fc67c:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fc682:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fc689:	eb 0a                	jmp    0x4fc695
  4fc68b:	ff d6                	call   esi
  4fc68d:	8b d8                	mov    ebx,eax
  4fc68f:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fc695:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4fc69b:	85 c9                	test   ecx,ecx
  4fc69d:	74 31                	je     0x4fc6d0
  4fc69f:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fc6a3:	75 2b                	jne    0x4fc6d0
  4fc6a5:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fc6ab:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fc6ae:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fc6b1:	72 0e                	jb     0x4fc6c1
  4fc6b3:	ff d6                	call   esi
  4fc6b5:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fc6bb:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4fc6c1:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fc6c8:	89 85 24 fe ff ff    	mov    DWORD PTR [ebp-0x1dc],eax
  4fc6ce:	eb 14                	jmp    0x4fc6e4
  4fc6d0:	ff d6                	call   esi
  4fc6d2:	89 85 24 fe ff ff    	mov    DWORD PTR [ebp-0x1dc],eax
  4fc6d8:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fc6de:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4fc6e4:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
  4fc6e7:	8b 79 0c             	mov    edi,DWORD PTR [ecx+0xc]
  4fc6ea:	d9 04 18             	fld    DWORD PTR [eax+ebx*1]
  4fc6ed:	8b 85 24 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1dc]
  4fc6f3:	d8 1c 07             	fcomp  DWORD PTR [edi+eax*1]
  4fc6f6:	df e0                	fnstsw ax
  4fc6f8:	f6 c4 01             	test   ah,0x1
  4fc6fb:	0f 84 88 00 00 00    	je     0x4fc789
  4fc701:	85 c9                	test   ecx,ecx
  4fc703:	74 2b                	je     0x4fc730
  4fc705:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fc709:	75 25                	jne    0x4fc730
  4fc70b:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fc711:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fc714:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fc717:	72 0e                	jb     0x4fc727
  4fc719:	ff d6                	call   esi
  4fc71b:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fc721:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4fc727:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fc72e:	eb 10                	jmp    0x4fc740
  4fc730:	ff d6                	call   esi
  4fc732:	8b d8                	mov    ebx,eax
  4fc734:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fc73a:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4fc740:	85 d2                	test   edx,edx
  4fc742:	74 2b                	je     0x4fc76f
  4fc744:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fc748:	75 25                	jne    0x4fc76f
  4fc74a:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fc750:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fc753:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fc756:	72 0e                	jb     0x4fc766
  4fc758:	ff d6                	call   esi
  4fc75a:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fc760:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4fc766:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fc76d:	eb 0e                	jmp    0x4fc77d
  4fc76f:	ff d6                	call   esi
  4fc771:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fc777:	8b 0d b0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b0
  4fc77d:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fc780:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fc783:	8b 0c 19             	mov    ecx,DWORD PTR [ecx+ebx*1]
  4fc786:	89 0c 02             	mov    DWORD PTR [edx+eax*1],ecx
  4fc789:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  4fc78e:	8b 10                	mov    edx,DWORD PTR [eax]
  4fc790:	50                   	push   eax
  4fc791:	ff 92 30 05 00 00    	call   DWORD PTR [edx+0x530]
  4fc797:	50                   	push   eax
  4fc798:	8d 45 a8             	lea    eax,[ebp-0x58]
  4fc79b:	50                   	push   eax
  4fc79c:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  4fc7a2:	8b f8                	mov    edi,eax
  4fc7a4:	8b 0f                	mov    ecx,DWORD PTR [edi]
  4fc7a6:	8d 55 a4             	lea    edx,[ebp-0x5c]
  4fc7a9:	52                   	push   edx
  4fc7aa:	6a 00                	push   0x0
  4fc7ac:	57                   	push   edi
  4fc7ad:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  4fc7b0:	db e2                	fnclex
  4fc7b2:	85 c0                	test   eax,eax
  4fc7b4:	7d 0f                	jge    0x4fc7c5
  4fc7b6:	6a 40                	push   0x40
  4fc7b8:	68 68 c9 41 00       	push   0x41c968
  4fc7bd:	57                   	push   edi
  4fc7be:	50                   	push   eax
  4fc7bf:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  4fc7c5:	6a 00                	push   0x0
  4fc7c7:	68 09 00 03 68       	push   0x68030009
  4fc7cc:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  4fc7cf:	50                   	push   eax
  4fc7d0:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  4fc7d6:	51                   	push   ecx
  4fc7d7:	8b 1d 34 11 40 00    	mov    ebx,DWORD PTR ds:0x401134
  4fc7dd:	ff d3                	call   ebx
  4fc7df:	83 c4 10             	add    esp,0x10
  4fc7e2:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  4fc7e7:	8b 10                	mov    edx,DWORD PTR [eax]
  4fc7e9:	50                   	push   eax
  4fc7ea:	ff 92 30 05 00 00    	call   DWORD PTR [edx+0x530]
  4fc7f0:	50                   	push   eax
  4fc7f1:	8d 45 a0             	lea    eax,[ebp-0x60]
  4fc7f4:	50                   	push   eax
  4fc7f5:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  4fc7fb:	8b f8                	mov    edi,eax
  4fc7fd:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fc803:	8b 0f                	mov    ecx,DWORD PTR [edi]
  4fc805:	8d 55 9c             	lea    edx,[ebp-0x64]
  4fc808:	52                   	push   edx
  4fc809:	6a 01                	push   0x1
  4fc80b:	57                   	push   edi
  4fc80c:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  4fc80f:	db e2                	fnclex
  4fc811:	85 c0                	test   eax,eax
  4fc813:	7d 0f                	jge    0x4fc824
  4fc815:	6a 40                	push   0x40
  4fc817:	68 68 c9 41 00       	push   0x41c968
  4fc81c:	57                   	push   edi
  4fc81d:	50                   	push   eax
  4fc81e:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  4fc824:	6a 00                	push   0x0
  4fc826:	68 09 00 03 68       	push   0x68030009
  4fc82b:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  4fc82e:	50                   	push   eax
  4fc82f:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  4fc835:	51                   	push   ecx
  4fc836:	ff d3                	call   ebx
  4fc838:	83 c4 10             	add    esp,0x10
  4fc83b:	a1 b8 b9 54 00       	mov    eax,ds:0x54b9b8
  4fc840:	85 c0                	test   eax,eax
  4fc842:	74 27                	je     0x4fc86b
  4fc844:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc848:	75 21                	jne    0x4fc86b
  4fc84a:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fc850:	8b fb                	mov    edi,ebx
  4fc852:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc855:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc858:	72 02                	jb     0x4fc85c
  4fc85a:	ff d6                	call   esi
  4fc85c:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fc863:	89 95 20 fe ff ff    	mov    DWORD PTR [ebp-0x1e0],edx
  4fc869:	eb 0e                	jmp    0x4fc879
  4fc86b:	ff d6                	call   esi
  4fc86d:	89 85 20 fe ff ff    	mov    DWORD PTR [ebp-0x1e0],eax
  4fc873:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fc879:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fc87e:	85 c0                	test   eax,eax
  4fc880:	74 1b                	je     0x4fc89d
  4fc882:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc886:	75 15                	jne    0x4fc89d
  4fc888:	8b fb                	mov    edi,ebx
  4fc88a:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc88d:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc890:	72 02                	jb     0x4fc894
  4fc892:	ff d6                	call   esi
  4fc894:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fc89b:	eb 02                	jmp    0x4fc89f
  4fc89d:	ff d6                	call   esi
  4fc89f:	89 85 1c fe ff ff    	mov    DWORD PTR [ebp-0x1e4],eax
  4fc8a5:	a1 b4 b9 54 00       	mov    eax,ds:0x54b9b4
  4fc8aa:	85 c0                	test   eax,eax
  4fc8ac:	74 21                	je     0x4fc8cf
  4fc8ae:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc8b2:	75 1b                	jne    0x4fc8cf
  4fc8b4:	8b fb                	mov    edi,ebx
  4fc8b6:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc8b9:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc8bc:	72 02                	jb     0x4fc8c0
  4fc8be:	ff d6                	call   esi
  4fc8c0:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fc8c7:	89 8d 18 fe ff ff    	mov    DWORD PTR [ebp-0x1e8],ecx
  4fc8cd:	eb 08                	jmp    0x4fc8d7
  4fc8cf:	ff d6                	call   esi
  4fc8d1:	89 85 18 fe ff ff    	mov    DWORD PTR [ebp-0x1e8],eax
  4fc8d7:	a1 b8 b9 54 00       	mov    eax,ds:0x54b9b8
  4fc8dc:	85 c0                	test   eax,eax
  4fc8de:	74 21                	je     0x4fc901
  4fc8e0:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc8e4:	75 1b                	jne    0x4fc901
  4fc8e6:	8b fb                	mov    edi,ebx
  4fc8e8:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc8eb:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc8ee:	72 02                	jb     0x4fc8f2
  4fc8f0:	ff d6                	call   esi
  4fc8f2:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fc8f9:	89 95 14 fe ff ff    	mov    DWORD PTR [ebp-0x1ec],edx
  4fc8ff:	eb 08                	jmp    0x4fc909
  4fc901:	ff d6                	call   esi
  4fc903:	89 85 14 fe ff ff    	mov    DWORD PTR [ebp-0x1ec],eax
  4fc909:	a1 b4 b9 54 00       	mov    eax,ds:0x54b9b4
  4fc90e:	85 c0                	test   eax,eax
  4fc910:	74 1b                	je     0x4fc92d
  4fc912:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc916:	75 15                	jne    0x4fc92d
  4fc918:	8b fb                	mov    edi,ebx
  4fc91a:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc91d:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc920:	72 02                	jb     0x4fc924
  4fc922:	ff d6                	call   esi
  4fc924:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fc92b:	eb 02                	jmp    0x4fc92f
  4fc92d:	ff d6                	call   esi
  4fc92f:	89 85 10 fe ff ff    	mov    DWORD PTR [ebp-0x1f0],eax
  4fc935:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fc93a:	85 c0                	test   eax,eax
  4fc93c:	74 21                	je     0x4fc95f
  4fc93e:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc942:	75 1b                	jne    0x4fc95f
  4fc944:	8b fb                	mov    edi,ebx
  4fc946:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc949:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc94c:	72 02                	jb     0x4fc950
  4fc94e:	ff d6                	call   esi
  4fc950:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fc957:	89 8d 0c fe ff ff    	mov    DWORD PTR [ebp-0x1f4],ecx
  4fc95d:	eb 08                	jmp    0x4fc967
  4fc95f:	ff d6                	call   esi
  4fc961:	89 85 0c fe ff ff    	mov    DWORD PTR [ebp-0x1f4],eax
  4fc967:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fc96c:	85 c0                	test   eax,eax
  4fc96e:	74 26                	je     0x4fc996
  4fc970:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc974:	75 20                	jne    0x4fc996
  4fc976:	8b fb                	mov    edi,ebx
  4fc978:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc97b:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc97e:	72 07                	jb     0x4fc987
  4fc980:	ff d6                	call   esi
  4fc982:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fc987:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fc98e:	89 95 08 fe ff ff    	mov    DWORD PTR [ebp-0x1f8],edx
  4fc994:	eb 0d                	jmp    0x4fc9a3
  4fc996:	ff d6                	call   esi
  4fc998:	89 85 08 fe ff ff    	mov    DWORD PTR [ebp-0x1f8],eax
  4fc99e:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fc9a3:	85 c0                	test   eax,eax
  4fc9a5:	74 26                	je     0x4fc9cd
  4fc9a7:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fc9ab:	75 20                	jne    0x4fc9cd
  4fc9ad:	8b fb                	mov    edi,ebx
  4fc9af:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fc9b2:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fc9b5:	72 07                	jb     0x4fc9be
  4fc9b7:	ff d6                	call   esi
  4fc9b9:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fc9be:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fc9c5:	89 8d 04 fe ff ff    	mov    DWORD PTR [ebp-0x1fc],ecx
  4fc9cb:	eb 0d                	jmp    0x4fc9da
  4fc9cd:	ff d6                	call   esi
  4fc9cf:	89 85 04 fe ff ff    	mov    DWORD PTR [ebp-0x1fc],eax
  4fc9d5:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fc9da:	8b 15 68 b9 54 00    	mov    edx,DWORD PTR ds:0x54b968
  4fc9e0:	8b 7a 0c             	mov    edi,DWORD PTR [edx+0xc]
  4fc9e3:	8b 0d b4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b4
  4fc9e9:	8b 59 0c             	mov    ebx,DWORD PTR [ecx+0xc]
  4fc9ec:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fc9f2:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  4fc9f5:	89 8d 00 fe ff ff    	mov    DWORD PTR [ebp-0x200],ecx
  4fc9fb:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  4fc9fe:	89 95 fc fd ff ff    	mov    DWORD PTR [ebp-0x204],edx
  4fca04:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  4fca0a:	50                   	push   eax
  4fca0b:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  4fca11:	0f bf c8             	movsx  ecx,ax
  4fca14:	89 8d f8 fd ff ff    	mov    DWORD PTR [ebp-0x208],ecx
  4fca1a:	db 85 f8 fd ff ff    	fild   DWORD PTR [ebp-0x208]
  4fca20:	d9 9d f4 fd ff ff    	fstp   DWORD PTR [ebp-0x20c]
  4fca26:	d9 85 f4 fd ff ff    	fld    DWORD PTR [ebp-0x20c]
  4fca2c:	d8 0d 20 b5 54 00    	fmul   DWORD PTR ds:0x54b520
  4fca32:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fca39:	75 08                	jne    0x4fca43
  4fca3b:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  4fca41:	eb 0b                	jmp    0x4fca4e
  4fca43:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  4fca49:	e8 da 7c f0 ff       	call   0x404728
  4fca4e:	df e0                	fnstsw ax
  4fca50:	a8 0d                	test   al,0xd
  4fca52:	0f 85 66 3a 00 00    	jne    0x5004be
  4fca58:	d9 9d f0 fd ff ff    	fstp   DWORD PTR [ebp-0x210]
  4fca5e:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
  4fca64:	52                   	push   edx
  4fca65:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  4fca6b:	0f bf c0             	movsx  eax,ax
  4fca6e:	89 85 ec fd ff ff    	mov    DWORD PTR [ebp-0x214],eax
  4fca74:	db 85 ec fd ff ff    	fild   DWORD PTR [ebp-0x214]
  4fca7a:	d9 9d e8 fd ff ff    	fstp   DWORD PTR [ebp-0x218]
  4fca80:	d9 85 e8 fd ff ff    	fld    DWORD PTR [ebp-0x218]
  4fca86:	d8 0d 1c b5 54 00    	fmul   DWORD PTR ds:0x54b51c
  4fca8c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fca93:	75 08                	jne    0x4fca9d
  4fca95:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  4fca9b:	eb 0b                	jmp    0x4fcaa8
  4fca9d:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  4fcaa3:	e8 80 7c f0 ff       	call   0x404728
  4fcaa8:	d8 85 f0 fd ff ff    	fadd   DWORD PTR [ebp-0x210]
  4fcaae:	8b 8d 1c fe ff ff    	mov    ecx,DWORD PTR [ebp-0x1e4]
  4fcab4:	d9 04 39             	fld    DWORD PTR [ecx+edi*1]
  4fcab7:	8b 95 18 fe ff ff    	mov    edx,DWORD PTR [ebp-0x1e8]
  4fcabd:	d8 24 1a             	fsub   DWORD PTR [edx+ebx*1]
  4fcac0:	8b 8d 14 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x1ec]
  4fcac6:	8b 85 00 fe ff ff    	mov    eax,DWORD PTR [ebp-0x200]
  4fcacc:	d8 0c 01             	fmul   DWORD PTR [ecx+eax*1]
  4fcacf:	8b 95 10 fe ff ff    	mov    edx,DWORD PTR [ebp-0x1f0]
  4fcad5:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fcadc:	75 05                	jne    0x4fcae3
  4fcade:	d8 34 1a             	fdiv   DWORD PTR [edx+ebx*1]
  4fcae1:	eb 08                	jmp    0x4fcaeb
  4fcae3:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
  4fcae6:	e8 3d 7c f0 ff       	call   0x404728
  4fcaeb:	de c9                	fmulp  st(1),st
  4fcaed:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fcaf3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fcafa:	75 08                	jne    0x4fcb04
  4fcafc:	d8 35 10 b9 54 00    	fdiv   DWORD PTR ds:0x54b910
  4fcb02:	eb 0b                	jmp    0x4fcb0f
  4fcb04:	ff 35 10 b9 54 00    	push   DWORD PTR ds:0x54b910
  4fcb0a:	e8 19 7c f0 ff       	call   0x404728
  4fcb0f:	8b 8d 20 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x1e0]
  4fcb15:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4fcb18:	d9 05 54 bb 54 00    	fld    DWORD PTR ds:0x54bb54
  4fcb1e:	8b 95 0c fe ff ff    	mov    edx,DWORD PTR [ebp-0x1f4]
  4fcb24:	d8 0c 3a             	fmul   DWORD PTR [edx+edi*1]
  4fcb27:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fcb2d:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fcb30:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fcb37:	75 05                	jne    0x4fcb3e
  4fcb39:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4fcb3c:	eb 08                	jmp    0x4fcb46
  4fcb3e:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4fcb41:	e8 e2 7b f0 ff       	call   0x404728
  4fcb46:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fcb4d:	75 08                	jne    0x4fcb57
  4fcb4f:	d8 35 10 b9 54 00    	fdiv   DWORD PTR ds:0x54b910
  4fcb55:	eb 0b                	jmp    0x4fcb62
  4fcb57:	ff 35 10 b9 54 00    	push   DWORD PTR ds:0x54b910
  4fcb5d:	e8 c6 7b f0 ff       	call   0x404728
  4fcb62:	d8 0d e8 b8 54 00    	fmul   DWORD PTR ds:0x54b8e8
  4fcb68:	de c1                	faddp  st(1),st
  4fcb6a:	d9 05 ac b8 54 00    	fld    DWORD PTR ds:0x54b8ac
  4fcb70:	8b 85 08 fe ff ff    	mov    eax,DWORD PTR [ebp-0x1f8]
  4fcb76:	8b 8d fc fd ff ff    	mov    ecx,DWORD PTR [ebp-0x204]
  4fcb7c:	d8 0c 08             	fmul   DWORD PTR [eax+ecx*1]
  4fcb7f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fcb86:	75 08                	jne    0x4fcb90
  4fcb88:	d8 35 10 b9 54 00    	fdiv   DWORD PTR ds:0x54b910
  4fcb8e:	eb 0b                	jmp    0x4fcb9b
  4fcb90:	ff 35 10 b9 54 00    	push   DWORD PTR ds:0x54b910
  4fcb96:	e8 8d 7b f0 ff       	call   0x404728
  4fcb9b:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fcba1:	de e9                	fsubp  st(1),st
  4fcba3:	8b 95 04 fe ff ff    	mov    edx,DWORD PTR [ebp-0x1fc]
  4fcba9:	d9 1c 0a             	fstp   DWORD PTR [edx+ecx*1]
  4fcbac:	df e0                	fnstsw ax
  4fcbae:	a8 0d                	test   al,0xd
  4fcbb0:	0f 85 08 39 00 00    	jne    0x5004be
  4fcbb6:	8d 45 9c             	lea    eax,[ebp-0x64]
  4fcbb9:	50                   	push   eax
  4fcbba:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4fcbbd:	51                   	push   ecx
  4fcbbe:	8d 55 a4             	lea    edx,[ebp-0x5c]
  4fcbc1:	52                   	push   edx
  4fcbc2:	8d 45 a8             	lea    eax,[ebp-0x58]
  4fcbc5:	50                   	push   eax
  4fcbc6:	6a 04                	push   0x4
  4fcbc8:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  4fcbce:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  4fcbd4:	51                   	push   ecx
  4fcbd5:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
  4fcbdb:	52                   	push   edx
  4fcbdc:	6a 02                	push   0x2
  4fcbde:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  4fcbe4:	83 c4 20             	add    esp,0x20
  4fcbe7:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fcbed:	85 c9                	test   ecx,ecx
  4fcbef:	74 25                	je     0x4fcc16
  4fcbf1:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fcbf5:	75 1f                	jne    0x4fcc16
  4fcbf7:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fcbfd:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fcc00:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fcc03:	72 08                	jb     0x4fcc0d
  4fcc05:	ff d6                	call   esi
  4fcc07:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fcc0d:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fcc14:	eb 0a                	jmp    0x4fcc20
  4fcc16:	ff d6                	call   esi
  4fcc18:	8b d8                	mov    ebx,eax
  4fcc1a:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fcc20:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fcc26:	85 d2                	test   edx,edx
  4fcc28:	74 31                	je     0x4fcc5b
  4fcc2a:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fcc2e:	75 2b                	jne    0x4fcc5b
  4fcc30:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fcc36:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fcc39:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fcc3c:	72 0e                	jb     0x4fcc4c
  4fcc3e:	ff d6                	call   esi
  4fcc40:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fcc46:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fcc4c:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fcc53:	89 85 e4 fd ff ff    	mov    DWORD PTR [ebp-0x21c],eax
  4fcc59:	eb 14                	jmp    0x4fcc6f
  4fcc5b:	ff d6                	call   esi
  4fcc5d:	89 85 e4 fd ff ff    	mov    DWORD PTR [ebp-0x21c],eax
  4fcc63:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fcc69:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fcc6f:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
  4fcc72:	8b 7a 0c             	mov    edi,DWORD PTR [edx+0xc]
  4fcc75:	d9 04 18             	fld    DWORD PTR [eax+ebx*1]
  4fcc78:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [ebp-0x21c]
  4fcc7e:	d8 1c 07             	fcomp  DWORD PTR [edi+eax*1]
  4fcc81:	df e0                	fnstsw ax
  4fcc83:	f6 c4 01             	test   ah,0x1
  4fcc86:	0f 84 88 00 00 00    	je     0x4fcd14
  4fcc8c:	85 d2                	test   edx,edx
  4fcc8e:	74 2b                	je     0x4fccbb
  4fcc90:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fcc94:	75 25                	jne    0x4fccbb
  4fcc96:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fcc9c:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fcc9f:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fcca2:	72 0e                	jb     0x4fccb2
  4fcca4:	ff d6                	call   esi
  4fcca6:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fccac:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fccb2:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fccb9:	eb 10                	jmp    0x4fcccb
  4fccbb:	ff d6                	call   esi
  4fccbd:	8b d8                	mov    ebx,eax
  4fccbf:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fccc5:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fcccb:	85 c9                	test   ecx,ecx
  4fcccd:	74 2b                	je     0x4fccfa
  4fcccf:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fccd3:	75 25                	jne    0x4fccfa
  4fccd5:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fccdb:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fccde:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fcce1:	72 0e                	jb     0x4fccf1
  4fcce3:	ff d6                	call   esi
  4fcce5:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fcceb:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fccf1:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fccf8:	eb 0e                	jmp    0x4fcd08
  4fccfa:	ff d6                	call   esi
  4fccfc:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fcd02:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fcd08:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fcd0b:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fcd0e:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4fcd11:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4fcd14:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fcd1a:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fcd1f:	85 c0                	test   eax,eax
  4fcd21:	74 26                	je     0x4fcd49
  4fcd23:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fcd27:	75 20                	jne    0x4fcd49
  4fcd29:	8b fb                	mov    edi,ebx
  4fcd2b:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fcd2e:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fcd31:	72 07                	jb     0x4fcd3a
  4fcd33:	ff d6                	call   esi
  4fcd35:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fcd3a:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fcd41:	89 8d e0 fd ff ff    	mov    DWORD PTR [ebp-0x220],ecx
  4fcd47:	eb 0d                	jmp    0x4fcd56
  4fcd49:	ff d6                	call   esi
  4fcd4b:	89 85 e0 fd ff ff    	mov    DWORD PTR [ebp-0x220],eax
  4fcd51:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fcd56:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fcd5c:	85 c9                	test   ecx,ecx
  4fcd5e:	74 2c                	je     0x4fcd8c
  4fcd60:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fcd64:	75 26                	jne    0x4fcd8c
  4fcd66:	8b fb                	mov    edi,ebx
  4fcd68:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fcd6b:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fcd71:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fcd74:	72 07                	jb     0x4fcd7d
  4fcd76:	ff d6                	call   esi
  4fcd78:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fcd7d:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fcd84:	89 95 dc fd ff ff    	mov    DWORD PTR [ebp-0x224],edx
  4fcd8a:	eb 0d                	jmp    0x4fcd99
  4fcd8c:	ff d6                	call   esi
  4fcd8e:	89 85 dc fd ff ff    	mov    DWORD PTR [ebp-0x224],eax
  4fcd94:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fcd99:	8b 0d ac b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9ac
  4fcd9f:	85 c9                	test   ecx,ecx
  4fcda1:	74 26                	je     0x4fcdc9
  4fcda3:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fcda7:	75 20                	jne    0x4fcdc9
  4fcda9:	8b fb                	mov    edi,ebx
  4fcdab:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fcdae:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fcdb1:	72 07                	jb     0x4fcdba
  4fcdb3:	ff d6                	call   esi
  4fcdb5:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fcdba:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fcdc1:	89 8d d8 fd ff ff    	mov    DWORD PTR [ebp-0x228],ecx
  4fcdc7:	eb 0d                	jmp    0x4fcdd6
  4fcdc9:	ff d6                	call   esi
  4fcdcb:	89 85 d8 fd ff ff    	mov    DWORD PTR [ebp-0x228],eax
  4fcdd1:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fcdd6:	85 c0                	test   eax,eax
  4fcdd8:	74 20                	je     0x4fcdfa
  4fcdda:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fcdde:	75 1a                	jne    0x4fcdfa
  4fcde0:	8b fb                	mov    edi,ebx
  4fcde2:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fcde5:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fcde8:	72 07                	jb     0x4fcdf1
  4fcdea:	ff d6                	call   esi
  4fcdec:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fcdf1:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fcdf8:	eb 09                	jmp    0x4fce03
  4fcdfa:	ff d6                	call   esi
  4fcdfc:	8b d8                	mov    ebx,eax
  4fcdfe:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fce03:	85 c0                	test   eax,eax
  4fce05:	74 24                	je     0x4fce2b
  4fce07:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fce0b:	75 1e                	jne    0x4fce2b
  4fce0d:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fce13:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fce16:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fce19:	72 07                	jb     0x4fce22
  4fce1b:	ff d6                	call   esi
  4fce1d:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fce22:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fce29:	eb 09                	jmp    0x4fce34
  4fce2b:	ff d6                	call   esi
  4fce2d:	8b d0                	mov    edx,eax
  4fce2f:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fce34:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4fce37:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fce3c:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fce3f:	d9 05 b4 b6 54 00    	fld    DWORD PTR ds:0x54b6b4
  4fce45:	8b bd dc fd ff ff    	mov    edi,DWORD PTR [ebp-0x224]
  4fce4b:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fce4e:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fce54:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fce5b:	75 08                	jne    0x4fce65
  4fce5d:	d8 35 0c b9 54 00    	fdiv   DWORD PTR ds:0x54b90c
  4fce63:	eb 0b                	jmp    0x4fce70
  4fce65:	ff 35 0c b9 54 00    	push   DWORD PTR ds:0x54b90c
  4fce6b:	e8 b8 78 f0 ff       	call   0x404728
  4fce70:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fce77:	75 05                	jne    0x4fce7e
  4fce79:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4fce7c:	eb 08                	jmp    0x4fce86
  4fce7e:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4fce81:	e8 a2 78 f0 ff       	call   0x404728
  4fce86:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fce89:	d8 0d ec b8 54 00    	fmul   DWORD PTR ds:0x54b8ec
  4fce8f:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [ebp-0x220]
  4fce95:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4fce98:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fce9d:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fcea0:	8b bd d8 fd ff ff    	mov    edi,DWORD PTR [ebp-0x228]
  4fcea6:	d9 04 38             	fld    DWORD PTR [eax+edi*1]
  4fcea9:	a1 14 b6 54 00       	mov    eax,ds:0x54b614
  4fceae:	d8 48 48             	fmul   DWORD PTR [eax+0x48]
  4fceb1:	d8 0d 14 b9 54 00    	fmul   DWORD PTR ds:0x54b914
  4fceb7:	de c1                	faddp  st(1),st
  4fceb9:	d9 05 04 b9 54 00    	fld    DWORD PTR ds:0x54b904
  4fcebf:	d8 0c 19             	fmul   DWORD PTR [ecx+ebx*1]
  4fcec2:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fcec9:	75 08                	jne    0x4fced3
  4fcecb:	d8 35 0c b9 54 00    	fdiv   DWORD PTR ds:0x54b90c
  4fced1:	eb 0b                	jmp    0x4fcede
  4fced3:	ff 35 0c b9 54 00    	push   DWORD PTR ds:0x54b90c
  4fced9:	e8 4a 78 f0 ff       	call   0x404728
  4fcede:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fcee4:	de e9                	fsubp  st(1),st
  4fcee6:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fcee9:	df e0                	fnstsw ax
  4fceeb:	a8 0d                	test   al,0xd
  4fceed:	0f 85 cb 35 00 00    	jne    0x5004be
  4fcef3:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fcef9:	85 c9                	test   ecx,ecx
  4fcefb:	74 25                	je     0x4fcf22
  4fcefd:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fcf01:	75 1f                	jne    0x4fcf22
  4fcf03:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fcf09:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fcf0c:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fcf0f:	72 08                	jb     0x4fcf19
  4fcf11:	ff d6                	call   esi
  4fcf13:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fcf19:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fcf20:	eb 0a                	jmp    0x4fcf2c
  4fcf22:	ff d6                	call   esi
  4fcf24:	8b d8                	mov    ebx,eax
  4fcf26:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fcf2c:	8b 15 bc b9 54 00    	mov    edx,DWORD PTR ds:0x54b9bc
  4fcf32:	85 d2                	test   edx,edx
  4fcf34:	74 31                	je     0x4fcf67
  4fcf36:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fcf3a:	75 2b                	jne    0x4fcf67
  4fcf3c:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fcf42:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fcf45:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fcf48:	72 0e                	jb     0x4fcf58
  4fcf4a:	ff d6                	call   esi
  4fcf4c:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fcf52:	8b 15 bc b9 54 00    	mov    edx,DWORD PTR ds:0x54b9bc
  4fcf58:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fcf5f:	89 85 d4 fd ff ff    	mov    DWORD PTR [ebp-0x22c],eax
  4fcf65:	eb 14                	jmp    0x4fcf7b
  4fcf67:	ff d6                	call   esi
  4fcf69:	89 85 d4 fd ff ff    	mov    DWORD PTR [ebp-0x22c],eax
  4fcf6f:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fcf75:	8b 15 bc b9 54 00    	mov    edx,DWORD PTR ds:0x54b9bc
  4fcf7b:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
  4fcf7e:	8b 7a 0c             	mov    edi,DWORD PTR [edx+0xc]
  4fcf81:	d9 04 18             	fld    DWORD PTR [eax+ebx*1]
  4fcf84:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [ebp-0x22c]
  4fcf8a:	d8 1c 07             	fcomp  DWORD PTR [edi+eax*1]
  4fcf8d:	df e0                	fnstsw ax
  4fcf8f:	f6 c4 01             	test   ah,0x1
  4fcf92:	0f 84 88 00 00 00    	je     0x4fd020
  4fcf98:	85 d2                	test   edx,edx
  4fcf9a:	74 2b                	je     0x4fcfc7
  4fcf9c:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fcfa0:	75 25                	jne    0x4fcfc7
  4fcfa2:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fcfa8:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fcfab:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fcfae:	72 0e                	jb     0x4fcfbe
  4fcfb0:	ff d6                	call   esi
  4fcfb2:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fcfb8:	8b 15 bc b9 54 00    	mov    edx,DWORD PTR ds:0x54b9bc
  4fcfbe:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fcfc5:	eb 10                	jmp    0x4fcfd7
  4fcfc7:	ff d6                	call   esi
  4fcfc9:	8b d8                	mov    ebx,eax
  4fcfcb:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fcfd1:	8b 15 bc b9 54 00    	mov    edx,DWORD PTR ds:0x54b9bc
  4fcfd7:	85 c9                	test   ecx,ecx
  4fcfd9:	74 2b                	je     0x4fd006
  4fcfdb:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fcfdf:	75 25                	jne    0x4fd006
  4fcfe1:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fcfe7:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fcfea:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fcfed:	72 0e                	jb     0x4fcffd
  4fcfef:	ff d6                	call   esi
  4fcff1:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fcff7:	8b 15 bc b9 54 00    	mov    edx,DWORD PTR ds:0x54b9bc
  4fcffd:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd004:	eb 0e                	jmp    0x4fd014
  4fd006:	ff d6                	call   esi
  4fd008:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4fd00e:	8b 15 bc b9 54 00    	mov    edx,DWORD PTR ds:0x54b9bc
  4fd014:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fd017:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fd01a:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4fd01d:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4fd020:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fd025:	85 c0                	test   eax,eax
  4fd027:	74 1f                	je     0x4fd048
  4fd029:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd02d:	75 19                	jne    0x4fd048
  4fd02f:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fd035:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd038:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd03b:	72 02                	jb     0x4fd03f
  4fd03d:	ff d6                	call   esi
  4fd03f:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fd046:	eb 04                	jmp    0x4fd04c
  4fd048:	ff d6                	call   esi
  4fd04a:	8b d8                	mov    ebx,eax
  4fd04c:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd052:	85 d2                	test   edx,edx
  4fd054:	74 2b                	je     0x4fd081
  4fd056:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fd05a:	75 25                	jne    0x4fd081
  4fd05c:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fd062:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fd065:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fd068:	72 08                	jb     0x4fd072
  4fd06a:	ff d6                	call   esi
  4fd06c:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd072:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd079:	89 85 d0 fd ff ff    	mov    DWORD PTR [ebp-0x230],eax
  4fd07f:	eb 0e                	jmp    0x4fd08f
  4fd081:	ff d6                	call   esi
  4fd083:	89 85 d0 fd ff ff    	mov    DWORD PTR [ebp-0x230],eax
  4fd089:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd08f:	85 d2                	test   edx,edx
  4fd091:	74 2a                	je     0x4fd0bd
  4fd093:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fd097:	75 24                	jne    0x4fd0bd
  4fd099:	bf 01 00 00 00       	mov    edi,0x1
  4fd09e:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fd0a1:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fd0a7:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fd0aa:	72 08                	jb     0x4fd0b4
  4fd0ac:	ff d6                	call   esi
  4fd0ae:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd0b4:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd0bb:	eb 08                	jmp    0x4fd0c5
  4fd0bd:	ff d6                	call   esi
  4fd0bf:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd0c5:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  4fd0c8:	8b 3d 64 b9 54 00    	mov    edi,DWORD PTR ds:0x54b964
  4fd0ce:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4fd0d1:	d9 04 1f             	fld    DWORD PTR [edi+ebx*1]
  4fd0d4:	8b bd d0 fd ff ff    	mov    edi,DWORD PTR [ebp-0x230]
  4fd0da:	d8 0c 39             	fmul   DWORD PTR [ecx+edi*1]
  4fd0dd:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd0e4:	75 05                	jne    0x4fd0eb
  4fd0e6:	d8 34 01             	fdiv   DWORD PTR [ecx+eax*1]
  4fd0e9:	eb 08                	jmp    0x4fd0f3
  4fd0eb:	ff 34 01             	push   DWORD PTR [ecx+eax*1]
  4fd0ee:	e8 35 76 f0 ff       	call   0x404728
  4fd0f3:	d8 05 b0 b8 54 00    	fadd   DWORD PTR ds:0x54b8b0
  4fd0f9:	d9 1d b0 b8 54 00    	fstp   DWORD PTR ds:0x54b8b0
  4fd0ff:	df e0                	fnstsw ax
  4fd101:	a8 0d                	test   al,0xd
  4fd103:	0f 85 b5 33 00 00    	jne    0x5004be
  4fd109:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fd10e:	85 c0                	test   eax,eax
  4fd110:	74 25                	je     0x4fd137
  4fd112:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd116:	75 1f                	jne    0x4fd137
  4fd118:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fd11e:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd121:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd124:	72 08                	jb     0x4fd12e
  4fd126:	ff d6                	call   esi
  4fd128:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd12e:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fd135:	eb 0a                	jmp    0x4fd141
  4fd137:	ff d6                	call   esi
  4fd139:	8b d8                	mov    ebx,eax
  4fd13b:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd141:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd147:	85 c9                	test   ecx,ecx
  4fd149:	74 31                	je     0x4fd17c
  4fd14b:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fd14f:	75 2b                	jne    0x4fd17c
  4fd151:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fd157:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fd15a:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fd15d:	72 0e                	jb     0x4fd16d
  4fd15f:	ff d6                	call   esi
  4fd161:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd167:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd16d:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd174:	89 85 cc fd ff ff    	mov    DWORD PTR [ebp-0x234],eax
  4fd17a:	eb 14                	jmp    0x4fd190
  4fd17c:	ff d6                	call   esi
  4fd17e:	89 85 cc fd ff ff    	mov    DWORD PTR [ebp-0x234],eax
  4fd184:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd18a:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd190:	85 c9                	test   ecx,ecx
  4fd192:	74 36                	je     0x4fd1ca
  4fd194:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fd198:	75 30                	jne    0x4fd1ca
  4fd19a:	bf 09 00 00 00       	mov    edi,0x9
  4fd19f:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fd1a2:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fd1a8:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fd1ab:	72 0e                	jb     0x4fd1bb
  4fd1ad:	ff d6                	call   esi
  4fd1af:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd1b5:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd1bb:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd1c2:	89 85 c8 fd ff ff    	mov    DWORD PTR [ebp-0x238],eax
  4fd1c8:	eb 14                	jmp    0x4fd1de
  4fd1ca:	ff d6                	call   esi
  4fd1cc:	89 85 c8 fd ff ff    	mov    DWORD PTR [ebp-0x238],eax
  4fd1d2:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd1d8:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd1de:	8b 79 0c             	mov    edi,DWORD PTR [ecx+0xc]
  4fd1e1:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fd1e6:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fd1e9:	d9 04 18             	fld    DWORD PTR [eax+ebx*1]
  4fd1ec:	8b 85 cc fd ff ff    	mov    eax,DWORD PTR [ebp-0x234]
  4fd1f2:	d8 0c 07             	fmul   DWORD PTR [edi+eax*1]
  4fd1f5:	8b 85 c8 fd ff ff    	mov    eax,DWORD PTR [ebp-0x238]
  4fd1fb:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd202:	75 05                	jne    0x4fd209
  4fd204:	d8 34 07             	fdiv   DWORD PTR [edi+eax*1]
  4fd207:	eb 08                	jmp    0x4fd211
  4fd209:	ff 34 07             	push   DWORD PTR [edi+eax*1]
  4fd20c:	e8 17 75 f0 ff       	call   0x404728
  4fd211:	d8 05 b4 b8 54 00    	fadd   DWORD PTR ds:0x54b8b4
  4fd217:	d9 1d b4 b8 54 00    	fstp   DWORD PTR ds:0x54b8b4
  4fd21d:	df e0                	fnstsw ax
  4fd21f:	a8 0d                	test   al,0xd
  4fd221:	0f 85 97 32 00 00    	jne    0x5004be
  4fd227:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fd22c:	85 c0                	test   eax,eax
  4fd22e:	74 2b                	je     0x4fd25b
  4fd230:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd234:	75 25                	jne    0x4fd25b
  4fd236:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fd23c:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd23f:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd242:	72 0e                	jb     0x4fd252
  4fd244:	ff d6                	call   esi
  4fd246:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd24c:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd252:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fd259:	eb 10                	jmp    0x4fd26b
  4fd25b:	ff d6                	call   esi
  4fd25d:	8b d8                	mov    ebx,eax
  4fd25f:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd265:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd26b:	85 d2                	test   edx,edx
  4fd26d:	74 31                	je     0x4fd2a0
  4fd26f:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fd273:	75 2b                	jne    0x4fd2a0
  4fd275:	8b bd 38 fe ff ff    	mov    edi,DWORD PTR [ebp-0x1c8]
  4fd27b:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fd27e:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fd281:	72 0e                	jb     0x4fd291
  4fd283:	ff d6                	call   esi
  4fd285:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd28b:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd291:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd298:	89 85 c4 fd ff ff    	mov    DWORD PTR [ebp-0x23c],eax
  4fd29e:	eb 14                	jmp    0x4fd2b4
  4fd2a0:	ff d6                	call   esi
  4fd2a2:	89 85 c4 fd ff ff    	mov    DWORD PTR [ebp-0x23c],eax
  4fd2a8:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd2ae:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd2b4:	85 d2                	test   edx,edx
  4fd2b6:	74 30                	je     0x4fd2e8
  4fd2b8:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fd2bc:	75 2a                	jne    0x4fd2e8
  4fd2be:	bf 01 00 00 00       	mov    edi,0x1
  4fd2c3:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fd2c6:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fd2cc:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fd2cf:	72 0e                	jb     0x4fd2df
  4fd2d1:	ff d6                	call   esi
  4fd2d3:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd2d9:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd2df:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd2e6:	eb 0e                	jmp    0x4fd2f6
  4fd2e8:	ff d6                	call   esi
  4fd2ea:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4fd2f0:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd2f6:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fd2f9:	8b 3d 68 b9 54 00    	mov    edi,DWORD PTR ds:0x54b968
  4fd2ff:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4fd302:	d9 04 1f             	fld    DWORD PTR [edi+ebx*1]
  4fd305:	8b bd c4 fd ff ff    	mov    edi,DWORD PTR [ebp-0x23c]
  4fd30b:	d8 0c 3a             	fmul   DWORD PTR [edx+edi*1]
  4fd30e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd315:	75 05                	jne    0x4fd31c
  4fd317:	d8 34 02             	fdiv   DWORD PTR [edx+eax*1]
  4fd31a:	eb 08                	jmp    0x4fd324
  4fd31c:	ff 34 02             	push   DWORD PTR [edx+eax*1]
  4fd31f:	e8 04 74 f0 ff       	call   0x404728
  4fd324:	d8 05 b8 b8 54 00    	fadd   DWORD PTR ds:0x54b8b8
  4fd32a:	d9 1d b8 b8 54 00    	fstp   DWORD PTR ds:0x54b8b8
  4fd330:	df e0                	fnstsw ax
  4fd332:	a8 0d                	test   al,0xd
  4fd334:	0f 85 84 31 00 00    	jne    0x5004be
  4fd33a:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fd33f:	85 c0                	test   eax,eax
  4fd341:	74 2d                	je     0x4fd370
  4fd343:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd347:	75 27                	jne    0x4fd370
  4fd349:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fd34f:	8b fb                	mov    edi,ebx
  4fd351:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd354:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd357:	72 08                	jb     0x4fd361
  4fd359:	ff d6                	call   esi
  4fd35b:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd361:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fd368:	89 95 c0 fd ff ff    	mov    DWORD PTR [ebp-0x240],edx
  4fd36e:	eb 14                	jmp    0x4fd384
  4fd370:	ff d6                	call   esi
  4fd372:	89 85 c0 fd ff ff    	mov    DWORD PTR [ebp-0x240],eax
  4fd378:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd37e:	8b 9d 38 fe ff ff    	mov    ebx,DWORD PTR [ebp-0x1c8]
  4fd384:	85 c9                	test   ecx,ecx
  4fd386:	74 25                	je     0x4fd3ad
  4fd388:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fd38c:	75 1f                	jne    0x4fd3ad
  4fd38e:	2b 59 14             	sub    ebx,DWORD PTR [ecx+0x14]
  4fd391:	3b 59 10             	cmp    ebx,DWORD PTR [ecx+0x10]
  4fd394:	72 08                	jb     0x4fd39e
  4fd396:	ff d6                	call   esi
  4fd398:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd39e:	8d 04 9d 00 00 00 00 	lea    eax,[ebx*4+0x0]
  4fd3a5:	89 85 bc fd ff ff    	mov    DWORD PTR [ebp-0x244],eax
  4fd3ab:	eb 0e                	jmp    0x4fd3bb
  4fd3ad:	ff d6                	call   esi
  4fd3af:	89 85 bc fd ff ff    	mov    DWORD PTR [ebp-0x244],eax
  4fd3b5:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd3bb:	85 c9                	test   ecx,ecx
  4fd3bd:	74 2a                	je     0x4fd3e9
  4fd3bf:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fd3c3:	75 24                	jne    0x4fd3e9
  4fd3c5:	bf 09 00 00 00       	mov    edi,0x9
  4fd3ca:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fd3cd:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fd3d3:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fd3d6:	72 08                	jb     0x4fd3e0
  4fd3d8:	ff d6                	call   esi
  4fd3da:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd3e0:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd3e7:	eb 08                	jmp    0x4fd3f1
  4fd3e9:	ff d6                	call   esi
  4fd3eb:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fd3f1:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fd3f4:	8b 3d 68 b9 54 00    	mov    edi,DWORD PTR ds:0x54b968
  4fd3fa:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4fd3fd:	8b 9d c0 fd ff ff    	mov    ebx,DWORD PTR [ebp-0x240]
  4fd403:	d9 04 1f             	fld    DWORD PTR [edi+ebx*1]
  4fd406:	8b bd bc fd ff ff    	mov    edi,DWORD PTR [ebp-0x244]
  4fd40c:	d8 0c 3a             	fmul   DWORD PTR [edx+edi*1]
  4fd40f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd416:	75 05                	jne    0x4fd41d
  4fd418:	d8 34 02             	fdiv   DWORD PTR [edx+eax*1]
  4fd41b:	eb 08                	jmp    0x4fd425
  4fd41d:	ff 34 02             	push   DWORD PTR [edx+eax*1]
  4fd420:	e8 03 73 f0 ff       	call   0x404728
  4fd425:	d8 05 bc b8 54 00    	fadd   DWORD PTR ds:0x54b8bc
  4fd42b:	d9 1d bc b8 54 00    	fstp   DWORD PTR ds:0x54b8bc
  4fd431:	df e0                	fnstsw ax
  4fd433:	a8 0d                	test   al,0xd
  4fd435:	0f 85 83 30 00 00    	jne    0x5004be
  4fd43b:	b8 01 00 00 00       	mov    eax,0x1
  4fd440:	66 03 45 e0          	add    ax,WORD PTR [ebp-0x20]
  4fd444:	0f 80 79 30 00 00    	jo     0x5004c3
  4fd44a:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4fd44d:	33 db                	xor    ebx,ebx
  4fd44f:	e9 bb e4 ff ff       	jmp    0x4fb90f
  4fd454:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fd45a:	d8 1d 18 b4 54 00    	fcomp  DWORD PTR ds:0x54b418
  4fd460:	df e0                	fnstsw ax
  4fd462:	f6 c4 41             	test   ah,0x41
  4fd465:	74 32                	je     0x4fd499
  4fd467:	d9 05 28 b9 54 00    	fld    DWORD PTR ds:0x54b928
  4fd46d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd474:	75 08                	jne    0x4fd47e
  4fd476:	d8 35 b4 b8 54 00    	fdiv   DWORD PTR ds:0x54b8b4
  4fd47c:	eb 0b                	jmp    0x4fd489
  4fd47e:	ff 35 b4 b8 54 00    	push   DWORD PTR ds:0x54b8b4
  4fd484:	e8 9f 72 f0 ff       	call   0x404728
  4fd489:	d9 1d 1c b1 54 00    	fstp   DWORD PTR ds:0x54b11c
  4fd48f:	df e0                	fnstsw ax
  4fd491:	a8 0d                	test   al,0xd
  4fd493:	0f 85 25 30 00 00    	jne    0x5004be
  4fd499:	d9 05 1c b1 54 00    	fld    DWORD PTR ds:0x54b11c
  4fd49f:	d8 0d b4 b8 54 00    	fmul   DWORD PTR ds:0x54b8b4
  4fd4a5:	d9 1d b4 b8 54 00    	fstp   DWORD PTR ds:0x54b8b4
  4fd4ab:	df e0                	fnstsw ax
  4fd4ad:	a8 0d                	test   al,0xd
  4fd4af:	0f 85 09 30 00 00    	jne    0x5004be
  4fd4b5:	8b 15 44 b9 54 00    	mov    edx,DWORD PTR ds:0x54b944
  4fd4bb:	89 95 b4 fe ff ff    	mov    DWORD PTR [ebp-0x14c],edx
  4fd4c1:	c7 45 e0 06 00 00 00 	mov    DWORD PTR [ebp-0x20],0x6
  4fd4c8:	66 8b 85 b4 fe ff ff 	mov    ax,WORD PTR [ebp-0x14c]
  4fd4cf:	66 39 45 e0          	cmp    WORD PTR [ebp-0x20],ax
  4fd4d3:	0f 8f 00 13 00 00    	jg     0x4fe7d9
  4fd4d9:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fd4df:	3b cb                	cmp    ecx,ebx
  4fd4e1:	74 23                	je     0x4fd506
  4fd4e3:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fd4e7:	75 1d                	jne    0x4fd506
  4fd4e9:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fd4ed:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fd4f0:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fd4f3:	72 08                	jb     0x4fd4fd
  4fd4f5:	ff d6                	call   esi
  4fd4f7:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fd4fd:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd504:	eb 08                	jmp    0x4fd50e
  4fd506:	ff d6                	call   esi
  4fd508:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fd50e:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fd511:	d9 04 01             	fld    DWORD PTR [ecx+eax*1]
  4fd514:	d9 e0                	fchs
  4fd516:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fd51c:	d8 25 4c b4 54 00    	fsub   DWORD PTR ds:0x54b44c
  4fd522:	de c9                	fmulp  st(1),st
  4fd524:	df e0                	fnstsw ax
  4fd526:	a8 0d                	test   al,0xd
  4fd528:	0f 85 90 2f 00 00    	jne    0x5004be
  4fd52e:	83 ec 08             	sub    esp,0x8
  4fd531:	dd 1c 24             	fstp   QWORD PTR [esp]
  4fd534:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  4fd53a:	dd 9d 14 ff ff ff    	fstp   QWORD PTR [ebp-0xec]
  4fd540:	a1 58 b9 54 00       	mov    eax,ds:0x54b958
  4fd545:	3b c3                	cmp    eax,ebx
  4fd547:	74 23                	je     0x4fd56c
  4fd549:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd54d:	75 1d                	jne    0x4fd56c
  4fd54f:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fd553:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd556:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fd55c:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd55f:	72 02                	jb     0x4fd563
  4fd561:	ff d6                	call   esi
  4fd563:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fd56a:	eb 04                	jmp    0x4fd570
  4fd56c:	ff d6                	call   esi
  4fd56e:	8b d8                	mov    ebx,eax
  4fd570:	8b 0d 60 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b960
  4fd576:	85 c9                	test   ecx,ecx
  4fd578:	74 23                	je     0x4fd59d
  4fd57a:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fd57e:	75 1d                	jne    0x4fd59d
  4fd580:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fd584:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fd587:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fd58a:	72 08                	jb     0x4fd594
  4fd58c:	ff d6                	call   esi
  4fd58e:	8b 0d 60 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b960
  4fd594:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fd59b:	eb 0a                	jmp    0x4fd5a7
  4fd59d:	ff d6                	call   esi
  4fd59f:	8b d0                	mov    edx,eax
  4fd5a1:	8b 0d 60 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b960
  4fd5a7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4fd5aa:	66 8b 00             	mov    ax,WORD PTR [eax]
  4fd5ad:	0f bf f8             	movsx  edi,ax
  4fd5b0:	89 bd b8 fd ff ff    	mov    DWORD PTR [ebp-0x248],edi
  4fd5b6:	db 85 b8 fd ff ff    	fild   DWORD PTR [ebp-0x248]
  4fd5bc:	dd 9d b0 fd ff ff    	fstp   QWORD PTR [ebp-0x250]
  4fd5c2:	dd 85 b0 fd ff ff    	fld    QWORD PTR [ebp-0x250]
  4fd5c8:	dc 8d 14 ff ff ff    	fmul   QWORD PTR [ebp-0xec]
  4fd5ce:	66 bf 01 00          	mov    di,0x1
  4fd5d2:	66 2b f8             	sub    di,ax
  4fd5d5:	0f 80 e8 2e 00 00    	jo     0x5004c3
  4fd5db:	0f bf c7             	movsx  eax,di
  4fd5de:	89 85 ac fd ff ff    	mov    DWORD PTR [ebp-0x254],eax
  4fd5e4:	db 85 ac fd ff ff    	fild   DWORD PTR [ebp-0x254]
  4fd5ea:	dd 9d a4 fd ff ff    	fstp   QWORD PTR [ebp-0x25c]
  4fd5f0:	dc 85 a4 fd ff ff    	fadd   QWORD PTR [ebp-0x25c]
  4fd5f6:	a1 58 b9 54 00       	mov    eax,ds:0x54b958
  4fd5fb:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fd5fe:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fd601:	d9 9d a0 fd ff ff    	fstp   DWORD PTR [ebp-0x260]
  4fd607:	df e0                	fnstsw ax
  4fd609:	a8 0d                	test   al,0xd
  4fd60b:	0f 85 ad 2e 00 00    	jne    0x5004be
  4fd611:	d9 85 a0 fd ff ff    	fld    DWORD PTR [ebp-0x260]
  4fd617:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fd61a:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fd61d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4fd620:	66 83 3a 00          	cmp    WORD PTR [edx],0x0
  4fd624:	0f 85 23 01 00 00    	jne    0x4fd74d
  4fd62a:	a1 58 b9 54 00       	mov    eax,ds:0x54b958
  4fd62f:	85 c0                	test   eax,eax
  4fd631:	74 1d                	je     0x4fd650
  4fd633:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd637:	75 17                	jne    0x4fd650
  4fd639:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fd63d:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd640:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd643:	72 02                	jb     0x4fd647
  4fd645:	ff d6                	call   esi
  4fd647:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd64e:	eb 02                	jmp    0x4fd652
  4fd650:	ff d6                	call   esi
  4fd652:	89 85 9c fd ff ff    	mov    DWORD PTR [ebp-0x264],eax
  4fd658:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fd65d:	85 c0                	test   eax,eax
  4fd65f:	74 23                	je     0x4fd684
  4fd661:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd665:	75 1d                	jne    0x4fd684
  4fd667:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fd66b:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd66e:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fd674:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd677:	72 02                	jb     0x4fd67b
  4fd679:	ff d6                	call   esi
  4fd67b:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fd682:	eb 04                	jmp    0x4fd688
  4fd684:	ff d6                	call   esi
  4fd686:	8b d8                	mov    ebx,eax
  4fd688:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fd68e:	85 c9                	test   ecx,ecx
  4fd690:	74 23                	je     0x4fd6b5
  4fd692:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fd696:	75 1d                	jne    0x4fd6b5
  4fd698:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fd69c:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fd69f:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fd6a2:	72 08                	jb     0x4fd6ac
  4fd6a4:	ff d6                	call   esi
  4fd6a6:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fd6ac:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fd6b3:	eb 0a                	jmp    0x4fd6bf
  4fd6b5:	ff d6                	call   esi
  4fd6b7:	8b d0                	mov    edx,eax
  4fd6b9:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fd6bf:	a1 58 b9 54 00       	mov    eax,ds:0x54b958
  4fd6c4:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fd6c7:	d9 05 bc b4 54 00    	fld    DWORD PTR ds:0x54b4bc
  4fd6cd:	8b bd 9c fd ff ff    	mov    edi,DWORD PTR [ebp-0x264]
  4fd6d3:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fd6d6:	d8 0d a0 b8 54 00    	fmul   DWORD PTR ds:0x54b8a0
  4fd6dc:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd6e3:	75 08                	jne    0x4fd6ed
  4fd6e5:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  4fd6eb:	eb 0b                	jmp    0x4fd6f8
  4fd6ed:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  4fd6f3:	e8 30 70 f0 ff       	call   0x404728
  4fd6f8:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4fd6fb:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd702:	75 08                	jne    0x4fd70c
  4fd704:	d8 35 38 bb 54 00    	fdiv   DWORD PTR ds:0x54bb38
  4fd70a:	eb 0b                	jmp    0x4fd717
  4fd70c:	ff 35 38 bb 54 00    	push   DWORD PTR ds:0x54bb38
  4fd712:	e8 11 70 f0 ff       	call   0x404728
  4fd717:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd71e:	75 05                	jne    0x4fd725
  4fd720:	d8 75 d4             	fdiv   DWORD PTR [ebp-0x2c]
  4fd723:	eb 08                	jmp    0x4fd72d
  4fd725:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
  4fd728:	e8 fb 6f f0 ff       	call   0x404728
  4fd72d:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fd732:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fd735:	d8 04 18             	fadd   DWORD PTR [eax+ebx*1]
  4fd738:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fd73b:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fd73e:	df e0                	fnstsw ax
  4fd740:	a8 0d                	test   al,0xd
  4fd742:	0f 85 76 2d 00 00    	jne    0x5004be
  4fd748:	e9 c7 02 00 00       	jmp    0x4fda14
  4fd74d:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fd753:	85 c9                	test   ecx,ecx
  4fd755:	74 25                	je     0x4fd77c
  4fd757:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fd75b:	75 1f                	jne    0x4fd77c
  4fd75d:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fd760:	0f bf fb             	movsx  edi,bx
  4fd763:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fd766:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fd769:	72 08                	jb     0x4fd773
  4fd76b:	ff d6                	call   esi
  4fd76d:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fd773:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd77a:	eb 0b                	jmp    0x4fd787
  4fd77c:	ff d6                	call   esi
  4fd77e:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fd784:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fd787:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fd78a:	d9 04 02             	fld    DWORD PTR [edx+eax*1]
  4fd78d:	d9 e0                	fchs
  4fd78f:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fd795:	d8 25 4c b4 54 00    	fsub   DWORD PTR ds:0x54b44c
  4fd79b:	de c9                	fmulp  st(1),st
  4fd79d:	df e0                	fnstsw ax
  4fd79f:	a8 0d                	test   al,0xd
  4fd7a1:	0f 85 17 2d 00 00    	jne    0x5004be
  4fd7a7:	83 ec 08             	sub    esp,0x8
  4fd7aa:	dd 1c 24             	fstp   QWORD PTR [esp]
  4fd7ad:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  4fd7b3:	dd 9d 14 ff ff ff    	fstp   QWORD PTR [ebp-0xec]
  4fd7b9:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fd7bf:	85 c9                	test   ecx,ecx
  4fd7c1:	74 22                	je     0x4fd7e5
  4fd7c3:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fd7c7:	75 1c                	jne    0x4fd7e5
  4fd7c9:	0f bf fb             	movsx  edi,bx
  4fd7cc:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fd7cf:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fd7d2:	72 08                	jb     0x4fd7dc
  4fd7d4:	ff d6                	call   esi
  4fd7d6:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fd7dc:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd7e3:	eb 08                	jmp    0x4fd7ed
  4fd7e5:	ff d6                	call   esi
  4fd7e7:	8b 0d 54 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b954
  4fd7ed:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fd7f0:	d9 04 01             	fld    DWORD PTR [ecx+eax*1]
  4fd7f3:	d9 e0                	fchs
  4fd7f5:	d9 05 0c b4 54 00    	fld    DWORD PTR ds:0x54b40c
  4fd7fb:	d8 25 4c b4 54 00    	fsub   DWORD PTR ds:0x54b44c
  4fd801:	de c9                	fmulp  st(1),st
  4fd803:	df e0                	fnstsw ax
  4fd805:	a8 0d                	test   al,0xd
  4fd807:	0f 85 b1 2c 00 00    	jne    0x5004be
  4fd80d:	83 ec 08             	sub    esp,0x8
  4fd810:	dd 1c 24             	fstp   QWORD PTR [esp]
  4fd813:	ff 15 20 10 40 00    	call   DWORD PTR ds:0x401020
  4fd819:	dd 9d 0c ff ff ff    	fstp   QWORD PTR [ebp-0xf4]
  4fd81f:	a1 60 b9 54 00       	mov    eax,ds:0x54b960
  4fd824:	85 c0                	test   eax,eax
  4fd826:	74 22                	je     0x4fd84a
  4fd828:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd82c:	75 1c                	jne    0x4fd84a
  4fd82e:	0f bf fb             	movsx  edi,bx
  4fd831:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd834:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd837:	72 02                	jb     0x4fd83b
  4fd839:	ff d6                	call   esi
  4fd83b:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fd842:	89 95 98 fd ff ff    	mov    DWORD PTR [ebp-0x268],edx
  4fd848:	eb 08                	jmp    0x4fd852
  4fd84a:	ff d6                	call   esi
  4fd84c:	89 85 98 fd ff ff    	mov    DWORD PTR [ebp-0x268],eax
  4fd852:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fd857:	85 c0                	test   eax,eax
  4fd859:	74 1c                	je     0x4fd877
  4fd85b:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd85f:	75 16                	jne    0x4fd877
  4fd861:	0f bf fb             	movsx  edi,bx
  4fd864:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd867:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd86a:	72 02                	jb     0x4fd86e
  4fd86c:	ff d6                	call   esi
  4fd86e:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fd875:	eb 02                	jmp    0x4fd879
  4fd877:	ff d6                	call   esi
  4fd879:	89 85 94 fd ff ff    	mov    DWORD PTR [ebp-0x26c],eax
  4fd87f:	a1 5c b9 54 00       	mov    eax,ds:0x54b95c
  4fd884:	85 c0                	test   eax,eax
  4fd886:	74 22                	je     0x4fd8aa
  4fd888:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd88c:	75 1c                	jne    0x4fd8aa
  4fd88e:	0f bf fb             	movsx  edi,bx
  4fd891:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd894:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd897:	72 02                	jb     0x4fd89b
  4fd899:	ff d6                	call   esi
  4fd89b:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fd8a2:	89 8d 90 fd ff ff    	mov    DWORD PTR [ebp-0x270],ecx
  4fd8a8:	eb 08                	jmp    0x4fd8b2
  4fd8aa:	ff d6                	call   esi
  4fd8ac:	89 85 90 fd ff ff    	mov    DWORD PTR [ebp-0x270],eax
  4fd8b2:	a1 54 b9 54 00       	mov    eax,ds:0x54b954
  4fd8b7:	85 c0                	test   eax,eax
  4fd8b9:	74 1c                	je     0x4fd8d7
  4fd8bb:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fd8bf:	75 16                	jne    0x4fd8d7
  4fd8c1:	0f bf fb             	movsx  edi,bx
  4fd8c4:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fd8c7:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fd8ca:	72 02                	jb     0x4fd8ce
  4fd8cc:	ff d6                	call   esi
  4fd8ce:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fd8d5:	eb 04                	jmp    0x4fd8db
  4fd8d7:	ff d6                	call   esi
  4fd8d9:	8b d8                	mov    ebx,eax
  4fd8db:	8b 15 64 b9 54 00    	mov    edx,DWORD PTR ds:0x54b964
  4fd8e1:	85 d2                	test   edx,edx
  4fd8e3:	74 29                	je     0x4fd90e
  4fd8e5:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fd8e9:	75 23                	jne    0x4fd90e
  4fd8eb:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fd8ef:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fd8f2:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fd8f8:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fd8fb:	72 08                	jb     0x4fd905
  4fd8fd:	ff d6                	call   esi
  4fd8ff:	8b 15 64 b9 54 00    	mov    edx,DWORD PTR ds:0x54b964
  4fd905:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fd90c:	eb 0a                	jmp    0x4fd918
  4fd90e:	ff d6                	call   esi
  4fd910:	8b c8                	mov    ecx,eax
  4fd912:	8b 15 64 b9 54 00    	mov    edx,DWORD PTR ds:0x54b964
  4fd918:	a1 60 b9 54 00       	mov    eax,ds:0x54b960
  4fd91d:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fd920:	d9 05 bc b4 54 00    	fld    DWORD PTR ds:0x54b4bc
  4fd926:	8b bd 98 fd ff ff    	mov    edi,DWORD PTR [ebp-0x268]
  4fd92c:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fd92f:	d8 0d a0 b8 54 00    	fmul   DWORD PTR ds:0x54b8a0
  4fd935:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd93c:	75 08                	jne    0x4fd946
  4fd93e:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  4fd944:	eb 0b                	jmp    0x4fd951
  4fd946:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  4fd94c:	e8 d7 6d f0 ff       	call   0x404728
  4fd951:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4fd954:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd95b:	75 08                	jne    0x4fd965
  4fd95d:	d8 35 38 bb 54 00    	fdiv   DWORD PTR ds:0x54bb38
  4fd963:	eb 0b                	jmp    0x4fd970
  4fd965:	ff 35 38 bb 54 00    	push   DWORD PTR ds:0x54bb38
  4fd96b:	e8 b8 6d f0 ff       	call   0x404728
  4fd970:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd977:	75 05                	jne    0x4fd97e
  4fd979:	d8 75 d4             	fdiv   DWORD PTR [ebp-0x2c]
  4fd97c:	eb 08                	jmp    0x4fd986
  4fd97e:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
  4fd981:	e8 a2 6d f0 ff       	call   0x404728
  4fd986:	df e0                	fnstsw ax
  4fd988:	a8 0d                	test   al,0xd
  4fd98a:	0f 85 2e 2b 00 00    	jne    0x5004be
  4fd990:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fd995:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fd998:	8b bd 94 fd ff ff    	mov    edi,DWORD PTR [ebp-0x26c]
  4fd99e:	d9 04 38             	fld    DWORD PTR [eax+edi*1]
  4fd9a1:	dc 8d 14 ff ff ff    	fmul   QWORD PTR [ebp-0xec]
  4fd9a7:	de c1                	faddp  st(1),st
  4fd9a9:	a1 5c b9 54 00       	mov    eax,ds:0x54b95c
  4fd9ae:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fd9b1:	d9 05 f4 b8 54 00    	fld    DWORD PTR ds:0x54b8f4
  4fd9b7:	8b bd 90 fd ff ff    	mov    edi,DWORD PTR [ebp-0x270]
  4fd9bd:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fd9c0:	df e0                	fnstsw ax
  4fd9c2:	a8 0d                	test   al,0xd
  4fd9c4:	0f 85 f4 2a 00 00    	jne    0x5004be
  4fd9ca:	dd 05 38 30 40 00    	fld    QWORD PTR ds:0x403038
  4fd9d0:	dc a5 0c ff ff ff    	fsub   QWORD PTR [ebp-0xf4]
  4fd9d6:	de c9                	fmulp  st(1),st
  4fd9d8:	a1 54 b9 54 00       	mov    eax,ds:0x54b954
  4fd9dd:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fd9e0:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fd9e7:	75 05                	jne    0x4fd9ee
  4fd9e9:	d8 34 18             	fdiv   DWORD PTR [eax+ebx*1]
  4fd9ec:	eb 08                	jmp    0x4fd9f6
  4fd9ee:	ff 34 18             	push   DWORD PTR [eax+ebx*1]
  4fd9f1:	e8 32 6d f0 ff       	call   0x404728
  4fd9f6:	de c1                	faddp  st(1),st
  4fd9f8:	d9 9d 8c fd ff ff    	fstp   DWORD PTR [ebp-0x274]
  4fd9fe:	df e0                	fnstsw ax
  4fda00:	a8 0d                	test   al,0xd
  4fda02:	0f 85 b6 2a 00 00    	jne    0x5004be
  4fda08:	d9 85 8c fd ff ff    	fld    DWORD PTR [ebp-0x274]
  4fda0e:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fda11:	d9 1c 0a             	fstp   DWORD PTR [edx+ecx*1]
  4fda14:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fda19:	85 c0                	test   eax,eax
  4fda1b:	74 2a                	je     0x4fda47
  4fda1d:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fda21:	75 24                	jne    0x4fda47
  4fda23:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fda26:	0f bf fb             	movsx  edi,bx
  4fda29:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fda2c:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fda2f:	72 07                	jb     0x4fda38
  4fda31:	ff d6                	call   esi
  4fda33:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fda38:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fda3f:	89 8d 88 fd ff ff    	mov    DWORD PTR [ebp-0x278],ecx
  4fda45:	eb 10                	jmp    0x4fda57
  4fda47:	ff d6                	call   esi
  4fda49:	89 85 88 fd ff ff    	mov    DWORD PTR [ebp-0x278],eax
  4fda4f:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fda54:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fda57:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fda5d:	85 c9                	test   ecx,ecx
  4fda5f:	74 2d                	je     0x4fda8e
  4fda61:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fda65:	75 27                	jne    0x4fda8e
  4fda67:	0f bf fb             	movsx  edi,bx
  4fda6a:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fda6d:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fda73:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fda76:	72 07                	jb     0x4fda7f
  4fda78:	ff d6                	call   esi
  4fda7a:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fda7f:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fda86:	89 95 84 fd ff ff    	mov    DWORD PTR [ebp-0x27c],edx
  4fda8c:	eb 0d                	jmp    0x4fda9b
  4fda8e:	ff d6                	call   esi
  4fda90:	89 85 84 fd ff ff    	mov    DWORD PTR [ebp-0x27c],eax
  4fda96:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fda9b:	85 c0                	test   eax,eax
  4fda9d:	74 21                	je     0x4fdac0
  4fda9f:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdaa3:	75 1b                	jne    0x4fdac0
  4fdaa5:	0f bf fb             	movsx  edi,bx
  4fdaa8:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdaab:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdaae:	72 07                	jb     0x4fdab7
  4fdab0:	ff d6                	call   esi
  4fdab2:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fdab7:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fdabe:	eb 09                	jmp    0x4fdac9
  4fdac0:	ff d6                	call   esi
  4fdac2:	8b d8                	mov    ebx,eax
  4fdac4:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fdac9:	85 c0                	test   eax,eax
  4fdacb:	74 22                	je     0x4fdaef
  4fdacd:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdad1:	75 1c                	jne    0x4fdaef
  4fdad3:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fdad7:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdada:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdadd:	72 07                	jb     0x4fdae6
  4fdadf:	ff d6                	call   esi
  4fdae1:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fdae6:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fdaed:	eb 09                	jmp    0x4fdaf8
  4fdaef:	ff d6                	call   esi
  4fdaf1:	8b d0                	mov    edx,eax
  4fdaf3:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fdaf8:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4fdafb:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fdb00:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fdb03:	d9 05 88 ba 54 00    	fld    DWORD PTR ds:0x54ba88
  4fdb09:	8b bd 84 fd ff ff    	mov    edi,DWORD PTR [ebp-0x27c]
  4fdb0f:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fdb12:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fdb18:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fdb1f:	75 08                	jne    0x4fdb29
  4fdb21:	d8 35 a4 b1 54 00    	fdiv   DWORD PTR ds:0x54b1a4
  4fdb27:	eb 0b                	jmp    0x4fdb34
  4fdb29:	ff 35 a4 b1 54 00    	push   DWORD PTR ds:0x54b1a4
  4fdb2f:	e8 f4 6b f0 ff       	call   0x404728
  4fdb34:	8b 85 88 fd ff ff    	mov    eax,DWORD PTR [ebp-0x278]
  4fdb3a:	d8 04 08             	fadd   DWORD PTR [eax+ecx*1]
  4fdb3d:	d9 05 54 bb 54 00    	fld    DWORD PTR ds:0x54bb54
  4fdb43:	d8 05 a4 bb 54 00    	fadd   DWORD PTR ds:0x54bba4
  4fdb49:	d8 05 7c b8 54 00    	fadd   DWORD PTR ds:0x54b87c
  4fdb4f:	d8 0c 0b             	fmul   DWORD PTR [ebx+ecx*1]
  4fdb52:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fdb58:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fdb5f:	75 08                	jne    0x4fdb69
  4fdb61:	d8 35 a4 b1 54 00    	fdiv   DWORD PTR ds:0x54b1a4
  4fdb67:	eb 0b                	jmp    0x4fdb74
  4fdb69:	ff 35 a4 b1 54 00    	push   DWORD PTR ds:0x54b1a4
  4fdb6f:	e8 b4 6b f0 ff       	call   0x404728
  4fdb74:	de e9                	fsubp  st(1),st
  4fdb76:	d9 1c 0a             	fstp   DWORD PTR [edx+ecx*1]
  4fdb79:	df e0                	fnstsw ax
  4fdb7b:	a8 0d                	test   al,0xd
  4fdb7d:	0f 85 3b 29 00 00    	jne    0x5004be
  4fdb83:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fdb88:	85 c0                	test   eax,eax
  4fdb8a:	74 1d                	je     0x4fdba9
  4fdb8c:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdb90:	75 17                	jne    0x4fdba9
  4fdb92:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fdb96:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdb99:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdb9c:	72 02                	jb     0x4fdba0
  4fdb9e:	ff d6                	call   esi
  4fdba0:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fdba7:	eb 04                	jmp    0x4fdbad
  4fdba9:	ff d6                	call   esi
  4fdbab:	8b d8                	mov    ebx,eax
  4fdbad:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdbb3:	85 c9                	test   ecx,ecx
  4fdbb5:	74 23                	je     0x4fdbda
  4fdbb7:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fdbbb:	75 1d                	jne    0x4fdbda
  4fdbbd:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fdbc1:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fdbc4:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fdbc7:	72 08                	jb     0x4fdbd1
  4fdbc9:	ff d6                	call   esi
  4fdbcb:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdbd1:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fdbd8:	eb 08                	jmp    0x4fdbe2
  4fdbda:	ff d6                	call   esi
  4fdbdc:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdbe2:	8b 15 68 b9 54 00    	mov    edx,DWORD PTR ds:0x54b968
  4fdbe8:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fdbeb:	8b 79 0c             	mov    edi,DWORD PTR [ecx+0xc]
  4fdbee:	d9 04 1a             	fld    DWORD PTR [edx+ebx*1]
  4fdbf1:	d8 1c 07             	fcomp  DWORD PTR [edi+eax*1]
  4fdbf4:	df e0                	fnstsw ax
  4fdbf6:	f6 c4 41             	test   ah,0x41
  4fdbf9:	75 7d                	jne    0x4fdc78
  4fdbfb:	85 c9                	test   ecx,ecx
  4fdbfd:	74 23                	je     0x4fdc22
  4fdbff:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fdc03:	75 1d                	jne    0x4fdc22
  4fdc05:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fdc09:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fdc0c:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fdc0f:	72 08                	jb     0x4fdc19
  4fdc11:	ff d6                	call   esi
  4fdc13:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdc19:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fdc20:	eb 0a                	jmp    0x4fdc2c
  4fdc22:	ff d6                	call   esi
  4fdc24:	8b d8                	mov    ebx,eax
  4fdc26:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdc2c:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fdc31:	85 c0                	test   eax,eax
  4fdc33:	74 23                	je     0x4fdc58
  4fdc35:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdc39:	75 1d                	jne    0x4fdc58
  4fdc3b:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fdc3f:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdc42:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdc45:	72 08                	jb     0x4fdc4f
  4fdc47:	ff d6                	call   esi
  4fdc49:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdc4f:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fdc56:	eb 08                	jmp    0x4fdc60
  4fdc58:	ff d6                	call   esi
  4fdc5a:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdc60:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fdc63:	8b 15 68 b9 54 00    	mov    edx,DWORD PTR ds:0x54b968
  4fdc69:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fdc6c:	8b 0c 19             	mov    ecx,DWORD PTR [ecx+ebx*1]
  4fdc6f:	89 0c 02             	mov    DWORD PTR [edx+eax*1],ecx
  4fdc72:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdc78:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fdc7b:	a1 a4 b9 54 00       	mov    eax,ds:0x54b9a4
  4fdc80:	85 c0                	test   eax,eax
  4fdc82:	74 28                	je     0x4fdcac
  4fdc84:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdc88:	75 22                	jne    0x4fdcac
  4fdc8a:	0f bf fb             	movsx  edi,bx
  4fdc8d:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdc90:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdc93:	72 08                	jb     0x4fdc9d
  4fdc95:	ff d6                	call   esi
  4fdc97:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdc9d:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fdca4:	89 95 80 fd ff ff    	mov    DWORD PTR [ebp-0x280],edx
  4fdcaa:	eb 0e                	jmp    0x4fdcba
  4fdcac:	ff d6                	call   esi
  4fdcae:	89 85 80 fd ff ff    	mov    DWORD PTR [ebp-0x280],eax
  4fdcb4:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fdcba:	85 c9                	test   ecx,ecx
  4fdcbc:	74 22                	je     0x4fdce0
  4fdcbe:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fdcc2:	75 1c                	jne    0x4fdce0
  4fdcc4:	0f bf fb             	movsx  edi,bx
  4fdcc7:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fdcca:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fdcd0:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fdcd3:	72 02                	jb     0x4fdcd7
  4fdcd5:	ff d6                	call   esi
  4fdcd7:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fdcde:	eb 02                	jmp    0x4fdce2
  4fdce0:	ff d6                	call   esi
  4fdce2:	89 85 7c fd ff ff    	mov    DWORD PTR [ebp-0x284],eax
  4fdce8:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fdced:	85 c0                	test   eax,eax
  4fdcef:	74 22                	je     0x4fdd13
  4fdcf1:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdcf5:	75 1c                	jne    0x4fdd13
  4fdcf7:	0f bf fb             	movsx  edi,bx
  4fdcfa:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdcfd:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdd00:	72 02                	jb     0x4fdd04
  4fdd02:	ff d6                	call   esi
  4fdd04:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fdd0b:	89 8d 78 fd ff ff    	mov    DWORD PTR [ebp-0x288],ecx
  4fdd11:	eb 08                	jmp    0x4fdd1b
  4fdd13:	ff d6                	call   esi
  4fdd15:	89 85 78 fd ff ff    	mov    DWORD PTR [ebp-0x288],eax
  4fdd1b:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fdd20:	85 c0                	test   eax,eax
  4fdd22:	74 18                	je     0x4fdd3c
  4fdd24:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdd28:	75 12                	jne    0x4fdd3c
  4fdd2a:	0f bf fb             	movsx  edi,bx
  4fdd2d:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdd30:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdd33:	72 02                	jb     0x4fdd37
  4fdd35:	ff d6                	call   esi
  4fdd37:	c1 e7 02             	shl    edi,0x2
  4fdd3a:	eb 04                	jmp    0x4fdd40
  4fdd3c:	ff d6                	call   esi
  4fdd3e:	8b f8                	mov    edi,eax
  4fdd40:	a1 a4 b9 54 00       	mov    eax,ds:0x54b9a4
  4fdd45:	85 c0                	test   eax,eax
  4fdd47:	74 1d                	je     0x4fdd66
  4fdd49:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdd4d:	75 17                	jne    0x4fdd66
  4fdd4f:	0f bf 5d e0          	movsx  ebx,WORD PTR [ebp-0x20]
  4fdd53:	2b 58 14             	sub    ebx,DWORD PTR [eax+0x14]
  4fdd56:	3b 58 10             	cmp    ebx,DWORD PTR [eax+0x10]
  4fdd59:	72 02                	jb     0x4fdd5d
  4fdd5b:	ff d6                	call   esi
  4fdd5d:	8d 14 9d 00 00 00 00 	lea    edx,[ebx*4+0x0]
  4fdd64:	eb 04                	jmp    0x4fdd6a
  4fdd66:	ff d6                	call   esi
  4fdd68:	8b d0                	mov    edx,eax
  4fdd6a:	a1 a4 b9 54 00       	mov    eax,ds:0x54b9a4
  4fdd6f:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4fdd72:	d9 05 9c bf 54 00    	fld    DWORD PTR ds:0x54bf9c
  4fdd78:	d8 05 a4 b6 54 00    	fadd   DWORD PTR ds:0x54b6a4
  4fdd7e:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fdd84:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fdd87:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fdd8c:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fdd8f:	8b 9d 7c fd ff ff    	mov    ebx,DWORD PTR [ebp-0x284]
  4fdd95:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fdd98:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fdd9f:	75 08                	jne    0x4fdda9
  4fdda1:	d8 35 30 bb 54 00    	fdiv   DWORD PTR ds:0x54bb30
  4fdda7:	eb 0b                	jmp    0x4fddb4
  4fdda9:	ff 35 30 bb 54 00    	push   DWORD PTR ds:0x54bb30
  4fddaf:	e8 74 69 f0 ff       	call   0x404728
  4fddb4:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fddbb:	75 05                	jne    0x4fddc2
  4fddbd:	d8 75 c0             	fdiv   DWORD PTR [ebp-0x40]
  4fddc0:	eb 08                	jmp    0x4fddca
  4fddc2:	ff 75 c0             	push   DWORD PTR [ebp-0x40]
  4fddc5:	e8 5e 69 f0 ff       	call   0x404728
  4fddca:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fddd1:	75 05                	jne    0x4fddd8
  4fddd3:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fddd6:	eb 08                	jmp    0x4fdde0
  4fddd8:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fdddb:	e8 48 69 f0 ff       	call   0x404728
  4fdde0:	8b 85 80 fd ff ff    	mov    eax,DWORD PTR [ebp-0x280]
  4fdde6:	d8 04 08             	fadd   DWORD PTR [eax+ecx*1]
  4fdde9:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fddee:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fddf1:	8b 9d 78 fd ff ff    	mov    ebx,DWORD PTR [ebp-0x288]
  4fddf7:	d9 04 18             	fld    DWORD PTR [eax+ebx*1]
  4fddfa:	a1 14 b6 54 00       	mov    eax,ds:0x54b614
  4fddff:	d8 48 44             	fmul   DWORD PTR [eax+0x44]
  4fde02:	de c1                	faddp  st(1),st
  4fde04:	d9 05 a4 bb 54 00    	fld    DWORD PTR ds:0x54bba4
  4fde0a:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fde10:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fde13:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fde18:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fde1b:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fde1e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fde25:	75 08                	jne    0x4fde2f
  4fde27:	d8 35 c0 b2 54 00    	fdiv   DWORD PTR ds:0x54b2c0
  4fde2d:	eb 0b                	jmp    0x4fde3a
  4fde2f:	ff 35 c0 b2 54 00    	push   DWORD PTR ds:0x54b2c0
  4fde35:	e8 ee 68 f0 ff       	call   0x404728
  4fde3a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fde41:	75 05                	jne    0x4fde48
  4fde43:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4fde46:	eb 08                	jmp    0x4fde50
  4fde48:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4fde4b:	e8 d8 68 f0 ff       	call   0x404728
  4fde50:	de c1                	faddp  st(1),st
  4fde52:	d9 1c 0a             	fstp   DWORD PTR [edx+ecx*1]
  4fde55:	df e0                	fnstsw ax
  4fde57:	a8 0d                	test   al,0xd
  4fde59:	0f 85 5f 26 00 00    	jne    0x5004be
  4fde5f:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  4fde64:	8b 08                	mov    ecx,DWORD PTR [eax]
  4fde66:	50                   	push   eax
  4fde67:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  4fde6d:	50                   	push   eax
  4fde6e:	8d 55 a8             	lea    edx,[ebp-0x58]
  4fde71:	52                   	push   edx
  4fde72:	8b 1d 94 10 40 00    	mov    ebx,DWORD PTR ds:0x401094
  4fde78:	ff d3                	call   ebx
  4fde7a:	8b f8                	mov    edi,eax
  4fde7c:	8b 07                	mov    eax,DWORD PTR [edi]
  4fde7e:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  4fde81:	51                   	push   ecx
  4fde82:	6a 00                	push   0x0
  4fde84:	57                   	push   edi
  4fde85:	ff 50 40             	call   DWORD PTR [eax+0x40]
  4fde88:	db e2                	fnclex
  4fde8a:	85 c0                	test   eax,eax
  4fde8c:	7d 0f                	jge    0x4fde9d
  4fde8e:	6a 40                	push   0x40
  4fde90:	68 68 c9 41 00       	push   0x41c968
  4fde95:	57                   	push   edi
  4fde96:	50                   	push   eax
  4fde97:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  4fde9d:	6a 00                	push   0x0
  4fde9f:	68 09 00 03 68       	push   0x68030009
  4fdea4:	8b 55 a4             	mov    edx,DWORD PTR [ebp-0x5c]
  4fdea7:	52                   	push   edx
  4fdea8:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  4fdeae:	50                   	push   eax
  4fdeaf:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  4fdeb5:	83 c4 10             	add    esp,0x10
  4fdeb8:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  4fdebd:	8b 08                	mov    ecx,DWORD PTR [eax]
  4fdebf:	50                   	push   eax
  4fdec0:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  4fdec6:	50                   	push   eax
  4fdec7:	8d 55 a0             	lea    edx,[ebp-0x60]
  4fdeca:	52                   	push   edx
  4fdecb:	ff d3                	call   ebx
  4fdecd:	8b f8                	mov    edi,eax
  4fdecf:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fded5:	8b 07                	mov    eax,DWORD PTR [edi]
  4fded7:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  4fdeda:	51                   	push   ecx
  4fdedb:	6a 01                	push   0x1
  4fdedd:	57                   	push   edi
  4fdede:	ff 50 40             	call   DWORD PTR [eax+0x40]
  4fdee1:	db e2                	fnclex
  4fdee3:	85 c0                	test   eax,eax
  4fdee5:	7d 0f                	jge    0x4fdef6
  4fdee7:	6a 40                	push   0x40
  4fdee9:	68 68 c9 41 00       	push   0x41c968
  4fdeee:	57                   	push   edi
  4fdeef:	50                   	push   eax
  4fdef0:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  4fdef6:	6a 00                	push   0x0
  4fdef8:	68 09 00 03 68       	push   0x68030009
  4fdefd:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  4fdf00:	52                   	push   edx
  4fdf01:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  4fdf07:	50                   	push   eax
  4fdf08:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  4fdf0e:	83 c4 10             	add    esp,0x10
  4fdf11:	a1 b8 b9 54 00       	mov    eax,ds:0x54b9b8
  4fdf16:	85 c0                	test   eax,eax
  4fdf18:	74 25                	je     0x4fdf3f
  4fdf1a:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdf1e:	75 1f                	jne    0x4fdf3f
  4fdf20:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fdf23:	0f bf fb             	movsx  edi,bx
  4fdf26:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdf29:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdf2c:	72 02                	jb     0x4fdf30
  4fdf2e:	ff d6                	call   esi
  4fdf30:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fdf37:	89 8d 74 fd ff ff    	mov    DWORD PTR [ebp-0x28c],ecx
  4fdf3d:	eb 0b                	jmp    0x4fdf4a
  4fdf3f:	ff d6                	call   esi
  4fdf41:	89 85 74 fd ff ff    	mov    DWORD PTR [ebp-0x28c],eax
  4fdf47:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fdf4a:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fdf4f:	85 c0                	test   eax,eax
  4fdf51:	74 22                	je     0x4fdf75
  4fdf53:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdf57:	75 1c                	jne    0x4fdf75
  4fdf59:	0f bf fb             	movsx  edi,bx
  4fdf5c:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdf5f:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdf62:	72 02                	jb     0x4fdf66
  4fdf64:	ff d6                	call   esi
  4fdf66:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fdf6d:	89 95 70 fd ff ff    	mov    DWORD PTR [ebp-0x290],edx
  4fdf73:	eb 08                	jmp    0x4fdf7d
  4fdf75:	ff d6                	call   esi
  4fdf77:	89 85 70 fd ff ff    	mov    DWORD PTR [ebp-0x290],eax
  4fdf7d:	a1 b4 b9 54 00       	mov    eax,ds:0x54b9b4
  4fdf82:	85 c0                	test   eax,eax
  4fdf84:	74 1c                	je     0x4fdfa2
  4fdf86:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdf8a:	75 16                	jne    0x4fdfa2
  4fdf8c:	0f bf fb             	movsx  edi,bx
  4fdf8f:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdf92:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdf95:	72 02                	jb     0x4fdf99
  4fdf97:	ff d6                	call   esi
  4fdf99:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fdfa0:	eb 02                	jmp    0x4fdfa4
  4fdfa2:	ff d6                	call   esi
  4fdfa4:	89 85 6c fd ff ff    	mov    DWORD PTR [ebp-0x294],eax
  4fdfaa:	a1 b8 b9 54 00       	mov    eax,ds:0x54b9b8
  4fdfaf:	85 c0                	test   eax,eax
  4fdfb1:	74 22                	je     0x4fdfd5
  4fdfb3:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdfb7:	75 1c                	jne    0x4fdfd5
  4fdfb9:	0f bf fb             	movsx  edi,bx
  4fdfbc:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdfbf:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdfc2:	72 02                	jb     0x4fdfc6
  4fdfc4:	ff d6                	call   esi
  4fdfc6:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fdfcd:	89 8d 68 fd ff ff    	mov    DWORD PTR [ebp-0x298],ecx
  4fdfd3:	eb 08                	jmp    0x4fdfdd
  4fdfd5:	ff d6                	call   esi
  4fdfd7:	89 85 68 fd ff ff    	mov    DWORD PTR [ebp-0x298],eax
  4fdfdd:	a1 b4 b9 54 00       	mov    eax,ds:0x54b9b4
  4fdfe2:	85 c0                	test   eax,eax
  4fdfe4:	74 22                	je     0x4fe008
  4fdfe6:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fdfea:	75 1c                	jne    0x4fe008
  4fdfec:	0f bf fb             	movsx  edi,bx
  4fdfef:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fdff2:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fdff5:	72 02                	jb     0x4fdff9
  4fdff7:	ff d6                	call   esi
  4fdff9:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fe000:	89 95 64 fd ff ff    	mov    DWORD PTR [ebp-0x29c],edx
  4fe006:	eb 08                	jmp    0x4fe010
  4fe008:	ff d6                	call   esi
  4fe00a:	89 85 64 fd ff ff    	mov    DWORD PTR [ebp-0x29c],eax
  4fe010:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fe015:	85 c0                	test   eax,eax
  4fe017:	74 1c                	je     0x4fe035
  4fe019:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fe01d:	75 16                	jne    0x4fe035
  4fe01f:	0f bf fb             	movsx  edi,bx
  4fe022:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fe025:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fe028:	72 02                	jb     0x4fe02c
  4fe02a:	ff d6                	call   esi
  4fe02c:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fe033:	eb 02                	jmp    0x4fe037
  4fe035:	ff d6                	call   esi
  4fe037:	89 85 60 fd ff ff    	mov    DWORD PTR [ebp-0x2a0],eax
  4fe03d:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fe042:	85 c0                	test   eax,eax
  4fe044:	74 27                	je     0x4fe06d
  4fe046:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fe04a:	75 21                	jne    0x4fe06d
  4fe04c:	0f bf fb             	movsx  edi,bx
  4fe04f:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fe052:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fe055:	72 07                	jb     0x4fe05e
  4fe057:	ff d6                	call   esi
  4fe059:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fe05e:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fe065:	89 8d 5c fd ff ff    	mov    DWORD PTR [ebp-0x2a4],ecx
  4fe06b:	eb 0d                	jmp    0x4fe07a
  4fe06d:	ff d6                	call   esi
  4fe06f:	89 85 5c fd ff ff    	mov    DWORD PTR [ebp-0x2a4],eax
  4fe075:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fe07a:	85 c0                	test   eax,eax
  4fe07c:	74 27                	je     0x4fe0a5
  4fe07e:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fe082:	75 21                	jne    0x4fe0a5
  4fe084:	0f bf fb             	movsx  edi,bx
  4fe087:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fe08a:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fe08d:	72 07                	jb     0x4fe096
  4fe08f:	ff d6                	call   esi
  4fe091:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fe096:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fe09d:	89 95 58 fd ff ff    	mov    DWORD PTR [ebp-0x2a8],edx
  4fe0a3:	eb 0d                	jmp    0x4fe0b2
  4fe0a5:	ff d6                	call   esi
  4fe0a7:	89 85 58 fd ff ff    	mov    DWORD PTR [ebp-0x2a8],eax
  4fe0ad:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fe0b2:	8b 0d 68 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b968
  4fe0b8:	8b 79 0c             	mov    edi,DWORD PTR [ecx+0xc]
  4fe0bb:	8b 15 b4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b4
  4fe0c1:	8b 5a 0c             	mov    ebx,DWORD PTR [edx+0xc]
  4fe0c4:	8b 0d b8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9b8
  4fe0ca:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fe0cd:	89 95 00 fe ff ff    	mov    DWORD PTR [ebp-0x200],edx
  4fe0d3:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fe0d6:	89 85 fc fd ff ff    	mov    DWORD PTR [ebp-0x204],eax
  4fe0dc:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  4fe0e2:	51                   	push   ecx
  4fe0e3:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  4fe0e9:	0f bf d0             	movsx  edx,ax
  4fe0ec:	89 95 54 fd ff ff    	mov    DWORD PTR [ebp-0x2ac],edx
  4fe0f2:	db 85 54 fd ff ff    	fild   DWORD PTR [ebp-0x2ac]
  4fe0f8:	d9 9d 50 fd ff ff    	fstp   DWORD PTR [ebp-0x2b0]
  4fe0fe:	d9 85 50 fd ff ff    	fld    DWORD PTR [ebp-0x2b0]
  4fe104:	d8 0d 20 b5 54 00    	fmul   DWORD PTR ds:0x54b520
  4fe10a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe111:	75 08                	jne    0x4fe11b
  4fe113:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  4fe119:	eb 0b                	jmp    0x4fe126
  4fe11b:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  4fe121:	e8 02 66 f0 ff       	call   0x404728
  4fe126:	df e0                	fnstsw ax
  4fe128:	a8 0d                	test   al,0xd
  4fe12a:	0f 85 8e 23 00 00    	jne    0x5004be
  4fe130:	d9 9d 4c fd ff ff    	fstp   DWORD PTR [ebp-0x2b4]
  4fe136:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  4fe13c:	50                   	push   eax
  4fe13d:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  4fe143:	0f bf c8             	movsx  ecx,ax
  4fe146:	89 8d 48 fd ff ff    	mov    DWORD PTR [ebp-0x2b8],ecx
  4fe14c:	db 85 48 fd ff ff    	fild   DWORD PTR [ebp-0x2b8]
  4fe152:	d9 9d 44 fd ff ff    	fstp   DWORD PTR [ebp-0x2bc]
  4fe158:	d9 85 44 fd ff ff    	fld    DWORD PTR [ebp-0x2bc]
  4fe15e:	d8 0d 1c b5 54 00    	fmul   DWORD PTR ds:0x54b51c
  4fe164:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe16b:	75 08                	jne    0x4fe175
  4fe16d:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  4fe173:	eb 0b                	jmp    0x4fe180
  4fe175:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  4fe17b:	e8 a8 65 f0 ff       	call   0x404728
  4fe180:	d8 85 4c fd ff ff    	fadd   DWORD PTR [ebp-0x2b4]
  4fe186:	8b 95 70 fd ff ff    	mov    edx,DWORD PTR [ebp-0x290]
  4fe18c:	d9 04 3a             	fld    DWORD PTR [edx+edi*1]
  4fe18f:	8b 85 6c fd ff ff    	mov    eax,DWORD PTR [ebp-0x294]
  4fe195:	d8 24 18             	fsub   DWORD PTR [eax+ebx*1]
  4fe198:	8b 85 00 fe ff ff    	mov    eax,DWORD PTR [ebp-0x200]
  4fe19e:	8b 8d 68 fd ff ff    	mov    ecx,DWORD PTR [ebp-0x298]
  4fe1a4:	d8 0c 08             	fmul   DWORD PTR [eax+ecx*1]
  4fe1a7:	8b 95 64 fd ff ff    	mov    edx,DWORD PTR [ebp-0x29c]
  4fe1ad:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe1b4:	75 05                	jne    0x4fe1bb
  4fe1b6:	d8 34 13             	fdiv   DWORD PTR [ebx+edx*1]
  4fe1b9:	eb 08                	jmp    0x4fe1c3
  4fe1bb:	ff 34 13             	push   DWORD PTR [ebx+edx*1]
  4fe1be:	e8 65 65 f0 ff       	call   0x404728
  4fe1c3:	de c9                	fmulp  st(1),st
  4fe1c5:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fe1cb:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe1d2:	75 08                	jne    0x4fe1dc
  4fe1d4:	d8 35 10 b9 54 00    	fdiv   DWORD PTR ds:0x54b910
  4fe1da:	eb 0b                	jmp    0x4fe1e7
  4fe1dc:	ff 35 10 b9 54 00    	push   DWORD PTR ds:0x54b910
  4fe1e2:	e8 41 65 f0 ff       	call   0x404728
  4fe1e7:	8b 8d 74 fd ff ff    	mov    ecx,DWORD PTR [ebp-0x28c]
  4fe1ed:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4fe1f0:	d9 05 54 bb 54 00    	fld    DWORD PTR ds:0x54bb54
  4fe1f6:	8b 95 60 fd ff ff    	mov    edx,DWORD PTR [ebp-0x2a0]
  4fe1fc:	d8 0c 17             	fmul   DWORD PTR [edi+edx*1]
  4fe1ff:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fe205:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fe208:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe20f:	75 05                	jne    0x4fe216
  4fe211:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4fe214:	eb 08                	jmp    0x4fe21e
  4fe216:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4fe219:	e8 0a 65 f0 ff       	call   0x404728
  4fe21e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe225:	75 08                	jne    0x4fe22f
  4fe227:	d8 35 10 b9 54 00    	fdiv   DWORD PTR ds:0x54b910
  4fe22d:	eb 0b                	jmp    0x4fe23a
  4fe22f:	ff 35 10 b9 54 00    	push   DWORD PTR ds:0x54b910
  4fe235:	e8 ee 64 f0 ff       	call   0x404728
  4fe23a:	de c1                	faddp  st(1),st
  4fe23c:	d9 05 ac b8 54 00    	fld    DWORD PTR ds:0x54b8ac
  4fe242:	8b 8d fc fd ff ff    	mov    ecx,DWORD PTR [ebp-0x204]
  4fe248:	8b 85 5c fd ff ff    	mov    eax,DWORD PTR [ebp-0x2a4]
  4fe24e:	d8 0c 01             	fmul   DWORD PTR [ecx+eax*1]
  4fe251:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe258:	75 08                	jne    0x4fe262
  4fe25a:	d8 35 10 b9 54 00    	fdiv   DWORD PTR ds:0x54b910
  4fe260:	eb 0b                	jmp    0x4fe26d
  4fe262:	ff 35 10 b9 54 00    	push   DWORD PTR ds:0x54b910
  4fe268:	e8 bb 64 f0 ff       	call   0x404728
  4fe26d:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fe273:	de e9                	fsubp  st(1),st
  4fe275:	8b 95 58 fd ff ff    	mov    edx,DWORD PTR [ebp-0x2a8]
  4fe27b:	d9 1c 0a             	fstp   DWORD PTR [edx+ecx*1]
  4fe27e:	df e0                	fnstsw ax
  4fe280:	a8 0d                	test   al,0xd
  4fe282:	0f 85 36 22 00 00    	jne    0x5004be
  4fe288:	8d 45 9c             	lea    eax,[ebp-0x64]
  4fe28b:	50                   	push   eax
  4fe28c:	8d 4d a0             	lea    ecx,[ebp-0x60]
  4fe28f:	51                   	push   ecx
  4fe290:	8d 55 a4             	lea    edx,[ebp-0x5c]
  4fe293:	52                   	push   edx
  4fe294:	8d 45 a8             	lea    eax,[ebp-0x58]
  4fe297:	50                   	push   eax
  4fe298:	6a 04                	push   0x4
  4fe29a:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  4fe2a0:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  4fe2a6:	51                   	push   ecx
  4fe2a7:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
  4fe2ad:	52                   	push   edx
  4fe2ae:	6a 02                	push   0x2
  4fe2b0:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  4fe2b6:	83 c4 20             	add    esp,0x20
  4fe2b9:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fe2bf:	85 c9                	test   ecx,ecx
  4fe2c1:	74 23                	je     0x4fe2e6
  4fe2c3:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe2c7:	75 1d                	jne    0x4fe2e6
  4fe2c9:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe2cd:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe2d0:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe2d3:	72 08                	jb     0x4fe2dd
  4fe2d5:	ff d6                	call   esi
  4fe2d7:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fe2dd:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fe2e4:	eb 0a                	jmp    0x4fe2f0
  4fe2e6:	ff d6                	call   esi
  4fe2e8:	8b d8                	mov    ebx,eax
  4fe2ea:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fe2f0:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fe2f6:	85 d2                	test   edx,edx
  4fe2f8:	74 2f                	je     0x4fe329
  4fe2fa:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fe2fe:	75 29                	jne    0x4fe329
  4fe300:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe304:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fe307:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fe30a:	72 0e                	jb     0x4fe31a
  4fe30c:	ff d6                	call   esi
  4fe30e:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fe314:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fe31a:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fe321:	89 85 40 fd ff ff    	mov    DWORD PTR [ebp-0x2c0],eax
  4fe327:	eb 14                	jmp    0x4fe33d
  4fe329:	ff d6                	call   esi
  4fe32b:	89 85 40 fd ff ff    	mov    DWORD PTR [ebp-0x2c0],eax
  4fe331:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fe337:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fe33d:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
  4fe340:	8b 7a 0c             	mov    edi,DWORD PTR [edx+0xc]
  4fe343:	d9 04 18             	fld    DWORD PTR [eax+ebx*1]
  4fe346:	8b 85 40 fd ff ff    	mov    eax,DWORD PTR [ebp-0x2c0]
  4fe34c:	d8 1c 07             	fcomp  DWORD PTR [edi+eax*1]
  4fe34f:	df e0                	fnstsw ax
  4fe351:	f6 c4 01             	test   ah,0x1
  4fe354:	0f 84 84 00 00 00    	je     0x4fe3de
  4fe35a:	85 d2                	test   edx,edx
  4fe35c:	74 29                	je     0x4fe387
  4fe35e:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fe362:	75 23                	jne    0x4fe387
  4fe364:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe368:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fe36b:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fe36e:	72 0e                	jb     0x4fe37e
  4fe370:	ff d6                	call   esi
  4fe372:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fe378:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fe37e:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fe385:	eb 10                	jmp    0x4fe397
  4fe387:	ff d6                	call   esi
  4fe389:	8b d8                	mov    ebx,eax
  4fe38b:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fe391:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fe397:	85 c9                	test   ecx,ecx
  4fe399:	74 29                	je     0x4fe3c4
  4fe39b:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe39f:	75 23                	jne    0x4fe3c4
  4fe3a1:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe3a5:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe3a8:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe3ab:	72 0e                	jb     0x4fe3bb
  4fe3ad:	ff d6                	call   esi
  4fe3af:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fe3b5:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fe3bb:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fe3c2:	eb 0e                	jmp    0x4fe3d2
  4fe3c4:	ff d6                	call   esi
  4fe3c6:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fe3cc:	8b 15 b8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9b8
  4fe3d2:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fe3d5:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fe3d8:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4fe3db:	89 14 01             	mov    DWORD PTR [ecx+eax*1],edx
  4fe3de:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4fe3e1:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe3e6:	85 c0                	test   eax,eax
  4fe3e8:	74 27                	je     0x4fe411
  4fe3ea:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fe3ee:	75 21                	jne    0x4fe411
  4fe3f0:	0f bf fb             	movsx  edi,bx
  4fe3f3:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fe3f6:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fe3f9:	72 07                	jb     0x4fe402
  4fe3fb:	ff d6                	call   esi
  4fe3fd:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe402:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fe409:	89 8d 3c fd ff ff    	mov    DWORD PTR [ebp-0x2c4],ecx
  4fe40f:	eb 0d                	jmp    0x4fe41e
  4fe411:	ff d6                	call   esi
  4fe413:	89 85 3c fd ff ff    	mov    DWORD PTR [ebp-0x2c4],eax
  4fe419:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe41e:	8b 0d 64 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b964
  4fe424:	85 c9                	test   ecx,ecx
  4fe426:	74 2d                	je     0x4fe455
  4fe428:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe42c:	75 27                	jne    0x4fe455
  4fe42e:	0f bf fb             	movsx  edi,bx
  4fe431:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe434:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fe43a:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe43d:	72 07                	jb     0x4fe446
  4fe43f:	ff d6                	call   esi
  4fe441:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe446:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fe44d:	89 95 38 fd ff ff    	mov    DWORD PTR [ebp-0x2c8],edx
  4fe453:	eb 0d                	jmp    0x4fe462
  4fe455:	ff d6                	call   esi
  4fe457:	89 85 38 fd ff ff    	mov    DWORD PTR [ebp-0x2c8],eax
  4fe45d:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe462:	8b 0d ac b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9ac
  4fe468:	85 c9                	test   ecx,ecx
  4fe46a:	74 27                	je     0x4fe493
  4fe46c:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe470:	75 21                	jne    0x4fe493
  4fe472:	0f bf fb             	movsx  edi,bx
  4fe475:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe478:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe47b:	72 07                	jb     0x4fe484
  4fe47d:	ff d6                	call   esi
  4fe47f:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe484:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fe48b:	89 8d 34 fd ff ff    	mov    DWORD PTR [ebp-0x2cc],ecx
  4fe491:	eb 0d                	jmp    0x4fe4a0
  4fe493:	ff d6                	call   esi
  4fe495:	89 85 34 fd ff ff    	mov    DWORD PTR [ebp-0x2cc],eax
  4fe49b:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe4a0:	85 c0                	test   eax,eax
  4fe4a2:	74 21                	je     0x4fe4c5
  4fe4a4:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fe4a8:	75 1b                	jne    0x4fe4c5
  4fe4aa:	0f bf fb             	movsx  edi,bx
  4fe4ad:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fe4b0:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fe4b3:	72 07                	jb     0x4fe4bc
  4fe4b5:	ff d6                	call   esi
  4fe4b7:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe4bc:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fe4c3:	eb 09                	jmp    0x4fe4ce
  4fe4c5:	ff d6                	call   esi
  4fe4c7:	8b d8                	mov    ebx,eax
  4fe4c9:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe4ce:	85 c0                	test   eax,eax
  4fe4d0:	74 22                	je     0x4fe4f4
  4fe4d2:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fe4d6:	75 1c                	jne    0x4fe4f4
  4fe4d8:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe4dc:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fe4df:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fe4e2:	72 07                	jb     0x4fe4eb
  4fe4e4:	ff d6                	call   esi
  4fe4e6:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe4eb:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fe4f2:	eb 09                	jmp    0x4fe4fd
  4fe4f4:	ff d6                	call   esi
  4fe4f6:	8b d0                	mov    edx,eax
  4fe4f8:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fe4fd:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4fe500:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fe505:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fe508:	d9 05 b4 b6 54 00    	fld    DWORD PTR ds:0x54b6b4
  4fe50e:	8b bd 38 fd ff ff    	mov    edi,DWORD PTR [ebp-0x2c8]
  4fe514:	d8 0c 38             	fmul   DWORD PTR [eax+edi*1]
  4fe517:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fe51d:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fe520:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe527:	75 08                	jne    0x4fe531
  4fe529:	d8 35 0c b9 54 00    	fdiv   DWORD PTR ds:0x54b90c
  4fe52f:	eb 0b                	jmp    0x4fe53c
  4fe531:	ff 35 0c b9 54 00    	push   DWORD PTR ds:0x54b90c
  4fe537:	e8 ec 61 f0 ff       	call   0x404728
  4fe53c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe543:	75 05                	jne    0x4fe54a
  4fe545:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4fe548:	eb 08                	jmp    0x4fe552
  4fe54a:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4fe54d:	e8 d6 61 f0 ff       	call   0x404728
  4fe552:	8b 85 3c fd ff ff    	mov    eax,DWORD PTR [ebp-0x2c4]
  4fe558:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4fe55b:	a1 ac b9 54 00       	mov    eax,ds:0x54b9ac
  4fe560:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fe563:	8b bd 34 fd ff ff    	mov    edi,DWORD PTR [ebp-0x2cc]
  4fe569:	d9 04 38             	fld    DWORD PTR [eax+edi*1]
  4fe56c:	a1 14 b6 54 00       	mov    eax,ds:0x54b614
  4fe571:	d8 48 48             	fmul   DWORD PTR [eax+0x48]
  4fe574:	d8 0d 14 b9 54 00    	fmul   DWORD PTR ds:0x54b914
  4fe57a:	de c1                	faddp  st(1),st
  4fe57c:	d9 05 04 b9 54 00    	fld    DWORD PTR ds:0x54b904
  4fe582:	d8 0c 19             	fmul   DWORD PTR [ecx+ebx*1]
  4fe585:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe58c:	75 08                	jne    0x4fe596
  4fe58e:	d8 35 0c b9 54 00    	fdiv   DWORD PTR ds:0x54b90c
  4fe594:	eb 0b                	jmp    0x4fe5a1
  4fe596:	ff 35 0c b9 54 00    	push   DWORD PTR ds:0x54b90c
  4fe59c:	e8 87 61 f0 ff       	call   0x404728
  4fe5a1:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fe5a7:	de e9                	fsubp  st(1),st
  4fe5a9:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fe5ac:	df e0                	fnstsw ax
  4fe5ae:	a8 0d                	test   al,0xd
  4fe5b0:	0f 85 08 1f 00 00    	jne    0x5004be
  4fe5b6:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fe5bc:	85 d2                	test   edx,edx
  4fe5be:	74 23                	je     0x4fe5e3
  4fe5c0:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fe5c4:	75 1d                	jne    0x4fe5e3
  4fe5c6:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe5ca:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fe5cd:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fe5d0:	72 08                	jb     0x4fe5da
  4fe5d2:	ff d6                	call   esi
  4fe5d4:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fe5da:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fe5e1:	eb 0a                	jmp    0x4fe5ed
  4fe5e3:	ff d6                	call   esi
  4fe5e5:	8b d8                	mov    ebx,eax
  4fe5e7:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fe5ed:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fe5f3:	85 c9                	test   ecx,ecx
  4fe5f5:	74 2f                	je     0x4fe626
  4fe5f7:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe5fb:	75 29                	jne    0x4fe626
  4fe5fd:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe601:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe604:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe607:	72 0e                	jb     0x4fe617
  4fe609:	ff d6                	call   esi
  4fe60b:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fe611:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fe617:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fe61e:	89 85 30 fd ff ff    	mov    DWORD PTR [ebp-0x2d0],eax
  4fe624:	eb 14                	jmp    0x4fe63a
  4fe626:	ff d6                	call   esi
  4fe628:	89 85 30 fd ff ff    	mov    DWORD PTR [ebp-0x2d0],eax
  4fe62e:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fe634:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fe63a:	8b 42 0c             	mov    eax,DWORD PTR [edx+0xc]
  4fe63d:	8b 79 0c             	mov    edi,DWORD PTR [ecx+0xc]
  4fe640:	d9 04 18             	fld    DWORD PTR [eax+ebx*1]
  4fe643:	8b 85 30 fd ff ff    	mov    eax,DWORD PTR [ebp-0x2d0]
  4fe649:	d8 1c 07             	fcomp  DWORD PTR [edi+eax*1]
  4fe64c:	df e0                	fnstsw ax
  4fe64e:	f6 c4 01             	test   ah,0x1
  4fe651:	0f 84 84 00 00 00    	je     0x4fe6db
  4fe657:	85 c9                	test   ecx,ecx
  4fe659:	74 29                	je     0x4fe684
  4fe65b:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe65f:	75 23                	jne    0x4fe684
  4fe661:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe665:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe668:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe66b:	72 0e                	jb     0x4fe67b
  4fe66d:	ff d6                	call   esi
  4fe66f:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fe675:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fe67b:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fe682:	eb 10                	jmp    0x4fe694
  4fe684:	ff d6                	call   esi
  4fe686:	8b d8                	mov    ebx,eax
  4fe688:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fe68e:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fe694:	85 d2                	test   edx,edx
  4fe696:	74 29                	je     0x4fe6c1
  4fe698:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fe69c:	75 23                	jne    0x4fe6c1
  4fe69e:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe6a2:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fe6a5:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fe6a8:	72 0e                	jb     0x4fe6b8
  4fe6aa:	ff d6                	call   esi
  4fe6ac:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fe6b2:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fe6b8:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fe6bf:	eb 0e                	jmp    0x4fe6cf
  4fe6c1:	ff d6                	call   esi
  4fe6c3:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fe6c9:	8b 0d bc b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9bc
  4fe6cf:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fe6d2:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fe6d5:	8b 0c 19             	mov    ecx,DWORD PTR [ecx+ebx*1]
  4fe6d8:	89 0c 02             	mov    DWORD PTR [edx+eax*1],ecx
  4fe6db:	a1 64 b9 54 00       	mov    eax,ds:0x54b964
  4fe6e0:	85 c0                	test   eax,eax
  4fe6e2:	74 1d                	je     0x4fe701
  4fe6e4:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fe6e8:	75 17                	jne    0x4fe701
  4fe6ea:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe6ee:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fe6f1:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fe6f4:	72 02                	jb     0x4fe6f8
  4fe6f6:	ff d6                	call   esi
  4fe6f8:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fe6ff:	eb 04                	jmp    0x4fe705
  4fe701:	ff d6                	call   esi
  4fe703:	8b d8                	mov    ebx,eax
  4fe705:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe70b:	85 c9                	test   ecx,ecx
  4fe70d:	74 29                	je     0x4fe738
  4fe70f:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe713:	75 23                	jne    0x4fe738
  4fe715:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe719:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe71c:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe71f:	72 08                	jb     0x4fe729
  4fe721:	ff d6                	call   esi
  4fe723:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe729:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fe730:	89 95 2c fd ff ff    	mov    DWORD PTR [ebp-0x2d4],edx
  4fe736:	eb 0e                	jmp    0x4fe746
  4fe738:	ff d6                	call   esi
  4fe73a:	89 85 2c fd ff ff    	mov    DWORD PTR [ebp-0x2d4],eax
  4fe740:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe746:	85 c9                	test   ecx,ecx
  4fe748:	74 2a                	je     0x4fe774
  4fe74a:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe74e:	75 24                	jne    0x4fe774
  4fe750:	bf 09 00 00 00       	mov    edi,0x9
  4fe755:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe758:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fe75e:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe761:	72 08                	jb     0x4fe76b
  4fe763:	ff d6                	call   esi
  4fe765:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe76b:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fe772:	eb 08                	jmp    0x4fe77c
  4fe774:	ff d6                	call   esi
  4fe776:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe77c:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fe77f:	8b 3d 64 b9 54 00    	mov    edi,DWORD PTR ds:0x54b964
  4fe785:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4fe788:	d9 04 1f             	fld    DWORD PTR [edi+ebx*1]
  4fe78b:	8b bd 2c fd ff ff    	mov    edi,DWORD PTR [ebp-0x2d4]
  4fe791:	d8 0c 3a             	fmul   DWORD PTR [edx+edi*1]
  4fe794:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fe79b:	75 05                	jne    0x4fe7a2
  4fe79d:	d8 34 02             	fdiv   DWORD PTR [edx+eax*1]
  4fe7a0:	eb 08                	jmp    0x4fe7aa
  4fe7a2:	ff 34 02             	push   DWORD PTR [edx+eax*1]
  4fe7a5:	e8 7e 5f f0 ff       	call   0x404728
  4fe7aa:	d8 05 b4 b8 54 00    	fadd   DWORD PTR ds:0x54b8b4
  4fe7b0:	d9 1d b4 b8 54 00    	fstp   DWORD PTR ds:0x54b8b4
  4fe7b6:	df e0                	fnstsw ax
  4fe7b8:	a8 0d                	test   al,0xd
  4fe7ba:	0f 85 fe 1c 00 00    	jne    0x5004be
  4fe7c0:	b8 01 00 00 00       	mov    eax,0x1
  4fe7c5:	66 03 45 e0          	add    ax,WORD PTR [ebp-0x20]
  4fe7c9:	0f 80 f4 1c 00 00    	jo     0x5004c3
  4fe7cf:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4fe7d2:	33 db                	xor    ebx,ebx
  4fe7d4:	e9 ef ec ff ff       	jmp    0x4fd4c8
  4fe7d9:	89 1d 80 b8 54 00    	mov    DWORD PTR ds:0x54b880,ebx
  4fe7df:	89 1d 84 b8 54 00    	mov    DWORD PTR ds:0x54b884,ebx
  4fe7e5:	89 1d 88 b8 54 00    	mov    DWORD PTR ds:0x54b888,ebx
  4fe7eb:	89 1d 8c b8 54 00    	mov    DWORD PTR ds:0x54b88c,ebx
  4fe7f1:	89 1d e8 b9 54 00    	mov    DWORD PTR ds:0x54b9e8,ebx
  4fe7f7:	89 1d ec b9 54 00    	mov    DWORD PTR ds:0x54b9ec,ebx
  4fe7fd:	89 1d f8 b9 54 00    	mov    DWORD PTR ds:0x54b9f8,ebx
  4fe803:	89 1d fc b9 54 00    	mov    DWORD PTR ds:0x54b9fc,ebx
  4fe809:	89 1d c8 b9 54 00    	mov    DWORD PTR ds:0x54b9c8,ebx
  4fe80f:	89 1d cc b9 54 00    	mov    DWORD PTR ds:0x54b9cc,ebx
  4fe815:	89 1d d0 b9 54 00    	mov    DWORD PTR ds:0x54b9d0,ebx
  4fe81b:	89 1d d4 b9 54 00    	mov    DWORD PTR ds:0x54b9d4,ebx
  4fe821:	89 1d d8 b9 54 00    	mov    DWORD PTR ds:0x54b9d8,ebx
  4fe827:	89 1d dc b9 54 00    	mov    DWORD PTR ds:0x54b9dc,ebx
  4fe82d:	89 1d e0 b9 54 00    	mov    DWORD PTR ds:0x54b9e0,ebx
  4fe833:	89 1d e4 b9 54 00    	mov    DWORD PTR ds:0x54b9e4,ebx
  4fe839:	a1 44 b9 54 00       	mov    eax,ds:0x54b944
  4fe83e:	89 85 ac fe ff ff    	mov    DWORD PTR [ebp-0x154],eax
  4fe844:	b8 01 00 00 00       	mov    eax,0x1
  4fe849:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4fe84c:	66 3b 85 ac fe ff ff 	cmp    ax,WORD PTR [ebp-0x154]
  4fe853:	0f 8f 6c 14 00 00    	jg     0x4ffcc5
  4fe859:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fe85f:	3b d3                	cmp    edx,ebx
  4fe861:	74 22                	je     0x4fe885
  4fe863:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4fe867:	75 1c                	jne    0x4fe885
  4fe869:	0f bf f8             	movsx  edi,ax
  4fe86c:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4fe86f:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4fe872:	72 08                	jb     0x4fe87c
  4fe874:	ff d6                	call   esi
  4fe876:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe87c:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fe883:	eb 0a                	jmp    0x4fe88f
  4fe885:	ff d6                	call   esi
  4fe887:	8b d8                	mov    ebx,eax
  4fe889:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe88f:	85 c9                	test   ecx,ecx
  4fe891:	74 23                	je     0x4fe8b6
  4fe893:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe897:	75 1d                	jne    0x4fe8b6
  4fe899:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe89d:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe8a0:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe8a3:	72 08                	jb     0x4fe8ad
  4fe8a5:	ff d6                	call   esi
  4fe8a7:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe8ad:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fe8b4:	eb 08                	jmp    0x4fe8be
  4fe8b6:	ff d6                	call   esi
  4fe8b8:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe8be:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4fe8c4:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fe8c7:	d9 05 0c b1 54 00    	fld    DWORD PTR ds:0x54b10c
  4fe8cd:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4fe8d0:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fe8d3:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4fe8d6:	d8 05 80 b8 54 00    	fadd   DWORD PTR ds:0x54b880
  4fe8dc:	d9 1d 80 b8 54 00    	fstp   DWORD PTR ds:0x54b880
  4fe8e2:	df e0                	fnstsw ax
  4fe8e4:	a8 0d                	test   al,0xd
  4fe8e6:	0f 85 d2 1b 00 00    	jne    0x5004be
  4fe8ec:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fe8f1:	85 c0                	test   eax,eax
  4fe8f3:	74 23                	je     0x4fe918
  4fe8f5:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fe8f9:	75 1d                	jne    0x4fe918
  4fe8fb:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe8ff:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fe902:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fe905:	72 08                	jb     0x4fe90f
  4fe907:	ff d6                	call   esi
  4fe909:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe90f:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fe916:	eb 0a                	jmp    0x4fe922
  4fe918:	ff d6                	call   esi
  4fe91a:	8b d8                	mov    ebx,eax
  4fe91c:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe922:	85 c9                	test   ecx,ecx
  4fe924:	74 23                	je     0x4fe949
  4fe926:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe92a:	75 1d                	jne    0x4fe949
  4fe92c:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe930:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe933:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe936:	72 08                	jb     0x4fe940
  4fe938:	ff d6                	call   esi
  4fe93a:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe940:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fe947:	eb 08                	jmp    0x4fe951
  4fe949:	ff d6                	call   esi
  4fe94b:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe951:	8b 15 68 b9 54 00    	mov    edx,DWORD PTR ds:0x54b968
  4fe957:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fe95a:	d9 05 10 b1 54 00    	fld    DWORD PTR ds:0x54b110
  4fe960:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4fe963:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fe966:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4fe969:	d8 05 84 b8 54 00    	fadd   DWORD PTR ds:0x54b884
  4fe96f:	d9 1d 84 b8 54 00    	fstp   DWORD PTR ds:0x54b884
  4fe975:	df e0                	fnstsw ax
  4fe977:	a8 0d                	test   al,0xd
  4fe979:	0f 85 3f 1b 00 00    	jne    0x5004be
  4fe97f:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fe984:	85 c0                	test   eax,eax
  4fe986:	74 23                	je     0x4fe9ab
  4fe988:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fe98c:	75 1d                	jne    0x4fe9ab
  4fe98e:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe992:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fe995:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fe998:	72 08                	jb     0x4fe9a2
  4fe99a:	ff d6                	call   esi
  4fe99c:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe9a2:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fe9a9:	eb 0a                	jmp    0x4fe9b5
  4fe9ab:	ff d6                	call   esi
  4fe9ad:	8b d8                	mov    ebx,eax
  4fe9af:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe9b5:	85 c9                	test   ecx,ecx
  4fe9b7:	74 23                	je     0x4fe9dc
  4fe9b9:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fe9bd:	75 1d                	jne    0x4fe9dc
  4fe9bf:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fe9c3:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fe9c6:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fe9c9:	72 08                	jb     0x4fe9d3
  4fe9cb:	ff d6                	call   esi
  4fe9cd:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe9d3:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fe9da:	eb 08                	jmp    0x4fe9e4
  4fe9dc:	ff d6                	call   esi
  4fe9de:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fe9e4:	8b 15 a8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a8
  4fe9ea:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fe9ed:	d9 05 14 b1 54 00    	fld    DWORD PTR ds:0x54b114
  4fe9f3:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4fe9f6:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4fe9f9:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4fe9fc:	d8 05 88 b8 54 00    	fadd   DWORD PTR ds:0x54b888
  4fea02:	d9 1d 88 b8 54 00    	fstp   DWORD PTR ds:0x54b888
  4fea08:	df e0                	fnstsw ax
  4fea0a:	a8 0d                	test   al,0xd
  4fea0c:	0f 85 ac 1a 00 00    	jne    0x5004be
  4fea12:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4fea17:	85 c0                	test   eax,eax
  4fea19:	74 23                	je     0x4fea3e
  4fea1b:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fea1f:	75 1d                	jne    0x4fea3e
  4fea21:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fea25:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fea28:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fea2b:	72 08                	jb     0x4fea35
  4fea2d:	ff d6                	call   esi
  4fea2f:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fea35:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fea3c:	eb 0a                	jmp    0x4fea48
  4fea3e:	ff d6                	call   esi
  4fea40:	8b d8                	mov    ebx,eax
  4fea42:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fea48:	85 c9                	test   ecx,ecx
  4fea4a:	74 23                	je     0x4fea6f
  4fea4c:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fea50:	75 1d                	jne    0x4fea6f
  4fea52:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fea56:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fea59:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fea5c:	72 08                	jb     0x4fea66
  4fea5e:	ff d6                	call   esi
  4fea60:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fea66:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fea6d:	eb 08                	jmp    0x4fea77
  4fea6f:	ff d6                	call   esi
  4fea71:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4fea77:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fea7d:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4fea80:	d9 05 18 b1 54 00    	fld    DWORD PTR ds:0x54b118
  4fea86:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4fea89:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fea8c:	d8 0c 01             	fmul   DWORD PTR [ecx+eax*1]
  4fea8f:	d8 05 8c b8 54 00    	fadd   DWORD PTR ds:0x54b88c
  4fea95:	d9 1d 8c b8 54 00    	fstp   DWORD PTR ds:0x54b88c
  4fea9b:	df e0                	fnstsw ax
  4fea9d:	a8 0d                	test   al,0xd
  4fea9f:	0f 85 19 1a 00 00    	jne    0x5004be
  4feaa5:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
  4feaa8:	66 83 f9 05          	cmp    cx,0x5
  4feaac:	a1 a4 b9 54 00       	mov    eax,ds:0x54b9a4
  4feab1:	0f 8f dd 05 00 00    	jg     0x4ff094
  4feab7:	85 c0                	test   eax,eax
  4feab9:	74 1c                	je     0x4fead7
  4feabb:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4feabf:	75 16                	jne    0x4fead7
  4feac1:	0f bf f9             	movsx  edi,cx
  4feac4:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4feac7:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4feaca:	72 02                	jb     0x4feace
  4feacc:	ff d6                	call   esi
  4feace:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fead5:	eb 02                	jmp    0x4fead9
  4fead7:	ff d6                	call   esi
  4fead9:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4feadf:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  4feae2:	d9 05 48 bb 54 00    	fld    DWORD PTR ds:0x54bb48
  4feae8:	d8 0c 01             	fmul   DWORD PTR [ecx+eax*1]
  4feaeb:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  4feaee:	d8 4d c8             	fmul   DWORD PTR [ebp-0x38]
  4feaf1:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4feaf8:	75 05                	jne    0x4feaff
  4feafa:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4feafd:	eb 08                	jmp    0x4feb07
  4feaff:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4feb02:	e8 21 5c f0 ff       	call   0x404728
  4feb07:	d8 0d c0 b8 54 00    	fmul   DWORD PTR ds:0x54b8c0
  4feb0d:	d8 0d d0 b8 54 00    	fmul   DWORD PTR ds:0x54b8d0
  4feb13:	d8 05 c8 b9 54 00    	fadd   DWORD PTR ds:0x54b9c8
  4feb19:	d9 1d c8 b9 54 00    	fstp   DWORD PTR ds:0x54b9c8
  4feb1f:	df e0                	fnstsw ax
  4feb21:	a8 0d                	test   al,0xd
  4feb23:	0f 85 95 19 00 00    	jne    0x5004be
  4feb29:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4feb2e:	85 c0                	test   eax,eax
  4feb30:	74 1d                	je     0x4feb4f
  4feb32:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4feb36:	75 17                	jne    0x4feb4f
  4feb38:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4feb3c:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4feb3f:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4feb42:	72 02                	jb     0x4feb46
  4feb44:	ff d6                	call   esi
  4feb46:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4feb4d:	eb 02                	jmp    0x4feb51
  4feb4f:	ff d6                	call   esi
  4feb51:	8b 15 68 b9 54 00    	mov    edx,DWORD PTR ds:0x54b968
  4feb57:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  4feb5a:	d9 05 7c b8 54 00    	fld    DWORD PTR ds:0x54b87c
  4feb60:	d8 0c 01             	fmul   DWORD PTR [ecx+eax*1]
  4feb63:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4feb66:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4feb6d:	75 05                	jne    0x4feb74
  4feb6f:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4feb72:	eb 08                	jmp    0x4feb7c
  4feb74:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4feb77:	e8 ac 5b f0 ff       	call   0x404728
  4feb7c:	d8 0d c4 b8 54 00    	fmul   DWORD PTR ds:0x54b8c4
  4feb82:	d8 0d d4 b8 54 00    	fmul   DWORD PTR ds:0x54b8d4
  4feb88:	d8 05 d0 b9 54 00    	fadd   DWORD PTR ds:0x54b9d0
  4feb8e:	d9 1d d0 b9 54 00    	fstp   DWORD PTR ds:0x54b9d0
  4feb94:	df e0                	fnstsw ax
  4feb96:	a8 0d                	test   al,0xd
  4feb98:	0f 85 20 19 00 00    	jne    0x5004be
  4feb9e:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4feba3:	85 c0                	test   eax,eax
  4feba5:	74 1d                	je     0x4febc4
  4feba7:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4febab:	75 17                	jne    0x4febc4
  4febad:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4febb1:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4febb4:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4febb7:	72 02                	jb     0x4febbb
  4febb9:	ff d6                	call   esi
  4febbb:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4febc2:	eb 02                	jmp    0x4febc6
  4febc4:	ff d6                	call   esi
  4febc6:	8b 15 a8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a8
  4febcc:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  4febcf:	d9 05 ac b8 54 00    	fld    DWORD PTR ds:0x54b8ac
  4febd5:	d8 0c 01             	fmul   DWORD PTR [ecx+eax*1]
  4febd8:	d8 0d c8 b8 54 00    	fmul   DWORD PTR ds:0x54b8c8
  4febde:	d8 0d d8 b8 54 00    	fmul   DWORD PTR ds:0x54b8d8
  4febe4:	d8 05 d8 b9 54 00    	fadd   DWORD PTR ds:0x54b9d8
  4febea:	d9 1d d8 b9 54 00    	fstp   DWORD PTR ds:0x54b9d8
  4febf0:	df e0                	fnstsw ax
  4febf2:	a8 0d                	test   al,0xd
  4febf4:	0f 85 c4 18 00 00    	jne    0x5004be
  4febfa:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4febff:	85 c0                	test   eax,eax
  4fec01:	74 1d                	je     0x4fec20
  4fec03:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fec07:	75 17                	jne    0x4fec20
  4fec09:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fec0d:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fec10:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fec13:	72 02                	jb     0x4fec17
  4fec15:	ff d6                	call   esi
  4fec17:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fec1e:	eb 02                	jmp    0x4fec22
  4fec20:	ff d6                	call   esi
  4fec22:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4fec28:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  4fec2b:	d9 05 04 b9 54 00    	fld    DWORD PTR ds:0x54b904
  4fec31:	d8 0c 01             	fmul   DWORD PTR [ecx+eax*1]
  4fec34:	d8 0d cc b8 54 00    	fmul   DWORD PTR ds:0x54b8cc
  4fec3a:	d8 0d dc b8 54 00    	fmul   DWORD PTR ds:0x54b8dc
  4fec40:	d8 05 e0 b9 54 00    	fadd   DWORD PTR ds:0x54b9e0
  4fec46:	d9 1d e0 b9 54 00    	fstp   DWORD PTR ds:0x54b9e0
  4fec4c:	df e0                	fnstsw ax
  4fec4e:	a8 0d                	test   al,0xd
  4fec50:	0f 85 68 18 00 00    	jne    0x5004be
  4fec56:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4fec5b:	85 c0                	test   eax,eax
  4fec5d:	74 28                	je     0x4fec87
  4fec5f:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fec63:	75 22                	jne    0x4fec87
  4fec65:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fec69:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fec6c:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fec6f:	72 07                	jb     0x4fec78
  4fec71:	ff d6                	call   esi
  4fec73:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4fec78:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fec7f:	89 95 28 fd ff ff    	mov    DWORD PTR [ebp-0x2d8],edx
  4fec85:	eb 0d                	jmp    0x4fec94
  4fec87:	ff d6                	call   esi
  4fec89:	89 85 28 fd ff ff    	mov    DWORD PTR [ebp-0x2d8],eax
  4fec8f:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4fec94:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4fec9a:	85 c9                	test   ecx,ecx
  4fec9c:	74 28                	je     0x4fecc6
  4fec9e:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4feca2:	75 22                	jne    0x4fecc6
  4feca4:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4feca8:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fecab:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fecb1:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fecb4:	72 07                	jb     0x4fecbd
  4fecb6:	ff d6                	call   esi
  4fecb8:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4fecbd:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fecc4:	eb 09                	jmp    0x4feccf
  4fecc6:	ff d6                	call   esi
  4fecc8:	8b d8                	mov    ebx,eax
  4fecca:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4feccf:	85 c0                	test   eax,eax
  4fecd1:	74 22                	je     0x4fecf5
  4fecd3:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fecd7:	75 1c                	jne    0x4fecf5
  4fecd9:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fecdd:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fece0:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fece3:	72 07                	jb     0x4fecec
  4fece5:	ff d6                	call   esi
  4fece7:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4fecec:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fecf3:	eb 09                	jmp    0x4fecfe
  4fecf5:	ff d6                	call   esi
  4fecf7:	8b d0                	mov    edx,eax
  4fecf9:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4fecfe:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4fed01:	a1 a4 b9 54 00       	mov    eax,ds:0x54b9a4
  4fed06:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fed09:	d9 05 48 bb 54 00    	fld    DWORD PTR ds:0x54bb48
  4fed0f:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fed12:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  4fed15:	d8 4d c8             	fmul   DWORD PTR [ebp-0x38]
  4fed18:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fed1f:	75 05                	jne    0x4fed26
  4fed21:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4fed24:	eb 08                	jmp    0x4fed2e
  4fed26:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4fed29:	e8 fa 59 f0 ff       	call   0x404728
  4fed2e:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fed34:	d8 0d c0 b8 54 00    	fmul   DWORD PTR ds:0x54b8c0
  4fed3a:	d8 0d d0 b8 54 00    	fmul   DWORD PTR ds:0x54b8d0
  4fed40:	8b 85 28 fd ff ff    	mov    eax,DWORD PTR [ebp-0x2d8]
  4fed46:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4fed49:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fed4c:	df e0                	fnstsw ax
  4fed4e:	a8 0d                	test   al,0xd
  4fed50:	0f 85 68 17 00 00    	jne    0x5004be
  4fed56:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fed5b:	85 c0                	test   eax,eax
  4fed5d:	74 28                	je     0x4fed87
  4fed5f:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fed63:	75 22                	jne    0x4fed87
  4fed65:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fed69:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fed6c:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fed6f:	72 07                	jb     0x4fed78
  4fed71:	ff d6                	call   esi
  4fed73:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fed78:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fed7f:	89 8d 24 fd ff ff    	mov    DWORD PTR [ebp-0x2dc],ecx
  4fed85:	eb 0d                	jmp    0x4fed94
  4fed87:	ff d6                	call   esi
  4fed89:	89 85 24 fd ff ff    	mov    DWORD PTR [ebp-0x2dc],eax
  4fed8f:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fed94:	8b 0d 68 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b968
  4fed9a:	85 c9                	test   ecx,ecx
  4fed9c:	74 28                	je     0x4fedc6
  4fed9e:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4feda2:	75 22                	jne    0x4fedc6
  4feda4:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4feda8:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fedab:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4fedb1:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fedb4:	72 07                	jb     0x4fedbd
  4fedb6:	ff d6                	call   esi
  4fedb8:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fedbd:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4fedc4:	eb 09                	jmp    0x4fedcf
  4fedc6:	ff d6                	call   esi
  4fedc8:	8b d8                	mov    ebx,eax
  4fedca:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fedcf:	85 c0                	test   eax,eax
  4fedd1:	74 22                	je     0x4fedf5
  4fedd3:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fedd7:	75 1c                	jne    0x4fedf5
  4fedd9:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4feddd:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fede0:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fede3:	72 07                	jb     0x4fedec
  4fede5:	ff d6                	call   esi
  4fede7:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fedec:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fedf3:	eb 09                	jmp    0x4fedfe
  4fedf5:	ff d6                	call   esi
  4fedf7:	8b d0                	mov    edx,eax
  4fedf9:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fedfe:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4fee01:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4fee06:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fee09:	d9 05 7c b8 54 00    	fld    DWORD PTR ds:0x54b87c
  4fee0f:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fee12:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4fee15:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fee1c:	75 05                	jne    0x4fee23
  4fee1e:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4fee21:	eb 08                	jmp    0x4fee2b
  4fee23:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4fee26:	e8 fd 58 f0 ff       	call   0x404728
  4fee2b:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fee31:	d8 0d c4 b8 54 00    	fmul   DWORD PTR ds:0x54b8c4
  4fee37:	d8 0d d4 b8 54 00    	fmul   DWORD PTR ds:0x54b8d4
  4fee3d:	8b 85 24 fd ff ff    	mov    eax,DWORD PTR [ebp-0x2dc]
  4fee43:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4fee46:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fee49:	df e0                	fnstsw ax
  4fee4b:	a8 0d                	test   al,0xd
  4fee4d:	0f 85 6b 16 00 00    	jne    0x5004be
  4fee53:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4fee58:	85 c0                	test   eax,eax
  4fee5a:	74 28                	je     0x4fee84
  4fee5c:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fee60:	75 22                	jne    0x4fee84
  4fee62:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fee66:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fee69:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fee6c:	72 07                	jb     0x4fee75
  4fee6e:	ff d6                	call   esi
  4fee70:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4fee75:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4fee7c:	89 8d 20 fd ff ff    	mov    DWORD PTR [ebp-0x2e0],ecx
  4fee82:	eb 0d                	jmp    0x4fee91
  4fee84:	ff d6                	call   esi
  4fee86:	89 85 20 fd ff ff    	mov    DWORD PTR [ebp-0x2e0],eax
  4fee8c:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4fee91:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4fee97:	85 c9                	test   ecx,ecx
  4fee99:	74 28                	je     0x4feec3
  4fee9b:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fee9f:	75 22                	jne    0x4feec3
  4feea1:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4feea5:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4feea8:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4feeae:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4feeb1:	72 07                	jb     0x4feeba
  4feeb3:	ff d6                	call   esi
  4feeb5:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4feeba:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4feec1:	eb 09                	jmp    0x4feecc
  4feec3:	ff d6                	call   esi
  4feec5:	8b d8                	mov    ebx,eax
  4feec7:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4feecc:	85 c0                	test   eax,eax
  4feece:	74 22                	je     0x4feef2
  4feed0:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4feed4:	75 1c                	jne    0x4feef2
  4feed6:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4feeda:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4feedd:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4feee0:	72 07                	jb     0x4feee9
  4feee2:	ff d6                	call   esi
  4feee4:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4feee9:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4feef0:	eb 09                	jmp    0x4feefb
  4feef2:	ff d6                	call   esi
  4feef4:	8b d0                	mov    edx,eax
  4feef6:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4feefb:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4feefe:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4fef03:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4fef06:	d9 05 ac b8 54 00    	fld    DWORD PTR ds:0x54b8ac
  4fef0c:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4fef0f:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4fef15:	d8 0d c8 b8 54 00    	fmul   DWORD PTR ds:0x54b8c8
  4fef1b:	d8 0d d8 b8 54 00    	fmul   DWORD PTR ds:0x54b8d8
  4fef21:	8b 85 20 fd ff ff    	mov    eax,DWORD PTR [ebp-0x2e0]
  4fef27:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4fef2a:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4fef2d:	df e0                	fnstsw ax
  4fef2f:	a8 0d                	test   al,0xd
  4fef31:	0f 85 87 15 00 00    	jne    0x5004be
  4fef37:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fef3c:	85 c0                	test   eax,eax
  4fef3e:	74 1e                	je     0x4fef5e
  4fef40:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fef44:	75 18                	jne    0x4fef5e
  4fef46:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fef4a:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fef4d:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fef50:	72 07                	jb     0x4fef59
  4fef52:	ff d6                	call   esi
  4fef54:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fef59:	c1 e7 02             	shl    edi,0x2
  4fef5c:	eb 09                	jmp    0x4fef67
  4fef5e:	ff d6                	call   esi
  4fef60:	8b f8                	mov    edi,eax
  4fef62:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4fef67:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  4fef6a:	d9 05 30 30 40 00    	fld    DWORD PTR ds:0x403030
  4fef70:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  4fef76:	d8 1c 3b             	fcomp  DWORD PTR [ebx+edi*1]
  4fef79:	df e0                	fnstsw ax
  4fef7b:	f6 c4 41             	test   ah,0x41
  4fef7e:	75 3f                	jne    0x4fefbf
  4fef80:	8b 0d 28 b8 54 00    	mov    ecx,DWORD PTR ds:0x54b828
  4fef86:	85 c9                	test   ecx,ecx
  4fef88:	74 23                	je     0x4fefad
  4fef8a:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4fef8e:	75 1d                	jne    0x4fefad
  4fef90:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fef94:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4fef97:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4fef9a:	72 08                	jb     0x4fefa4
  4fef9c:	ff d6                	call   esi
  4fef9e:	8b 0d 28 b8 54 00    	mov    ecx,DWORD PTR ds:0x54b828
  4fefa4:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4fefab:	eb 08                	jmp    0x4fefb5
  4fefad:	ff d6                	call   esi
  4fefaf:	8b 0d 28 b8 54 00    	mov    ecx,DWORD PTR ds:0x54b828
  4fefb5:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4fefb8:	c7 04 01 5f 70 89 30 	mov    DWORD PTR [ecx+eax*1],0x3089705f
  4fefbf:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4fefc4:	85 c0                	test   eax,eax
  4fefc6:	74 28                	je     0x4feff0
  4fefc8:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4fefcc:	75 22                	jne    0x4feff0
  4fefce:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4fefd2:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4fefd5:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4fefd8:	72 07                	jb     0x4fefe1
  4fefda:	ff d6                	call   esi
  4fefdc:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4fefe1:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4fefe8:	89 95 1c fd ff ff    	mov    DWORD PTR [ebp-0x2e4],edx
  4fefee:	eb 0d                	jmp    0x4feffd
  4feff0:	ff d6                	call   esi
  4feff2:	89 85 1c fd ff ff    	mov    DWORD PTR [ebp-0x2e4],eax
  4feff8:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4feffd:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4ff003:	85 c9                	test   ecx,ecx
  4ff005:	74 28                	je     0x4ff02f
  4ff007:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ff00b:	75 22                	jne    0x4ff02f
  4ff00d:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff011:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ff014:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4ff01a:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ff01d:	72 07                	jb     0x4ff026
  4ff01f:	ff d6                	call   esi
  4ff021:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff026:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ff02d:	eb 09                	jmp    0x4ff038
  4ff02f:	ff d6                	call   esi
  4ff031:	8b d8                	mov    ebx,eax
  4ff033:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff038:	85 c0                	test   eax,eax
  4ff03a:	74 1e                	je     0x4ff05a
  4ff03c:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff040:	75 18                	jne    0x4ff05a
  4ff042:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff046:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff049:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff04c:	72 07                	jb     0x4ff055
  4ff04e:	ff d6                	call   esi
  4ff050:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff055:	c1 e7 02             	shl    edi,0x2
  4ff058:	eb 09                	jmp    0x4ff063
  4ff05a:	ff d6                	call   esi
  4ff05c:	8b f8                	mov    edi,eax
  4ff05e:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff063:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4ff066:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4ff06b:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  4ff06e:	d9 05 04 b9 54 00    	fld    DWORD PTR ds:0x54b904
  4ff074:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4ff077:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4ff07d:	d8 0d cc b8 54 00    	fmul   DWORD PTR ds:0x54b8cc
  4ff083:	d8 0d dc b8 54 00    	fmul   DWORD PTR ds:0x54b8dc
  4ff089:	8b 85 1c fd ff ff    	mov    eax,DWORD PTR [ebp-0x2e4]
  4ff08f:	e9 a8 05 00 00       	jmp    0x4ff63c
  4ff094:	85 c0                	test   eax,eax
  4ff096:	74 1c                	je     0x4ff0b4
  4ff098:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff09c:	75 16                	jne    0x4ff0b4
  4ff09e:	0f bf f9             	movsx  edi,cx
  4ff0a1:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff0a4:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff0a7:	72 02                	jb     0x4ff0ab
  4ff0a9:	ff d6                	call   esi
  4ff0ab:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ff0b2:	eb 02                	jmp    0x4ff0b6
  4ff0b4:	ff d6                	call   esi
  4ff0b6:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4ff0bc:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4ff0bf:	d9 05 48 bb 54 00    	fld    DWORD PTR ds:0x54bb48
  4ff0c5:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4ff0c8:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  4ff0cb:	d8 4d c8             	fmul   DWORD PTR [ebp-0x38]
  4ff0ce:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ff0d5:	75 05                	jne    0x4ff0dc
  4ff0d7:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4ff0da:	eb 08                	jmp    0x4ff0e4
  4ff0dc:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4ff0df:	e8 44 56 f0 ff       	call   0x404728
  4ff0e4:	d8 0d d0 b8 54 00    	fmul   DWORD PTR ds:0x54b8d0
  4ff0ea:	d8 05 cc b9 54 00    	fadd   DWORD PTR ds:0x54b9cc
  4ff0f0:	d9 1d cc b9 54 00    	fstp   DWORD PTR ds:0x54b9cc
  4ff0f6:	df e0                	fnstsw ax
  4ff0f8:	a8 0d                	test   al,0xd
  4ff0fa:	0f 85 be 13 00 00    	jne    0x5004be
  4ff100:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4ff105:	85 c0                	test   eax,eax
  4ff107:	74 1d                	je     0x4ff126
  4ff109:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff10d:	75 17                	jne    0x4ff126
  4ff10f:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff113:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff116:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff119:	72 02                	jb     0x4ff11d
  4ff11b:	ff d6                	call   esi
  4ff11d:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ff124:	eb 02                	jmp    0x4ff128
  4ff126:	ff d6                	call   esi
  4ff128:	8b 0d 68 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b968
  4ff12e:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4ff131:	d9 05 7c b8 54 00    	fld    DWORD PTR ds:0x54b87c
  4ff137:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4ff13a:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4ff13d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ff144:	75 05                	jne    0x4ff14b
  4ff146:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4ff149:	eb 08                	jmp    0x4ff153
  4ff14b:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4ff14e:	e8 d5 55 f0 ff       	call   0x404728
  4ff153:	d8 0d d4 b8 54 00    	fmul   DWORD PTR ds:0x54b8d4
  4ff159:	d8 05 d4 b9 54 00    	fadd   DWORD PTR ds:0x54b9d4
  4ff15f:	d9 1d d4 b9 54 00    	fstp   DWORD PTR ds:0x54b9d4
  4ff165:	df e0                	fnstsw ax
  4ff167:	a8 0d                	test   al,0xd
  4ff169:	0f 85 4f 13 00 00    	jne    0x5004be
  4ff16f:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4ff174:	85 c0                	test   eax,eax
  4ff176:	74 1d                	je     0x4ff195
  4ff178:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff17c:	75 17                	jne    0x4ff195
  4ff17e:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff182:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff185:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff188:	72 02                	jb     0x4ff18c
  4ff18a:	ff d6                	call   esi
  4ff18c:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ff193:	eb 02                	jmp    0x4ff197
  4ff195:	ff d6                	call   esi
  4ff197:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4ff19d:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4ff1a0:	d9 05 ac b8 54 00    	fld    DWORD PTR ds:0x54b8ac
  4ff1a6:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4ff1a9:	d8 0d d0 b8 54 00    	fmul   DWORD PTR ds:0x54b8d0
  4ff1af:	d8 05 dc b9 54 00    	fadd   DWORD PTR ds:0x54b9dc
  4ff1b5:	d9 1d dc b9 54 00    	fstp   DWORD PTR ds:0x54b9dc
  4ff1bb:	df e0                	fnstsw ax
  4ff1bd:	a8 0d                	test   al,0xd
  4ff1bf:	0f 85 f9 12 00 00    	jne    0x5004be
  4ff1c5:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4ff1ca:	85 c0                	test   eax,eax
  4ff1cc:	74 1d                	je     0x4ff1eb
  4ff1ce:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff1d2:	75 17                	jne    0x4ff1eb
  4ff1d4:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff1d8:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff1db:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff1de:	72 02                	jb     0x4ff1e2
  4ff1e0:	ff d6                	call   esi
  4ff1e2:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ff1e9:	eb 02                	jmp    0x4ff1ed
  4ff1eb:	ff d6                	call   esi
  4ff1ed:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4ff1f3:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4ff1f6:	d9 05 04 b9 54 00    	fld    DWORD PTR ds:0x54b904
  4ff1fc:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4ff1ff:	d8 0d dc b8 54 00    	fmul   DWORD PTR ds:0x54b8dc
  4ff205:	d8 05 e4 b9 54 00    	fadd   DWORD PTR ds:0x54b9e4
  4ff20b:	d9 1d e4 b9 54 00    	fstp   DWORD PTR ds:0x54b9e4
  4ff211:	df e0                	fnstsw ax
  4ff213:	a8 0d                	test   al,0xd
  4ff215:	0f 85 a3 12 00 00    	jne    0x5004be
  4ff21b:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4ff220:	85 c0                	test   eax,eax
  4ff222:	74 28                	je     0x4ff24c
  4ff224:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff228:	75 22                	jne    0x4ff24c
  4ff22a:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff22e:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff231:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff234:	72 07                	jb     0x4ff23d
  4ff236:	ff d6                	call   esi
  4ff238:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4ff23d:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4ff244:	89 8d 18 fd ff ff    	mov    DWORD PTR [ebp-0x2e8],ecx
  4ff24a:	eb 0d                	jmp    0x4ff259
  4ff24c:	ff d6                	call   esi
  4ff24e:	89 85 18 fd ff ff    	mov    DWORD PTR [ebp-0x2e8],eax
  4ff254:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4ff259:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4ff25f:	85 c9                	test   ecx,ecx
  4ff261:	74 28                	je     0x4ff28b
  4ff263:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ff267:	75 22                	jne    0x4ff28b
  4ff269:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff26d:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ff270:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4ff276:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ff279:	72 07                	jb     0x4ff282
  4ff27b:	ff d6                	call   esi
  4ff27d:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4ff282:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ff289:	eb 09                	jmp    0x4ff294
  4ff28b:	ff d6                	call   esi
  4ff28d:	8b d8                	mov    ebx,eax
  4ff28f:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4ff294:	85 c0                	test   eax,eax
  4ff296:	74 22                	je     0x4ff2ba
  4ff298:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff29c:	75 1c                	jne    0x4ff2ba
  4ff29e:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff2a2:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff2a5:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff2a8:	72 07                	jb     0x4ff2b1
  4ff2aa:	ff d6                	call   esi
  4ff2ac:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4ff2b1:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4ff2b8:	eb 09                	jmp    0x4ff2c3
  4ff2ba:	ff d6                	call   esi
  4ff2bc:	8b d0                	mov    edx,eax
  4ff2be:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4ff2c3:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4ff2c6:	a1 a4 b9 54 00       	mov    eax,ds:0x54b9a4
  4ff2cb:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4ff2ce:	d9 05 48 bb 54 00    	fld    DWORD PTR ds:0x54bb48
  4ff2d4:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4ff2d7:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  4ff2da:	d8 4d c8             	fmul   DWORD PTR [ebp-0x38]
  4ff2dd:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ff2e4:	75 05                	jne    0x4ff2eb
  4ff2e6:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4ff2e9:	eb 08                	jmp    0x4ff2f3
  4ff2eb:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4ff2ee:	e8 35 54 f0 ff       	call   0x404728
  4ff2f3:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4ff2f9:	d8 0d d0 b8 54 00    	fmul   DWORD PTR ds:0x54b8d0
  4ff2ff:	8b 85 18 fd ff ff    	mov    eax,DWORD PTR [ebp-0x2e8]
  4ff305:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4ff308:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4ff30b:	df e0                	fnstsw ax
  4ff30d:	a8 0d                	test   al,0xd
  4ff30f:	0f 85 a9 11 00 00    	jne    0x5004be
  4ff315:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff31a:	85 c0                	test   eax,eax
  4ff31c:	74 28                	je     0x4ff346
  4ff31e:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff322:	75 22                	jne    0x4ff346
  4ff324:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff328:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff32b:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff32e:	72 07                	jb     0x4ff337
  4ff330:	ff d6                	call   esi
  4ff332:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff337:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4ff33e:	89 8d 14 fd ff ff    	mov    DWORD PTR [ebp-0x2ec],ecx
  4ff344:	eb 0d                	jmp    0x4ff353
  4ff346:	ff d6                	call   esi
  4ff348:	89 85 14 fd ff ff    	mov    DWORD PTR [ebp-0x2ec],eax
  4ff34e:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff353:	8b 0d 68 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b968
  4ff359:	85 c9                	test   ecx,ecx
  4ff35b:	74 28                	je     0x4ff385
  4ff35d:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ff361:	75 22                	jne    0x4ff385
  4ff363:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff367:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ff36a:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4ff370:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ff373:	72 07                	jb     0x4ff37c
  4ff375:	ff d6                	call   esi
  4ff377:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff37c:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ff383:	eb 09                	jmp    0x4ff38e
  4ff385:	ff d6                	call   esi
  4ff387:	8b d8                	mov    ebx,eax
  4ff389:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff38e:	85 c0                	test   eax,eax
  4ff390:	74 22                	je     0x4ff3b4
  4ff392:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff396:	75 1c                	jne    0x4ff3b4
  4ff398:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff39c:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff39f:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff3a2:	72 07                	jb     0x4ff3ab
  4ff3a4:	ff d6                	call   esi
  4ff3a6:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff3ab:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4ff3b2:	eb 09                	jmp    0x4ff3bd
  4ff3b4:	ff d6                	call   esi
  4ff3b6:	8b d0                	mov    edx,eax
  4ff3b8:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff3bd:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4ff3c0:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4ff3c5:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4ff3c8:	d9 05 7c b8 54 00    	fld    DWORD PTR ds:0x54b87c
  4ff3ce:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4ff3d1:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4ff3d4:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ff3db:	75 05                	jne    0x4ff3e2
  4ff3dd:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4ff3e0:	eb 08                	jmp    0x4ff3ea
  4ff3e2:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4ff3e5:	e8 3e 53 f0 ff       	call   0x404728
  4ff3ea:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4ff3f0:	d8 0d d4 b8 54 00    	fmul   DWORD PTR ds:0x54b8d4
  4ff3f6:	8b 85 14 fd ff ff    	mov    eax,DWORD PTR [ebp-0x2ec]
  4ff3fc:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4ff3ff:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4ff402:	df e0                	fnstsw ax
  4ff404:	a8 0d                	test   al,0xd
  4ff406:	0f 85 b2 10 00 00    	jne    0x5004be
  4ff40c:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4ff411:	85 c0                	test   eax,eax
  4ff413:	74 28                	je     0x4ff43d
  4ff415:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff419:	75 22                	jne    0x4ff43d
  4ff41b:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff41f:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff422:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff425:	72 07                	jb     0x4ff42e
  4ff427:	ff d6                	call   esi
  4ff429:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4ff42e:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4ff435:	89 8d 10 fd ff ff    	mov    DWORD PTR [ebp-0x2f0],ecx
  4ff43b:	eb 0d                	jmp    0x4ff44a
  4ff43d:	ff d6                	call   esi
  4ff43f:	89 85 10 fd ff ff    	mov    DWORD PTR [ebp-0x2f0],eax
  4ff445:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4ff44a:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4ff450:	85 c9                	test   ecx,ecx
  4ff452:	74 28                	je     0x4ff47c
  4ff454:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ff458:	75 22                	jne    0x4ff47c
  4ff45a:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff45e:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ff461:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4ff467:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ff46a:	72 07                	jb     0x4ff473
  4ff46c:	ff d6                	call   esi
  4ff46e:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4ff473:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ff47a:	eb 09                	jmp    0x4ff485
  4ff47c:	ff d6                	call   esi
  4ff47e:	8b d8                	mov    ebx,eax
  4ff480:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4ff485:	85 c0                	test   eax,eax
  4ff487:	74 22                	je     0x4ff4ab
  4ff489:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff48d:	75 1c                	jne    0x4ff4ab
  4ff48f:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff493:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff496:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff499:	72 07                	jb     0x4ff4a2
  4ff49b:	ff d6                	call   esi
  4ff49d:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4ff4a2:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4ff4a9:	eb 09                	jmp    0x4ff4b4
  4ff4ab:	ff d6                	call   esi
  4ff4ad:	8b d0                	mov    edx,eax
  4ff4af:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4ff4b4:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4ff4b7:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4ff4bc:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4ff4bf:	d9 05 ac b8 54 00    	fld    DWORD PTR ds:0x54b8ac
  4ff4c5:	d8 0c 18             	fmul   DWORD PTR [eax+ebx*1]
  4ff4c8:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4ff4ce:	d8 0d d8 b8 54 00    	fmul   DWORD PTR ds:0x54b8d8
  4ff4d4:	8b 85 10 fd ff ff    	mov    eax,DWORD PTR [ebp-0x2f0]
  4ff4da:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4ff4dd:	d9 1c 11             	fstp   DWORD PTR [ecx+edx*1]
  4ff4e0:	df e0                	fnstsw ax
  4ff4e2:	a8 0d                	test   al,0xd
  4ff4e4:	0f 85 d4 0f 00 00    	jne    0x5004be
  4ff4ea:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff4ef:	85 c0                	test   eax,eax
  4ff4f1:	74 1e                	je     0x4ff511
  4ff4f3:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff4f7:	75 18                	jne    0x4ff511
  4ff4f9:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff4fd:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff500:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff503:	72 07                	jb     0x4ff50c
  4ff505:	ff d6                	call   esi
  4ff507:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff50c:	c1 e7 02             	shl    edi,0x2
  4ff50f:	eb 09                	jmp    0x4ff51a
  4ff511:	ff d6                	call   esi
  4ff513:	8b f8                	mov    edi,eax
  4ff515:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff51a:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  4ff51d:	d9 05 30 30 40 00    	fld    DWORD PTR ds:0x403030
  4ff523:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  4ff529:	d8 1c 3b             	fcomp  DWORD PTR [ebx+edi*1]
  4ff52c:	df e0                	fnstsw ax
  4ff52e:	f6 c4 41             	test   ah,0x41
  4ff531:	75 3f                	jne    0x4ff572
  4ff533:	8b 0d 28 b8 54 00    	mov    ecx,DWORD PTR ds:0x54b828
  4ff539:	85 c9                	test   ecx,ecx
  4ff53b:	74 23                	je     0x4ff560
  4ff53d:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ff541:	75 1d                	jne    0x4ff560
  4ff543:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff547:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ff54a:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ff54d:	72 08                	jb     0x4ff557
  4ff54f:	ff d6                	call   esi
  4ff551:	8b 0d 28 b8 54 00    	mov    ecx,DWORD PTR ds:0x54b828
  4ff557:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ff55e:	eb 08                	jmp    0x4ff568
  4ff560:	ff d6                	call   esi
  4ff562:	8b 0d 28 b8 54 00    	mov    ecx,DWORD PTR ds:0x54b828
  4ff568:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4ff56b:	c7 04 01 5f 70 89 30 	mov    DWORD PTR [ecx+eax*1],0x3089705f
  4ff572:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff577:	85 c0                	test   eax,eax
  4ff579:	74 28                	je     0x4ff5a3
  4ff57b:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff57f:	75 22                	jne    0x4ff5a3
  4ff581:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff585:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff588:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff58b:	72 07                	jb     0x4ff594
  4ff58d:	ff d6                	call   esi
  4ff58f:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff594:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4ff59b:	89 95 0c fd ff ff    	mov    DWORD PTR [ebp-0x2f4],edx
  4ff5a1:	eb 0d                	jmp    0x4ff5b0
  4ff5a3:	ff d6                	call   esi
  4ff5a5:	89 85 0c fd ff ff    	mov    DWORD PTR [ebp-0x2f4],eax
  4ff5ab:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff5b0:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4ff5b6:	85 c9                	test   ecx,ecx
  4ff5b8:	74 28                	je     0x4ff5e2
  4ff5ba:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ff5be:	75 22                	jne    0x4ff5e2
  4ff5c0:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff5c4:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ff5c7:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4ff5cd:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ff5d0:	72 07                	jb     0x4ff5d9
  4ff5d2:	ff d6                	call   esi
  4ff5d4:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff5d9:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ff5e0:	eb 09                	jmp    0x4ff5eb
  4ff5e2:	ff d6                	call   esi
  4ff5e4:	8b d8                	mov    ebx,eax
  4ff5e6:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff5eb:	85 c0                	test   eax,eax
  4ff5ed:	74 1e                	je     0x4ff60d
  4ff5ef:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff5f3:	75 18                	jne    0x4ff60d
  4ff5f5:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff5f9:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff5fc:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff5ff:	72 07                	jb     0x4ff608
  4ff601:	ff d6                	call   esi
  4ff603:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff608:	c1 e7 02             	shl    edi,0x2
  4ff60b:	eb 09                	jmp    0x4ff616
  4ff60d:	ff d6                	call   esi
  4ff60f:	8b f8                	mov    edi,eax
  4ff611:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff616:	8b 48 0c             	mov    ecx,DWORD PTR [eax+0xc]
  4ff619:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4ff61e:	8b 50 0c             	mov    edx,DWORD PTR [eax+0xc]
  4ff621:	d9 05 04 b9 54 00    	fld    DWORD PTR ds:0x54b904
  4ff627:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4ff62a:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4ff630:	d8 0d dc b8 54 00    	fmul   DWORD PTR ds:0x54b8dc
  4ff636:	8b 85 0c fd ff ff    	mov    eax,DWORD PTR [ebp-0x2f4]
  4ff63c:	d8 04 01             	fadd   DWORD PTR [ecx+eax*1]
  4ff63f:	d9 1c 39             	fstp   DWORD PTR [ecx+edi*1]
  4ff642:	df e0                	fnstsw ax
  4ff644:	a8 0d                	test   al,0xd
  4ff646:	0f 85 72 0e 00 00    	jne    0x5004be
  4ff64c:	a1 24 b8 54 00       	mov    eax,ds:0x54b824
  4ff651:	85 c0                	test   eax,eax
  4ff653:	74 23                	je     0x4ff678
  4ff655:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff659:	75 1d                	jne    0x4ff678
  4ff65b:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff65f:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff662:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff665:	72 02                	jb     0x4ff669
  4ff667:	ff d6                	call   esi
  4ff669:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4ff670:	89 8d 08 fd ff ff    	mov    DWORD PTR [ebp-0x2f8],ecx
  4ff676:	eb 08                	jmp    0x4ff680
  4ff678:	ff d6                	call   esi
  4ff67a:	89 85 08 fd ff ff    	mov    DWORD PTR [ebp-0x2f8],eax
  4ff680:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4ff685:	85 c0                	test   eax,eax
  4ff687:	74 23                	je     0x4ff6ac
  4ff689:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff68d:	75 1d                	jne    0x4ff6ac
  4ff68f:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff693:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff696:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4ff69c:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff69f:	72 02                	jb     0x4ff6a3
  4ff6a1:	ff d6                	call   esi
  4ff6a3:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ff6aa:	eb 04                	jmp    0x4ff6b0
  4ff6ac:	ff d6                	call   esi
  4ff6ae:	8b d8                	mov    ebx,eax
  4ff6b0:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff6b5:	85 c0                	test   eax,eax
  4ff6b7:	74 23                	je     0x4ff6dc
  4ff6b9:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff6bd:	75 1d                	jne    0x4ff6dc
  4ff6bf:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff6c3:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff6c6:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff6c9:	72 02                	jb     0x4ff6cd
  4ff6cb:	ff d6                	call   esi
  4ff6cd:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4ff6d4:	89 95 04 fd ff ff    	mov    DWORD PTR [ebp-0x2fc],edx
  4ff6da:	eb 08                	jmp    0x4ff6e4
  4ff6dc:	ff d6                	call   esi
  4ff6de:	89 85 04 fd ff ff    	mov    DWORD PTR [ebp-0x2fc],eax
  4ff6e4:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff6e9:	85 c0                	test   eax,eax
  4ff6eb:	74 1d                	je     0x4ff70a
  4ff6ed:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff6f1:	75 17                	jne    0x4ff70a
  4ff6f3:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff6f7:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff6fa:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff6fd:	72 02                	jb     0x4ff701
  4ff6ff:	ff d6                	call   esi
  4ff701:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ff708:	eb 02                	jmp    0x4ff70c
  4ff70a:	ff d6                	call   esi
  4ff70c:	89 85 00 fd ff ff    	mov    DWORD PTR [ebp-0x300],eax
  4ff712:	8b 15 34 b8 54 00    	mov    edx,DWORD PTR ds:0x54b834
  4ff718:	85 d2                	test   edx,edx
  4ff71a:	74 23                	je     0x4ff73f
  4ff71c:	66 83 3a 01          	cmp    WORD PTR [edx],0x1
  4ff720:	75 1d                	jne    0x4ff73f
  4ff722:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff726:	2b 7a 14             	sub    edi,DWORD PTR [edx+0x14]
  4ff729:	3b 7a 10             	cmp    edi,DWORD PTR [edx+0x10]
  4ff72c:	72 08                	jb     0x4ff736
  4ff72e:	ff d6                	call   esi
  4ff730:	8b 15 34 b8 54 00    	mov    edx,DWORD PTR ds:0x54b834
  4ff736:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4ff73d:	eb 0a                	jmp    0x4ff749
  4ff73f:	ff d6                	call   esi
  4ff741:	8b c8                	mov    ecx,eax
  4ff743:	8b 15 34 b8 54 00    	mov    edx,DWORD PTR ds:0x54b834
  4ff749:	a1 2c b8 54 00       	mov    eax,ds:0x54b82c
  4ff74e:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4ff751:	8b 3d 24 b8 54 00    	mov    edi,DWORD PTR ds:0x54b824
  4ff757:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4ff75a:	d9 04 18             	fld    DWORD PTR [eax+ebx*1]
  4ff75d:	8b 85 08 fd ff ff    	mov    eax,DWORD PTR [ebp-0x2f8]
  4ff763:	d8 04 07             	fadd   DWORD PTR [edi+eax*1]
  4ff766:	a1 28 b8 54 00       	mov    eax,ds:0x54b828
  4ff76b:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4ff76e:	8b bd 04 fd ff ff    	mov    edi,DWORD PTR [ebp-0x2fc]
  4ff774:	d8 04 38             	fadd   DWORD PTR [eax+edi*1]
  4ff777:	a1 30 b8 54 00       	mov    eax,ds:0x54b830
  4ff77c:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4ff77f:	8b bd 00 fd ff ff    	mov    edi,DWORD PTR [ebp-0x300]
  4ff785:	d8 04 38             	fadd   DWORD PTR [eax+edi*1]
  4ff788:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4ff78b:	d9 1c 0a             	fstp   DWORD PTR [edx+ecx*1]
  4ff78e:	df e0                	fnstsw ax
  4ff790:	a8 0d                	test   al,0xd
  4ff792:	0f 85 26 0d 00 00    	jne    0x5004be
  4ff798:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4ff79b:	66 83 fb 05          	cmp    bx,0x5
  4ff79f:	0f 8f 66 02 00 00    	jg     0x4ffa0b
  4ff7a5:	a1 48 b9 54 00       	mov    eax,ds:0x54b948
  4ff7aa:	85 c0                	test   eax,eax
  4ff7ac:	74 1c                	je     0x4ff7ca
  4ff7ae:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff7b2:	75 16                	jne    0x4ff7ca
  4ff7b4:	0f bf fb             	movsx  edi,bx
  4ff7b7:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff7ba:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff7bd:	72 02                	jb     0x4ff7c1
  4ff7bf:	ff d6                	call   esi
  4ff7c1:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ff7c8:	eb 02                	jmp    0x4ff7cc
  4ff7ca:	ff d6                	call   esi
  4ff7cc:	89 85 fc fc ff ff    	mov    DWORD PTR [ebp-0x304],eax
  4ff7d2:	a1 a4 b9 54 00       	mov    eax,ds:0x54b9a4
  4ff7d7:	85 c0                	test   eax,eax
  4ff7d9:	74 22                	je     0x4ff7fd
  4ff7db:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff7df:	75 1c                	jne    0x4ff7fd
  4ff7e1:	0f bf fb             	movsx  edi,bx
  4ff7e4:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff7e7:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff7ea:	72 02                	jb     0x4ff7ee
  4ff7ec:	ff d6                	call   esi
  4ff7ee:	8d 0c bd 00 00 00 00 	lea    ecx,[edi*4+0x0]
  4ff7f5:	89 8d f8 fc ff ff    	mov    DWORD PTR [ebp-0x308],ecx
  4ff7fb:	eb 08                	jmp    0x4ff805
  4ff7fd:	ff d6                	call   esi
  4ff7ff:	89 85 f8 fc ff ff    	mov    DWORD PTR [ebp-0x308],eax
  4ff805:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4ff80a:	85 c0                	test   eax,eax
  4ff80c:	74 28                	je     0x4ff836
  4ff80e:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff812:	75 22                	jne    0x4ff836
  4ff814:	0f bf fb             	movsx  edi,bx
  4ff817:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff81a:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4ff820:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff823:	72 02                	jb     0x4ff827
  4ff825:	ff d6                	call   esi
  4ff827:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4ff82e:	89 95 f4 fc ff ff    	mov    DWORD PTR [ebp-0x30c],edx
  4ff834:	eb 08                	jmp    0x4ff83e
  4ff836:	ff d6                	call   esi
  4ff838:	89 85 f4 fc ff ff    	mov    DWORD PTR [ebp-0x30c],eax
  4ff83e:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4ff843:	85 c0                	test   eax,eax
  4ff845:	74 1c                	je     0x4ff863
  4ff847:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff84b:	75 16                	jne    0x4ff863
  4ff84d:	0f bf fb             	movsx  edi,bx
  4ff850:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff853:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff856:	72 02                	jb     0x4ff85a
  4ff858:	ff d6                	call   esi
  4ff85a:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ff861:	eb 04                	jmp    0x4ff867
  4ff863:	ff d6                	call   esi
  4ff865:	8b d8                	mov    ebx,eax
  4ff867:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4ff86c:	85 c0                	test   eax,eax
  4ff86e:	74 1d                	je     0x4ff88d
  4ff870:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ff874:	75 17                	jne    0x4ff88d
  4ff876:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff87a:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ff87d:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ff880:	72 02                	jb     0x4ff884
  4ff882:	ff d6                	call   esi
  4ff884:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ff88b:	eb 02                	jmp    0x4ff88f
  4ff88d:	ff d6                	call   esi
  4ff88f:	8b 0d a4 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a4
  4ff895:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4ff898:	d9 05 48 bb 54 00    	fld    DWORD PTR ds:0x54bb48
  4ff89e:	8b 8d f8 fc ff ff    	mov    ecx,DWORD PTR [ebp-0x308]
  4ff8a4:	d8 0c 0a             	fmul   DWORD PTR [edx+ecx*1]
  4ff8a7:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  4ff8aa:	d8 4d c8             	fmul   DWORD PTR [ebp-0x38]
  4ff8ad:	d8 0d c0 b8 54 00    	fmul   DWORD PTR ds:0x54b8c0
  4ff8b3:	d8 0d d0 b8 54 00    	fmul   DWORD PTR ds:0x54b8d0
  4ff8b9:	8b 15 68 b9 54 00    	mov    edx,DWORD PTR ds:0x54b968
  4ff8bf:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  4ff8c2:	d9 05 7c b8 54 00    	fld    DWORD PTR ds:0x54b87c
  4ff8c8:	8b 95 f4 fc ff ff    	mov    edx,DWORD PTR [ebp-0x30c]
  4ff8ce:	d8 0c 11             	fmul   DWORD PTR [ecx+edx*1]
  4ff8d1:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4ff8d4:	d8 0d c4 b8 54 00    	fmul   DWORD PTR ds:0x54b8c4
  4ff8da:	d8 0d d4 b8 54 00    	fmul   DWORD PTR ds:0x54b8d4
  4ff8e0:	de c1                	faddp  st(1),st
  4ff8e2:	8b 0d a8 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9a8
  4ff8e8:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4ff8eb:	d9 05 ac b8 54 00    	fld    DWORD PTR ds:0x54b8ac
  4ff8f1:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4ff8f4:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4ff8f7:	d8 0d c8 b8 54 00    	fmul   DWORD PTR ds:0x54b8c8
  4ff8fd:	d8 0d d8 b8 54 00    	fmul   DWORD PTR ds:0x54b8d8
  4ff903:	de c1                	faddp  st(1),st
  4ff905:	8b 0d c0 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b9c0
  4ff90b:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4ff90e:	d9 05 04 b9 54 00    	fld    DWORD PTR ds:0x54b904
  4ff914:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4ff917:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4ff91a:	d8 0d cc b8 54 00    	fmul   DWORD PTR ds:0x54b8cc
  4ff920:	d8 0d dc b8 54 00    	fmul   DWORD PTR ds:0x54b8dc
  4ff926:	de c1                	faddp  st(1),st
  4ff928:	8b 0d 48 b9 54 00    	mov    ecx,DWORD PTR ds:0x54b948
  4ff92e:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
  4ff931:	d9 05 fc b8 54 00    	fld    DWORD PTR ds:0x54b8fc
  4ff937:	d8 0d f8 b8 54 00    	fmul   DWORD PTR ds:0x54b8f8
  4ff93d:	8b 95 fc fc ff ff    	mov    edx,DWORD PTR [ebp-0x304]
  4ff943:	d8 0c 10             	fmul   DWORD PTR [eax+edx*1]
  4ff946:	de c9                	fmulp  st(1),st
  4ff948:	d8 0d 18 b3 54 00    	fmul   DWORD PTR ds:0x54b318
  4ff94e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ff955:	75 05                	jne    0x4ff95c
  4ff957:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4ff95a:	eb 08                	jmp    0x4ff964
  4ff95c:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4ff95f:	e8 c4 4d f0 ff       	call   0x404728
  4ff964:	d8 05 e8 b9 54 00    	fadd   DWORD PTR ds:0x54b9e8
  4ff96a:	d9 1d e8 b9 54 00    	fstp   DWORD PTR ds:0x54b9e8
  4ff970:	df e0                	fnstsw ax
  4ff972:	a8 0d                	test   al,0xd
  4ff974:	0f 85 44 0b 00 00    	jne    0x5004be
  4ff97a:	85 c9                	test   ecx,ecx
  4ff97c:	74 1d                	je     0x4ff99b
  4ff97e:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ff982:	75 17                	jne    0x4ff99b
  4ff984:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff988:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ff98b:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ff98e:	72 02                	jb     0x4ff992
  4ff990:	ff d6                	call   esi
  4ff992:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ff999:	eb 04                	jmp    0x4ff99f
  4ff99b:	ff d6                	call   esi
  4ff99d:	8b d8                	mov    ebx,eax
  4ff99f:	8b 0d 34 b8 54 00    	mov    ecx,DWORD PTR ds:0x54b834
  4ff9a5:	85 c9                	test   ecx,ecx
  4ff9a7:	74 23                	je     0x4ff9cc
  4ff9a9:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ff9ad:	75 1d                	jne    0x4ff9cc
  4ff9af:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ff9b3:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ff9b6:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ff9b9:	72 08                	jb     0x4ff9c3
  4ff9bb:	ff d6                	call   esi
  4ff9bd:	8b 0d 34 b8 54 00    	mov    ecx,DWORD PTR ds:0x54b834
  4ff9c3:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ff9ca:	eb 08                	jmp    0x4ff9d4
  4ff9cc:	ff d6                	call   esi
  4ff9ce:	8b 0d 34 b8 54 00    	mov    ecx,DWORD PTR ds:0x54b834
  4ff9d4:	8b 15 48 b9 54 00    	mov    edx,DWORD PTR ds:0x54b948
  4ff9da:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4ff9dd:	d9 05 fc b8 54 00    	fld    DWORD PTR ds:0x54b8fc
  4ff9e3:	d8 0d f8 b8 54 00    	fmul   DWORD PTR ds:0x54b8f8
  4ff9e9:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4ff9ec:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4ff9ef:	d8 0c 01             	fmul   DWORD PTR [ecx+eax*1]
  4ff9f2:	d8 05 f8 b9 54 00    	fadd   DWORD PTR ds:0x54b9f8
  4ff9f8:	d9 1d f8 b9 54 00    	fstp   DWORD PTR ds:0x54b9f8
  4ff9fe:	df e0                	fnstsw ax
  4ffa00:	a8 0d                	test   al,0xd
  4ffa02:	0f 85 b6 0a 00 00    	jne    0x5004be
  4ffa08:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  4ffa0b:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffa11:	85 c9                	test   ecx,ecx
  4ffa13:	74 28                	je     0x4ffa3d
  4ffa15:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ffa19:	75 22                	jne    0x4ffa3d
  4ffa1b:	0f bf fb             	movsx  edi,bx
  4ffa1e:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ffa21:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ffa24:	72 08                	jb     0x4ffa2e
  4ffa26:	ff d6                	call   esi
  4ffa28:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffa2e:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4ffa35:	89 95 f0 fc ff ff    	mov    DWORD PTR [ebp-0x310],edx
  4ffa3b:	eb 0e                	jmp    0x4ffa4b
  4ffa3d:	ff d6                	call   esi
  4ffa3f:	89 85 f0 fc ff ff    	mov    DWORD PTR [ebp-0x310],eax
  4ffa45:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffa4b:	a1 a4 b9 54 00       	mov    eax,ds:0x54b9a4
  4ffa50:	85 c0                	test   eax,eax
  4ffa52:	74 28                	je     0x4ffa7c
  4ffa54:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ffa58:	75 22                	jne    0x4ffa7c
  4ffa5a:	0f bf fb             	movsx  edi,bx
  4ffa5d:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ffa60:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ffa63:	72 08                	jb     0x4ffa6d
  4ffa65:	ff d6                	call   esi
  4ffa67:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffa6d:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ffa74:	89 85 ec fc ff ff    	mov    DWORD PTR [ebp-0x314],eax
  4ffa7a:	eb 0e                	jmp    0x4ffa8a
  4ffa7c:	ff d6                	call   esi
  4ffa7e:	89 85 ec fc ff ff    	mov    DWORD PTR [ebp-0x314],eax
  4ffa84:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffa8a:	a1 68 b9 54 00       	mov    eax,ds:0x54b968
  4ffa8f:	85 c0                	test   eax,eax
  4ffa91:	74 2e                	je     0x4ffac1
  4ffa93:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ffa97:	75 28                	jne    0x4ffac1
  4ffa99:	0f bf fb             	movsx  edi,bx
  4ffa9c:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ffa9f:	89 bd 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],edi
  4ffaa5:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ffaa8:	72 08                	jb     0x4ffab2
  4ffaaa:	ff d6                	call   esi
  4ffaac:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffab2:	8d 14 bd 00 00 00 00 	lea    edx,[edi*4+0x0]
  4ffab9:	89 95 e8 fc ff ff    	mov    DWORD PTR [ebp-0x318],edx
  4ffabf:	eb 0e                	jmp    0x4ffacf
  4ffac1:	ff d6                	call   esi
  4ffac3:	89 85 e8 fc ff ff    	mov    DWORD PTR [ebp-0x318],eax
  4ffac9:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffacf:	a1 a8 b9 54 00       	mov    eax,ds:0x54b9a8
  4ffad4:	85 c0                	test   eax,eax
  4ffad6:	74 22                	je     0x4ffafa
  4ffad8:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ffadc:	75 1c                	jne    0x4ffafa
  4ffade:	0f bf fb             	movsx  edi,bx
  4ffae1:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ffae4:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ffae7:	72 08                	jb     0x4ffaf1
  4ffae9:	ff d6                	call   esi
  4ffaeb:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffaf1:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ffaf8:	eb 0a                	jmp    0x4ffb04
  4ffafa:	ff d6                	call   esi
  4ffafc:	8b d8                	mov    ebx,eax
  4ffafe:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffb04:	a1 c0 b9 54 00       	mov    eax,ds:0x54b9c0
  4ffb09:	85 c0                	test   eax,eax
  4ffb0b:	74 23                	je     0x4ffb30
  4ffb0d:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ffb11:	75 1d                	jne    0x4ffb30
  4ffb13:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ffb17:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ffb1a:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ffb1d:	72 08                	jb     0x4ffb27
  4ffb1f:	ff d6                	call   esi
  4ffb21:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffb27:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ffb2e:	eb 08                	jmp    0x4ffb38
  4ffb30:	ff d6                	call   esi
  4ffb32:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffb38:	8b 15 a4 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a4
  4ffb3e:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4ffb41:	d9 05 48 bb 54 00    	fld    DWORD PTR ds:0x54bb48
  4ffb47:	8b bd ec fc ff ff    	mov    edi,DWORD PTR [ebp-0x314]
  4ffb4d:	d8 0c 3a             	fmul   DWORD PTR [edx+edi*1]
  4ffb50:	d8 4d c0             	fmul   DWORD PTR [ebp-0x40]
  4ffb53:	d8 4d c8             	fmul   DWORD PTR [ebp-0x38]
  4ffb56:	d8 0d d0 b8 54 00    	fmul   DWORD PTR ds:0x54b8d0
  4ffb5c:	8b 15 68 b9 54 00    	mov    edx,DWORD PTR ds:0x54b968
  4ffb62:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4ffb65:	d9 05 7c b8 54 00    	fld    DWORD PTR ds:0x54b87c
  4ffb6b:	8b bd e8 fc ff ff    	mov    edi,DWORD PTR [ebp-0x318]
  4ffb71:	d8 0c 3a             	fmul   DWORD PTR [edx+edi*1]
  4ffb74:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  4ffb77:	d8 0d d4 b8 54 00    	fmul   DWORD PTR ds:0x54b8d4
  4ffb7d:	de c1                	faddp  st(1),st
  4ffb7f:	8b 15 a8 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9a8
  4ffb85:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4ffb88:	d9 05 ac b8 54 00    	fld    DWORD PTR ds:0x54b8ac
  4ffb8e:	d8 0c 1a             	fmul   DWORD PTR [edx+ebx*1]
  4ffb91:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4ffb94:	d8 0d d8 b8 54 00    	fmul   DWORD PTR ds:0x54b8d8
  4ffb9a:	de c1                	faddp  st(1),st
  4ffb9c:	8b 15 c0 b9 54 00    	mov    edx,DWORD PTR ds:0x54b9c0
  4ffba2:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4ffba5:	d9 05 04 b9 54 00    	fld    DWORD PTR ds:0x54b904
  4ffbab:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4ffbae:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4ffbb1:	d8 0d dc b8 54 00    	fmul   DWORD PTR ds:0x54b8dc
  4ffbb7:	de c1                	faddp  st(1),st
  4ffbb9:	df e0                	fnstsw ax
  4ffbbb:	a8 0d                	test   al,0xd
  4ffbbd:	0f 85 fb 08 00 00    	jne    0x5004be
  4ffbc3:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
  4ffbc6:	8b 95 f0 fc ff ff    	mov    edx,DWORD PTR [ebp-0x310]
  4ffbcc:	d9 04 10             	fld    DWORD PTR [eax+edx*1]
  4ffbcf:	d9 05 fc b8 54 00    	fld    DWORD PTR ds:0x54b8fc
  4ffbd5:	dc 0d 28 30 40 00    	fmul   QWORD PTR ds:0x403028
  4ffbdb:	de c9                	fmulp  st(1),st
  4ffbdd:	de c9                	fmulp  st(1),st
  4ffbdf:	d8 0d 18 b3 54 00    	fmul   DWORD PTR ds:0x54b318
  4ffbe5:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ffbec:	75 05                	jne    0x4ffbf3
  4ffbee:	d8 75 b0             	fdiv   DWORD PTR [ebp-0x50]
  4ffbf1:	eb 08                	jmp    0x4ffbfb
  4ffbf3:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4ffbf6:	e8 2d 4b f0 ff       	call   0x404728
  4ffbfb:	d8 05 ec b9 54 00    	fadd   DWORD PTR ds:0x54b9ec
  4ffc01:	d9 1d ec b9 54 00    	fstp   DWORD PTR ds:0x54b9ec
  4ffc07:	df e0                	fnstsw ax
  4ffc09:	a8 0d                	test   al,0xd
  4ffc0b:	0f 85 ad 08 00 00    	jne    0x5004be
  4ffc11:	85 c9                	test   ecx,ecx
  4ffc13:	74 23                	je     0x4ffc38
  4ffc15:	66 83 39 01          	cmp    WORD PTR [ecx],0x1
  4ffc19:	75 1d                	jne    0x4ffc38
  4ffc1b:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ffc1f:	2b 79 14             	sub    edi,DWORD PTR [ecx+0x14]
  4ffc22:	3b 79 10             	cmp    edi,DWORD PTR [ecx+0x10]
  4ffc25:	72 08                	jb     0x4ffc2f
  4ffc27:	ff d6                	call   esi
  4ffc29:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffc2f:	8d 1c bd 00 00 00 00 	lea    ebx,[edi*4+0x0]
  4ffc36:	eb 0a                	jmp    0x4ffc42
  4ffc38:	ff d6                	call   esi
  4ffc3a:	8b d8                	mov    ebx,eax
  4ffc3c:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffc42:	a1 34 b8 54 00       	mov    eax,ds:0x54b834
  4ffc47:	85 c0                	test   eax,eax
  4ffc49:	74 23                	je     0x4ffc6e
  4ffc4b:	66 83 38 01          	cmp    WORD PTR [eax],0x1
  4ffc4f:	75 1d                	jne    0x4ffc6e
  4ffc51:	0f bf 7d e0          	movsx  edi,WORD PTR [ebp-0x20]
  4ffc55:	2b 78 14             	sub    edi,DWORD PTR [eax+0x14]
  4ffc58:	3b 78 10             	cmp    edi,DWORD PTR [eax+0x10]
  4ffc5b:	72 08                	jb     0x4ffc65
  4ffc5d:	ff d6                	call   esi
  4ffc5f:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffc65:	8d 04 bd 00 00 00 00 	lea    eax,[edi*4+0x0]
  4ffc6c:	eb 08                	jmp    0x4ffc76
  4ffc6e:	ff d6                	call   esi
  4ffc70:	8b 0d 4c b9 54 00    	mov    ecx,DWORD PTR ds:0x54b94c
  4ffc76:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  4ffc79:	d9 04 1a             	fld    DWORD PTR [edx+ebx*1]
  4ffc7c:	d9 05 fc b8 54 00    	fld    DWORD PTR ds:0x54b8fc
  4ffc82:	dc 0d 28 30 40 00    	fmul   QWORD PTR ds:0x403028
  4ffc88:	de c9                	fmulp  st(1),st
  4ffc8a:	8b 15 34 b8 54 00    	mov    edx,DWORD PTR ds:0x54b834
  4ffc90:	8b 52 0c             	mov    edx,DWORD PTR [edx+0xc]
  4ffc93:	d8 0c 02             	fmul   DWORD PTR [edx+eax*1]
  4ffc96:	d8 05 fc b9 54 00    	fadd   DWORD PTR ds:0x54b9fc
  4ffc9c:	d9 1d fc b9 54 00    	fstp   DWORD PTR ds:0x54b9fc
  4ffca2:	df e0                	fnstsw ax
  4ffca4:	a8 0d                	test   al,0xd
  4ffca6:	0f 85 12 08 00 00    	jne    0x5004be
  4ffcac:	b8 01 00 00 00       	mov    eax,0x1
  4ffcb1:	66 03 45 e0          	add    ax,WORD PTR [ebp-0x20]
  4ffcb5:	0f 80 08 08 00 00    	jo     0x5004c3
  4ffcbb:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4ffcbe:	33 db                	xor    ebx,ebx
  4ffcc0:	e9 87 eb ff ff       	jmp    0x4fe84c
  4ffcc5:	d9 05 00 b9 54 00    	fld    DWORD PTR ds:0x54b900
  4ffccb:	d8 0d e8 b9 54 00    	fmul   DWORD PTR ds:0x54b9e8
  4ffcd1:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ffcd8:	75 08                	jne    0x4ffce2
  4ffcda:	d8 35 fc b8 54 00    	fdiv   DWORD PTR ds:0x54b8fc
  4ffce0:	eb 0b                	jmp    0x4ffced
  4ffce2:	ff 35 fc b8 54 00    	push   DWORD PTR ds:0x54b8fc
  4ffce8:	e8 3b 4a f0 ff       	call   0x404728
  4ffced:	d9 1d f0 b9 54 00    	fstp   DWORD PTR ds:0x54b9f0
  4ffcf3:	df e0                	fnstsw ax
  4ffcf5:	a8 0d                	test   al,0xd
  4ffcf7:	0f 85 c1 07 00 00    	jne    0x5004be
  4ffcfd:	d9 05 00 b9 54 00    	fld    DWORD PTR ds:0x54b900
  4ffd03:	d8 0d ec b9 54 00    	fmul   DWORD PTR ds:0x54b9ec
  4ffd09:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ffd10:	75 08                	jne    0x4ffd1a
  4ffd12:	d8 35 fc b8 54 00    	fdiv   DWORD PTR ds:0x54b8fc
  4ffd18:	eb 0b                	jmp    0x4ffd25
  4ffd1a:	ff 35 fc b8 54 00    	push   DWORD PTR ds:0x54b8fc
  4ffd20:	e8 03 4a f0 ff       	call   0x404728
  4ffd25:	d9 1d f4 b9 54 00    	fstp   DWORD PTR ds:0x54b9f4
  4ffd2b:	df e0                	fnstsw ax
  4ffd2d:	a8 0d                	test   al,0xd
  4ffd2f:	0f 85 89 07 00 00    	jne    0x5004be
  4ffd35:	d9 05 00 b9 54 00    	fld    DWORD PTR ds:0x54b900
  4ffd3b:	d8 0d f8 b9 54 00    	fmul   DWORD PTR ds:0x54b9f8
  4ffd41:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ffd48:	75 08                	jne    0x4ffd52
  4ffd4a:	d8 35 fc b8 54 00    	fdiv   DWORD PTR ds:0x54b8fc
  4ffd50:	eb 0b                	jmp    0x4ffd5d
  4ffd52:	ff 35 fc b8 54 00    	push   DWORD PTR ds:0x54b8fc
  4ffd58:	e8 cb 49 f0 ff       	call   0x404728
  4ffd5d:	d9 1d 00 ba 54 00    	fstp   DWORD PTR ds:0x54ba00
  4ffd63:	df e0                	fnstsw ax
  4ffd65:	a8 0d                	test   al,0xd
  4ffd67:	0f 85 51 07 00 00    	jne    0x5004be
  4ffd6d:	d9 05 00 b9 54 00    	fld    DWORD PTR ds:0x54b900
  4ffd73:	d8 0d fc b9 54 00    	fmul   DWORD PTR ds:0x54b9fc
  4ffd79:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ffd80:	75 08                	jne    0x4ffd8a
  4ffd82:	d8 35 fc b8 54 00    	fdiv   DWORD PTR ds:0x54b8fc
  4ffd88:	eb 0b                	jmp    0x4ffd95
  4ffd8a:	ff 35 fc b8 54 00    	push   DWORD PTR ds:0x54b8fc
  4ffd90:	e8 93 49 f0 ff       	call   0x404728
  4ffd95:	d9 1d 04 ba 54 00    	fstp   DWORD PTR ds:0x54ba04
  4ffd9b:	df e0                	fnstsw ax
  4ffd9d:	a8 0d                	test   al,0xd
  4ffd9f:	0f 85 19 07 00 00    	jne    0x5004be
  4ffda5:	d9 05 48 bb 54 00    	fld    DWORD PTR ds:0x54bb48
  4ffdab:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4ffdb1:	d8 05 0c ba 54 00    	fadd   DWORD PTR ds:0x54ba0c
  4ffdb7:	d9 1d 0c ba 54 00    	fstp   DWORD PTR ds:0x54ba0c
  4ffdbd:	df e0                	fnstsw ax
  4ffdbf:	a8 0d                	test   al,0xd
  4ffdc1:	0f 85 f7 06 00 00    	jne    0x5004be
  4ffdc7:	d9 05 7c b8 54 00    	fld    DWORD PTR ds:0x54b87c
  4ffdcd:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4ffdd3:	d8 05 10 ba 54 00    	fadd   DWORD PTR ds:0x54ba10
  4ffdd9:	d9 1d 10 ba 54 00    	fstp   DWORD PTR ds:0x54ba10
  4ffddf:	df e0                	fnstsw ax
  4ffde1:	a8 0d                	test   al,0xd
  4ffde3:	0f 85 d5 06 00 00    	jne    0x5004be
  4ffde9:	d9 05 04 b9 54 00    	fld    DWORD PTR ds:0x54b904
  4ffdef:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4ffdf2:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ffdf9:	75 05                	jne    0x4ffe00
  4ffdfb:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4ffdfe:	eb 08                	jmp    0x4ffe08
  4ffe00:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4ffe03:	e8 20 49 f0 ff       	call   0x404728
  4ffe08:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ffe0f:	75 05                	jne    0x4ffe16
  4ffe11:	d8 75 bc             	fdiv   DWORD PTR [ebp-0x44]
  4ffe14:	eb 08                	jmp    0x4ffe1e
  4ffe16:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
  4ffe19:	e8 0a 49 f0 ff       	call   0x404728
  4ffe1e:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4ffe24:	d8 05 18 ba 54 00    	fadd   DWORD PTR ds:0x54ba18
  4ffe2a:	d9 1d 18 ba 54 00    	fstp   DWORD PTR ds:0x54ba18
  4ffe30:	df e0                	fnstsw ax
  4ffe32:	a8 0d                	test   al,0xd
  4ffe34:	0f 85 84 06 00 00    	jne    0x5004be
  4ffe3a:	d9 05 ac b8 54 00    	fld    DWORD PTR ds:0x54b8ac
  4ffe40:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  4ffe43:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ffe4a:	75 05                	jne    0x4ffe51
  4ffe4c:	d8 75 c8             	fdiv   DWORD PTR [ebp-0x38]
  4ffe4f:	eb 08                	jmp    0x4ffe59
  4ffe51:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
  4ffe54:	e8 cf 48 f0 ff       	call   0x404728
  4ffe59:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4ffe60:	75 05                	jne    0x4ffe67
  4ffe62:	d8 75 c4             	fdiv   DWORD PTR [ebp-0x3c]
  4ffe65:	eb 08                	jmp    0x4ffe6f
  4ffe67:	ff 75 c4             	push   DWORD PTR [ebp-0x3c]
  4ffe6a:	e8 b9 48 f0 ff       	call   0x404728
  4ffe6f:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  4ffe75:	d8 05 14 ba 54 00    	fadd   DWORD PTR ds:0x54ba14
  4ffe7b:	d9 1d 14 ba 54 00    	fstp   DWORD PTR ds:0x54ba14
  4ffe81:	df e0                	fnstsw ax
  4ffe83:	a8 0d                	test   al,0xd
  4ffe85:	0f 85 33 06 00 00    	jne    0x5004be
  4ffe8b:	d9 05 10 ba 54 00    	fld    DWORD PTR ds:0x54ba10
  4ffe91:	d8 05 0c ba 54 00    	fadd   DWORD PTR ds:0x54ba0c
  4ffe97:	d8 05 14 ba 54 00    	fadd   DWORD PTR ds:0x54ba14
  4ffe9d:	d8 05 18 ba 54 00    	fadd   DWORD PTR ds:0x54ba18
  4ffea3:	d9 1d 08 ba 54 00    	fstp   DWORD PTR ds:0x54ba08
  4ffea9:	df e0                	fnstsw ax
  4ffeab:	a8 0d                	test   al,0xd
  4ffead:	0f 85 0b 06 00 00    	jne    0x5004be
  4ffeb3:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  4ffeb8:	8b 08                	mov    ecx,DWORD PTR [eax]
  4ffeba:	50                   	push   eax
  4ffebb:	ff 91 30 05 00 00    	call   DWORD PTR [ecx+0x530]
  4ffec1:	50                   	push   eax
  4ffec2:	8d 55 a8             	lea    edx,[ebp-0x58]
  4ffec5:	52                   	push   edx
  4ffec6:	8b 3d 94 10 40 00    	mov    edi,DWORD PTR ds:0x401094
  4ffecc:	ff d7                	call   edi
  4ffece:	8b f0                	mov    esi,eax
  4ffed0:	8b 06                	mov    eax,DWORD PTR [esi]
  4ffed2:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  4ffed5:	51                   	push   ecx
  4ffed6:	53                   	push   ebx
  4ffed7:	56                   	push   esi
  4ffed8:	ff 50 40             	call   DWORD PTR [eax+0x40]
  4ffedb:	db e2                	fnclex
  4ffedd:	3b c3                	cmp    eax,ebx
  4ffedf:	7d 0f                	jge    0x4ffef0
  4ffee1:	6a 40                	push   0x40
  4ffee3:	68 68 c9 41 00       	push   0x41c968
  4ffee8:	56                   	push   esi
  4ffee9:	50                   	push   eax
  4ffeea:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  4ffef0:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  4ffef5:	8b 10                	mov    edx,DWORD PTR [eax]
  4ffef7:	50                   	push   eax
  4ffef8:	ff 92 30 05 00 00    	call   DWORD PTR [edx+0x530]
  4ffefe:	50                   	push   eax
  4ffeff:	8d 45 a0             	lea    eax,[ebp-0x60]
  4fff02:	50                   	push   eax
  4fff03:	ff d7                	call   edi
  4fff05:	8b f0                	mov    esi,eax
  4fff07:	89 b5 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],esi
  4fff0d:	8b 0e                	mov    ecx,DWORD PTR [esi]
  4fff0f:	8d 55 9c             	lea    edx,[ebp-0x64]
  4fff12:	52                   	push   edx
  4fff13:	6a 01                	push   0x1
  4fff15:	56                   	push   esi
  4fff16:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  4fff19:	db e2                	fnclex
  4fff1b:	3b c3                	cmp    eax,ebx
  4fff1d:	7d 0f                	jge    0x4fff2e
  4fff1f:	6a 40                	push   0x40
  4fff21:	68 68 c9 41 00       	push   0x41c968
  4fff26:	56                   	push   esi
  4fff27:	50                   	push   eax
  4fff28:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  4fff2e:	6a 00                	push   0x0
  4fff30:	68 09 00 03 68       	push   0x68030009
  4fff35:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  4fff38:	50                   	push   eax
  4fff39:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  4fff3f:	51                   	push   ecx
  4fff40:	8b 35 34 11 40 00    	mov    esi,DWORD PTR ds:0x401134
  4fff46:	ff d6                	call   esi
  4fff48:	83 c4 10             	add    esp,0x10
  4fff4b:	50                   	push   eax
  4fff4c:	8b 3d a0 11 40 00    	mov    edi,DWORD PTR ds:0x4011a0
  4fff52:	ff d7                	call   edi
  4fff54:	66 8b d8             	mov    bx,ax
  4fff57:	6a 00                	push   0x0
  4fff59:	68 09 00 03 68       	push   0x68030009
  4fff5e:	8b 55 a4             	mov    edx,DWORD PTR [ebp-0x5c]
  4fff61:	52                   	push   edx
  4fff62:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  4fff68:	50                   	push   eax
  4fff69:	ff d6                	call   esi
  4fff6b:	83 c4 10             	add    esp,0x10
  4fff6e:	50                   	push   eax
  4fff6f:	ff d7                	call   edi
  4fff71:	66 03 d8             	add    bx,ax
  4fff74:	0f 80 49 05 00 00    	jo     0x5004c3
  4fff7a:	0f bf cb             	movsx  ecx,bx
  4fff7d:	89 8d e4 fc ff ff    	mov    DWORD PTR [ebp-0x31c],ecx
  4fff83:	db 85 e4 fc ff ff    	fild   DWORD PTR [ebp-0x31c]
  4fff89:	dd 9d dc fc ff ff    	fstp   QWORD PTR [ebp-0x324]
  4fff8f:	dd 85 dc fc ff ff    	fld    QWORD PTR [ebp-0x324]
  4fff95:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  4fff9c:	75 08                	jne    0x4fffa6
  4fff9e:	dc 35 60 1c 40 00    	fdiv   QWORD PTR ds:0x401c60
  4fffa4:	eb 11                	jmp    0x4fffb7
  4fffa6:	ff 35 64 1c 40 00    	push   DWORD PTR ds:0x401c64
  4fffac:	ff 35 60 1c 40 00    	push   DWORD PTR ds:0x401c60
  4fffb2:	e8 7d 47 f0 ff       	call   0x404734
  4fffb7:	df e0                	fnstsw ax
  4fffb9:	a8 0d                	test   al,0xd
  4fffbb:	0f 85 fd 04 00 00    	jne    0x5004be
  4fffc1:	8b 3d 2c 12 40 00    	mov    edi,DWORD PTR ds:0x40122c
  4fffc7:	ff d7                	call   edi
  4fffc9:	66 89 85 40 ff ff ff 	mov    WORD PTR [ebp-0xc0],ax
  4fffd0:	b8 02 00 00 00       	mov    eax,0x2
  4fffd5:	89 85 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],eax
  4fffdb:	83 ec 10             	sub    esp,0x10
  4fffde:	8b d4                	mov    edx,esp
  4fffe0:	89 02                	mov    DWORD PTR [edx],eax
  4fffe2:	8b 9d 3c ff ff ff    	mov    ebx,DWORD PTR [ebp-0xc4]
  4fffe8:	89 5a 04             	mov    DWORD PTR [edx+0x4],ebx
  4fffeb:	8b 85 40 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc0]
  4ffff1:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  4ffff4:	8b 8d 44 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xbc]
  4ffffa:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  4ffffd:	68 09 00 03 68       	push   0x68030009
  500002:	a1 38 b0 54 00       	mov    eax,ds:0x54b038
  500007:	8b 10                	mov    edx,DWORD PTR [eax]
  500009:	50                   	push   eax
  50000a:	ff 92 28 04 00 00    	call   DWORD PTR [edx+0x428]
  500010:	50                   	push   eax
  500011:	8d 45 98             	lea    eax,[ebp-0x68]
  500014:	50                   	push   eax
  500015:	8b 35 94 10 40 00    	mov    esi,DWORD PTR ds:0x401094
  50001b:	ff d6                	call   esi
  50001d:	50                   	push   eax
  50001e:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  500024:	8d 4d 98             	lea    ecx,[ebp-0x68]
  500027:	51                   	push   ecx
  500028:	8d 55 9c             	lea    edx,[ebp-0x64]
  50002b:	52                   	push   edx
  50002c:	8d 45 a0             	lea    eax,[ebp-0x60]
  50002f:	50                   	push   eax
  500030:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  500033:	51                   	push   ecx
  500034:	8d 55 a8             	lea    edx,[ebp-0x58]
  500037:	52                   	push   edx
  500038:	6a 05                	push   0x5
  50003a:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  500040:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  500046:	50                   	push   eax
  500047:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  50004d:	51                   	push   ecx
  50004e:	6a 02                	push   0x2
  500050:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  500056:	83 c4 24             	add    esp,0x24
  500059:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50005e:	8b 10                	mov    edx,DWORD PTR [eax]
  500060:	50                   	push   eax
  500061:	ff 92 88 05 00 00    	call   DWORD PTR [edx+0x588]
  500067:	50                   	push   eax
  500068:	8d 45 a8             	lea    eax,[ebp-0x58]
  50006b:	50                   	push   eax
  50006c:	ff d6                	call   esi
  50006e:	8b f0                	mov    esi,eax
  500070:	8b 0e                	mov    ecx,DWORD PTR [esi]
  500072:	8d 55 a4             	lea    edx,[ebp-0x5c]
  500075:	52                   	push   edx
  500076:	6a 00                	push   0x0
  500078:	56                   	push   esi
  500079:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50007c:	db e2                	fnclex
  50007e:	85 c0                	test   eax,eax
  500080:	7d 0f                	jge    0x500091
  500082:	6a 40                	push   0x40
  500084:	68 68 c9 41 00       	push   0x41c968
  500089:	56                   	push   esi
  50008a:	50                   	push   eax
  50008b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  500091:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500096:	8b 08                	mov    ecx,DWORD PTR [eax]
  500098:	50                   	push   eax
  500099:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  50009f:	50                   	push   eax
  5000a0:	8d 55 a0             	lea    edx,[ebp-0x60]
  5000a3:	52                   	push   edx
  5000a4:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  5000aa:	8b f0                	mov    esi,eax
  5000ac:	89 b5 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],esi
  5000b2:	8b 06                	mov    eax,DWORD PTR [esi]
  5000b4:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  5000b7:	51                   	push   ecx
  5000b8:	6a 01                	push   0x1
  5000ba:	56                   	push   esi
  5000bb:	ff 50 40             	call   DWORD PTR [eax+0x40]
  5000be:	db e2                	fnclex
  5000c0:	85 c0                	test   eax,eax
  5000c2:	7d 0f                	jge    0x5000d3
  5000c4:	6a 40                	push   0x40
  5000c6:	68 68 c9 41 00       	push   0x41c968
  5000cb:	56                   	push   esi
  5000cc:	50                   	push   eax
  5000cd:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5000d3:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5000d8:	8b 10                	mov    edx,DWORD PTR [eax]
  5000da:	50                   	push   eax
  5000db:	ff 92 88 05 00 00    	call   DWORD PTR [edx+0x588]
  5000e1:	50                   	push   eax
  5000e2:	8d 45 98             	lea    eax,[ebp-0x68]
  5000e5:	50                   	push   eax
  5000e6:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  5000ec:	8b f0                	mov    esi,eax
  5000ee:	8b 0e                	mov    ecx,DWORD PTR [esi]
  5000f0:	8d 55 94             	lea    edx,[ebp-0x6c]
  5000f3:	52                   	push   edx
  5000f4:	6a 02                	push   0x2
  5000f6:	56                   	push   esi
  5000f7:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  5000fa:	db e2                	fnclex
  5000fc:	85 c0                	test   eax,eax
  5000fe:	7d 0f                	jge    0x50010f
  500100:	6a 40                	push   0x40
  500102:	68 68 c9 41 00       	push   0x41c968
  500107:	56                   	push   esi
  500108:	50                   	push   eax
  500109:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50010f:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500114:	8b 08                	mov    ecx,DWORD PTR [eax]
  500116:	50                   	push   eax
  500117:	ff 91 88 05 00 00    	call   DWORD PTR [ecx+0x588]
  50011d:	50                   	push   eax
  50011e:	8d 55 90             	lea    edx,[ebp-0x70]
  500121:	52                   	push   edx
  500122:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  500128:	8b f0                	mov    esi,eax
  50012a:	8b 06                	mov    eax,DWORD PTR [esi]
  50012c:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  50012f:	51                   	push   ecx
  500130:	6a 03                	push   0x3
  500132:	56                   	push   esi
  500133:	ff 50 40             	call   DWORD PTR [eax+0x40]
  500136:	db e2                	fnclex
  500138:	85 c0                	test   eax,eax
  50013a:	7d 0f                	jge    0x50014b
  50013c:	6a 40                	push   0x40
  50013e:	68 68 c9 41 00       	push   0x41c968
  500143:	56                   	push   esi
  500144:	50                   	push   eax
  500145:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50014b:	6a 00                	push   0x0
  50014d:	68 09 00 03 68       	push   0x68030009
  500152:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  500155:	52                   	push   edx
  500156:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  50015c:	50                   	push   eax
  50015d:	8b 35 34 11 40 00    	mov    esi,DWORD PTR ds:0x401134
  500163:	ff d6                	call   esi
  500165:	83 c4 10             	add    esp,0x10
  500168:	50                   	push   eax
  500169:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  50016f:	66 8b d0             	mov    dx,ax
  500172:	6a 00                	push   0x0
  500174:	68 09 00 03 68       	push   0x68030009
  500179:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  50017c:	51                   	push   ecx
  50017d:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  500183:	50                   	push   eax
  500184:	66 89 95 da fc ff ff 	mov    WORD PTR [ebp-0x326],dx
  50018b:	ff d6                	call   esi
  50018d:	83 c4 10             	add    esp,0x10
  500190:	50                   	push   eax
  500191:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  500197:	66 8b b5 da fc ff ff 	mov    si,WORD PTR [ebp-0x326]
  50019e:	66 03 f0             	add    si,ax
  5001a1:	0f 80 1c 03 00 00    	jo     0x5004c3
  5001a7:	6a 00                	push   0x0
  5001a9:	68 09 00 03 68       	push   0x68030009
  5001ae:	8b 4d 94             	mov    ecx,DWORD PTR [ebp-0x6c]
  5001b1:	51                   	push   ecx
  5001b2:	8d 95 58 ff ff ff    	lea    edx,[ebp-0xa8]
  5001b8:	52                   	push   edx
  5001b9:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  5001bf:	83 c4 10             	add    esp,0x10
  5001c2:	50                   	push   eax
  5001c3:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  5001c9:	66 03 f0             	add    si,ax
  5001cc:	0f 80 f1 02 00 00    	jo     0x5004c3
  5001d2:	6a 00                	push   0x0
  5001d4:	68 09 00 03 68       	push   0x68030009
  5001d9:	8b 45 8c             	mov    eax,DWORD PTR [ebp-0x74]
  5001dc:	50                   	push   eax
  5001dd:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  5001e3:	51                   	push   ecx
  5001e4:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  5001ea:	83 c4 10             	add    esp,0x10
  5001ed:	50                   	push   eax
  5001ee:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  5001f4:	66 03 f0             	add    si,ax
  5001f7:	0f 80 c6 02 00 00    	jo     0x5004c3
  5001fd:	0f bf d6             	movsx  edx,si
  500200:	89 95 d4 fc ff ff    	mov    DWORD PTR [ebp-0x32c],edx
  500206:	db 85 d4 fc ff ff    	fild   DWORD PTR [ebp-0x32c]
  50020c:	dd 9d cc fc ff ff    	fstp   QWORD PTR [ebp-0x334]
  500212:	dd 85 cc fc ff ff    	fld    QWORD PTR [ebp-0x334]
  500218:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50021f:	75 08                	jne    0x500229
  500221:	dc 35 b0 28 40 00    	fdiv   QWORD PTR ds:0x4028b0
  500227:	eb 11                	jmp    0x50023a
  500229:	ff 35 b4 28 40 00    	push   DWORD PTR ds:0x4028b4
  50022f:	ff 35 b0 28 40 00    	push   DWORD PTR ds:0x4028b0
  500235:	e8 fa 44 f0 ff       	call   0x404734
  50023a:	df e0                	fnstsw ax
  50023c:	a8 0d                	test   al,0xd
  50023e:	0f 85 7a 02 00 00    	jne    0x5004be
  500244:	ff d7                	call   edi
  500246:	66 89 85 40 ff ff ff 	mov    WORD PTR [ebp-0xc0],ax
  50024d:	b8 02 00 00 00       	mov    eax,0x2
  500252:	89 85 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],eax
  500258:	83 ec 10             	sub    esp,0x10
  50025b:	8b cc                	mov    ecx,esp
  50025d:	89 01                	mov    DWORD PTR [ecx],eax
  50025f:	89 59 04             	mov    DWORD PTR [ecx+0x4],ebx
  500262:	8b 95 40 ff ff ff    	mov    edx,DWORD PTR [ebp-0xc0]
  500268:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  50026b:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [ebp-0xbc]
  500271:	89 41 0c             	mov    DWORD PTR [ecx+0xc],eax
  500274:	68 09 00 03 68       	push   0x68030009
  500279:	a1 38 b0 54 00       	mov    eax,ds:0x54b038
  50027e:	8b 08                	mov    ecx,DWORD PTR [eax]
  500280:	50                   	push   eax
  500281:	ff 91 24 04 00 00    	call   DWORD PTR [ecx+0x424]
  500287:	50                   	push   eax
  500288:	8d 55 88             	lea    edx,[ebp-0x78]
  50028b:	52                   	push   edx
  50028c:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  500292:	50                   	push   eax
  500293:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  500299:	8d 45 88             	lea    eax,[ebp-0x78]
  50029c:	50                   	push   eax
  50029d:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  5002a0:	51                   	push   ecx
  5002a1:	8d 55 90             	lea    edx,[ebp-0x70]
  5002a4:	52                   	push   edx
  5002a5:	8d 45 94             	lea    eax,[ebp-0x6c]
  5002a8:	50                   	push   eax
  5002a9:	8d 4d 98             	lea    ecx,[ebp-0x68]
  5002ac:	51                   	push   ecx
  5002ad:	8d 55 9c             	lea    edx,[ebp-0x64]
  5002b0:	52                   	push   edx
  5002b1:	8d 45 a0             	lea    eax,[ebp-0x60]
  5002b4:	50                   	push   eax
  5002b5:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  5002b8:	51                   	push   ecx
  5002b9:	8d 55 a8             	lea    edx,[ebp-0x58]
  5002bc:	52                   	push   edx
  5002bd:	6a 09                	push   0x9
  5002bf:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  5002c5:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  5002cb:	50                   	push   eax
  5002cc:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  5002d2:	51                   	push   ecx
  5002d3:	8d 95 68 ff ff ff    	lea    edx,[ebp-0x98]
  5002d9:	52                   	push   edx
  5002da:	8d 85 78 ff ff ff    	lea    eax,[ebp-0x88]
  5002e0:	50                   	push   eax
  5002e1:	6a 04                	push   0x4
  5002e3:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  5002e9:	83 c4 3c             	add    esp,0x3c
  5002ec:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  5002f2:	50                   	push   eax
  5002f3:	8d 4d a8             	lea    ecx,[ebp-0x58]
  5002f6:	51                   	push   ecx
  5002f7:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  5002fd:	8b f0                	mov    esi,eax
  5002ff:	8b 16                	mov    edx,DWORD PTR [esi]
  500301:	8d 85 20 ff ff ff    	lea    eax,[ebp-0xe0]
  500307:	50                   	push   eax
  500308:	56                   	push   esi
  500309:	ff 52 1c             	call   DWORD PTR [edx+0x1c]
  50030c:	db e2                	fnclex
  50030e:	85 c0                	test   eax,eax
  500310:	7d 0f                	jge    0x500321
  500312:	6a 1c                	push   0x1c
  500314:	68 d0 b0 41 00       	push   0x41b0d0
  500319:	56                   	push   esi
  50031a:	50                   	push   eax
  50031b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  500321:	33 c9                	xor    ecx,ecx
  500323:	8b b5 20 ff ff ff    	mov    esi,DWORD PTR [ebp-0xe0]
  500329:	85 f6                	test   esi,esi
  50032b:	0f 9f c1             	setg   cl
  50032e:	f7 d9                	neg    ecx
  500330:	8b f1                	mov    esi,ecx
  500332:	89 b5 00 ff ff ff    	mov    DWORD PTR [ebp-0x100],esi
  500338:	8d 4d a8             	lea    ecx,[ebp-0x58]
  50033b:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  500341:	66 85 f6             	test   si,si
  500344:	0f 84 f6 00 00 00    	je     0x500440
  50034a:	ba 70 3e 42 00       	mov    edx,0x423e70
  50034f:	b9 48 b6 54 00       	mov    ecx,0x54b648
  500354:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  50035a:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  50035f:	85 c0                	test   eax,eax
  500361:	75 10                	jne    0x500373
  500363:	68 10 b0 54 00       	push   0x54b010
  500368:	68 8c 7e 40 00       	push   0x407e8c
  50036d:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  500373:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  500379:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50037e:	89 85 30 ff ff ff    	mov    DWORD PTR [ebp-0xd0],eax
  500384:	b9 09 00 00 00       	mov    ecx,0x9
  500389:	89 8d 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],ecx
  50038f:	ba 01 00 00 00       	mov    edx,0x1
  500394:	89 95 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],edx
  50039a:	c7 85 38 ff ff ff 03 	mov    DWORD PTR [ebp-0xc8],0x3
  5003a1:	00 00 00 
  5003a4:	8b 3e                	mov    edi,DWORD PTR [esi]
  5003a6:	83 ec 10             	sub    esp,0x10
  5003a9:	8b dc                	mov    ebx,esp
  5003ab:	89 0b                	mov    DWORD PTR [ebx],ecx
  5003ad:	8b 8d 2c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xd4]
  5003b3:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  5003b6:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  5003b9:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [ebp-0xcc]
  5003bf:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  5003c2:	83 ec 10             	sub    esp,0x10
  5003c5:	8b cc                	mov    ecx,esp
  5003c7:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc8]
  5003cd:	89 01                	mov    DWORD PTR [ecx],eax
  5003cf:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [ebp-0xc4]
  5003d5:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  5003d8:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  5003db:	8b 95 44 ff ff ff    	mov    edx,DWORD PTR [ebp-0xbc]
  5003e1:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  5003e4:	56                   	push   esi
  5003e5:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  5003eb:	db e2                	fnclex
  5003ed:	85 c0                	test   eax,eax
  5003ef:	7d 12                	jge    0x500403
  5003f1:	68 b0 02 00 00       	push   0x2b0
  5003f6:	68 d8 ae 41 00       	push   0x41aed8
  5003fb:	56                   	push   esi
  5003fc:	50                   	push   eax
  5003fd:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  500403:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [ebp-0xdc],0x0
  50040a:	00 00 00 
  50040d:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500412:	8b 08                	mov    ecx,DWORD PTR [eax]
  500414:	8d 95 24 ff ff ff    	lea    edx,[ebp-0xdc]
  50041a:	52                   	push   edx
  50041b:	50                   	push   eax
  50041c:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  500422:	db e2                	fnclex
  500424:	85 c0                	test   eax,eax
  500426:	7d 18                	jge    0x500440
  500428:	68 fc 06 00 00       	push   0x6fc
  50042d:	68 34 e4 41 00       	push   0x41e434
  500432:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  500438:	51                   	push   ecx
  500439:	50                   	push   eax
  50043a:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  500440:	6a 00                	push   0x0
  500442:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  500448:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  50044e:	9b                   	fwait
  50044f:	68 ab 04 50 00       	push   0x5004ab
  500454:	eb 54                	jmp    0x5004aa
  500456:	8d 55 88             	lea    edx,[ebp-0x78]
  500459:	52                   	push   edx
  50045a:	8d 45 8c             	lea    eax,[ebp-0x74]
  50045d:	50                   	push   eax
  50045e:	8d 4d 90             	lea    ecx,[ebp-0x70]
  500461:	51                   	push   ecx
  500462:	8d 55 94             	lea    edx,[ebp-0x6c]
  500465:	52                   	push   edx
  500466:	8d 45 98             	lea    eax,[ebp-0x68]
  500469:	50                   	push   eax
  50046a:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  50046d:	51                   	push   ecx
  50046e:	8d 55 a0             	lea    edx,[ebp-0x60]
  500471:	52                   	push   edx
  500472:	8d 45 a4             	lea    eax,[ebp-0x5c]
  500475:	50                   	push   eax
  500476:	8d 4d a8             	lea    ecx,[ebp-0x58]
  500479:	51                   	push   ecx
  50047a:	6a 09                	push   0x9
  50047c:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  500482:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  500488:	52                   	push   edx
  500489:	8d 85 58 ff ff ff    	lea    eax,[ebp-0xa8]
  50048f:	50                   	push   eax
  500490:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  500496:	51                   	push   ecx
  500497:	8d 95 78 ff ff ff    	lea    edx,[ebp-0x88]
  50049d:	52                   	push   edx
  50049e:	6a 04                	push   0x4
  5004a0:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  5004a6:	83 c4 3c             	add    esp,0x3c
  5004a9:	c3                   	ret
  5004aa:	c3                   	ret
  5004ab:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  5004ae:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  5004b5:	5f                   	pop    edi
  5004b6:	5e                   	pop    esi
  5004b7:	5b                   	pop    ebx
  5004b8:	8b e5                	mov    esp,ebp
  5004ba:	5d                   	pop    ebp
  5004bb:	c2 04 00             	ret    0x4
  5004be:	e9 59 42 f0 ff       	jmp    0x40471c
  5004c3:	ff 15 b0 11 40 00    	call   DWORD PTR ds:0x4011b0
  5004c9:	90                   	nop
  5004ca:	90                   	nop
  5004cb:	90                   	nop
  5004cc:	90                   	nop
  5004cd:	90                   	nop
  5004ce:	90                   	nop
  5004cf:	90                   	nop
  5004d0:	55                   	push   ebp
  5004d1:	8b ec                	mov    ebp,esp
  5004d3:	83 ec 14             	sub    esp,0x14
  5004d6:	68 16 47 40 00       	push   0x404716
  5004db:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  5004e1:	50                   	push   eax
  5004e2:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  5004e9:	83 ec 68             	sub    esp,0x68
  5004ec:	53                   	push   ebx
  5004ed:	56                   	push   esi
  5004ee:	57                   	push   edi
  5004ef:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  5004f2:	c7 45 f0 80 30 40 00 	mov    DWORD PTR [ebp-0x10],0x403080
  5004f9:	33 db                	xor    ebx,ebx
  5004fb:	89 5d f4             	mov    DWORD PTR [ebp-0xc],ebx
  5004fe:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
  500501:	89 5d c8             	mov    DWORD PTR [ebp-0x38],ebx
  500504:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  500507:	89 5d a8             	mov    DWORD PTR [ebp-0x58],ebx
  50050a:	89 5d a4             	mov    DWORD PTR [ebp-0x5c],ebx
  50050d:	89 5d a0             	mov    DWORD PTR [ebp-0x60],ebx
  500510:	6a 01                	push   0x1
  500512:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  500518:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
  50051b:	d9 07                	fld    DWORD PTR [edi]
  50051d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  500520:	d8 20                	fsub   DWORD PTR [eax]
  500522:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  500525:	df e0                	fnstsw ax
  500527:	a8 0d                	test   al,0xd
  500529:	0f 85 0e 04 00 00    	jne    0x50093d
  50052f:	d9 05 98 2f 40 00    	fld    DWORD PTR ds:0x402f98
  500535:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
  500538:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50053f:	75 04                	jne    0x500545
  500541:	d8 30                	fdiv   DWORD PTR [eax]
  500543:	eb 07                	jmp    0x50054c
  500545:	ff 30                	push   DWORD PTR [eax]
  500547:	e8 dc 41 f0 ff       	call   0x404728
  50054c:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  50054f:	d8 09                	fmul   DWORD PTR [ecx]
  500551:	d8 45 dc             	fadd   DWORD PTR [ebp-0x24]
  500554:	d9 05 98 2f 40 00    	fld    DWORD PTR ds:0x402f98
  50055a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  500561:	75 04                	jne    0x500567
  500563:	d8 30                	fdiv   DWORD PTR [eax]
  500565:	eb 07                	jmp    0x50056e
  500567:	ff 30                	push   DWORD PTR [eax]
  500569:	e8 ba 41 f0 ff       	call   0x404728
  50056e:	d8 05 f8 13 40 00    	fadd   DWORD PTR ds:0x4013f8
  500574:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50057b:	75 04                	jne    0x500581
  50057d:	de f9                	fdivp  st(1),st
  50057f:	eb 09                	jmp    0x50058a
  500581:	50                   	push   eax
  500582:	b0 0d                	mov    al,0xd
  500584:	e8 b1 41 f0 ff       	call   0x40473a
  500589:	58                   	pop    eax
  50058a:	d8 6d dc             	fsubr  DWORD PTR [ebp-0x24]
  50058d:	d9 5d cc             	fstp   DWORD PTR [ebp-0x34]
  500590:	df e0                	fnstsw ax
  500592:	a8 0d                	test   al,0xd
  500594:	0f 85 a3 03 00 00    	jne    0x50093d
  50059a:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  50059d:	89 11                	mov    DWORD PTR [ecx],edx
  50059f:	d9 05 00 31 40 00    	fld    DWORD PTR ds:0x403100
  5005a5:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  5005ab:	d8 5d cc             	fcomp  DWORD PTR [ebp-0x34]
  5005ae:	df e0                	fnstsw ax
  5005b0:	f6 c4 41             	test   ah,0x41
  5005b3:	74 07                	je     0x5005bc
  5005b5:	be 01 00 00 00       	mov    esi,0x1
  5005ba:	eb 02                	jmp    0x5005be
  5005bc:	33 f6                	xor    esi,esi
  5005be:	dd 05 f8 30 40 00    	fld    QWORD PTR ds:0x4030f8
  5005c4:	df e0                	fnstsw ax
  5005c6:	a8 0d                	test   al,0xd
  5005c8:	0f 85 6f 03 00 00    	jne    0x50093d
  5005ce:	d9 5d 80             	fstp   DWORD PTR [ebp-0x80]
  5005d1:	d9 45 80             	fld    DWORD PTR [ebp-0x80]
  5005d4:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  5005da:	d8 5d cc             	fcomp  DWORD PTR [ebp-0x34]
  5005dd:	df e0                	fnstsw ax
  5005df:	f6 c4 01             	test   ah,0x1
  5005e2:	75 07                	jne    0x5005eb
  5005e4:	b8 01 00 00 00       	mov    eax,0x1
  5005e9:	eb 02                	jmp    0x5005ed
  5005eb:	33 c0                	xor    eax,eax
  5005ed:	0b f0                	or     esi,eax
  5005ef:	75 15                	jne    0x500606
  5005f1:	d9 45 cc             	fld    DWORD PTR [ebp-0x34]
  5005f4:	d8 0d f0 30 40 00    	fmul   DWORD PTR ds:0x4030f0
  5005fa:	df e0                	fnstsw ax
  5005fc:	a8 0d                	test   al,0xd
  5005fe:	0f 85 39 03 00 00    	jne    0x50093d
  500604:	eb 49                	jmp    0x50064f
  500606:	d9 05 00 31 40 00    	fld    DWORD PTR ds:0x403100
  50060c:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  500612:	d8 5d cc             	fcomp  DWORD PTR [ebp-0x34]
  500615:	df e0                	fnstsw ax
  500617:	f6 c4 41             	test   ah,0x41
  50061a:	d9 45 cc             	fld    DWORD PTR [ebp-0x34]
  50061d:	74 14                	je     0x500633
  50061f:	dc 25 e8 30 40 00    	fsub   QWORD PTR ds:0x4030e8
  500625:	dc 0d e0 30 40 00    	fmul   QWORD PTR ds:0x4030e0
  50062b:	dc 05 d8 30 40 00    	fadd   QWORD PTR ds:0x4030d8
  500631:	eb 12                	jmp    0x500645
  500633:	dc 05 e8 30 40 00    	fadd   QWORD PTR ds:0x4030e8
  500639:	dc 0d e0 30 40 00    	fmul   QWORD PTR ds:0x4030e0
  50063f:	dc 25 d8 30 40 00    	fsub   QWORD PTR ds:0x4030d8
  500645:	df e0                	fnstsw ax
  500647:	a8 0d                	test   al,0xd
  500649:	0f 85 ee 02 00 00    	jne    0x50093d
  50064f:	d9 5d d4             	fstp   DWORD PTR [ebp-0x2c]
  500652:	d9 05 d0 30 40 00    	fld    DWORD PTR ds:0x4030d0
  500658:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50065e:	d8 1f                	fcomp  DWORD PTR [edi]
  500660:	df e0                	fnstsw ax
  500662:	f6 c4 41             	test   ah,0x41
  500665:	75 09                	jne    0x500670
  500667:	c7 45 d0 00 00 00 40 	mov    DWORD PTR [ebp-0x30],0x40000000
  50066e:	eb 3d                	jmp    0x5006ad
  500670:	68 00 00 00 40       	push   0x40000000
  500675:	53                   	push   ebx
  500676:	d9 07                	fld    DWORD PTR [edi]
  500678:	dc 25 c8 30 40 00    	fsub   QWORD PTR ds:0x4030c8
  50067e:	df e0                	fnstsw ax
  500680:	a8 0d                	test   al,0xd
  500682:	0f 85 b5 02 00 00    	jne    0x50093d
  500688:	83 ec 08             	sub    esp,0x8
  50068b:	dd 1c 24             	fstp   QWORD PTR [esp]
  50068e:	ff 15 f4 11 40 00    	call   DWORD PTR ds:0x4011f4
  500694:	dc 0d b0 28 40 00    	fmul   QWORD PTR ds:0x4028b0
  50069a:	dc 2d 60 1c 40 00    	fsubr  QWORD PTR ds:0x401c60
  5006a0:	d9 5d d0             	fstp   DWORD PTR [ebp-0x30]
  5006a3:	df e0                	fnstsw ax
  5006a5:	a8 0d                	test   al,0xd
  5006a7:	0f 85 90 02 00 00    	jne    0x50093d
  5006ad:	d9 45 d0             	fld    DWORD PTR [ebp-0x30]
  5006b0:	d8 4d d4             	fmul   DWORD PTR [ebp-0x2c]
  5006b3:	d9 5d e0             	fstp   DWORD PTR [ebp-0x20]
  5006b6:	df e0                	fnstsw ax
  5006b8:	a8 0d                	test   al,0xd
  5006ba:	0f 85 7d 02 00 00    	jne    0x50093d
  5006c0:	d9 45 e0             	fld    DWORD PTR [ebp-0x20]
  5006c3:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  5006c6:	d8 00                	fadd   DWORD PTR [eax]
  5006c8:	8b 4d 18             	mov    ecx,DWORD PTR [ebp+0x18]
  5006cb:	d8 21                	fsub   DWORD PTR [ecx]
  5006cd:	d9 5d d8             	fstp   DWORD PTR [ebp-0x28]
  5006d0:	df e0                	fnstsw ax
  5006d2:	a8 0d                	test   al,0xd
  5006d4:	0f 85 63 02 00 00    	jne    0x50093d
  5006da:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  5006dd:	d8 1d a0 2f 40 00    	fcomp  DWORD PTR ds:0x402fa0
  5006e3:	df e0                	fnstsw ax
  5006e5:	f6 c4 41             	test   ah,0x41
  5006e8:	75 0e                	jne    0x5006f8
  5006ea:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  5006ed:	c7 02 00 00 90 42    	mov    DWORD PTR [edx],0x42900000
  5006f3:	e9 ea 00 00 00       	jmp    0x5007e2
  5006f8:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  5006fb:	d8 1d c0 30 40 00    	fcomp  DWORD PTR ds:0x4030c0
  500701:	df e0                	fnstsw ax
  500703:	f6 c4 41             	test   ah,0x41
  500706:	75 29                	jne    0x500731
  500708:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  50070b:	d8 25 c0 30 40 00    	fsub   DWORD PTR ds:0x4030c0
  500711:	d8 0d dc 1b 40 00    	fmul   DWORD PTR ds:0x401bdc
  500717:	d8 05 bc 30 40 00    	fadd   DWORD PTR ds:0x4030bc
  50071d:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
  500720:	d9 19                	fstp   DWORD PTR [ecx]
  500722:	df e0                	fnstsw ax
  500724:	a8 0d                	test   al,0xd
  500726:	0f 85 11 02 00 00    	jne    0x50093d
  50072c:	e9 b1 00 00 00       	jmp    0x5007e2
  500731:	d9 05 b8 30 40 00    	fld    DWORD PTR ds:0x4030b8
  500737:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50073d:	d8 5d d8             	fcomp  DWORD PTR [ebp-0x28]
  500740:	df e0                	fnstsw ax
  500742:	f6 c4 01             	test   ah,0x1
  500745:	74 0e                	je     0x500755
  500747:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  50074a:	c7 02 00 00 00 41    	mov    DWORD PTR [edx],0x41000000
  500750:	e9 8d 00 00 00       	jmp    0x5007e2
  500755:	dd 05 b0 30 40 00    	fld    QWORD PTR ds:0x4030b0
  50075b:	df e0                	fnstsw ax
  50075d:	a8 0d                	test   al,0xd
  50075f:	0f 85 d8 01 00 00    	jne    0x50093d
  500765:	d9 9d 7c ff ff ff    	fstp   DWORD PTR [ebp-0x84]
  50076b:	d9 85 7c ff ff ff    	fld    DWORD PTR [ebp-0x84]
  500771:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  500777:	d8 5d d8             	fcomp  DWORD PTR [ebp-0x28]
  50077a:	df e0                	fnstsw ax
  50077c:	f6 c4 01             	test   ah,0x1
  50077f:	74 07                	je     0x500788
  500781:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  500784:	89 18                	mov    DWORD PTR [eax],ebx
  500786:	eb 5a                	jmp    0x5007e2
  500788:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  50078b:	d8 1d a8 30 40 00    	fcomp  DWORD PTR ds:0x4030a8
  500791:	df e0                	fnstsw ax
  500793:	f6 c4 41             	test   ah,0x41
  500796:	75 0b                	jne    0x5007a3
  500798:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
  50079b:	c7 01 00 00 00 c1    	mov    DWORD PTR [ecx],0xc1000000
  5007a1:	eb 3f                	jmp    0x5007e2
  5007a3:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  5007a6:	d8 1d a4 30 40 00    	fcomp  DWORD PTR ds:0x4030a4
  5007ac:	df e0                	fnstsw ax
  5007ae:	f6 c4 41             	test   ah,0x41
  5007b1:	75 26                	jne    0x5007d9
  5007b3:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  5007b6:	d8 05 c0 30 40 00    	fadd   DWORD PTR ds:0x4030c0
  5007bc:	d8 0d dc 1b 40 00    	fmul   DWORD PTR ds:0x401bdc
  5007c2:	d8 25 bc 30 40 00    	fsub   DWORD PTR ds:0x4030bc
  5007c8:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  5007cb:	d9 1a                	fstp   DWORD PTR [edx]
  5007cd:	df e0                	fnstsw ax
  5007cf:	a8 0d                	test   al,0xd
  5007d1:	0f 85 66 01 00 00    	jne    0x50093d
  5007d7:	eb 09                	jmp    0x5007e2
  5007d9:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  5007dc:	c7 00 00 00 90 c2    	mov    DWORD PTR [eax],0xc2900000
  5007e2:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  5007e8:	50                   	push   eax
  5007e9:	8d 4d c8             	lea    ecx,[ebp-0x38]
  5007ec:	51                   	push   ecx
  5007ed:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  5007f3:	8b f0                	mov    esi,eax
  5007f5:	8b 16                	mov    edx,DWORD PTR [esi]
  5007f7:	8d 45 a0             	lea    eax,[ebp-0x60]
  5007fa:	50                   	push   eax
  5007fb:	56                   	push   esi
  5007fc:	ff 52 1c             	call   DWORD PTR [edx+0x1c]
  5007ff:	db e2                	fnclex
  500801:	85 c0                	test   eax,eax
  500803:	7d 0f                	jge    0x500814
  500805:	6a 1c                	push   0x1c
  500807:	68 d0 b0 41 00       	push   0x41b0d0
  50080c:	56                   	push   esi
  50080d:	50                   	push   eax
  50080e:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  500814:	33 c9                	xor    ecx,ecx
  500816:	8b 75 a0             	mov    esi,DWORD PTR [ebp-0x60]
  500819:	85 f6                	test   esi,esi
  50081b:	0f 9f c1             	setg   cl
  50081e:	f7 d9                	neg    ecx
  500820:	8b f1                	mov    esi,ecx
  500822:	8d 4d c8             	lea    ecx,[ebp-0x38]
  500825:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  50082b:	66 85 f6             	test   si,si
  50082e:	0f 84 d5 00 00 00    	je     0x500909
  500834:	ba 80 3e 42 00       	mov    edx,0x423e80
  500839:	b9 48 b6 54 00       	mov    ecx,0x54b648
  50083e:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  500844:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  500849:	85 c0                	test   eax,eax
  50084b:	75 10                	jne    0x50085d
  50084d:	68 10 b0 54 00       	push   0x54b010
  500852:	68 8c 7e 40 00       	push   0x407e8c
  500857:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  50085d:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  500863:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500868:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  50086b:	b9 09 00 00 00       	mov    ecx,0x9
  500870:	89 4d a8             	mov    DWORD PTR [ebp-0x58],ecx
  500873:	ba 01 00 00 00       	mov    edx,0x1
  500878:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  50087b:	c7 45 b8 03 00 00 00 	mov    DWORD PTR [ebp-0x48],0x3
  500882:	8b 3e                	mov    edi,DWORD PTR [esi]
  500884:	83 ec 10             	sub    esp,0x10
  500887:	8b dc                	mov    ebx,esp
  500889:	89 0b                	mov    DWORD PTR [ebx],ecx
  50088b:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  50088e:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  500891:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  500894:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  500897:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  50089a:	83 ec 10             	sub    esp,0x10
  50089d:	8b cc                	mov    ecx,esp
  50089f:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  5008a2:	89 01                	mov    DWORD PTR [ecx],eax
  5008a4:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  5008a7:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  5008aa:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  5008ad:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  5008b0:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  5008b3:	56                   	push   esi
  5008b4:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  5008ba:	db e2                	fnclex
  5008bc:	85 c0                	test   eax,eax
  5008be:	7d 12                	jge    0x5008d2
  5008c0:	68 b0 02 00 00       	push   0x2b0
  5008c5:	68 d8 ae 41 00       	push   0x41aed8
  5008ca:	56                   	push   esi
  5008cb:	50                   	push   eax
  5008cc:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5008d2:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [ebp-0x5c],0x0
  5008d9:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5008de:	8b 08                	mov    ecx,DWORD PTR [eax]
  5008e0:	8d 55 a4             	lea    edx,[ebp-0x5c]
  5008e3:	52                   	push   edx
  5008e4:	50                   	push   eax
  5008e5:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  5008eb:	db e2                	fnclex
  5008ed:	85 c0                	test   eax,eax
  5008ef:	7d 18                	jge    0x500909
  5008f1:	68 fc 06 00 00       	push   0x6fc
  5008f6:	68 34 e4 41 00       	push   0x41e434
  5008fb:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  500901:	51                   	push   ecx
  500902:	50                   	push   eax
  500903:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  500909:	6a 00                	push   0x0
  50090b:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  500911:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  500917:	9b                   	fwait
  500918:	68 2a 09 50 00       	push   0x50092a
  50091d:	eb 0a                	jmp    0x500929
  50091f:	8d 4d c8             	lea    ecx,[ebp-0x38]
  500922:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  500928:	c3                   	ret
  500929:	c3                   	ret
  50092a:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  50092d:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  500934:	5f                   	pop    edi
  500935:	5e                   	pop    esi
  500936:	5b                   	pop    ebx
  500937:	8b e5                	mov    esp,ebp
  500939:	5d                   	pop    ebp
  50093a:	c2 1c 00             	ret    0x1c
  50093d:	e9 da 3d f0 ff       	jmp    0x40471c
  500942:	90                   	nop
  500943:	90                   	nop
  500944:	90                   	nop
  500945:	90                   	nop
  500946:	90                   	nop
  500947:	90                   	nop
  500948:	90                   	nop
  500949:	90                   	nop
  50094a:	90                   	nop
  50094b:	90                   	nop
  50094c:	90                   	nop
  50094d:	90                   	nop
  50094e:	90                   	nop
  50094f:	90                   	nop
  500950:	55                   	push   ebp
  500951:	8b ec                	mov    ebp,esp
  500953:	83 ec 14             	sub    esp,0x14
  500956:	68 16 47 40 00       	push   0x404716
  50095b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  500961:	50                   	push   eax
  500962:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  500969:	83 ec 58             	sub    esp,0x58
  50096c:	53                   	push   ebx
  50096d:	56                   	push   esi
  50096e:	57                   	push   edi
  50096f:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  500972:	c7 45 f0 08 31 40 00 	mov    DWORD PTR [ebp-0x10],0x403108
  500979:	33 f6                	xor    esi,esi
  50097b:	89 75 f4             	mov    DWORD PTR [ebp-0xc],esi
  50097e:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
  500981:	89 75 d4             	mov    DWORD PTR [ebp-0x2c],esi
  500984:	89 75 d0             	mov    DWORD PTR [ebp-0x30],esi
  500987:	89 75 c0             	mov    DWORD PTR [ebp-0x40],esi
  50098a:	89 75 b0             	mov    DWORD PTR [ebp-0x50],esi
  50098d:	89 75 ac             	mov    DWORD PTR [ebp-0x54],esi
  500990:	89 75 a8             	mov    DWORD PTR [ebp-0x58],esi
  500993:	6a 01                	push   0x1
  500995:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  50099b:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  50099e:	d9 01                	fld    DWORD PTR [ecx]
  5009a0:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
  5009a3:	d8 1f                	fcomp  DWORD PTR [edi]
  5009a5:	df e0                	fnstsw ax
  5009a7:	f6 c4 01             	test   ah,0x1
  5009aa:	74 1e                	je     0x5009ca
  5009ac:	89 75 c8             	mov    DWORD PTR [ebp-0x38],esi
  5009af:	c7 45 c0 02 00 00 00 	mov    DWORD PTR [ebp-0x40],0x2
  5009b6:	8d 55 c0             	lea    edx,[ebp-0x40]
  5009b9:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  5009bc:	ff 15 18 10 40 00    	call   DWORD PTR ds:0x401018
  5009c2:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  5009c5:	66 89 30             	mov    WORD PTR [eax],si
  5009c8:	eb 72                	jmp    0x500a3c
  5009ca:	d9 01                	fld    DWORD PTR [ecx]
  5009cc:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  5009cf:	d8 1a                	fcomp  DWORD PTR [edx]
  5009d1:	df e0                	fnstsw ax
  5009d3:	f6 c4 41             	test   ah,0x41
  5009d6:	75 24                	jne    0x5009fc
  5009d8:	c7 45 c8 01 00 00 00 	mov    DWORD PTR [ebp-0x38],0x1
  5009df:	c7 45 c0 02 00 00 00 	mov    DWORD PTR [ebp-0x40],0x2
  5009e6:	8d 55 c0             	lea    edx,[ebp-0x40]
  5009e9:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  5009ec:	ff 15 18 10 40 00    	call   DWORD PTR ds:0x401018
  5009f2:	8b 4d 18             	mov    ecx,DWORD PTR [ebp+0x18]
  5009f5:	66 c7 01 01 00       	mov    WORD PTR [ecx],0x1
  5009fa:	eb 40                	jmp    0x500a3c
  5009fc:	d9 02                	fld    DWORD PTR [edx]
  5009fe:	d8 27                	fsub   DWORD PTR [edi]
  500a00:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  500a07:	75 04                	jne    0x500a0d
  500a09:	d8 39                	fdivr  DWORD PTR [ecx]
  500a0b:	eb 07                	jmp    0x500a14
  500a0d:	ff 31                	push   DWORD PTR [ecx]
  500a0f:	e8 32 3d f0 ff       	call   0x404746
  500a14:	d9 5d c8             	fstp   DWORD PTR [ebp-0x38]
  500a17:	df e0                	fnstsw ax
  500a19:	a8 0d                	test   al,0xd
  500a1b:	0f 85 a1 01 00 00    	jne    0x500bc2
  500a21:	c7 45 c0 04 00 00 00 	mov    DWORD PTR [ebp-0x40],0x4
  500a28:	8d 55 c0             	lea    edx,[ebp-0x40]
  500a2b:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  500a2e:	ff 15 18 10 40 00    	call   DWORD PTR ds:0x401018
  500a34:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
  500a37:	66 c7 02 01 00       	mov    WORD PTR [edx],0x1
  500a3c:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  500a42:	50                   	push   eax
  500a43:	8d 45 d0             	lea    eax,[ebp-0x30]
  500a46:	50                   	push   eax
  500a47:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  500a4d:	8b f0                	mov    esi,eax
  500a4f:	8b 0e                	mov    ecx,DWORD PTR [esi]
  500a51:	8d 55 a8             	lea    edx,[ebp-0x58]
  500a54:	52                   	push   edx
  500a55:	56                   	push   esi
  500a56:	ff 51 1c             	call   DWORD PTR [ecx+0x1c]
  500a59:	db e2                	fnclex
  500a5b:	85 c0                	test   eax,eax
  500a5d:	7d 0f                	jge    0x500a6e
  500a5f:	6a 1c                	push   0x1c
  500a61:	68 d0 b0 41 00       	push   0x41b0d0
  500a66:	56                   	push   esi
  500a67:	50                   	push   eax
  500a68:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  500a6e:	33 c0                	xor    eax,eax
  500a70:	8b 55 a8             	mov    edx,DWORD PTR [ebp-0x58]
  500a73:	85 d2                	test   edx,edx
  500a75:	0f 9f c0             	setg   al
  500a78:	f7 d8                	neg    eax
  500a7a:	8b f0                	mov    esi,eax
  500a7c:	8d 4d d0             	lea    ecx,[ebp-0x30]
  500a7f:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  500a85:	66 85 f6             	test   si,si
  500a88:	0f 84 d5 00 00 00    	je     0x500b63
  500a8e:	ba 8c 3e 42 00       	mov    edx,0x423e8c
  500a93:	b9 48 b6 54 00       	mov    ecx,0x54b648
  500a98:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  500a9e:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  500aa3:	85 c0                	test   eax,eax
  500aa5:	75 10                	jne    0x500ab7
  500aa7:	68 10 b0 54 00       	push   0x54b010
  500aac:	68 8c 7e 40 00       	push   0x407e8c
  500ab1:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  500ab7:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  500abd:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500ac2:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  500ac5:	b9 09 00 00 00       	mov    ecx,0x9
  500aca:	89 4d b0             	mov    DWORD PTR [ebp-0x50],ecx
  500acd:	ba 01 00 00 00       	mov    edx,0x1
  500ad2:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
  500ad5:	c7 45 c0 03 00 00 00 	mov    DWORD PTR [ebp-0x40],0x3
  500adc:	8b 3e                	mov    edi,DWORD PTR [esi]
  500ade:	83 ec 10             	sub    esp,0x10
  500ae1:	8b dc                	mov    ebx,esp
  500ae3:	89 0b                	mov    DWORD PTR [ebx],ecx
  500ae5:	8b 4d b4             	mov    ecx,DWORD PTR [ebp-0x4c]
  500ae8:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  500aeb:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  500aee:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  500af1:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  500af4:	83 ec 10             	sub    esp,0x10
  500af7:	8b cc                	mov    ecx,esp
  500af9:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  500afc:	89 01                	mov    DWORD PTR [ecx],eax
  500afe:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
  500b01:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  500b04:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  500b07:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  500b0a:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  500b0d:	56                   	push   esi
  500b0e:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  500b14:	db e2                	fnclex
  500b16:	85 c0                	test   eax,eax
  500b18:	7d 12                	jge    0x500b2c
  500b1a:	68 b0 02 00 00       	push   0x2b0
  500b1f:	68 d8 ae 41 00       	push   0x41aed8
  500b24:	56                   	push   esi
  500b25:	50                   	push   eax
  500b26:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  500b2c:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [ebp-0x54],0x0
  500b33:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500b38:	8b 08                	mov    ecx,DWORD PTR [eax]
  500b3a:	8d 55 ac             	lea    edx,[ebp-0x54]
  500b3d:	52                   	push   edx
  500b3e:	50                   	push   eax
  500b3f:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  500b45:	db e2                	fnclex
  500b47:	85 c0                	test   eax,eax
  500b49:	7d 18                	jge    0x500b63
  500b4b:	68 fc 06 00 00       	push   0x6fc
  500b50:	68 34 e4 41 00       	push   0x41e434
  500b55:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  500b5b:	51                   	push   ecx
  500b5c:	50                   	push   eax
  500b5d:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  500b63:	6a 00                	push   0x0
  500b65:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  500b6b:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  500b71:	9b                   	fwait
  500b72:	68 93 0b 50 00       	push   0x500b93
  500b77:	eb 19                	jmp    0x500b92
  500b79:	f6 45 f4 04          	test   BYTE PTR [ebp-0xc],0x4
  500b7d:	74 09                	je     0x500b88
  500b7f:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  500b82:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  500b88:	8d 4d d0             	lea    ecx,[ebp-0x30]
  500b8b:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  500b91:	c3                   	ret
  500b92:	c3                   	ret
  500b93:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  500b96:	8b d0                	mov    edx,eax
  500b98:	8b 4d d4             	mov    ecx,DWORD PTR [ebp-0x2c]
  500b9b:	89 0a                	mov    DWORD PTR [edx],ecx
  500b9d:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
  500ba0:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  500ba3:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  500ba6:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
  500ba9:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
  500bac:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  500baf:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  500bb2:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  500bb9:	5f                   	pop    edi
  500bba:	5e                   	pop    esi
  500bbb:	5b                   	pop    ebx
  500bbc:	8b e5                	mov    esp,ebp
  500bbe:	5d                   	pop    ebp
  500bbf:	c2 14 00             	ret    0x14
  500bc2:	e9 55 3b f0 ff       	jmp    0x40471c
  500bc7:	90                   	nop
  500bc8:	90                   	nop
  500bc9:	90                   	nop
  500bca:	90                   	nop
  500bcb:	90                   	nop
  500bcc:	90                   	nop
  500bcd:	90                   	nop
  500bce:	90                   	nop
  500bcf:	90                   	nop
  500bd0:	55                   	push   ebp
  500bd1:	8b ec                	mov    ebp,esp
  500bd3:	83 ec 14             	sub    esp,0x14
  500bd6:	68 16 47 40 00       	push   0x404716
  500bdb:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  500be1:	50                   	push   eax
  500be2:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  500be9:	81 ec 84 00 00 00    	sub    esp,0x84
  500bef:	53                   	push   ebx
  500bf0:	56                   	push   esi
  500bf1:	57                   	push   edi
  500bf2:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  500bf5:	c7 45 f0 30 31 40 00 	mov    DWORD PTR [ebp-0x10],0x403130
  500bfc:	33 f6                	xor    esi,esi
  500bfe:	89 75 f4             	mov    DWORD PTR [ebp-0xc],esi
  500c01:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
  500c04:	89 75 e0             	mov    DWORD PTR [ebp-0x20],esi
  500c07:	89 75 d4             	mov    DWORD PTR [ebp-0x2c],esi
  500c0a:	89 75 c4             	mov    DWORD PTR [ebp-0x3c],esi
  500c0d:	89 75 b4             	mov    DWORD PTR [ebp-0x4c],esi
  500c10:	89 75 a4             	mov    DWORD PTR [ebp-0x5c],esi
  500c13:	89 75 a0             	mov    DWORD PTR [ebp-0x60],esi
  500c16:	89 75 9c             	mov    DWORD PTR [ebp-0x64],esi
  500c19:	6a 01                	push   0x1
  500c1b:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  500c21:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  500c24:	d9 00                	fld    DWORD PTR [eax]
  500c26:	8b 4d 28             	mov    ecx,DWORD PTR [ebp+0x28]
  500c29:	d8 19                	fcomp  DWORD PTR [ecx]
  500c2b:	df e0                	fnstsw ax
  500c2d:	f6 c4 41             	test   ah,0x41
  500c30:	0f 85 55 03 00 00    	jne    0x500f8b
  500c36:	56                   	push   esi
  500c37:	68 17 00 03 68       	push   0x68030017
  500c3c:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500c41:	8b 10                	mov    edx,DWORD PTR [eax]
  500c43:	50                   	push   eax
  500c44:	ff 92 54 04 00 00    	call   DWORD PTR [edx+0x454]
  500c4a:	50                   	push   eax
  500c4b:	8d 45 d4             	lea    eax,[ebp-0x2c]
  500c4e:	50                   	push   eax
  500c4f:	8b 35 94 10 40 00    	mov    esi,DWORD PTR ds:0x401094
  500c55:	ff d6                	call   esi
  500c57:	50                   	push   eax
  500c58:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  500c5b:	51                   	push   ecx
  500c5c:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  500c62:	83 c4 10             	add    esp,0x10
  500c65:	50                   	push   eax
  500c66:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  500c6c:	66 8b d8             	mov    bx,ax
  500c6f:	f7 d3                	not    ebx
  500c71:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  500c74:	8b 3d 80 12 40 00    	mov    edi,DWORD PTR ds:0x401280
  500c7a:	ff d7                	call   edi
  500c7c:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  500c7f:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  500c85:	66 85 db             	test   bx,bx
  500c88:	0f 84 bd 00 00 00    	je     0x500d4b
  500c8e:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  500c91:	d9 03                	fld    DWORD PTR [ebx]
  500c93:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
  500c96:	d8 19                	fcomp  DWORD PTR [ecx]
  500c98:	df e0                	fnstsw ax
  500c9a:	f6 c4 41             	test   ah,0x41
  500c9d:	75 55                	jne    0x500cf4
  500c9f:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
  500ca6:	33 c0                	xor    eax,eax
  500ca8:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  500cab:	b9 02 00 00 00       	mov    ecx,0x2
  500cb0:	89 4d b4             	mov    DWORD PTR [ebp-0x4c],ecx
  500cb3:	83 ec 10             	sub    esp,0x10
  500cb6:	8b d4                	mov    edx,esp
  500cb8:	89 0a                	mov    DWORD PTR [edx],ecx
  500cba:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  500cbd:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  500cc0:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  500cc3:	8b 5d c0             	mov    ebx,DWORD PTR [ebp-0x40]
  500cc6:	89 5a 0c             	mov    DWORD PTR [edx+0xc],ebx
  500cc9:	68 03 00 03 68       	push   0x68030003
  500cce:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500cd3:	8b 10                	mov    edx,DWORD PTR [eax]
  500cd5:	50                   	push   eax
  500cd6:	ff 92 54 04 00 00    	call   DWORD PTR [edx+0x454]
  500cdc:	50                   	push   eax
  500cdd:	8d 45 d4             	lea    eax,[ebp-0x2c]
  500ce0:	50                   	push   eax
  500ce1:	ff d6                	call   esi
  500ce3:	50                   	push   eax
  500ce4:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  500cea:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  500ced:	ff d7                	call   edi
  500cef:	e9 e8 00 00 00       	jmp    0x500ddc
  500cf4:	d9 03                	fld    DWORD PTR [ebx]
  500cf6:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
  500cf9:	d8 1a                	fcomp  DWORD PTR [edx]
  500cfb:	df e0                	fnstsw ax
  500cfd:	f6 c4 01             	test   ah,0x1
  500d00:	74 0f                	je     0x500d11
  500d02:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
  500d05:	8b 11                	mov    edx,DWORD PTR [ecx]
  500d07:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
  500d0a:	b8 64 00 00 00       	mov    eax,0x64
  500d0f:	eb 97                	jmp    0x500ca8
  500d11:	d9 01                	fld    DWORD PTR [ecx]
  500d13:	d8 23                	fsub   DWORD PTR [ebx]
  500d15:	d9 01                	fld    DWORD PTR [ecx]
  500d17:	d8 22                	fsub   DWORD PTR [edx]
  500d19:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  500d20:	75 04                	jne    0x500d26
  500d22:	de f9                	fdivp  st(1),st
  500d24:	eb 09                	jmp    0x500d2f
  500d26:	50                   	push   eax
  500d27:	b0 0d                	mov    al,0xd
  500d29:	e8 0c 3a f0 ff       	call   0x40473a
  500d2e:	58                   	pop    eax
  500d2f:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
  500d32:	d8 09                	fmul   DWORD PTR [ecx]
  500d34:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  500d37:	df e0                	fnstsw ax
  500d39:	a8 0d                	test   al,0xd
  500d3b:	0f 85 66 04 00 00    	jne    0x5011a7
  500d41:	b8 64 00 00 00       	mov    eax,0x64
  500d46:	e9 5d ff ff ff       	jmp    0x500ca8
  500d4b:	6a 00                	push   0x0
  500d4d:	68 03 00 03 68       	push   0x68030003
  500d52:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500d57:	8b 08                	mov    ecx,DWORD PTR [eax]
  500d59:	50                   	push   eax
  500d5a:	ff 91 54 04 00 00    	call   DWORD PTR [ecx+0x454]
  500d60:	50                   	push   eax
  500d61:	8d 55 d4             	lea    edx,[ebp-0x2c]
  500d64:	52                   	push   edx
  500d65:	ff d6                	call   esi
  500d67:	50                   	push   eax
  500d68:	8d 45 c4             	lea    eax,[ebp-0x3c]
  500d6b:	50                   	push   eax
  500d6c:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  500d72:	83 c4 10             	add    esp,0x10
  500d75:	50                   	push   eax
  500d76:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  500d7c:	0f bf c8             	movsx  ecx,ax
  500d7f:	89 8d 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],ecx
  500d85:	db 85 7c ff ff ff    	fild   DWORD PTR [ebp-0x84]
  500d8b:	dd 9d 74 ff ff ff    	fstp   QWORD PTR [ebp-0x8c]
  500d91:	dd 85 74 ff ff ff    	fld    QWORD PTR [ebp-0x8c]
  500d97:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  500d9e:	75 08                	jne    0x500da8
  500da0:	dc 35 a0 28 40 00    	fdiv   QWORD PTR ds:0x4028a0
  500da6:	eb 11                	jmp    0x500db9
  500da8:	ff 35 a4 28 40 00    	push   DWORD PTR ds:0x4028a4
  500dae:	ff 35 a0 28 40 00    	push   DWORD PTR ds:0x4028a0
  500db4:	e8 7b 39 f0 ff       	call   0x404734
  500db9:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  500dbc:	d8 0a                	fmul   DWORD PTR [edx]
  500dbe:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  500dc1:	df e0                	fnstsw ax
  500dc3:	a8 0d                	test   al,0xd
  500dc5:	0f 85 dc 03 00 00    	jne    0x5011a7
  500dcb:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  500dce:	ff d7                	call   edi
  500dd0:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  500dd3:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  500dd9:	8b 5d c0             	mov    ebx,DWORD PTR [ebp-0x40]
  500ddc:	6a 00                	push   0x0
  500dde:	68 16 00 03 68       	push   0x68030016
  500de3:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500de8:	8b 08                	mov    ecx,DWORD PTR [eax]
  500dea:	50                   	push   eax
  500deb:	ff 91 54 04 00 00    	call   DWORD PTR [ecx+0x454]
  500df1:	50                   	push   eax
  500df2:	8d 55 d4             	lea    edx,[ebp-0x2c]
  500df5:	52                   	push   edx
  500df6:	ff d6                	call   esi
  500df8:	50                   	push   eax
  500df9:	8d 45 c4             	lea    eax,[ebp-0x3c]
  500dfc:	50                   	push   eax
  500dfd:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  500e03:	83 c4 10             	add    esp,0x10
  500e06:	50                   	push   eax
  500e07:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  500e0d:	f7 d0                	not    eax
  500e0f:	66 89 45 98          	mov    WORD PTR [ebp-0x68],ax
  500e13:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  500e16:	ff d7                	call   edi
  500e18:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  500e1b:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  500e21:	66 83 7d 98 00       	cmp    WORD PTR [ebp-0x68],0x0
  500e26:	0f 84 cc 00 00 00    	je     0x500ef8
  500e2c:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  500e2f:	d9 01                	fld    DWORD PTR [ecx]
  500e31:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
  500e34:	d8 1a                	fcomp  DWORD PTR [edx]
  500e36:	df e0                	fnstsw ax
  500e38:	f6 c4 01             	test   ah,0x1
  500e3b:	c7 85 70 ff ff ff 01 	mov    DWORD PTR [ebp-0x90],0x1
  500e42:	00 00 00 
  500e45:	74 0a                	je     0x500e51
  500e47:	c7 85 70 ff ff ff 00 	mov    DWORD PTR [ebp-0x90],0x0
  500e4e:	00 00 00 
  500e51:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  500e54:	d9 00                	fld    DWORD PTR [eax]
  500e56:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  500e59:	d8 21                	fsub   DWORD PTR [ecx]
  500e5b:	df e0                	fnstsw ax
  500e5d:	a8 0d                	test   al,0xd
  500e5f:	0f 85 42 03 00 00    	jne    0x5011a7
  500e65:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  500e6b:	d9 9d 6c ff ff ff    	fstp   DWORD PTR [ebp-0x94]
  500e71:	d9 05 54 31 40 00    	fld    DWORD PTR ds:0x403154
  500e77:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  500e7d:	d8 9d 6c ff ff ff    	fcomp  DWORD PTR [ebp-0x94]
  500e83:	df e0                	fnstsw ax
  500e85:	f6 c4 01             	test   ah,0x1
  500e88:	75 07                	jne    0x500e91
  500e8a:	b8 01 00 00 00       	mov    eax,0x1
  500e8f:	eb 02                	jmp    0x500e93
  500e91:	33 c0                	xor    eax,eax
  500e93:	85 85 70 ff ff ff    	test   DWORD PTR [ebp-0x90],eax
  500e99:	75 0f                	jne    0x500eaa
  500e9b:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
  500e9e:	8b 02                	mov    eax,DWORD PTR [edx]
  500ea0:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  500ea3:	b8 64 00 00 00       	mov    eax,0x64
  500ea8:	eb 05                	jmp    0x500eaf
  500eaa:	33 c0                	xor    eax,eax
  500eac:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  500eaf:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  500eb2:	b9 02 00 00 00       	mov    ecx,0x2
  500eb7:	89 4d b4             	mov    DWORD PTR [ebp-0x4c],ecx
  500eba:	83 ec 10             	sub    esp,0x10
  500ebd:	8b d4                	mov    edx,esp
  500ebf:	89 0a                	mov    DWORD PTR [edx],ecx
  500ec1:	8b 4d b8             	mov    ecx,DWORD PTR [ebp-0x48]
  500ec4:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  500ec7:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  500eca:	89 5a 0c             	mov    DWORD PTR [edx+0xc],ebx
  500ecd:	68 02 00 03 68       	push   0x68030002
  500ed2:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500ed7:	8b 10                	mov    edx,DWORD PTR [eax]
  500ed9:	50                   	push   eax
  500eda:	ff 92 54 04 00 00    	call   DWORD PTR [edx+0x454]
  500ee0:	50                   	push   eax
  500ee1:	8d 45 d4             	lea    eax,[ebp-0x2c]
  500ee4:	50                   	push   eax
  500ee5:	ff d6                	call   esi
  500ee7:	50                   	push   eax
  500ee8:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  500eee:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  500ef1:	ff d7                	call   edi
  500ef3:	e9 35 01 00 00       	jmp    0x50102d
  500ef8:	6a 00                	push   0x0
  500efa:	68 02 00 03 68       	push   0x68030002
  500eff:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500f04:	8b 08                	mov    ecx,DWORD PTR [eax]
  500f06:	50                   	push   eax
  500f07:	ff 91 54 04 00 00    	call   DWORD PTR [ecx+0x454]
  500f0d:	50                   	push   eax
  500f0e:	8d 55 d4             	lea    edx,[ebp-0x2c]
  500f11:	52                   	push   edx
  500f12:	ff d6                	call   esi
  500f14:	50                   	push   eax
  500f15:	8d 45 c4             	lea    eax,[ebp-0x3c]
  500f18:	50                   	push   eax
  500f19:	ff 15 34 11 40 00    	call   DWORD PTR ds:0x401134
  500f1f:	83 c4 10             	add    esp,0x10
  500f22:	50                   	push   eax
  500f23:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  500f29:	0f bf c8             	movsx  ecx,ax
  500f2c:	89 8d 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],ecx
  500f32:	db 85 68 ff ff ff    	fild   DWORD PTR [ebp-0x98]
  500f38:	dd 9d 60 ff ff ff    	fstp   QWORD PTR [ebp-0xa0]
  500f3e:	dd 85 60 ff ff ff    	fld    QWORD PTR [ebp-0xa0]
  500f44:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  500f4b:	75 08                	jne    0x500f55
  500f4d:	dc 35 a0 28 40 00    	fdiv   QWORD PTR ds:0x4028a0
  500f53:	eb 11                	jmp    0x500f66
  500f55:	ff 35 a4 28 40 00    	push   DWORD PTR ds:0x4028a4
  500f5b:	ff 35 a0 28 40 00    	push   DWORD PTR ds:0x4028a0
  500f61:	e8 ce 37 f0 ff       	call   0x404734
  500f66:	8b 55 24             	mov    edx,DWORD PTR [ebp+0x24]
  500f69:	d8 0a                	fmul   DWORD PTR [edx]
  500f6b:	d9 5d d8             	fstp   DWORD PTR [ebp-0x28]
  500f6e:	df e0                	fnstsw ax
  500f70:	a8 0d                	test   al,0xd
  500f72:	0f 85 2f 02 00 00    	jne    0x5011a7
  500f78:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  500f7b:	ff d7                	call   edi
  500f7d:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  500f80:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  500f86:	e9 a2 00 00 00       	jmp    0x50102d
  500f8b:	33 c0                	xor    eax,eax
  500f8d:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  500f90:	b9 02 00 00 00       	mov    ecx,0x2
  500f95:	89 4d b4             	mov    DWORD PTR [ebp-0x4c],ecx
  500f98:	83 ec 10             	sub    esp,0x10
  500f9b:	8b d4                	mov    edx,esp
  500f9d:	89 0a                	mov    DWORD PTR [edx],ecx
  500f9f:	8b 75 b8             	mov    esi,DWORD PTR [ebp-0x48]
  500fa2:	89 72 04             	mov    DWORD PTR [edx+0x4],esi
  500fa5:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  500fa8:	8b 7d c0             	mov    edi,DWORD PTR [ebp-0x40]
  500fab:	89 7a 0c             	mov    DWORD PTR [edx+0xc],edi
  500fae:	68 02 00 03 68       	push   0x68030002
  500fb3:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  500fb8:	8b 08                	mov    ecx,DWORD PTR [eax]
  500fba:	50                   	push   eax
  500fbb:	ff 91 54 04 00 00    	call   DWORD PTR [ecx+0x454]
  500fc1:	50                   	push   eax
  500fc2:	8d 55 d4             	lea    edx,[ebp-0x2c]
  500fc5:	52                   	push   edx
  500fc6:	8b 1d 94 10 40 00    	mov    ebx,DWORD PTR ds:0x401094
  500fcc:	ff d3                	call   ebx
  500fce:	50                   	push   eax
  500fcf:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  500fd5:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  500fd8:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  500fde:	33 c0                	xor    eax,eax
  500fe0:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  500fe3:	b9 02 00 00 00       	mov    ecx,0x2
  500fe8:	89 4d b4             	mov    DWORD PTR [ebp-0x4c],ecx
  500feb:	83 ec 10             	sub    esp,0x10
  500fee:	8b d4                	mov    edx,esp
  500ff0:	89 0a                	mov    DWORD PTR [edx],ecx
  500ff2:	89 72 04             	mov    DWORD PTR [edx+0x4],esi
  500ff5:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  500ff8:	89 7a 0c             	mov    DWORD PTR [edx+0xc],edi
  500ffb:	68 03 00 03 68       	push   0x68030003
  501000:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  501005:	8b 08                	mov    ecx,DWORD PTR [eax]
  501007:	50                   	push   eax
  501008:	ff 91 54 04 00 00    	call   DWORD PTR [ecx+0x454]
  50100e:	50                   	push   eax
  50100f:	8d 55 d4             	lea    edx,[ebp-0x2c]
  501012:	52                   	push   edx
  501013:	ff d3                	call   ebx
  501015:	50                   	push   eax
  501016:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  50101c:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  50101f:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  501025:	33 c0                	xor    eax,eax
  501027:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  50102a:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  50102d:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  501030:	d8 45 dc             	fadd   DWORD PTR [ebp-0x24]
  501033:	d9 5d e0             	fstp   DWORD PTR [ebp-0x20]
  501036:	df e0                	fnstsw ax
  501038:	a8 0d                	test   al,0xd
  50103a:	0f 85 67 01 00 00    	jne    0x5011a7
  501040:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  501046:	50                   	push   eax
  501047:	8d 45 d4             	lea    eax,[ebp-0x2c]
  50104a:	50                   	push   eax
  50104b:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  501051:	8b f0                	mov    esi,eax
  501053:	8b 0e                	mov    ecx,DWORD PTR [esi]
  501055:	8d 55 9c             	lea    edx,[ebp-0x64]
  501058:	52                   	push   edx
  501059:	56                   	push   esi
  50105a:	ff 51 1c             	call   DWORD PTR [ecx+0x1c]
  50105d:	db e2                	fnclex
  50105f:	85 c0                	test   eax,eax
  501061:	7d 0f                	jge    0x501072
  501063:	6a 1c                	push   0x1c
  501065:	68 d0 b0 41 00       	push   0x41b0d0
  50106a:	56                   	push   esi
  50106b:	50                   	push   eax
  50106c:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  501072:	33 c0                	xor    eax,eax
  501074:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  501077:	85 d2                	test   edx,edx
  501079:	0f 9f c0             	setg   al
  50107c:	f7 d8                	neg    eax
  50107e:	8b f0                	mov    esi,eax
  501080:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  501083:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  501089:	66 85 f6             	test   si,si
  50108c:	0f 84 d5 00 00 00    	je     0x501167
  501092:	ba 9c 3e 42 00       	mov    edx,0x423e9c
  501097:	b9 48 b6 54 00       	mov    ecx,0x54b648
  50109c:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  5010a2:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  5010a7:	85 c0                	test   eax,eax
  5010a9:	75 10                	jne    0x5010bb
  5010ab:	68 10 b0 54 00       	push   0x54b010
  5010b0:	68 8c 7e 40 00       	push   0x407e8c
  5010b5:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  5010bb:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  5010c1:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5010c6:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
  5010c9:	b9 09 00 00 00       	mov    ecx,0x9
  5010ce:	89 4d a4             	mov    DWORD PTR [ebp-0x5c],ecx
  5010d1:	ba 01 00 00 00       	mov    edx,0x1
  5010d6:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
  5010d9:	c7 45 b4 03 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x3
  5010e0:	8b 3e                	mov    edi,DWORD PTR [esi]
  5010e2:	83 ec 10             	sub    esp,0x10
  5010e5:	8b dc                	mov    ebx,esp
  5010e7:	89 0b                	mov    DWORD PTR [ebx],ecx
  5010e9:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  5010ec:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  5010ef:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  5010f2:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
  5010f5:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  5010f8:	83 ec 10             	sub    esp,0x10
  5010fb:	8b cc                	mov    ecx,esp
  5010fd:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  501100:	89 01                	mov    DWORD PTR [ecx],eax
  501102:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  501105:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  501108:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  50110b:	8b 55 c0             	mov    edx,DWORD PTR [ebp-0x40]
  50110e:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  501111:	56                   	push   esi
  501112:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  501118:	db e2                	fnclex
  50111a:	85 c0                	test   eax,eax
  50111c:	7d 12                	jge    0x501130
  50111e:	68 b0 02 00 00       	push   0x2b0
  501123:	68 d8 ae 41 00       	push   0x41aed8
  501128:	56                   	push   esi
  501129:	50                   	push   eax
  50112a:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  501130:	c7 45 a0 00 00 00 00 	mov    DWORD PTR [ebp-0x60],0x0
  501137:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50113c:	8b 08                	mov    ecx,DWORD PTR [eax]
  50113e:	8d 55 a0             	lea    edx,[ebp-0x60]
  501141:	52                   	push   edx
  501142:	50                   	push   eax
  501143:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  501149:	db e2                	fnclex
  50114b:	85 c0                	test   eax,eax
  50114d:	7d 18                	jge    0x501167
  50114f:	68 fc 06 00 00       	push   0x6fc
  501154:	68 34 e4 41 00       	push   0x41e434
  501159:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  50115f:	51                   	push   ecx
  501160:	50                   	push   eax
  501161:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  501167:	6a 00                	push   0x0
  501169:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  50116f:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  501175:	9b                   	fwait
  501176:	68 91 11 50 00       	push   0x501191
  50117b:	eb 13                	jmp    0x501190
  50117d:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  501180:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  501186:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  501189:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  50118f:	c3                   	ret
  501190:	c3                   	ret
  501191:	d9 45 e0             	fld    DWORD PTR [ebp-0x20]
  501194:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  501197:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  50119e:	5f                   	pop    edi
  50119f:	5e                   	pop    esi
  5011a0:	5b                   	pop    ebx
  5011a1:	8b e5                	mov    esp,ebp
  5011a3:	5d                   	pop    ebp
  5011a4:	c2 24 00             	ret    0x24
  5011a7:	e9 70 35 f0 ff       	jmp    0x40471c
  5011ac:	90                   	nop
  5011ad:	90                   	nop
  5011ae:	90                   	nop
  5011af:	90                   	nop
