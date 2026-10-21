
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

005090ba <.text+0x1080ba>:
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
