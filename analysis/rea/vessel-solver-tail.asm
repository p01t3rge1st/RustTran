
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

00501640 <.text+0x100640>:
  501640:	0d 0f 85 07 08       	or     eax,0x807850f
  501645:	00 00                	add    BYTE PTR [eax],al
  501647:	bb 49 00 00 00       	mov    ebx,0x49
  50164c:	c7 45 fc 22 00 00 00 	mov    DWORD PTR [ebp-0x4],0x22
  501653:	d9 85 7c ff ff ff    	fld    DWORD PTR [ebp-0x84]
  501659:	d8 45 84             	fadd   DWORD PTR [ebp-0x7c]
  50165c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501663:	75 08                	jne    0x50166d
  501665:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50166b:	eb 0b                	jmp    0x501678
  50166d:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  501673:	e8 b0 30 f0 ff       	call   0x404728
  501678:	d9 9d 70 ff ff ff    	fstp   DWORD PTR [ebp-0x90]
  50167e:	df e0                	fnstsw ax
  501680:	a8 0d                	test   al,0xd
  501682:	0f 85 c6 07 00 00    	jne    0x501e4e
  501688:	c7 45 fc 23 00 00 00 	mov    DWORD PTR [ebp-0x4],0x23
  50168f:	8d 85 70 ff ff ff    	lea    eax,[ebp-0x90]
  501695:	50                   	push   eax
  501696:	e8 45 a7 f9 ff       	call   0x49bde0
  50169b:	d9 5d 90             	fstp   DWORD PTR [ebp-0x70]
  50169e:	c7 45 fc 24 00 00 00 	mov    DWORD PTR [ebp-0x4],0x24
  5016a5:	8d 4d 90             	lea    ecx,[ebp-0x70]
  5016a8:	51                   	push   ecx
  5016a9:	e8 62 97 f9 ff       	call   0x49ae10
  5016ae:	d9 5d ac             	fstp   DWORD PTR [ebp-0x54]
  5016b1:	c7 45 fc 25 00 00 00 	mov    DWORD PTR [ebp-0x4],0x25
  5016b8:	8d 55 90             	lea    edx,[ebp-0x70]
  5016bb:	52                   	push   edx
  5016bc:	e8 af 94 f9 ff       	call   0x49ab70
  5016c1:	d9 9d 3c ff ff ff    	fstp   DWORD PTR [ebp-0xc4]
  5016c7:	c7 45 fc 26 00 00 00 	mov    DWORD PTR [ebp-0x4],0x26
  5016ce:	8d 45 90             	lea    eax,[ebp-0x70]
  5016d1:	50                   	push   eax
  5016d2:	e8 b9 aa f9 ff       	call   0x49c190
  5016d7:	d9 5d bc             	fstp   DWORD PTR [ebp-0x44]
  5016da:	c7 45 fc 27 00 00 00 	mov    DWORD PTR [ebp-0x4],0x27
  5016e1:	8d 4d 90             	lea    ecx,[ebp-0x70]
  5016e4:	51                   	push   ecx
  5016e5:	e8 16 a8 f9 ff       	call   0x49bf00
  5016ea:	d9 9d 68 ff ff ff    	fstp   DWORD PTR [ebp-0x98]
  5016f0:	c7 45 fc 28 00 00 00 	mov    DWORD PTR [ebp-0x4],0x28
  5016f7:	d9 85 58 ff ff ff    	fld    DWORD PTR [ebp-0xa8]
  5016fd:	d8 a5 68 ff ff ff    	fsub   DWORD PTR [ebp-0x98]
  501703:	d9 45 bc             	fld    DWORD PTR [ebp-0x44]
  501706:	d8 a5 68 ff ff ff    	fsub   DWORD PTR [ebp-0x98]
  50170c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501713:	75 04                	jne    0x501719
  501715:	de f9                	fdivp  st(1),st
  501717:	eb 09                	jmp    0x501722
  501719:	50                   	push   eax
  50171a:	b0 0d                	mov    al,0xd
  50171c:	e8 19 30 f0 ff       	call   0x40473a
  501721:	58                   	pop    eax
  501722:	d9 5d d8             	fstp   DWORD PTR [ebp-0x28]
  501725:	df e0                	fnstsw ax
  501727:	a8 0d                	test   al,0xd
  501729:	0f 85 1f 07 00 00    	jne    0x501e4e
  50172f:	c7 45 fc 29 00 00 00 	mov    DWORD PTR [ebp-0x4],0x29
  501736:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50173c:	d8 65 d8             	fsub   DWORD PTR [ebp-0x28]
  50173f:	d8 8d 3c ff ff ff    	fmul   DWORD PTR [ebp-0xc4]
  501745:	d9 45 ac             	fld    DWORD PTR [ebp-0x54]
  501748:	d8 4d d8             	fmul   DWORD PTR [ebp-0x28]
  50174b:	de c1                	faddp  st(1),st
  50174d:	d9 9d 40 ff ff ff    	fstp   DWORD PTR [ebp-0xc0]
  501753:	df e0                	fnstsw ax
  501755:	a8 0d                	test   al,0xd
  501757:	0f 85 f1 06 00 00    	jne    0x501e4e
  50175d:	c7 45 fc 2a 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2a
  501764:	d9 45 80             	fld    DWORD PTR [ebp-0x80]
  501767:	d8 4d 94             	fmul   DWORD PTR [ebp-0x6c]
  50176a:	d9 85 70 ff ff ff    	fld    DWORD PTR [ebp-0x90]
  501770:	d8 05 10 c0 54 00    	fadd   DWORD PTR ds:0x54c010
  501776:	de c9                	fmulp  st(1),st
  501778:	d9 85 40 ff ff ff    	fld    DWORD PTR [ebp-0xc0]
  50177e:	d8 8d 6c ff ff ff    	fmul   DWORD PTR [ebp-0x94]
  501784:	de c1                	faddp  st(1),st
  501786:	d9 45 90             	fld    DWORD PTR [ebp-0x70]
  501789:	d8 0d 34 b3 54 00    	fmul   DWORD PTR ds:0x54b334
  50178f:	d8 0e                	fmul   DWORD PTR [esi]
  501791:	de e9                	fsubp  st(1),st
  501793:	d9 5d cc             	fstp   DWORD PTR [ebp-0x34]
  501796:	df e0                	fnstsw ax
  501798:	a8 0d                	test   al,0xd
  50179a:	0f 85 ae 06 00 00    	jne    0x501e4e
  5017a0:	c7 45 fc 2b 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2b
  5017a7:	d9 45 cc             	fld    DWORD PTR [ebp-0x34]
  5017aa:	d8 65 c0             	fsub   DWORD PTR [ebp-0x40]
  5017ad:	d9 5d a0             	fstp   DWORD PTR [ebp-0x60]
  5017b0:	df e0                	fnstsw ax
  5017b2:	a8 0d                	test   al,0xd
  5017b4:	0f 85 94 06 00 00    	jne    0x501e4e
  5017ba:	c7 45 fc 2c 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2c
  5017c1:	d9 45 b0             	fld    DWORD PTR [ebp-0x50]
  5017c4:	d9 e1                	fabs
  5017c6:	df e0                	fnstsw ax
  5017c8:	a8 0d                	test   al,0xd
  5017ca:	0f 85 7e 06 00 00    	jne    0x501e4e
  5017d0:	d9 9d e8 fe ff ff    	fstp   DWORD PTR [ebp-0x118]
  5017d6:	d9 85 e8 fe ff ff    	fld    DWORD PTR [ebp-0x118]
  5017dc:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  5017e2:	d9 9d e4 fe ff ff    	fstp   DWORD PTR [ebp-0x11c]
  5017e8:	d9 45 c0             	fld    DWORD PTR [ebp-0x40]
  5017eb:	dc 0d 38 32 40 00    	fmul   QWORD PTR ds:0x403238
  5017f1:	df e0                	fnstsw ax
  5017f3:	a8 0d                	test   al,0xd
  5017f5:	0f 85 53 06 00 00    	jne    0x501e4e
  5017fb:	d9 9d e0 fe ff ff    	fstp   DWORD PTR [ebp-0x120]
  501801:	d9 85 e0 fe ff ff    	fld    DWORD PTR [ebp-0x120]
  501807:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50180d:	d8 9d e4 fe ff ff    	fcomp  DWORD PTR [ebp-0x11c]
  501813:	df e0                	fnstsw ax
  501815:	f6 c4 41             	test   ah,0x41
  501818:	0f 84 62 03 00 00    	je     0x501b80
  50181e:	c7 45 fc 32 00 00 00 	mov    DWORD PTR [ebp-0x4],0x32
  501825:	d9 45 a0             	fld    DWORD PTR [ebp-0x60]
  501828:	d9 e1                	fabs
  50182a:	df e0                	fnstsw ax
  50182c:	a8 0d                	test   al,0xd
  50182e:	0f 85 1a 06 00 00    	jne    0x501e4e
  501834:	d9 9d dc fe ff ff    	fstp   DWORD PTR [ebp-0x124]
  50183a:	d9 85 dc fe ff ff    	fld    DWORD PTR [ebp-0x124]
  501840:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  501846:	d9 9d d8 fe ff ff    	fstp   DWORD PTR [ebp-0x128]
  50184c:	d9 45 c0             	fld    DWORD PTR [ebp-0x40]
  50184f:	dc 0d 38 32 40 00    	fmul   QWORD PTR ds:0x403238
  501855:	df e0                	fnstsw ax
  501857:	a8 0d                	test   al,0xd
  501859:	0f 85 ef 05 00 00    	jne    0x501e4e
  50185f:	d9 9d d4 fe ff ff    	fstp   DWORD PTR [ebp-0x12c]
  501865:	d9 85 d4 fe ff ff    	fld    DWORD PTR [ebp-0x12c]
  50186b:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  501871:	d8 9d d8 fe ff ff    	fcomp  DWORD PTR [ebp-0x128]
  501877:	df e0                	fnstsw ax
  501879:	f6 c4 41             	test   ah,0x41
  50187c:	74 05                	je     0x501883
  50187e:	bf 01 00 00 00       	mov    edi,0x1
  501883:	d9 45 84             	fld    DWORD PTR [ebp-0x7c]
  501886:	d8 a5 7c ff ff ff    	fsub   DWORD PTR [ebp-0x84]
  50188c:	df e0                	fnstsw ax
  50188e:	a8 0d                	test   al,0xd
  501890:	0f 85 b8 05 00 00    	jne    0x501e4e
  501896:	d9 e1                	fabs
  501898:	df e0                	fnstsw ax
  50189a:	a8 0d                	test   al,0xd
  50189c:	0f 85 ac 05 00 00    	jne    0x501e4e
  5018a2:	d9 9d d0 fe ff ff    	fstp   DWORD PTR [ebp-0x130]
  5018a8:	d9 85 d0 fe ff ff    	fld    DWORD PTR [ebp-0x130]
  5018ae:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  5018b4:	d9 9d cc fe ff ff    	fstp   DWORD PTR [ebp-0x134]
  5018ba:	d9 05 30 32 40 00    	fld    DWORD PTR ds:0x403230
  5018c0:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  5018c6:	d8 9d cc fe ff ff    	fcomp  DWORD PTR [ebp-0x134]
  5018cc:	df e0                	fnstsw ax
  5018ce:	f6 c4 41             	test   ah,0x41
  5018d1:	74 07                	je     0x5018da
  5018d3:	b8 01 00 00 00       	mov    eax,0x1
  5018d8:	eb 02                	jmp    0x5018dc
  5018da:	33 c0                	xor    eax,eax
  5018dc:	85 f8                	test   eax,edi
  5018de:	0f 84 e3 02 00 00    	je     0x501bc7
  5018e4:	c7 45 fc 33 00 00 00 	mov    DWORD PTR [ebp-0x4],0x33
  5018eb:	d9 45 a0             	fld    DWORD PTR [ebp-0x60]
  5018ee:	d8 4d b0             	fmul   DWORD PTR [ebp-0x50]
  5018f1:	df e0                	fnstsw ax
  5018f3:	a8 0d                	test   al,0xd
  5018f5:	0f 85 53 05 00 00    	jne    0x501e4e
  5018fb:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  501901:	d9 9d c8 fe ff ff    	fstp   DWORD PTR [ebp-0x138]
  501907:	d9 05 f4 13 40 00    	fld    DWORD PTR ds:0x4013f4
  50190d:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  501913:	d8 9d c8 fe ff ff    	fcomp  DWORD PTR [ebp-0x138]
  501919:	df e0                	fnstsw ax
  50191b:	f6 c4 41             	test   ah,0x41
  50191e:	75 27                	jne    0x501947
  501920:	c7 45 fc 34 00 00 00 	mov    DWORD PTR [ebp-0x4],0x34
  501927:	8b 95 70 ff ff ff    	mov    edx,DWORD PTR [ebp-0x90]
  50192d:	89 95 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],edx
  501933:	c7 45 fc 35 00 00 00 	mov    DWORD PTR [ebp-0x4],0x35
  50193a:	8b 45 a0             	mov    eax,DWORD PTR [ebp-0x60]
  50193d:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  501940:	33 ff                	xor    edi,edi
  501942:	e9 05 fd ff ff       	jmp    0x50164c
  501947:	c7 45 fc 36 00 00 00 	mov    DWORD PTR [ebp-0x4],0x36
  50194e:	d9 45 a0             	fld    DWORD PTR [ebp-0x60]
  501951:	d8 4d a8             	fmul   DWORD PTR [ebp-0x58]
  501954:	df e0                	fnstsw ax
  501956:	a8 0d                	test   al,0xd
  501958:	0f 85 f0 04 00 00    	jne    0x501e4e
  50195e:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  501964:	d9 9d c4 fe ff ff    	fstp   DWORD PTR [ebp-0x13c]
  50196a:	d9 05 f4 13 40 00    	fld    DWORD PTR ds:0x4013f4
  501970:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  501976:	d8 9d c4 fe ff ff    	fcomp  DWORD PTR [ebp-0x13c]
  50197c:	df e0                	fnstsw ax
  50197e:	f6 c4 41             	test   ah,0x41
  501981:	75 4b                	jne    0x5019ce
  501983:	c7 45 fc 37 00 00 00 	mov    DWORD PTR [ebp-0x4],0x37
  50198a:	8b 8d 70 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x90]
  501990:	89 4d 84             	mov    DWORD PTR [ebp-0x7c],ecx
  501993:	c7 45 fc 38 00 00 00 	mov    DWORD PTR [ebp-0x4],0x38
  50199a:	8b 55 a0             	mov    edx,DWORD PTR [ebp-0x60]
  50199d:	89 55 b0             	mov    DWORD PTR [ebp-0x50],edx
  5019a0:	c7 45 fc 39 00 00 00 	mov    DWORD PTR [ebp-0x4],0x39
  5019a7:	8b 45 90             	mov    eax,DWORD PTR [ebp-0x70]
  5019aa:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
  5019ad:	c7 45 fc 3a 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3a
  5019b4:	c7 45 fc 3b 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3b
  5019bb:	8b 8d 68 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x98]
  5019c1:	89 8d 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],ecx
  5019c7:	33 ff                	xor    edi,edi
  5019c9:	e9 7e fc ff ff       	jmp    0x50164c
  5019ce:	c7 45 fc 3c 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3c
  5019d5:	8b 55 84             	mov    edx,DWORD PTR [ebp-0x7c]
  5019d8:	89 95 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],edx
  5019de:	c7 45 fc 3d 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3d
  5019e5:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
  5019e8:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  5019eb:	c7 45 fc 3e 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3e
  5019f2:	d9 45 84             	fld    DWORD PTR [ebp-0x7c]
  5019f5:	d8 25 80 14 40 00    	fsub   DWORD PTR ds:0x401480
  5019fb:	df e0                	fnstsw ax
  5019fd:	a8 0d                	test   al,0xd
  5019ff:	0f 85 49 04 00 00    	jne    0x501e4e
  501a05:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  501a0b:	8b 4d 30             	mov    ecx,DWORD PTR [ebp+0x30]
  501a0e:	d8 19                	fcomp  DWORD PTR [ecx]
  501a10:	df e0                	fnstsw ax
  501a12:	f6 c4 41             	test   ah,0x41
  501a15:	75 1f                	jne    0x501a36
  501a17:	c7 45 fc 3f 00 00 00 	mov    DWORD PTR [ebp-0x4],0x3f
  501a1e:	d9 45 84             	fld    DWORD PTR [ebp-0x7c]
  501a21:	d8 25 80 14 40 00    	fsub   DWORD PTR ds:0x401480
  501a27:	d9 5d 84             	fstp   DWORD PTR [ebp-0x7c]
  501a2a:	df e0                	fnstsw ax
  501a2c:	a8 0d                	test   al,0xd
  501a2e:	0f 85 1a 04 00 00    	jne    0x501e4e
  501a34:	eb 0c                	jmp    0x501a42
  501a36:	c7 45 fc 40 00 00 00 	mov    DWORD PTR [ebp-0x4],0x40
  501a3d:	8b 09                	mov    ecx,DWORD PTR [ecx]
  501a3f:	89 4d 84             	mov    DWORD PTR [ebp-0x7c],ecx
  501a42:	c7 45 fc 41 00 00 00 	mov    DWORD PTR [ebp-0x4],0x41
  501a49:	8d 55 84             	lea    edx,[ebp-0x7c]
  501a4c:	52                   	push   edx
  501a4d:	e8 8e a3 f9 ff       	call   0x49bde0
  501a52:	d9 5d a4             	fstp   DWORD PTR [ebp-0x5c]
  501a55:	c7 45 fc 42 00 00 00 	mov    DWORD PTR [ebp-0x4],0x42
  501a5c:	8d 45 a4             	lea    eax,[ebp-0x5c]
  501a5f:	50                   	push   eax
  501a60:	e8 ab 93 f9 ff       	call   0x49ae10
  501a65:	d9 5d b8             	fstp   DWORD PTR [ebp-0x48]
  501a68:	c7 45 fc 43 00 00 00 	mov    DWORD PTR [ebp-0x4],0x43
  501a6f:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  501a72:	51                   	push   ecx
  501a73:	e8 f8 90 f9 ff       	call   0x49ab70
  501a78:	d9 9d 60 ff ff ff    	fstp   DWORD PTR [ebp-0xa0]
  501a7e:	c7 45 fc 44 00 00 00 	mov    DWORD PTR [ebp-0x4],0x44
  501a85:	8d 55 a4             	lea    edx,[ebp-0x5c]
  501a88:	52                   	push   edx
  501a89:	e8 02 a7 f9 ff       	call   0x49c190
  501a8e:	d9 5d d4             	fstp   DWORD PTR [ebp-0x2c]
  501a91:	c7 45 fc 45 00 00 00 	mov    DWORD PTR [ebp-0x4],0x45
  501a98:	8d 45 a4             	lea    eax,[ebp-0x5c]
  501a9b:	50                   	push   eax
  501a9c:	e8 5f a4 f9 ff       	call   0x49bf00
  501aa1:	d9 9d 78 ff ff ff    	fstp   DWORD PTR [ebp-0x88]
  501aa7:	c7 45 fc 46 00 00 00 	mov    DWORD PTR [ebp-0x4],0x46
  501aae:	d9 85 58 ff ff ff    	fld    DWORD PTR [ebp-0xa8]
  501ab4:	d8 a5 78 ff ff ff    	fsub   DWORD PTR [ebp-0x88]
  501aba:	d9 45 d4             	fld    DWORD PTR [ebp-0x2c]
  501abd:	d8 a5 78 ff ff ff    	fsub   DWORD PTR [ebp-0x88]
  501ac3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501aca:	75 04                	jne    0x501ad0
  501acc:	de f9                	fdivp  st(1),st
  501ace:	eb 09                	jmp    0x501ad9
  501ad0:	50                   	push   eax
  501ad1:	b0 0d                	mov    al,0xd
  501ad3:	e8 62 2c f0 ff       	call   0x40473a
  501ad8:	58                   	pop    eax
  501ad9:	d9 9d 4c ff ff ff    	fstp   DWORD PTR [ebp-0xb4]
  501adf:	df e0                	fnstsw ax
  501ae1:	a8 0d                	test   al,0xd
  501ae3:	0f 85 65 03 00 00    	jne    0x501e4e
  501ae9:	c7 45 fc 47 00 00 00 	mov    DWORD PTR [ebp-0x4],0x47
  501af0:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  501af6:	d8 a5 4c ff ff ff    	fsub   DWORD PTR [ebp-0xb4]
  501afc:	d8 8d 60 ff ff ff    	fmul   DWORD PTR [ebp-0xa0]
  501b02:	d9 85 4c ff ff ff    	fld    DWORD PTR [ebp-0xb4]
  501b08:	d8 4d b8             	fmul   DWORD PTR [ebp-0x48]
  501b0b:	de c1                	faddp  st(1),st
  501b0d:	d9 9d 64 ff ff ff    	fstp   DWORD PTR [ebp-0x9c]
  501b13:	df e0                	fnstsw ax
  501b15:	a8 0d                	test   al,0xd
  501b17:	0f 85 31 03 00 00    	jne    0x501e4e
  501b1d:	c7 45 fc 48 00 00 00 	mov    DWORD PTR [ebp-0x4],0x48
  501b24:	d9 45 80             	fld    DWORD PTR [ebp-0x80]
  501b27:	d8 4d 94             	fmul   DWORD PTR [ebp-0x6c]
  501b2a:	d9 45 84             	fld    DWORD PTR [ebp-0x7c]
  501b2d:	d8 05 10 c0 54 00    	fadd   DWORD PTR ds:0x54c010
  501b33:	de c9                	fmulp  st(1),st
  501b35:	d9 85 64 ff ff ff    	fld    DWORD PTR [ebp-0x9c]
  501b3b:	d8 8d 6c ff ff ff    	fmul   DWORD PTR [ebp-0x94]
  501b41:	de c1                	faddp  st(1),st
  501b43:	d9 45 a4             	fld    DWORD PTR [ebp-0x5c]
  501b46:	d8 0d 34 b3 54 00    	fmul   DWORD PTR ds:0x54b334
  501b4c:	d8 0e                	fmul   DWORD PTR [esi]
  501b4e:	de e9                	fsubp  st(1),st
  501b50:	d9 9d 48 ff ff ff    	fstp   DWORD PTR [ebp-0xb8]
  501b56:	df e0                	fnstsw ax
  501b58:	a8 0d                	test   al,0xd
  501b5a:	0f 85 ee 02 00 00    	jne    0x501e4e
  501b60:	89 5d fc             	mov    DWORD PTR [ebp-0x4],ebx
  501b63:	d9 85 48 ff ff ff    	fld    DWORD PTR [ebp-0xb8]
  501b69:	d8 65 c0             	fsub   DWORD PTR [ebp-0x40]
  501b6c:	d9 5d b0             	fstp   DWORD PTR [ebp-0x50]
  501b6f:	df e0                	fnstsw ax
  501b71:	a8 0d                	test   al,0xd
  501b73:	0f 85 d5 02 00 00    	jne    0x501e4e
  501b79:	33 ff                	xor    edi,edi
  501b7b:	e9 cc fa ff ff       	jmp    0x50164c
  501b80:	c7 45 fc 2d 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2d
  501b87:	8b 4d 84             	mov    ecx,DWORD PTR [ebp-0x7c]
  501b8a:	89 8d 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],ecx
  501b90:	c7 45 fc 2e 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2e
  501b97:	8b 95 4c ff ff ff    	mov    edx,DWORD PTR [ebp-0xb4]
  501b9d:	89 55 d8             	mov    DWORD PTR [ebp-0x28],edx
  501ba0:	c7 45 fc 2f 00 00 00 	mov    DWORD PTR [ebp-0x4],0x2f
  501ba7:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  501baa:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
  501bad:	c7 45 fc 30 00 00 00 	mov    DWORD PTR [ebp-0x4],0x30
  501bb4:	8b 8d 78 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x88]
  501bba:	89 8d 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],ecx
  501bc0:	c7 45 fc 31 00 00 00 	mov    DWORD PTR [ebp-0x4],0x31
  501bc7:	c7 45 fc 4a 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4a
  501bce:	d9 85 70 ff ff ff    	fld    DWORD PTR [ebp-0x90]
  501bd4:	d8 05 10 c0 54 00    	fadd   DWORD PTR ds:0x54c010
  501bda:	d9 45 94             	fld    DWORD PTR [ebp-0x6c]
  501bdd:	d8 4d d0             	fmul   DWORD PTR [ebp-0x30]
  501be0:	de c9                	fmulp  st(1),st
  501be2:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501be9:	75 04                	jne    0x501bef
  501beb:	d8 36                	fdiv   DWORD PTR [esi]
  501bed:	eb 07                	jmp    0x501bf6
  501bef:	ff 36                	push   DWORD PTR [esi]
  501bf1:	e8 32 2b f0 ff       	call   0x404728
  501bf6:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501bfd:	75 08                	jne    0x501c07
  501bff:	d8 35 44 32 40 00    	fdiv   DWORD PTR ds:0x403244
  501c05:	eb 0b                	jmp    0x501c12
  501c07:	ff 35 44 32 40 00    	push   DWORD PTR ds:0x403244
  501c0d:	e8 16 2b f0 ff       	call   0x404728
  501c12:	df e0                	fnstsw ax
  501c14:	a8 0d                	test   al,0xd
  501c16:	0f 85 32 02 00 00    	jne    0x501e4e
  501c1c:	d9 9d c0 fe ff ff    	fstp   DWORD PTR [ebp-0x140]
  501c22:	8b 95 c0 fe ff ff    	mov    edx,DWORD PTR [ebp-0x140]
  501c28:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  501c2b:	89 10                	mov    DWORD PTR [eax],edx
  501c2d:	c7 45 fc 4b 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4b
  501c34:	d9 85 c0 fe ff ff    	fld    DWORD PTR [ebp-0x140]
  501c3a:	d8 45 90             	fadd   DWORD PTR [ebp-0x70]
  501c3d:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  501c40:	d9 19                	fstp   DWORD PTR [ecx]
  501c42:	df e0                	fnstsw ax
  501c44:	a8 0d                	test   al,0xd
  501c46:	0f 85 02 02 00 00    	jne    0x501e4e
  501c4c:	c7 45 fc 4c 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4c
  501c53:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
  501c56:	8b 85 70 ff ff ff    	mov    eax,DWORD PTR [ebp-0x90]
  501c5c:	89 02                	mov    DWORD PTR [edx],eax
  501c5e:	c7 45 fc 4d 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4d
  501c65:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  501c6b:	d8 65 d8             	fsub   DWORD PTR [ebp-0x28]
  501c6e:	d8 8d 6c ff ff ff    	fmul   DWORD PTR [ebp-0x94]
  501c74:	d8 8d 68 ff ff ff    	fmul   DWORD PTR [ebp-0x98]
  501c7a:	8b 4d 2c             	mov    ecx,DWORD PTR [ebp+0x2c]
  501c7d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  501c84:	75 04                	jne    0x501c8a
  501c86:	d8 31                	fdiv   DWORD PTR [ecx]
  501c88:	eb 07                	jmp    0x501c91
  501c8a:	ff 31                	push   DWORD PTR [ecx]
  501c8c:	e8 97 2a f0 ff       	call   0x404728
  501c91:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  501c94:	d9 1a                	fstp   DWORD PTR [edx]
  501c96:	df e0                	fnstsw ax
  501c98:	a8 0d                	test   al,0xd
  501c9a:	0f 85 ae 01 00 00    	jne    0x501e4e
  501ca0:	c7 45 fc 4e 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4e
  501ca7:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  501cad:	50                   	push   eax
  501cae:	8d 85 34 ff ff ff    	lea    eax,[ebp-0xcc]
  501cb4:	50                   	push   eax
  501cb5:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  501cbb:	8b f0                	mov    esi,eax
  501cbd:	8b 0e                	mov    ecx,DWORD PTR [esi]
  501cbf:	8d 95 0c ff ff ff    	lea    edx,[ebp-0xf4]
  501cc5:	52                   	push   edx
  501cc6:	56                   	push   esi
  501cc7:	ff 51 1c             	call   DWORD PTR [ecx+0x1c]
  501cca:	db e2                	fnclex
  501ccc:	85 c0                	test   eax,eax
  501cce:	7d 0f                	jge    0x501cdf
  501cd0:	6a 1c                	push   0x1c
  501cd2:	68 d0 b0 41 00       	push   0x41b0d0
  501cd7:	56                   	push   esi
  501cd8:	50                   	push   eax
  501cd9:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  501cdf:	33 c0                	xor    eax,eax
  501ce1:	8b 95 0c ff ff ff    	mov    edx,DWORD PTR [ebp-0xf4]
  501ce7:	85 d2                	test   edx,edx
  501ce9:	0f 9f c0             	setg   al
  501cec:	f7 d8                	neg    eax
  501cee:	8b f0                	mov    esi,eax
  501cf0:	8d 8d 34 ff ff ff    	lea    ecx,[ebp-0xcc]
  501cf6:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  501cfc:	66 85 f6             	test   si,si
  501cff:	0f 84 0b 01 00 00    	je     0x501e10
  501d05:	c7 45 fc 4f 00 00 00 	mov    DWORD PTR [ebp-0x4],0x4f
  501d0c:	ba b0 3e 42 00       	mov    edx,0x423eb0
  501d11:	b9 48 b6 54 00       	mov    ecx,0x54b648
  501d16:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  501d1c:	c7 45 fc 50 00 00 00 	mov    DWORD PTR [ebp-0x4],0x50
  501d23:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  501d28:	85 c0                	test   eax,eax
  501d2a:	75 10                	jne    0x501d3c
  501d2c:	68 10 b0 54 00       	push   0x54b010
  501d31:	68 8c 7e 40 00       	push   0x407e8c
  501d36:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  501d3c:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  501d42:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  501d47:	89 85 1c ff ff ff    	mov    DWORD PTR [ebp-0xe4],eax
  501d4d:	b9 09 00 00 00       	mov    ecx,0x9
  501d52:	89 8d 14 ff ff ff    	mov    DWORD PTR [ebp-0xec],ecx
  501d58:	ba 01 00 00 00       	mov    edx,0x1
  501d5d:	89 95 2c ff ff ff    	mov    DWORD PTR [ebp-0xd4],edx
  501d63:	c7 85 24 ff ff ff 03 	mov    DWORD PTR [ebp-0xdc],0x3
  501d6a:	00 00 00 
  501d6d:	8b 3e                	mov    edi,DWORD PTR [esi]
  501d6f:	83 ec 10             	sub    esp,0x10
  501d72:	8b dc                	mov    ebx,esp
  501d74:	89 0b                	mov    DWORD PTR [ebx],ecx
  501d76:	8b 8d 18 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xe8]
  501d7c:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  501d7f:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  501d82:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [ebp-0xe0]
  501d88:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  501d8b:	83 ec 10             	sub    esp,0x10
  501d8e:	8b cc                	mov    ecx,esp
  501d90:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [ebp-0xdc]
  501d96:	89 01                	mov    DWORD PTR [ecx],eax
  501d98:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [ebp-0xd8]
  501d9e:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  501da1:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  501da4:	8b 95 30 ff ff ff    	mov    edx,DWORD PTR [ebp-0xd0]
  501daa:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  501dad:	56                   	push   esi
  501dae:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  501db4:	db e2                	fnclex
  501db6:	85 c0                	test   eax,eax
  501db8:	7d 12                	jge    0x501dcc
  501dba:	68 b0 02 00 00       	push   0x2b0
  501dbf:	68 d8 ae 41 00       	push   0x41aed8
  501dc4:	56                   	push   esi
  501dc5:	50                   	push   eax
  501dc6:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  501dcc:	c7                   	.byte 0xc7
  501dcd:	45                   	inc    ebp
  501dce:	fc                   	cld
  501dcf:	51                   	push   ecx
