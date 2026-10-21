
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0050b60f <.text+0x10a60f>:
  50b60f:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50b615:	d8 1d f8 13 40 00    	fcomp  DWORD PTR ds:0x4013f8
  50b61b:	df e0                	fnstsw ax
  50b61d:	f6 c4 41             	test   ah,0x41
  50b620:	0f 85 d1 01 00 00    	jne    0x50b7f7
  50b626:	d9 05 9c b1 54 00    	fld    DWORD PTR ds:0x54b19c
  50b62c:	dc 0d c8 30 40 00    	fmul   QWORD PTR ds:0x4030c8
  50b632:	d8 05 a4 b4 54 00    	fadd   DWORD PTR ds:0x54b4a4
  50b638:	d9 1d a4 b4 54 00    	fstp   DWORD PTR ds:0x54b4a4
  50b63e:	df e0                	fnstsw ax
  50b640:	a8 0d                	test   al,0xd
  50b642:	0f 85 ed 23 00 00    	jne    0x50da35
  50b648:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50b64e:	d9 05 9c b1 54 00    	fld    DWORD PTR ds:0x54b19c
  50b654:	dc 0d c8 30 40 00    	fmul   QWORD PTR ds:0x4030c8
  50b65a:	de e9                	fsubp  st(1),st
  50b65c:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b663:	75 08                	jne    0x50b66d
  50b665:	d8 35 a4 b4 54 00    	fdiv   DWORD PTR ds:0x54b4a4
  50b66b:	eb 0b                	jmp    0x50b678
  50b66d:	ff 35 a4 b4 54 00    	push   DWORD PTR ds:0x54b4a4
  50b673:	e8 b0 90 ef ff       	call   0x404728
  50b678:	d9 1d ec b7 54 00    	fstp   DWORD PTR ds:0x54b7ec
  50b67e:	df e0                	fnstsw ax
  50b680:	a8 0d                	test   al,0xd
  50b682:	0f 85 ad 23 00 00    	jne    0x50da35
  50b688:	d9 05 a0 b1 54 00    	fld    DWORD PTR ds:0x54b1a0
  50b68e:	d8 05 9c b1 54 00    	fadd   DWORD PTR ds:0x54b19c
  50b694:	d8 25 a4 b4 54 00    	fsub   DWORD PTR ds:0x54b4a4
  50b69a:	d9 1d a8 b4 54 00    	fstp   DWORD PTR ds:0x54b4a8
  50b6a0:	df e0                	fnstsw ax
  50b6a2:	a8 0d                	test   al,0xd
  50b6a4:	0f 85 8b 23 00 00    	jne    0x50da35
  50b6aa:	d9 05 9c b1 54 00    	fld    DWORD PTR ds:0x54b19c
  50b6b0:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b6b7:	75 08                	jne    0x50b6c1
  50b6b9:	d8 35 54 b6 54 00    	fdiv   DWORD PTR ds:0x54b654
  50b6bf:	eb 0b                	jmp    0x50b6cc
  50b6c1:	ff 35 54 b6 54 00    	push   DWORD PTR ds:0x54b654
  50b6c7:	e8 5c 90 ef ff       	call   0x404728
  50b6cc:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b6d3:	75 08                	jne    0x50b6dd
  50b6d5:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  50b6db:	eb 0b                	jmp    0x50b6e8
  50b6dd:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  50b6e3:	e8 40 90 ef ff       	call   0x404728
  50b6e8:	d8 2d 38 bb 54 00    	fsubr  DWORD PTR ds:0x54bb38
  50b6ee:	d9 1d 38 bb 54 00    	fstp   DWORD PTR ds:0x54bb38
  50b6f4:	df e0                	fnstsw ax
  50b6f6:	a8 0d                	test   al,0xd
  50b6f8:	0f 85 37 23 00 00    	jne    0x50da35
  50b6fe:	66 8b d6             	mov    dx,si
  50b701:	66 89 15 d6 b4 54 00 	mov    WORD PTR ds:0x54b4d6,dx
  50b708:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b70e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b715:	75 08                	jne    0x50b71f
  50b717:	d8 35 50 b6 54 00    	fdiv   DWORD PTR ds:0x54b650
  50b71d:	eb 0b                	jmp    0x50b72a
  50b71f:	ff 35 50 b6 54 00    	push   DWORD PTR ds:0x54b650
  50b725:	e8 fe 8f ef ff       	call   0x404728
  50b72a:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50b730:	d8 25 ec b7 54 00    	fsub   DWORD PTR ds:0x54b7ec
  50b736:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b73d:	75 08                	jne    0x50b747
  50b73f:	d8 35 4c b6 54 00    	fdiv   DWORD PTR ds:0x54b64c
  50b745:	eb 0b                	jmp    0x50b752
  50b747:	ff 35 4c b6 54 00    	push   DWORD PTR ds:0x54b64c
  50b74d:	e8 d6 8f ef ff       	call   0x404728
  50b752:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b758:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b75f:	75 08                	jne    0x50b769
  50b761:	d8 35 50 b6 54 00    	fdiv   DWORD PTR ds:0x54b650
  50b767:	eb 0b                	jmp    0x50b774
  50b769:	ff 35 50 b6 54 00    	push   DWORD PTR ds:0x54b650
  50b76f:	e8 b4 8f ef ff       	call   0x404728
  50b774:	de c1                	faddp  st(1),st
  50b776:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b77d:	75 04                	jne    0x50b783
  50b77f:	de f9                	fdivp  st(1),st
  50b781:	eb 09                	jmp    0x50b78c
  50b783:	50                   	push   eax
  50b784:	b0 0d                	mov    al,0xd
  50b786:	e8 af 8f ef ff       	call   0x40473a
  50b78b:	58                   	pop    eax
  50b78c:	d9 1d 88 b6 54 00    	fstp   DWORD PTR ds:0x54b688
  50b792:	df e0                	fnstsw ax
  50b794:	a8 0d                	test   al,0xd
  50b796:	0f 85 99 22 00 00    	jne    0x50da35
  50b79c:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50b7a2:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50b7a8:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50b7ae:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50b7b4:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50b7ba:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50b7c0:	df e0                	fnstsw ax
  50b7c2:	a8 0d                	test   al,0xd
  50b7c4:	0f 85 6b 22 00 00    	jne    0x50da35
  50b7ca:	de c1                	faddp  st(1),st
  50b7cc:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b7d3:	75 04                	jne    0x50b7d9
  50b7d5:	de f9                	fdivp  st(1),st
  50b7d7:	eb 09                	jmp    0x50b7e2
  50b7d9:	50                   	push   eax
  50b7da:	b0 0d                	mov    al,0xd
  50b7dc:	e8 59 8f ef ff       	call   0x40473a
  50b7e1:	58                   	pop    eax
  50b7e2:	d9 1d f0 b7 54 00    	fstp   DWORD PTR ds:0x54b7f0
  50b7e8:	df e0                	fnstsw ax
  50b7ea:	a8 0d                	test   al,0xd
  50b7ec:	0f 85 43 22 00 00    	jne    0x50da35
  50b7f2:	e9 f0 05 00 00       	jmp    0x50bde7
  50b7f7:	d9 05 a0 b4 54 00    	fld    DWORD PTR ds:0x54b4a0
  50b7fd:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50b803:	df e0                	fnstsw ax
  50b805:	f6 c4 01             	test   ah,0x1
  50b808:	74 0c                	je     0x50b816
  50b80a:	66 8b d6             	mov    dx,si
  50b80d:	66 89 15 d6 b4 54 00 	mov    WORD PTR ds:0x54b4d6,dx
  50b814:	eb 07                	jmp    0x50b81d
  50b816:	66 8b 15 d6 b4 54 00 	mov    dx,WORD PTR ds:0x54b4d6
  50b81d:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50b823:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50b829:	df e0                	fnstsw ax
  50b82b:	f6 c4 01             	test   ah,0x1
  50b82e:	0f 84 ae 00 00 00    	je     0x50b8e2
  50b834:	66 3b cb             	cmp    cx,bx
  50b837:	75 08                	jne    0x50b841
  50b839:	d9 05 ac b4 54 00    	fld    DWORD PTR ds:0x54b4ac
  50b83f:	eb 0c                	jmp    0x50b84d
  50b841:	d9 05 c4 b6 54 00    	fld    DWORD PTR ds:0x54b6c4
  50b847:	d8 a5 54 ff ff ff    	fsub   DWORD PTR [ebp-0xac]
  50b84d:	d8 25 a8 b6 54 00    	fsub   DWORD PTR ds:0x54b6a8
  50b853:	d8 0d 14 b4 54 00    	fmul   DWORD PTR ds:0x54b414
  50b859:	d8 05 f0 b7 54 00    	fadd   DWORD PTR ds:0x54b7f0
  50b85f:	d9 1d f0 b7 54 00    	fstp   DWORD PTR ds:0x54b7f0
  50b865:	df e0                	fnstsw ax
  50b867:	a8 0d                	test   al,0xd
  50b869:	0f 85 c6 21 00 00    	jne    0x50da35
  50b86f:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50b875:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b87c:	75 08                	jne    0x50b886
  50b87e:	d8 35 f0 b7 54 00    	fdiv   DWORD PTR ds:0x54b7f0
  50b884:	eb 0b                	jmp    0x50b891
  50b886:	ff 35 f0 b7 54 00    	push   DWORD PTR ds:0x54b7f0
  50b88c:	e8 97 8e ef ff       	call   0x404728
  50b891:	d8 25 4c b6 54 00    	fsub   DWORD PTR ds:0x54b64c
  50b897:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50b89d:	d8 25 4c b6 54 00    	fsub   DWORD PTR ds:0x54b64c
  50b8a3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b8aa:	75 04                	jne    0x50b8b0
  50b8ac:	de f9                	fdivp  st(1),st
  50b8ae:	eb 09                	jmp    0x50b8b9
  50b8b0:	50                   	push   eax
  50b8b1:	b0 0d                	mov    al,0xd
  50b8b3:	e8 82 8e ef ff       	call   0x40473a
  50b8b8:	58                   	pop    eax
  50b8b9:	d9 1d 88 b6 54 00    	fstp   DWORD PTR ds:0x54b688
  50b8bf:	df e0                	fnstsw ax
  50b8c1:	a8 0d                	test   al,0xd
  50b8c3:	0f 85 6c 21 00 00    	jne    0x50da35
  50b8c9:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50b8cf:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  50b8d5:	df e0                	fnstsw ax
  50b8d7:	f6 c4 01             	test   ah,0x1
  50b8da:	74 06                	je     0x50b8e2
  50b8dc:	89 1d 88 b6 54 00    	mov    DWORD PTR ds:0x54b688,ebx
  50b8e2:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  50b8e8:	d8 1d 44 b5 54 00    	fcomp  DWORD PTR ds:0x54b544
  50b8ee:	df e0                	fnstsw ax
  50b8f0:	f6 c4 01             	test   ah,0x1
  50b8f3:	74 0a                	je     0x50b8ff
  50b8f5:	a1 44 b5 54 00       	mov    eax,ds:0x54b544
  50b8fa:	a3 94 b4 54 00       	mov    ds:0x54b494,eax
  50b8ff:	d9 05 94 b4 54 00    	fld    DWORD PTR ds:0x54b494
  50b905:	d8 1d 84 b6 54 00    	fcomp  DWORD PTR ds:0x54b684
  50b90b:	df e0                	fnstsw ax
  50b90d:	f6 c4 01             	test   ah,0x1
  50b910:	0f 84 76 01 00 00    	je     0x50ba8c
  50b916:	66 3b cb             	cmp    cx,bx
  50b919:	0f 85 6d 01 00 00    	jne    0x50ba8c
  50b91f:	d9 05 a0 b1 54 00    	fld    DWORD PTR ds:0x54b1a0
  50b925:	d8 05 9c b1 54 00    	fadd   DWORD PTR ds:0x54b19c
  50b92b:	d9 1d a4 b4 54 00    	fstp   DWORD PTR ds:0x54b4a4
  50b931:	df e0                	fnstsw ax
  50b933:	a8 0d                	test   al,0xd
  50b935:	0f 85 fa 20 00 00    	jne    0x50da35
  50b93b:	66 8b ce             	mov    cx,si
  50b93e:	66 89 0d d8 b4 54 00 	mov    WORD PTR ds:0x54b4d8,cx
  50b945:	d9 05 a0 b4 54 00    	fld    DWORD PTR ds:0x54b4a0
  50b94b:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50b951:	d8 0d 9c b1 54 00    	fmul   DWORD PTR ds:0x54b19c
  50b957:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b95e:	75 08                	jne    0x50b968
  50b960:	d8 35 a4 b4 54 00    	fdiv   DWORD PTR ds:0x54b4a4
  50b966:	eb 0b                	jmp    0x50b973
  50b968:	ff 35 a4 b4 54 00    	push   DWORD PTR ds:0x54b4a4
  50b96e:	e8 b5 8d ef ff       	call   0x404728
  50b973:	d9 1d ec b7 54 00    	fstp   DWORD PTR ds:0x54b7ec
  50b979:	df e0                	fnstsw ax
  50b97b:	a8 0d                	test   al,0xd
  50b97d:	0f 85 b2 20 00 00    	jne    0x50da35
  50b983:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b989:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b990:	75 08                	jne    0x50b99a
  50b992:	d8 35 50 b6 54 00    	fdiv   DWORD PTR ds:0x54b650
  50b998:	eb 0b                	jmp    0x50b9a5
  50b99a:	ff 35 50 b6 54 00    	push   DWORD PTR ds:0x54b650
  50b9a0:	e8 83 8d ef ff       	call   0x404728
  50b9a5:	df e0                	fnstsw ax
  50b9a7:	a8 0d                	test   al,0xd
  50b9a9:	0f 85 86 20 00 00    	jne    0x50da35
  50b9af:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b9b5:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50b9bb:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b9c2:	75 08                	jne    0x50b9cc
  50b9c4:	d8 35 4c b6 54 00    	fdiv   DWORD PTR ds:0x54b64c
  50b9ca:	eb 0b                	jmp    0x50b9d7
  50b9cc:	ff 35 4c b6 54 00    	push   DWORD PTR ds:0x54b64c
  50b9d2:	e8 51 8d ef ff       	call   0x404728
  50b9d7:	d9 05 ec b7 54 00    	fld    DWORD PTR ds:0x54b7ec
  50b9dd:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50b9e4:	75 08                	jne    0x50b9ee
  50b9e6:	d8 35 50 b6 54 00    	fdiv   DWORD PTR ds:0x54b650
  50b9ec:	eb 0b                	jmp    0x50b9f9
  50b9ee:	ff 35 50 b6 54 00    	push   DWORD PTR ds:0x54b650
  50b9f4:	e8 2f 8d ef ff       	call   0x404728
  50b9f9:	df e0                	fnstsw ax
  50b9fb:	a8 0d                	test   al,0xd
  50b9fd:	0f 85 32 20 00 00    	jne    0x50da35
  50ba03:	de c1                	faddp  st(1),st
  50ba05:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50ba0c:	75 04                	jne    0x50ba12
  50ba0e:	de f9                	fdivp  st(1),st
  50ba10:	eb 09                	jmp    0x50ba1b
  50ba12:	50                   	push   eax
  50ba13:	b0 0d                	mov    al,0xd
  50ba15:	e8 20 8d ef ff       	call   0x40473a
  50ba1a:	58                   	pop    eax
  50ba1b:	d9 1d 88 b6 54 00    	fstp   DWORD PTR ds:0x54b688
  50ba21:	df e0                	fnstsw ax
  50ba23:	a8 0d                	test   al,0xd
  50ba25:	0f 85 0a 20 00 00    	jne    0x50da35
  50ba2b:	d9 05 a4 b4 54 00    	fld    DWORD PTR ds:0x54b4a4
  50ba31:	d9 05 88 b6 54 00    	fld    DWORD PTR ds:0x54b688
  50ba37:	dc 2d 38 30 40 00    	fsubr  QWORD PTR ds:0x403038
  50ba3d:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50ba43:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50ba49:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50ba4f:	df e0                	fnstsw ax
  50ba51:	a8 0d                	test   al,0xd
  50ba53:	0f 85 dc 1f 00 00    	jne    0x50da35
  50ba59:	de c1                	faddp  st(1),st
  50ba5b:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50ba62:	75 04                	jne    0x50ba68
  50ba64:	de f9                	fdivp  st(1),st
  50ba66:	eb 09                	jmp    0x50ba71
  50ba68:	50                   	push   eax
  50ba69:	b0 0d                	mov    al,0xd
  50ba6b:	e8 ca 8c ef ff       	call   0x40473a
  50ba70:	58                   	pop    eax
  50ba71:	d9 1d f0 b7 54 00    	fstp   DWORD PTR ds:0x54b7f0
  50ba77:	df e0                	fnstsw ax
  50ba79:	a8 0d                	test   al,0xd
  50ba7b:	0f 85 b4 1f 00 00    	jne    0x50da35
  50ba81:	89 1d a8 b4 54 00    	mov    DWORD PTR ds:0x54b4a8,ebx
  50ba87:	e9 5b 03 00 00       	jmp    0x50bde7
  50ba8c:	d9 05 50 b6 54 00    	fld    DWORD PTR ds:0x54b650
  50ba92:	d8 0d 88 b6 54 00    	fmul   DWORD PTR ds:0x54b688
  50ba98:	d9 9d 90 fe ff ff    	fstp   DWORD PTR [ebp-0x170]
  50ba9e:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  50baa4:	d8 25 88 b6 54 00    	fsub   DWORD PTR ds:0x54b688
  50baaa:	d8 0d 4c b6 54 00    	fmul   DWORD PTR ds:0x54b64c
  50bab0:	d8 85 90 fe ff ff    	fadd   DWORD PTR [ebp-0x170]
  50bab6:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50babd:	75 08                	jne    0x50bac7
  50babf:	d8 bd 90 fe ff ff    	fdivr  DWORD PTR [ebp-0x170]
  50bac5:	eb 0b                	jmp    0x50bad2
  50bac7:	ff b5 90 fe ff ff    	push   DWORD PTR [ebp-0x170]
  50bacd:	e8 74 8c ef ff       	call   0x404746
  50bad2:	d9 1d ec b7 54 00    	fstp   DWORD PTR ds:0x54b7ec
  50bad8:	df e0                	fnstsw ax
  50bada:	a8 0d                	test   al,0xd
  50badc:	0f 85 53 1f 00 00    	jne    0x50da35
