
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

00511ff0 <.text+0x110ff0>:
  511ff0:	8d 54 ff ff          	lea    edx,[edi+edi*8-0x1]
  511ff4:	ff 83 3d 00 b0 54    	inc    DWORD PTR [ebx+0x54b0003d]
  511ffa:	00 00                	add    BYTE PTR [eax],al
  511ffc:	75 08                	jne    0x512006
  511ffe:	dc 35 a0 28 40 00    	fdiv   QWORD PTR ds:0x4028a0
  512004:	eb 11                	jmp    0x512017
  512006:	ff 35 a4 28 40 00    	push   DWORD PTR ds:0x4028a4
  51200c:	ff 35 a0 28 40 00    	push   DWORD PTR ds:0x4028a0
  512012:	e8 1d 27 ef ff       	call   0x404734
  512017:	8b 75 18             	mov    esi,DWORD PTR [ebp+0x18]
  51201a:	d9 1e                	fstp   DWORD PTR [esi]
  51201c:	df e0                	fnstsw ax
  51201e:	a8 0d                	test   al,0xd
  512020:	0f 85 56 02 00 00    	jne    0x51227c
  512026:	8d 55 d4             	lea    edx,[ebp-0x2c]
  512029:	52                   	push   edx
  51202a:	8d 45 d8             	lea    eax,[ebp-0x28]
  51202d:	50                   	push   eax
  51202e:	8d 4d dc             	lea    ecx,[ebp-0x24]
  512031:	51                   	push   ecx
  512032:	8d 55 e0             	lea    edx,[ebp-0x20]
  512035:	52                   	push   edx
  512036:	6a 04                	push   0x4
  512038:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  51203e:	8d 45 b4             	lea    eax,[ebp-0x4c]
  512041:	50                   	push   eax
  512042:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  512045:	51                   	push   ecx
  512046:	6a 02                	push   0x2
  512048:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  51204e:	83 c4 20             	add    esp,0x20
  512051:	d9 03                	fld    DWORD PTR [ebx]
  512053:	d9 06                	fld    DWORD PTR [esi]
  512055:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51205c:	75 08                	jne    0x512066
  51205e:	dc 35 78 30 40 00    	fdiv   QWORD PTR ds:0x403078
  512064:	eb 11                	jmp    0x512077
  512066:	ff 35 7c 30 40 00    	push   DWORD PTR ds:0x40307c
  51206c:	ff 35 78 30 40 00    	push   DWORD PTR ds:0x403078
  512072:	e8 bd 26 ef ff       	call   0x404734
  512077:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
  51207a:	d8 0a                	fmul   DWORD PTR [edx]
  51207c:	de e9                	fsubp  st(1),st
  51207e:	df e0                	fnstsw ax
  512080:	a8 0d                	test   al,0xd
  512082:	0f 85 f4 01 00 00    	jne    0x51227c
  512088:	d9 9d 50 ff ff ff    	fstp   DWORD PTR [ebp-0xb0]
  51208e:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [ebp-0xb0]
  512094:	89 03                	mov    DWORD PTR [ebx],eax
  512096:	68 cc cc f4 3f       	push   0x3ff4cccc
  51209b:	68 cd cc cc cc       	push   0xcccccccd
  5120a0:	8b 75 28             	mov    esi,DWORD PTR [ebp+0x28]
  5120a3:	d9 06                	fld    DWORD PTR [esi]
  5120a5:	d8 a5 50 ff ff ff    	fsub   DWORD PTR [ebp-0xb0]
  5120ab:	8b 7d 24             	mov    edi,DWORD PTR [ebp+0x24]
  5120ae:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5120b5:	75 04                	jne    0x5120bb
  5120b7:	d8 3f                	fdivr  DWORD PTR [edi]
  5120b9:	eb 07                	jmp    0x5120c2
  5120bb:	ff 37                	push   DWORD PTR [edi]
  5120bd:	e8 84 26 ef ff       	call   0x404746
  5120c2:	df e0                	fnstsw ax
  5120c4:	a8 0d                	test   al,0xd
  5120c6:	0f 85 b0 01 00 00    	jne    0x51227c
  5120cc:	83 ec 08             	sub    esp,0x8
  5120cf:	dd 1c 24             	fstp   QWORD PTR [esp]
  5120d2:	ff 15 f4 11 40 00    	call   DWORD PTR ds:0x4011f4
  5120d8:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
  5120db:	d8 09                	fmul   DWORD PTR [ecx]
  5120dd:	d9 19                	fstp   DWORD PTR [ecx]
  5120df:	df e0                	fnstsw ax
  5120e1:	a8 0d                	test   al,0xd
  5120e3:	0f 85 93 01 00 00    	jne    0x51227c
  5120e9:	d9 06                	fld    DWORD PTR [esi]
  5120eb:	d8 23                	fsub   DWORD PTR [ebx]
  5120ed:	d9 1f                	fstp   DWORD PTR [edi]
  5120ef:	df e0                	fnstsw ax
  5120f1:	a8 0d                	test   al,0xd
  5120f3:	0f 85 83 01 00 00    	jne    0x51227c
  5120f9:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  5120ff:	50                   	push   eax
  512100:	8d 4d e0             	lea    ecx,[ebp-0x20]
  512103:	51                   	push   ecx
  512104:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  51210a:	8b f0                	mov    esi,eax
  51210c:	8b 16                	mov    edx,DWORD PTR [esi]
  51210e:	8d                   	.byte 0x8d
  51210f:	45                   	inc    ebp
