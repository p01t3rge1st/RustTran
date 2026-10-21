
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0050f660 <.text+0x10e660>:
  50f660:	55                   	push   ebp
  50f661:	8b ec                	mov    ebp,esp
  50f663:	83 ec 14             	sub    esp,0x14
  50f666:	68 16 47 40 00       	push   0x404716
  50f66b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  50f671:	50                   	push   eax
  50f672:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  50f679:	81 ec d4 00 00 00    	sub    esp,0xd4
  50f67f:	53                   	push   ebx
  50f680:	56                   	push   esi
  50f681:	57                   	push   edi
  50f682:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  50f685:	c7 45 f0 38 35 40 00 	mov    DWORD PTR [ebp-0x10],0x403538
  50f68c:	33 ff                	xor    edi,edi
  50f68e:	89 7d f4             	mov    DWORD PTR [ebp-0xc],edi
  50f691:	89 7d f8             	mov    DWORD PTR [ebp-0x8],edi
  50f694:	89 7d d8             	mov    DWORD PTR [ebp-0x28],edi
  50f697:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
  50f69a:	89 7d d0             	mov    DWORD PTR [ebp-0x30],edi
  50f69d:	89 7d cc             	mov    DWORD PTR [ebp-0x34],edi
  50f6a0:	89 7d c8             	mov    DWORD PTR [ebp-0x38],edi
  50f6a3:	89 7d c4             	mov    DWORD PTR [ebp-0x3c],edi
  50f6a6:	89 7d c0             	mov    DWORD PTR [ebp-0x40],edi
  50f6a9:	89 7d b0             	mov    DWORD PTR [ebp-0x50],edi
  50f6ac:	89 7d a0             	mov    DWORD PTR [ebp-0x60],edi
  50f6af:	89 7d 90             	mov    DWORD PTR [ebp-0x70],edi
  50f6b2:	89 7d 80             	mov    DWORD PTR [ebp-0x80],edi
  50f6b5:	89 bd 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],edi
  50f6bb:	89 bd 60 ff ff ff    	mov    DWORD PTR [ebp-0xa0],edi
  50f6c1:	89 bd 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],edi
  50f6c7:	89 bd 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],edi
  50f6cd:	89 bd 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],edi
  50f6d3:	6a 01                	push   0x1
  50f6d5:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  50f6db:	c7 05 08 b4 54 00 48 	mov    DWORD PTR ds:0x54b408,0x3f7ae148
  50f6e2:	e1 7a 3f 
  50f6e5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  50f6e8:	d9 00                	fld    DWORD PTR [eax]
  50f6ea:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
  50f6ed:	d8 19                	fcomp  DWORD PTR [ecx]
  50f6ef:	df e0                	fnstsw ax
  50f6f1:	f6 c4 01             	test   ah,0x1
  50f6f4:	74 07                	je     0x50f6fd
  50f6f6:	be 01 00 00 00       	mov    esi,0x1
  50f6fb:	eb 02                	jmp    0x50f6ff
  50f6fd:	33 f6                	xor    esi,esi
  50f6ff:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50f704:	8b 10                	mov    edx,DWORD PTR [eax]
  50f706:	50                   	push   eax
  50f707:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  50f70d:	50                   	push   eax
  50f70e:	8d 45 d4             	lea    eax,[ebp-0x2c]
  50f711:	50                   	push   eax
  50f712:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50f718:	8b d8                	mov    ebx,eax
  50f71a:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  50f71c:	8d 55 d0             	lea    edx,[ebp-0x30]
  50f71f:	52                   	push   edx
  50f720:	6a 02                	push   0x2
  50f722:	53                   	push   ebx
  50f723:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50f726:	db e2                	fnclex
  50f728:	3b c7                	cmp    eax,edi
  50f72a:	7d 0f                	jge    0x50f73b
  50f72c:	6a 40                	push   0x40
  50f72e:	68 68 c9 41 00       	push   0x41c968
  50f733:	53                   	push   ebx
  50f734:	50                   	push   eax
  50f735:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50f73b:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50f740:	8b 08                	mov    ecx,DWORD PTR [eax]
  50f742:	50                   	push   eax
  50f743:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50f749:	50                   	push   eax
  50f74a:	8d 55 cc             	lea    edx,[ebp-0x34]
  50f74d:	52                   	push   edx
  50f74e:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50f754:	8b d8                	mov    ebx,eax
  50f756:	89 9d 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],ebx
  50f75c:	8b 03                	mov    eax,DWORD PTR [ebx]
  50f75e:	8d 4d c8             	lea    ecx,[ebp-0x38]
  50f761:	51                   	push   ecx
  50f762:	6a 02                	push   0x2
  50f764:	53                   	push   ebx
  50f765:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50f768:	db e2                	fnclex
  50f76a:	3b c7                	cmp    eax,edi
  50f76c:	7d 0f                	jge    0x50f77d
  50f76e:	6a 40                	push   0x40
  50f770:	68 68 c9 41 00       	push   0x41c968
  50f775:	53                   	push   ebx
  50f776:	50                   	push   eax
  50f777:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50f77d:	57                   	push   edi
  50f77e:	68 09 00 03 68       	push   0x68030009
  50f783:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  50f786:	52                   	push   edx
  50f787:	8d 45 b0             	lea    eax,[ebp-0x50]
  50f78a:	50                   	push   eax
  50f78b:	8b 1d 34 11 40 00    	mov    ebx,DWORD PTR ds:0x401134
  50f791:	ff d3                	call   ebx
  50f793:	83 c4 10             	add    esp,0x10
  50f796:	50                   	push   eax
  50f797:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  50f79d:	33 d2                	xor    edx,edx
  50f79f:	66 3d 64 00          	cmp    ax,0x64
  50f7a3:	0f 94 c2             	sete   dl
  50f7a6:	f7 da                	neg    edx
  50f7a8:	57                   	push   edi
  50f7a9:	68 08 00 03 68       	push   0x68030008
  50f7ae:	8b 4d c8             	mov    ecx,DWORD PTR [ebp-0x38]
  50f7b1:	51                   	push   ecx
  50f7b2:	8d 45 a0             	lea    eax,[ebp-0x60]
  50f7b5:	50                   	push   eax
  50f7b6:	89 95 2c ff ff ff    	mov    DWORD PTR [ebp-0xd4],edx
  50f7bc:	ff d3                	call   ebx
  50f7be:	83 c4 10             	add    esp,0x10
  50f7c1:	50                   	push   eax
  50f7c2:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50f7c8:	f7 d0                	not    eax
  50f7ca:	8b 8d 2c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xd4]
  50f7d0:	23 c8                	and    ecx,eax
  50f7d2:	f7 de                	neg    esi
  50f7d4:	23 ce                	and    ecx,esi
  50f7d6:	66 8b f1             	mov    si,cx
  50f7d9:	8d 55 c8             	lea    edx,[ebp-0x38]
  50f7dc:	52                   	push   edx
  50f7dd:	8d 45 cc             	lea    eax,[ebp-0x34]
  50f7e0:	50                   	push   eax
  50f7e1:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50f7e4:	51                   	push   ecx
  50f7e5:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50f7e8:	52                   	push   edx
  50f7e9:	6a 04                	push   0x4
  50f7eb:	8b 3d 48 10 40 00    	mov    edi,DWORD PTR ds:0x401048
  50f7f1:	ff d7                	call   edi
  50f7f3:	8d 45 a0             	lea    eax,[ebp-0x60]
  50f7f6:	50                   	push   eax
  50f7f7:	8d 4d b0             	lea    ecx,[ebp-0x50]
  50f7fa:	51                   	push   ecx
  50f7fb:	6a 02                	push   0x2
  50f7fd:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50f803:	83 c4 20             	add    esp,0x20
  50f806:	66 85 f6             	test   si,si
  50f809:	0f 84 86 00 00 00    	je     0x50f895
  50f80f:	c7 45 88 00 00 00 00 	mov    DWORD PTR [ebp-0x78],0x0
  50f816:	c7 45 80 02 00 00 00 	mov    DWORD PTR [ebp-0x80],0x2
  50f81d:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50f822:	8b 10                	mov    edx,DWORD PTR [eax]
  50f824:	50                   	push   eax
  50f825:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  50f82b:	50                   	push   eax
  50f82c:	8d 45 d4             	lea    eax,[ebp-0x2c]
  50f82f:	50                   	push   eax
  50f830:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50f836:	8b f0                	mov    esi,eax
  50f838:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50f83a:	8d 55 d0             	lea    edx,[ebp-0x30]
  50f83d:	52                   	push   edx
  50f83e:	6a 02                	push   0x2
  50f840:	56                   	push   esi
  50f841:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50f844:	db e2                	fnclex
  50f846:	85 c0                	test   eax,eax
  50f848:	7d 0f                	jge    0x50f859
  50f84a:	6a 40                	push   0x40
  50f84c:	68 68 c9 41 00       	push   0x41c968
  50f851:	56                   	push   esi
  50f852:	50                   	push   eax
  50f853:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50f859:	83 ec 10             	sub    esp,0x10
  50f85c:	8b c4                	mov    eax,esp
  50f85e:	8b 4d 80             	mov    ecx,DWORD PTR [ebp-0x80]
  50f861:	89 08                	mov    DWORD PTR [eax],ecx
  50f863:	8b 55 84             	mov    edx,DWORD PTR [ebp-0x7c]
  50f866:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
  50f869:	8b 4d 88             	mov    ecx,DWORD PTR [ebp-0x78]
  50f86c:	89 48 08             	mov    DWORD PTR [eax+0x8],ecx
  50f86f:	8b 55 8c             	mov    edx,DWORD PTR [ebp-0x74]
  50f872:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
  50f875:	68 09 00 03 68       	push   0x68030009
  50f87a:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  50f87d:	50                   	push   eax
  50f87e:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  50f884:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50f887:	51                   	push   ecx
  50f888:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50f88b:	52                   	push   edx
  50f88c:	6a 02                	push   0x2
  50f88e:	ff d7                	call   edi
  50f890:	e9 c8 07 00 00       	jmp    0x51005d
  50f895:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  50f898:	d9 00                	fld    DWORD PTR [eax]
  50f89a:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  50f89d:	d8 19                	fcomp  DWORD PTR [ecx]
  50f89f:	df e0                	fnstsw ax
  50f8a1:	f6 c4 01             	test   ah,0x1
  50f8a4:	75 07                	jne    0x50f8ad
  50f8a6:	bf 01 00 00 00       	mov    edi,0x1
  50f8ab:	eb 02                	jmp    0x50f8af
  50f8ad:	33 ff                	xor    edi,edi
  50f8af:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50f8b4:	8b 10                	mov    edx,DWORD PTR [eax]
  50f8b6:	50                   	push   eax
  50f8b7:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  50f8bd:	50                   	push   eax
  50f8be:	8d 45 d4             	lea    eax,[ebp-0x2c]
  50f8c1:	50                   	push   eax
  50f8c2:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50f8c8:	8b f0                	mov    esi,eax
  50f8ca:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50f8cc:	8d 55 d0             	lea    edx,[ebp-0x30]
  50f8cf:	52                   	push   edx
  50f8d0:	6a 02                	push   0x2
  50f8d2:	56                   	push   esi
  50f8d3:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50f8d6:	db e2                	fnclex
  50f8d8:	85 c0                	test   eax,eax
  50f8da:	7d 0f                	jge    0x50f8eb
  50f8dc:	6a 40                	push   0x40
  50f8de:	68 68 c9 41 00       	push   0x41c968
  50f8e3:	56                   	push   esi
  50f8e4:	50                   	push   eax
  50f8e5:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50f8eb:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50f8f0:	8b 08                	mov    ecx,DWORD PTR [eax]
  50f8f2:	50                   	push   eax
  50f8f3:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50f8f9:	50                   	push   eax
  50f8fa:	8d 55 cc             	lea    edx,[ebp-0x34]
  50f8fd:	52                   	push   edx
  50f8fe:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50f904:	8b f0                	mov    esi,eax
  50f906:	89 b5 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],esi
  50f90c:	8b 06                	mov    eax,DWORD PTR [esi]
  50f90e:	8d 4d c8             	lea    ecx,[ebp-0x38]
  50f911:	51                   	push   ecx
  50f912:	6a 02                	push   0x2
  50f914:	56                   	push   esi
  50f915:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50f918:	db e2                	fnclex
  50f91a:	85 c0                	test   eax,eax
  50f91c:	7d 0f                	jge    0x50f92d
  50f91e:	6a 40                	push   0x40
  50f920:	68 68 c9 41 00       	push   0x41c968
  50f925:	56                   	push   esi
  50f926:	50                   	push   eax
  50f927:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50f92d:	6a 00                	push   0x0
  50f92f:	68 09 00 03 68       	push   0x68030009
  50f934:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  50f937:	52                   	push   edx
  50f938:	8d 45 b0             	lea    eax,[ebp-0x50]
  50f93b:	50                   	push   eax
  50f93c:	ff d3                	call   ebx
  50f93e:	83 c4 10             	add    esp,0x10
  50f941:	50                   	push   eax
  50f942:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  50f948:	66 8b f0             	mov    si,ax
  50f94b:	66 f7 de             	neg    si
  50f94e:	1b f6                	sbb    esi,esi
  50f950:	46                   	inc    esi
  50f951:	f7 de                	neg    esi
  50f953:	6a 00                	push   0x0
  50f955:	68 08 00 03 68       	push   0x68030008
  50f95a:	8b 4d c8             	mov    ecx,DWORD PTR [ebp-0x38]
  50f95d:	51                   	push   ecx
  50f95e:	8d 55 a0             	lea    edx,[ebp-0x60]
  50f961:	52                   	push   edx
  50f962:	ff d3                	call   ebx
  50f964:	83 c4 10             	add    esp,0x10
  50f967:	50                   	push   eax
  50f968:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50f96e:	f7 d0                	not    eax
  50f970:	23 f0                	and    esi,eax
  50f972:	f7 df                	neg    edi
  50f974:	23 f7                	and    esi,edi
  50f976:	8d 45 c8             	lea    eax,[ebp-0x38]
  50f979:	50                   	push   eax
  50f97a:	8d 4d cc             	lea    ecx,[ebp-0x34]
  50f97d:	51                   	push   ecx
  50f97e:	8d 55 d0             	lea    edx,[ebp-0x30]
  50f981:	52                   	push   edx
  50f982:	8d 45 d4             	lea    eax,[ebp-0x2c]
  50f985:	50                   	push   eax
  50f986:	6a 04                	push   0x4
  50f988:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50f98e:	8d 4d a0             	lea    ecx,[ebp-0x60]
  50f991:	51                   	push   ecx
  50f992:	8d 55 b0             	lea    edx,[ebp-0x50]
  50f995:	52                   	push   edx
  50f996:	6a 02                	push   0x2
  50f998:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50f99e:	83 c4 20             	add    esp,0x20
  50f9a1:	66 85 f6             	test   si,si
  50f9a4:	74 44                	je     0x50f9ea
  50f9a6:	c7 45 88 64 00 00 00 	mov    DWORD PTR [ebp-0x78],0x64
  50f9ad:	c7 45 80 02 00 00 00 	mov    DWORD PTR [ebp-0x80],0x2
  50f9b4:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50f9b9:	8b 08                	mov    ecx,DWORD PTR [eax]
  50f9bb:	50                   	push   eax
  50f9bc:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50f9c2:	50                   	push   eax
  50f9c3:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50f9c6:	52                   	push   edx
  50f9c7:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50f9cd:	8b f0                	mov    esi,eax
  50f9cf:	8b 06                	mov    eax,DWORD PTR [esi]
  50f9d1:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50f9d4:	51                   	push   ecx
  50f9d5:	6a 02                	push   0x2
  50f9d7:	56                   	push   esi
  50f9d8:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50f9db:	db e2                	fnclex
  50f9dd:	85 c0                	test   eax,eax
  50f9df:	0f 8d 3d 06 00 00    	jge    0x510022
  50f9e5:	e9 29 06 00 00       	jmp    0x510013
  50f9ea:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
  50f9ed:	d9 02                	fld    DWORD PTR [edx]
  50f9ef:	d8 05 60 35 40 00    	fadd   DWORD PTR ds:0x403560
  50f9f5:	df e0                	fnstsw ax
  50f9f7:	a8 0d                	test   al,0xd
  50f9f9:	0f 85 3a 0e 00 00    	jne    0x510839
  50f9ff:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50fa05:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  50fa08:	d8 18                	fcomp  DWORD PTR [eax]
  50fa0a:	df e0                	fnstsw ax
  50fa0c:	f6 c4 41             	test   ah,0x41
  50fa0f:	75 07                	jne    0x50fa18
  50fa11:	be 01 00 00 00       	mov    esi,0x1
  50fa16:	eb 02                	jmp    0x50fa1a
  50fa18:	33 f6                	xor    esi,esi
  50fa1a:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fa1f:	8b 08                	mov    ecx,DWORD PTR [eax]
  50fa21:	50                   	push   eax
  50fa22:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50fa28:	50                   	push   eax
  50fa29:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50fa2c:	52                   	push   edx
  50fa2d:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fa33:	8b f8                	mov    edi,eax
  50fa35:	8b 07                	mov    eax,DWORD PTR [edi]
  50fa37:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50fa3a:	51                   	push   ecx
  50fa3b:	6a 01                	push   0x1
  50fa3d:	57                   	push   edi
  50fa3e:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50fa41:	db e2                	fnclex
  50fa43:	85 c0                	test   eax,eax
  50fa45:	7d 0f                	jge    0x50fa56
  50fa47:	6a 40                	push   0x40
  50fa49:	68 68 c9 41 00       	push   0x41c968
  50fa4e:	57                   	push   edi
  50fa4f:	50                   	push   eax
  50fa50:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50fa56:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fa5b:	8b 10                	mov    edx,DWORD PTR [eax]
  50fa5d:	50                   	push   eax
  50fa5e:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  50fa64:	50                   	push   eax
  50fa65:	8d 45 cc             	lea    eax,[ebp-0x34]
  50fa68:	50                   	push   eax
  50fa69:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fa6f:	8b f8                	mov    edi,eax
  50fa71:	89 bd 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],edi
  50fa77:	8b 0f                	mov    ecx,DWORD PTR [edi]
  50fa79:	8d 55 c8             	lea    edx,[ebp-0x38]
  50fa7c:	52                   	push   edx
  50fa7d:	6a 01                	push   0x1
  50fa7f:	57                   	push   edi
  50fa80:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50fa83:	db e2                	fnclex
  50fa85:	85 c0                	test   eax,eax
  50fa87:	7d 0f                	jge    0x50fa98
  50fa89:	6a 40                	push   0x40
  50fa8b:	68 68 c9 41 00       	push   0x41c968
  50fa90:	57                   	push   edi
  50fa91:	50                   	push   eax
  50fa92:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50fa98:	6a 00                	push   0x0
  50fa9a:	68 09 00 03 68       	push   0x68030009
  50fa9f:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  50faa2:	50                   	push   eax
  50faa3:	8d 4d b0             	lea    ecx,[ebp-0x50]
  50faa6:	51                   	push   ecx
  50faa7:	ff d3                	call   ebx
  50faa9:	83 c4 10             	add    esp,0x10
  50faac:	50                   	push   eax
  50faad:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  50fab3:	33 d2                	xor    edx,edx
  50fab5:	66 3d 64 00          	cmp    ax,0x64
  50fab9:	0f 94 c2             	sete   dl
  50fabc:	f7 da                	neg    edx
  50fabe:	6a 00                	push   0x0
  50fac0:	68 08 00 03 68       	push   0x68030008
  50fac5:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  50fac8:	50                   	push   eax
  50fac9:	8d 4d a0             	lea    ecx,[ebp-0x60]
  50facc:	51                   	push   ecx
  50facd:	89 95 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],edx
  50fad3:	ff d3                	call   ebx
  50fad5:	83 c4 10             	add    esp,0x10
  50fad8:	50                   	push   eax
  50fad9:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50fadf:	f7 d0                	not    eax
  50fae1:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [ebp-0xd8]
  50fae7:	23 d0                	and    edx,eax
  50fae9:	f7 de                	neg    esi
  50faeb:	23 d6                	and    edx,esi
  50faed:	66 8b f2             	mov    si,dx
  50faf0:	8d 45 c8             	lea    eax,[ebp-0x38]
  50faf3:	50                   	push   eax
  50faf4:	8d 4d cc             	lea    ecx,[ebp-0x34]
  50faf7:	51                   	push   ecx
  50faf8:	8d 55 d0             	lea    edx,[ebp-0x30]
  50fafb:	52                   	push   edx
  50fafc:	8d 45 d4             	lea    eax,[ebp-0x2c]
  50faff:	50                   	push   eax
  50fb00:	6a 04                	push   0x4
  50fb02:	8b 3d 48 10 40 00    	mov    edi,DWORD PTR ds:0x401048
  50fb08:	ff d7                	call   edi
  50fb0a:	8d 4d a0             	lea    ecx,[ebp-0x60]
  50fb0d:	51                   	push   ecx
  50fb0e:	8d 55 b0             	lea    edx,[ebp-0x50]
  50fb11:	52                   	push   edx
  50fb12:	6a 02                	push   0x2
  50fb14:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50fb1a:	83 c4 20             	add    esp,0x20
  50fb1d:	66 85 f6             	test   si,si
  50fb20:	0f 84 86 00 00 00    	je     0x50fbac
  50fb26:	c7 45 88 00 00 00 00 	mov    DWORD PTR [ebp-0x78],0x0
  50fb2d:	c7 45 80 02 00 00 00 	mov    DWORD PTR [ebp-0x80],0x2
  50fb34:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fb39:	8b 08                	mov    ecx,DWORD PTR [eax]
  50fb3b:	50                   	push   eax
  50fb3c:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50fb42:	50                   	push   eax
  50fb43:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50fb46:	52                   	push   edx
  50fb47:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fb4d:	8b f0                	mov    esi,eax
  50fb4f:	8b 06                	mov    eax,DWORD PTR [esi]
  50fb51:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50fb54:	51                   	push   ecx
  50fb55:	6a 01                	push   0x1
  50fb57:	56                   	push   esi
  50fb58:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50fb5b:	db e2                	fnclex
  50fb5d:	85 c0                	test   eax,eax
  50fb5f:	7d 0f                	jge    0x50fb70
  50fb61:	6a 40                	push   0x40
  50fb63:	68 68 c9 41 00       	push   0x41c968
  50fb68:	56                   	push   esi
  50fb69:	50                   	push   eax
  50fb6a:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50fb70:	83 ec 10             	sub    esp,0x10
  50fb73:	8b d4                	mov    edx,esp
  50fb75:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
  50fb78:	89 02                	mov    DWORD PTR [edx],eax
  50fb7a:	8b 4d 84             	mov    ecx,DWORD PTR [ebp-0x7c]
  50fb7d:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  50fb80:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
  50fb83:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  50fb86:	8b 4d 8c             	mov    ecx,DWORD PTR [ebp-0x74]
  50fb89:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  50fb8c:	68 09 00 03 68       	push   0x68030009
  50fb91:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  50fb94:	52                   	push   edx
  50fb95:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  50fb9b:	8d 45 d0             	lea    eax,[ebp-0x30]
  50fb9e:	50                   	push   eax
  50fb9f:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  50fba2:	51                   	push   ecx
  50fba3:	6a 02                	push   0x2
  50fba5:	ff d7                	call   edi
  50fba7:	e9 b1 04 00 00       	jmp    0x51005d
  50fbac:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  50fbaf:	d9 02                	fld    DWORD PTR [edx]
  50fbb1:	d8 05 60 35 40 00    	fadd   DWORD PTR ds:0x403560
  50fbb7:	df e0                	fnstsw ax
  50fbb9:	a8 0d                	test   al,0xd
  50fbbb:	0f 85 78 0c 00 00    	jne    0x510839
  50fbc1:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  50fbc7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  50fbca:	d8 18                	fcomp  DWORD PTR [eax]
  50fbcc:	df e0                	fnstsw ax
  50fbce:	f6 c4 41             	test   ah,0x41
  50fbd1:	74 07                	je     0x50fbda
  50fbd3:	bf 01 00 00 00       	mov    edi,0x1
  50fbd8:	eb 02                	jmp    0x50fbdc
  50fbda:	33 ff                	xor    edi,edi
  50fbdc:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fbe1:	8b 08                	mov    ecx,DWORD PTR [eax]
  50fbe3:	50                   	push   eax
  50fbe4:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50fbea:	50                   	push   eax
  50fbeb:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50fbee:	52                   	push   edx
  50fbef:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fbf5:	8b f0                	mov    esi,eax
  50fbf7:	8b 06                	mov    eax,DWORD PTR [esi]
  50fbf9:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50fbfc:	51                   	push   ecx
  50fbfd:	6a 01                	push   0x1
  50fbff:	56                   	push   esi
  50fc00:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50fc03:	db e2                	fnclex
  50fc05:	85 c0                	test   eax,eax
  50fc07:	7d 0f                	jge    0x50fc18
  50fc09:	6a 40                	push   0x40
  50fc0b:	68 68 c9 41 00       	push   0x41c968
  50fc10:	56                   	push   esi
  50fc11:	50                   	push   eax
  50fc12:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50fc18:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fc1d:	8b 10                	mov    edx,DWORD PTR [eax]
  50fc1f:	50                   	push   eax
  50fc20:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  50fc26:	50                   	push   eax
  50fc27:	8d 45 cc             	lea    eax,[ebp-0x34]
  50fc2a:	50                   	push   eax
  50fc2b:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fc31:	8b f0                	mov    esi,eax
  50fc33:	89 b5 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],esi
  50fc39:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50fc3b:	8d 55 c8             	lea    edx,[ebp-0x38]
  50fc3e:	52                   	push   edx
  50fc3f:	6a 01                	push   0x1
  50fc41:	56                   	push   esi
  50fc42:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50fc45:	db e2                	fnclex
  50fc47:	85 c0                	test   eax,eax
  50fc49:	7d 0f                	jge    0x50fc5a
  50fc4b:	6a 40                	push   0x40
  50fc4d:	68 68 c9 41 00       	push   0x41c968
  50fc52:	56                   	push   esi
  50fc53:	50                   	push   eax
  50fc54:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50fc5a:	6a 00                	push   0x0
  50fc5c:	68 09 00 03 68       	push   0x68030009
  50fc61:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  50fc64:	50                   	push   eax
  50fc65:	8d 4d b0             	lea    ecx,[ebp-0x50]
  50fc68:	51                   	push   ecx
  50fc69:	ff d3                	call   ebx
  50fc6b:	83 c4 10             	add    esp,0x10
  50fc6e:	50                   	push   eax
  50fc6f:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  50fc75:	66 8b f0             	mov    si,ax
  50fc78:	66 f7 de             	neg    si
  50fc7b:	1b f6                	sbb    esi,esi
  50fc7d:	46                   	inc    esi
  50fc7e:	f7 de                	neg    esi
  50fc80:	6a 00                	push   0x0
  50fc82:	68 08 00 03 68       	push   0x68030008
  50fc87:	8b 55 c8             	mov    edx,DWORD PTR [ebp-0x38]
  50fc8a:	52                   	push   edx
  50fc8b:	8d 45 a0             	lea    eax,[ebp-0x60]
  50fc8e:	50                   	push   eax
  50fc8f:	ff d3                	call   ebx
  50fc91:	83 c4 10             	add    esp,0x10
  50fc94:	50                   	push   eax
  50fc95:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50fc9b:	f7 d0                	not    eax
  50fc9d:	23 f0                	and    esi,eax
  50fc9f:	f7 df                	neg    edi
  50fca1:	23 f7                	and    esi,edi
  50fca3:	8d 4d c8             	lea    ecx,[ebp-0x38]
  50fca6:	51                   	push   ecx
  50fca7:	8d 55 cc             	lea    edx,[ebp-0x34]
  50fcaa:	52                   	push   edx
  50fcab:	8d 45 d0             	lea    eax,[ebp-0x30]
  50fcae:	50                   	push   eax
  50fcaf:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  50fcb2:	51                   	push   ecx
  50fcb3:	6a 04                	push   0x4
  50fcb5:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50fcbb:	8d 55 a0             	lea    edx,[ebp-0x60]
  50fcbe:	52                   	push   edx
  50fcbf:	8d 45 b0             	lea    eax,[ebp-0x50]
  50fcc2:	50                   	push   eax
  50fcc3:	6a 02                	push   0x2
  50fcc5:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50fccb:	83 c4 20             	add    esp,0x20
  50fcce:	66 85 f6             	test   si,si
  50fcd1:	74 44                	je     0x50fd17
  50fcd3:	c7 45 88 64 00 00 00 	mov    DWORD PTR [ebp-0x78],0x64
  50fcda:	c7 45 80 02 00 00 00 	mov    DWORD PTR [ebp-0x80],0x2
  50fce1:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fce6:	8b 08                	mov    ecx,DWORD PTR [eax]
  50fce8:	50                   	push   eax
  50fce9:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50fcef:	50                   	push   eax
  50fcf0:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50fcf3:	52                   	push   edx
  50fcf4:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fcfa:	8b f0                	mov    esi,eax
  50fcfc:	8b 06                	mov    eax,DWORD PTR [esi]
  50fcfe:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50fd01:	51                   	push   ecx
  50fd02:	6a 01                	push   0x1
  50fd04:	56                   	push   esi
  50fd05:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50fd08:	db e2                	fnclex
  50fd0a:	85 c0                	test   eax,eax
  50fd0c:	0f 8d 10 03 00 00    	jge    0x510022
  50fd12:	e9 fc 02 00 00       	jmp    0x510013
  50fd17:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  50fd1a:	d9 02                	fld    DWORD PTR [edx]
  50fd1c:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
  50fd1f:	d8 18                	fcomp  DWORD PTR [eax]
  50fd21:	df e0                	fnstsw ax
  50fd23:	f6 c4 01             	test   ah,0x1
  50fd26:	74 07                	je     0x50fd2f
  50fd28:	be 01 00 00 00       	mov    esi,0x1
  50fd2d:	eb 02                	jmp    0x50fd31
  50fd2f:	33 f6                	xor    esi,esi
  50fd31:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fd36:	8b 08                	mov    ecx,DWORD PTR [eax]
  50fd38:	50                   	push   eax
  50fd39:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50fd3f:	50                   	push   eax
  50fd40:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50fd43:	52                   	push   edx
  50fd44:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fd4a:	8b f8                	mov    edi,eax
  50fd4c:	8b 07                	mov    eax,DWORD PTR [edi]
  50fd4e:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50fd51:	51                   	push   ecx
  50fd52:	6a 00                	push   0x0
  50fd54:	57                   	push   edi
  50fd55:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50fd58:	db e2                	fnclex
  50fd5a:	85 c0                	test   eax,eax
  50fd5c:	7d 0f                	jge    0x50fd6d
  50fd5e:	6a 40                	push   0x40
  50fd60:	68 68 c9 41 00       	push   0x41c968
  50fd65:	57                   	push   edi
  50fd66:	50                   	push   eax
  50fd67:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50fd6d:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fd72:	8b 10                	mov    edx,DWORD PTR [eax]
  50fd74:	50                   	push   eax
  50fd75:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  50fd7b:	50                   	push   eax
  50fd7c:	8d 45 cc             	lea    eax,[ebp-0x34]
  50fd7f:	50                   	push   eax
  50fd80:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fd86:	8b f8                	mov    edi,eax
  50fd88:	89 bd 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],edi
  50fd8e:	8b 0f                	mov    ecx,DWORD PTR [edi]
  50fd90:	8d 55 c8             	lea    edx,[ebp-0x38]
  50fd93:	52                   	push   edx
  50fd94:	6a 00                	push   0x0
  50fd96:	57                   	push   edi
  50fd97:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50fd9a:	db e2                	fnclex
  50fd9c:	85 c0                	test   eax,eax
  50fd9e:	7d 0f                	jge    0x50fdaf
  50fda0:	6a 40                	push   0x40
  50fda2:	68 68 c9 41 00       	push   0x41c968
  50fda7:	57                   	push   edi
  50fda8:	50                   	push   eax
  50fda9:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50fdaf:	6a 00                	push   0x0
  50fdb1:	68 09 00 03 68       	push   0x68030009
  50fdb6:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  50fdb9:	50                   	push   eax
  50fdba:	8d 4d b0             	lea    ecx,[ebp-0x50]
  50fdbd:	51                   	push   ecx
  50fdbe:	ff d3                	call   ebx
  50fdc0:	83 c4 10             	add    esp,0x10
  50fdc3:	50                   	push   eax
  50fdc4:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  50fdca:	33 d2                	xor    edx,edx
  50fdcc:	66 3d 64 00          	cmp    ax,0x64
  50fdd0:	0f 94 c2             	sete   dl
  50fdd3:	f7 da                	neg    edx
  50fdd5:	6a 00                	push   0x0
  50fdd7:	68 08 00 03 68       	push   0x68030008
  50fddc:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  50fddf:	50                   	push   eax
  50fde0:	8d 4d a0             	lea    ecx,[ebp-0x60]
  50fde3:	51                   	push   ecx
  50fde4:	89 95 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],edx
  50fdea:	ff d3                	call   ebx
  50fdec:	83 c4 10             	add    esp,0x10
  50fdef:	50                   	push   eax
  50fdf0:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50fdf6:	f7 d0                	not    eax
  50fdf8:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [ebp-0xdc]
  50fdfe:	23 d0                	and    edx,eax
  50fe00:	f7 de                	neg    esi
  50fe02:	23 d6                	and    edx,esi
  50fe04:	66 8b f2             	mov    si,dx
  50fe07:	8d 45 c8             	lea    eax,[ebp-0x38]
  50fe0a:	50                   	push   eax
  50fe0b:	8d 4d cc             	lea    ecx,[ebp-0x34]
  50fe0e:	51                   	push   ecx
  50fe0f:	8d 55 d0             	lea    edx,[ebp-0x30]
  50fe12:	52                   	push   edx
  50fe13:	8d 45 d4             	lea    eax,[ebp-0x2c]
  50fe16:	50                   	push   eax
  50fe17:	6a 04                	push   0x4
  50fe19:	8b 3d 48 10 40 00    	mov    edi,DWORD PTR ds:0x401048
  50fe1f:	ff d7                	call   edi
  50fe21:	8d 4d a0             	lea    ecx,[ebp-0x60]
  50fe24:	51                   	push   ecx
  50fe25:	8d 55 b0             	lea    edx,[ebp-0x50]
  50fe28:	52                   	push   edx
  50fe29:	6a 02                	push   0x2
  50fe2b:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50fe31:	83 c4 20             	add    esp,0x20
  50fe34:	66 85 f6             	test   si,si
  50fe37:	0f 84 86 00 00 00    	je     0x50fec3
  50fe3d:	c7 45 88 00 00 00 00 	mov    DWORD PTR [ebp-0x78],0x0
  50fe44:	c7 45 80 02 00 00 00 	mov    DWORD PTR [ebp-0x80],0x2
  50fe4b:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fe50:	8b 08                	mov    ecx,DWORD PTR [eax]
  50fe52:	50                   	push   eax
  50fe53:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50fe59:	50                   	push   eax
  50fe5a:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50fe5d:	52                   	push   edx
  50fe5e:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fe64:	8b f0                	mov    esi,eax
  50fe66:	8b 06                	mov    eax,DWORD PTR [esi]
  50fe68:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50fe6b:	51                   	push   ecx
  50fe6c:	6a 00                	push   0x0
  50fe6e:	56                   	push   esi
  50fe6f:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50fe72:	db e2                	fnclex
  50fe74:	85 c0                	test   eax,eax
  50fe76:	7d 0f                	jge    0x50fe87
  50fe78:	6a 40                	push   0x40
  50fe7a:	68 68 c9 41 00       	push   0x41c968
  50fe7f:	56                   	push   esi
  50fe80:	50                   	push   eax
  50fe81:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50fe87:	83 ec 10             	sub    esp,0x10
  50fe8a:	8b d4                	mov    edx,esp
  50fe8c:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
  50fe8f:	89 02                	mov    DWORD PTR [edx],eax
  50fe91:	8b 4d 84             	mov    ecx,DWORD PTR [ebp-0x7c]
  50fe94:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  50fe97:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
  50fe9a:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  50fe9d:	8b 4d 8c             	mov    ecx,DWORD PTR [ebp-0x74]
  50fea0:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  50fea3:	68 09 00 03 68       	push   0x68030009
  50fea8:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  50feab:	52                   	push   edx
  50feac:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  50feb2:	8d 45 d0             	lea    eax,[ebp-0x30]
  50feb5:	50                   	push   eax
  50feb6:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  50feb9:	51                   	push   ecx
  50feba:	6a 02                	push   0x2
  50febc:	ff d7                	call   edi
  50febe:	e9 9a 01 00 00       	jmp    0x51005d
  50fec3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  50fec6:	d9 02                	fld    DWORD PTR [edx]
  50fec8:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  50fecb:	d8 18                	fcomp  DWORD PTR [eax]
  50fecd:	df e0                	fnstsw ax
  50fecf:	f6 c4 01             	test   ah,0x1
  50fed2:	75 07                	jne    0x50fedb
  50fed4:	bf 01 00 00 00       	mov    edi,0x1
  50fed9:	eb 02                	jmp    0x50fedd
  50fedb:	33 ff                	xor    edi,edi
  50fedd:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50fee2:	8b 08                	mov    ecx,DWORD PTR [eax]
  50fee4:	50                   	push   eax
  50fee5:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50feeb:	50                   	push   eax
  50feec:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50feef:	52                   	push   edx
  50fef0:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50fef6:	8b f0                	mov    esi,eax
  50fef8:	8b 06                	mov    eax,DWORD PTR [esi]
  50fefa:	8d 4d d0             	lea    ecx,[ebp-0x30]
  50fefd:	51                   	push   ecx
  50fefe:	6a 00                	push   0x0
  50ff00:	56                   	push   esi
  50ff01:	ff 50 40             	call   DWORD PTR [eax+0x40]
  50ff04:	db e2                	fnclex
  50ff06:	85 c0                	test   eax,eax
  50ff08:	7d 0f                	jge    0x50ff19
  50ff0a:	6a 40                	push   0x40
  50ff0c:	68 68 c9 41 00       	push   0x41c968
  50ff11:	56                   	push   esi
  50ff12:	50                   	push   eax
  50ff13:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50ff19:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50ff1e:	8b 10                	mov    edx,DWORD PTR [eax]
  50ff20:	50                   	push   eax
  50ff21:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  50ff27:	50                   	push   eax
  50ff28:	8d 45 cc             	lea    eax,[ebp-0x34]
  50ff2b:	50                   	push   eax
  50ff2c:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50ff32:	8b f0                	mov    esi,eax
  50ff34:	89 b5 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],esi
  50ff3a:	8b 0e                	mov    ecx,DWORD PTR [esi]
  50ff3c:	8d 55 c8             	lea    edx,[ebp-0x38]
  50ff3f:	52                   	push   edx
  50ff40:	6a 00                	push   0x0
  50ff42:	56                   	push   esi
  50ff43:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  50ff46:	db e2                	fnclex
  50ff48:	85 c0                	test   eax,eax
  50ff4a:	7d 0f                	jge    0x50ff5b
  50ff4c:	6a 40                	push   0x40
  50ff4e:	68 68 c9 41 00       	push   0x41c968
  50ff53:	56                   	push   esi
  50ff54:	50                   	push   eax
  50ff55:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50ff5b:	6a 00                	push   0x0
  50ff5d:	68 09 00 03 68       	push   0x68030009
  50ff62:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  50ff65:	50                   	push   eax
  50ff66:	8d 4d b0             	lea    ecx,[ebp-0x50]
  50ff69:	51                   	push   ecx
  50ff6a:	ff d3                	call   ebx
  50ff6c:	83 c4 10             	add    esp,0x10
  50ff6f:	50                   	push   eax
  50ff70:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  50ff76:	66 8b f0             	mov    si,ax
  50ff79:	66 f7 de             	neg    si
  50ff7c:	1b f6                	sbb    esi,esi
  50ff7e:	46                   	inc    esi
  50ff7f:	f7 de                	neg    esi
  50ff81:	6a 00                	push   0x0
  50ff83:	68 08 00 03 68       	push   0x68030008
  50ff88:	8b 55 c8             	mov    edx,DWORD PTR [ebp-0x38]
  50ff8b:	52                   	push   edx
  50ff8c:	8d 45 a0             	lea    eax,[ebp-0x60]
  50ff8f:	50                   	push   eax
  50ff90:	ff d3                	call   ebx
  50ff92:	83 c4 10             	add    esp,0x10
  50ff95:	50                   	push   eax
  50ff96:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  50ff9c:	f7 d0                	not    eax
  50ff9e:	23 f0                	and    esi,eax
  50ffa0:	f7 df                	neg    edi
  50ffa2:	23 f7                	and    esi,edi
  50ffa4:	8d 4d c8             	lea    ecx,[ebp-0x38]
  50ffa7:	51                   	push   ecx
  50ffa8:	8d 55 cc             	lea    edx,[ebp-0x34]
  50ffab:	52                   	push   edx
  50ffac:	8d 45 d0             	lea    eax,[ebp-0x30]
  50ffaf:	50                   	push   eax
  50ffb0:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  50ffb3:	51                   	push   ecx
  50ffb4:	6a 04                	push   0x4
  50ffb6:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  50ffbc:	8d 55 a0             	lea    edx,[ebp-0x60]
  50ffbf:	52                   	push   edx
  50ffc0:	8d 45 b0             	lea    eax,[ebp-0x50]
  50ffc3:	50                   	push   eax
  50ffc4:	6a 02                	push   0x2
  50ffc6:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  50ffcc:	83 c4 20             	add    esp,0x20
  50ffcf:	66 85 f6             	test   si,si
  50ffd2:	0f 84 88 00 00 00    	je     0x510060
  50ffd8:	c7 45 88 64 00 00 00 	mov    DWORD PTR [ebp-0x78],0x64
  50ffdf:	c7 45 80 02 00 00 00 	mov    DWORD PTR [ebp-0x80],0x2
  50ffe6:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50ffeb:	8b 08                	mov    ecx,DWORD PTR [eax]
  50ffed:	50                   	push   eax
  50ffee:	ff 91 bc 05 00 00    	call   DWORD PTR [ecx+0x5bc]
  50fff4:	50                   	push   eax
  50fff5:	8d 55 d4             	lea    edx,[ebp-0x2c]
  50fff8:	52                   	push   edx
  50fff9:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  50ffff:	8b f0                	mov    esi,eax
  510001:	8b 06                	mov    eax,DWORD PTR [esi]
  510003:	8d 4d d0             	lea    ecx,[ebp-0x30]
  510006:	51                   	push   ecx
  510007:	6a 00                	push   0x0
  510009:	56                   	push   esi
  51000a:	ff 50 40             	call   DWORD PTR [eax+0x40]
  51000d:	db e2                	fnclex
  51000f:	85 c0                	test   eax,eax
  510011:	7d 0f                	jge    0x510022
  510013:	6a 40                	push   0x40
  510015:	68 68 c9 41 00       	push   0x41c968
  51001a:	56                   	push   esi
  51001b:	50                   	push   eax
  51001c:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510022:	83 ec 10             	sub    esp,0x10
  510025:	8b d4                	mov    edx,esp
  510027:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
  51002a:	89 02                	mov    DWORD PTR [edx],eax
  51002c:	8b 4d 84             	mov    ecx,DWORD PTR [ebp-0x7c]
  51002f:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  510032:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
  510035:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  510038:	8b 4d 8c             	mov    ecx,DWORD PTR [ebp-0x74]
  51003b:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  51003e:	68 09 00 03 68       	push   0x68030009
  510043:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  510046:	52                   	push   edx
  510047:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  51004d:	8d 45 d0             	lea    eax,[ebp-0x30]
  510050:	50                   	push   eax
  510051:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  510054:	51                   	push   ecx
  510055:	6a 02                	push   0x2
  510057:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  51005d:	83 c4 0c             	add    esp,0xc
  510060:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510065:	8b 10                	mov    edx,DWORD PTR [eax]
  510067:	50                   	push   eax
  510068:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  51006e:	50                   	push   eax
  51006f:	8d 45 d4             	lea    eax,[ebp-0x2c]
  510072:	50                   	push   eax
  510073:	8b 3d 94 10 40 00    	mov    edi,DWORD PTR ds:0x401094
  510079:	ff d7                	call   edi
  51007b:	8b f0                	mov    esi,eax
  51007d:	8b 0e                	mov    ecx,DWORD PTR [esi]
  51007f:	8d 55 d0             	lea    edx,[ebp-0x30]
  510082:	52                   	push   edx
  510083:	6a 00                	push   0x0
  510085:	56                   	push   esi
  510086:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  510089:	db e2                	fnclex
  51008b:	85 c0                	test   eax,eax
  51008d:	7d 0f                	jge    0x51009e
  51008f:	6a 40                	push   0x40
  510091:	68 68 c9 41 00       	push   0x41c968
  510096:	56                   	push   esi
  510097:	50                   	push   eax
  510098:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  51009e:	6a 00                	push   0x0
  5100a0:	68 09 00 03 68       	push   0x68030009
  5100a5:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  5100a8:	50                   	push   eax
  5100a9:	8d 4d b0             	lea    ecx,[ebp-0x50]
  5100ac:	51                   	push   ecx
  5100ad:	ff d3                	call   ebx
  5100af:	83 c4 10             	add    esp,0x10
  5100b2:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5100b7:	8b 10                	mov    edx,DWORD PTR [eax]
  5100b9:	50                   	push   eax
  5100ba:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  5100c0:	50                   	push   eax
  5100c1:	8d 45 cc             	lea    eax,[ebp-0x34]
  5100c4:	50                   	push   eax
  5100c5:	ff d7                	call   edi
  5100c7:	8b f0                	mov    esi,eax
  5100c9:	89 b5 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],esi
  5100cf:	8b 0e                	mov    ecx,DWORD PTR [esi]
  5100d1:	8d 55 c8             	lea    edx,[ebp-0x38]
  5100d4:	52                   	push   edx
  5100d5:	6a 01                	push   0x1
  5100d7:	56                   	push   esi
  5100d8:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  5100db:	db e2                	fnclex
  5100dd:	85 c0                	test   eax,eax
  5100df:	7d 0f                	jge    0x5100f0
  5100e1:	6a 40                	push   0x40
  5100e3:	68 68 c9 41 00       	push   0x41c968
  5100e8:	56                   	push   esi
  5100e9:	50                   	push   eax
  5100ea:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5100f0:	6a 00                	push   0x0
  5100f2:	68 09 00 03 68       	push   0x68030009
  5100f7:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  5100fa:	50                   	push   eax
  5100fb:	8d 4d a0             	lea    ecx,[ebp-0x60]
  5100fe:	51                   	push   ecx
  5100ff:	ff d3                	call   ebx
  510101:	83 c4 10             	add    esp,0x10
  510104:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510109:	8b 10                	mov    edx,DWORD PTR [eax]
  51010b:	50                   	push   eax
  51010c:	ff 92 bc 05 00 00    	call   DWORD PTR [edx+0x5bc]
  510112:	50                   	push   eax
  510113:	8d 45 c4             	lea    eax,[ebp-0x3c]
  510116:	50                   	push   eax
  510117:	ff d7                	call   edi
  510119:	8b f0                	mov    esi,eax
  51011b:	8b 0e                	mov    ecx,DWORD PTR [esi]
  51011d:	8d 55 c0             	lea    edx,[ebp-0x40]
  510120:	52                   	push   edx
  510121:	6a 02                	push   0x2
  510123:	56                   	push   esi
  510124:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  510127:	db e2                	fnclex
  510129:	85 c0                	test   eax,eax
  51012b:	7d 0f                	jge    0x51013c
  51012d:	6a 40                	push   0x40
  51012f:	68 68 c9 41 00       	push   0x41c968
  510134:	56                   	push   esi
  510135:	50                   	push   eax
  510136:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  51013c:	6a 00                	push   0x0
  51013e:	68 09 00 03 68       	push   0x68030009
  510143:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  510146:	50                   	push   eax
  510147:	8d 4d 90             	lea    ecx,[ebp-0x70]
  51014a:	51                   	push   ecx
  51014b:	ff d3                	call   ebx
  51014d:	83 c4 10             	add    esp,0x10
  510150:	8d 55 a0             	lea    edx,[ebp-0x60]
  510153:	52                   	push   edx
  510154:	8b 35 a0 11 40 00    	mov    esi,DWORD PTR ds:0x4011a0
  51015a:	ff d6                	call   esi
  51015c:	66 8b f8             	mov    di,ax
  51015f:	8d 45 b0             	lea    eax,[ebp-0x50]
  510162:	50                   	push   eax
  510163:	ff d6                	call   esi
  510165:	66 03 f8             	add    di,ax
  510168:	0f 80 d0 06 00 00    	jo     0x51083e
  51016e:	0f bf cf             	movsx  ecx,di
  510171:	89 8d 20 ff ff ff    	mov    DWORD PTR [ebp-0xe0],ecx
  510177:	db 85 20 ff ff ff    	fild   DWORD PTR [ebp-0xe0]
  51017d:	d9 9d 1c ff ff ff    	fstp   DWORD PTR [ebp-0xe4]
  510183:	d9 85 1c ff ff ff    	fld    DWORD PTR [ebp-0xe4]
  510189:	8b 55 18             	mov    edx,DWORD PTR [ebp+0x18]
  51018c:	d8 0a                	fmul   DWORD PTR [edx]
  51018e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  510195:	75 08                	jne    0x51019f
  510197:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  51019d:	eb 0b                	jmp    0x5101aa
  51019f:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  5101a5:	e8 7e 45 ef ff       	call   0x404728
  5101aa:	df e0                	fnstsw ax
  5101ac:	a8 0d                	test   al,0xd
  5101ae:	0f 85 85 06 00 00    	jne    0x510839
  5101b4:	d9 9d 18 ff ff ff    	fstp   DWORD PTR [ebp-0xe8]
  5101ba:	8d 45 90             	lea    eax,[ebp-0x70]
  5101bd:	50                   	push   eax
  5101be:	ff d6                	call   esi
  5101c0:	0f bf c8             	movsx  ecx,ax
  5101c3:	89 8d 14 ff ff ff    	mov    DWORD PTR [ebp-0xec],ecx
  5101c9:	db 85 14 ff ff ff    	fild   DWORD PTR [ebp-0xec]
  5101cf:	d9 9d 10 ff ff ff    	fstp   DWORD PTR [ebp-0xf0]
  5101d5:	d9 85 10 ff ff ff    	fld    DWORD PTR [ebp-0xf0]
  5101db:	8b 55 38             	mov    edx,DWORD PTR [ebp+0x38]
  5101de:	d8 0a                	fmul   DWORD PTR [edx]
  5101e0:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5101e7:	75 08                	jne    0x5101f1
  5101e9:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  5101ef:	eb 0b                	jmp    0x5101fc
  5101f1:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  5101f7:	e8 2c 45 ef ff       	call   0x404728
  5101fc:	d8 85 18 ff ff ff    	fadd   DWORD PTR [ebp-0xe8]
  510202:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  510205:	df e0                	fnstsw ax
  510207:	a8 0d                	test   al,0xd
  510209:	0f 85 2a 06 00 00    	jne    0x510839
  51020f:	8d 45 c0             	lea    eax,[ebp-0x40]
  510212:	50                   	push   eax
  510213:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  510216:	51                   	push   ecx
  510217:	8d 55 c8             	lea    edx,[ebp-0x38]
  51021a:	52                   	push   edx
  51021b:	8d 45 cc             	lea    eax,[ebp-0x34]
  51021e:	50                   	push   eax
  51021f:	8d 4d d0             	lea    ecx,[ebp-0x30]
  510222:	51                   	push   ecx
  510223:	8d 55 d4             	lea    edx,[ebp-0x2c]
  510226:	52                   	push   edx
  510227:	6a 06                	push   0x6
  510229:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  51022f:	8d 45 90             	lea    eax,[ebp-0x70]
  510232:	50                   	push   eax
  510233:	8d 4d a0             	lea    ecx,[ebp-0x60]
  510236:	51                   	push   ecx
  510237:	8d 55 b0             	lea    edx,[ebp-0x50]
  51023a:	52                   	push   edx
  51023b:	6a 03                	push   0x3
  51023d:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  510243:	83 c4 2c             	add    esp,0x2c
  510246:	8b 75 24             	mov    esi,DWORD PTR [ebp+0x24]
  510249:	d9 06                	fld    DWORD PTR [esi]
  51024b:	d8 1d 00 b4 54 00    	fcomp  DWORD PTR ds:0x54b400
  510251:	df e0                	fnstsw ax
  510253:	f6 c4 01             	test   ah,0x1
  510256:	8b 7d 2c             	mov    edi,DWORD PTR [ebp+0x2c]
  510259:	74 05                	je     0x510260
  51025b:	66 c7 07 00 00       	mov    WORD PTR [edi],0x0
  510260:	d9 06                	fld    DWORD PTR [esi]
  510262:	d8 1d 08 b4 54 00    	fcomp  DWORD PTR ds:0x54b408
  510268:	df e0                	fnstsw ax
  51026a:	f6 c4 41             	test   ah,0x41
  51026d:	74 07                	je     0x510276
  51026f:	b8 01 00 00 00       	mov    eax,0x1
  510274:	eb 02                	jmp    0x510278
  510276:	33 c0                	xor    eax,eax
  510278:	33 c9                	xor    ecx,ecx
  51027a:	66 83 3f 01          	cmp    WORD PTR [edi],0x1
  51027e:	0f 95 c1             	setne  cl
  510281:	85 c8                	test   eax,ecx
  510283:	0f 85 d5 00 00 00    	jne    0x51035e
  510289:	d9 06                	fld    DWORD PTR [esi]
  51028b:	d8 25 00 b4 54 00    	fsub   DWORD PTR ds:0x54b400
  510291:	d9 05 08 b4 54 00    	fld    DWORD PTR ds:0x54b408
  510297:	d8 25 00 b4 54 00    	fsub   DWORD PTR ds:0x54b400
  51029d:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5102a4:	75 04                	jne    0x5102aa
  5102a6:	de f9                	fdivp  st(1),st
  5102a8:	eb 09                	jmp    0x5102b3
  5102aa:	50                   	push   eax
  5102ab:	b0 0d                	mov    al,0xd
  5102ad:	e8 88 44 ef ff       	call   0x40473a
  5102b2:	58                   	pop    eax
  5102b3:	d9 5d e0             	fstp   DWORD PTR [ebp-0x20]
  5102b6:	df e0                	fnstsw ax
  5102b8:	a8 0d                	test   al,0xd
  5102ba:	0f 85 79 05 00 00    	jne    0x510839
  5102c0:	d9 45 e0             	fld    DWORD PTR [ebp-0x20]
  5102c3:	d8 1d f8 13 40 00    	fcomp  DWORD PTR ds:0x4013f8
  5102c9:	df e0                	fnstsw ax
  5102cb:	f6 c4 01             	test   ah,0x1
  5102ce:	75 07                	jne    0x5102d7
  5102d0:	c7 45 e0 00 00 80 3f 	mov    DWORD PTR [ebp-0x20],0x3f800000
  5102d7:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  5102dd:	d8 65 e0             	fsub   DWORD PTR [ebp-0x20]
  5102e0:	8b 4d 34             	mov    ecx,DWORD PTR [ebp+0x34]
  5102e3:	d8 09                	fmul   DWORD PTR [ecx]
  5102e5:	d9 45 e0             	fld    DWORD PTR [ebp-0x20]
  5102e8:	8b 55 30             	mov    edx,DWORD PTR [ebp+0x30]
  5102eb:	d8 0a                	fmul   DWORD PTR [edx]
  5102ed:	de c1                	faddp  st(1),st
  5102ef:	d8 4d dc             	fmul   DWORD PTR [ebp-0x24]
  5102f2:	8b 75 28             	mov    esi,DWORD PTR [ebp+0x28]
  5102f5:	d9 1e                	fstp   DWORD PTR [esi]
  5102f7:	df e0                	fnstsw ax
  5102f9:	a8 0d                	test   al,0xd
  5102fb:	0f 85 38 05 00 00    	jne    0x510839
  510301:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  510307:	d8 65 e0             	fsub   DWORD PTR [ebp-0x20]
  51030a:	d8 09                	fmul   DWORD PTR [ecx]
  51030c:	d8 0d 24 b7 54 00    	fmul   DWORD PTR ds:0x54b724
  510312:	d9 45 e0             	fld    DWORD PTR [ebp-0x20]
  510315:	d8 0a                	fmul   DWORD PTR [edx]
  510317:	d8 0d 28 b7 54 00    	fmul   DWORD PTR ds:0x54b728
  51031d:	de c1                	faddp  st(1),st
  51031f:	d9 05 f8 13 40 00    	fld    DWORD PTR ds:0x4013f8
  510325:	d8 65 e0             	fsub   DWORD PTR [ebp-0x20]
  510328:	d8 09                	fmul   DWORD PTR [ecx]
  51032a:	d9 45 e0             	fld    DWORD PTR [ebp-0x20]
  51032d:	d8 0a                	fmul   DWORD PTR [edx]
  51032f:	de c1                	faddp  st(1),st
  510331:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  510338:	75 04                	jne    0x51033e
  51033a:	de f9                	fdivp  st(1),st
  51033c:	eb 09                	jmp    0x510347
  51033e:	50                   	push   eax
  51033f:	b0 0d                	mov    al,0xd
  510341:	e8 f4 43 ef ff       	call   0x40473a
  510346:	58                   	pop    eax
  510347:	d9 1d 3c b7 54 00    	fstp   DWORD PTR ds:0x54b73c
  51034d:	df e0                	fnstsw ax
  51034f:	a8 0d                	test   al,0xd
  510351:	0f 85 e2 04 00 00    	jne    0x510839
  510357:	66 c7 07 01 00       	mov    WORD PTR [edi],0x1
  51035c:	eb 38                	jmp    0x510396
  51035e:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  510361:	56                   	push   esi
  510362:	e8 a9 aa f8 ff       	call   0x49ae10
  510367:	d9 1d 3c b7 54 00    	fstp   DWORD PTR ds:0x54b73c
  51036d:	c7 85 5c ff ff ff 02 	mov    DWORD PTR [ebp-0xa4],0x2
  510374:	00 00 00 
  510377:	8d 95 5c ff ff ff    	lea    edx,[ebp-0xa4]
  51037d:	52                   	push   edx
  51037e:	56                   	push   esi
  51037f:	e8 1c b0 f8 ff       	call   0x49b3a0
  510384:	d8 4d dc             	fmul   DWORD PTR [ebp-0x24]
  510387:	8b 75 28             	mov    esi,DWORD PTR [ebp+0x28]
  51038a:	d9 1e                	fstp   DWORD PTR [esi]
  51038c:	df e0                	fnstsw ax
  51038e:	a8 0d                	test   al,0xd
  510390:	0f 85 a3 04 00 00    	jne    0x510839
  510396:	d9 05 ac b6 54 00    	fld    DWORD PTR ds:0x54b6ac
  51039c:	d8 1d c8 28 40 00    	fcomp  DWORD PTR ds:0x4028c8
  5103a2:	df e0                	fnstsw ax
  5103a4:	f6 c4 01             	test   ah,0x1
  5103a7:	74 2a                	je     0x5103d3
  5103a9:	d9 06                	fld    DWORD PTR [esi]
  5103ab:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5103b2:	75 08                	jne    0x5103bc
  5103b4:	d8 35 a0 2f 40 00    	fdiv   DWORD PTR ds:0x402fa0
  5103ba:	eb 0b                	jmp    0x5103c7
  5103bc:	ff 35 a0 2f 40 00    	push   DWORD PTR ds:0x402fa0
  5103c2:	e8 61 43 ef ff       	call   0x404728
  5103c7:	d9 1e                	fstp   DWORD PTR [esi]
  5103c9:	df e0                	fnstsw ax
  5103cb:	a8 0d                	test   al,0xd
  5103cd:	0f 85 66 04 00 00    	jne    0x510839
  5103d3:	d9 05 98 bf 54 00    	fld    DWORD PTR ds:0x54bf98
  5103d9:	d8 1d 5c 35 40 00    	fcomp  DWORD PTR ds:0x40355c
  5103df:	df e0                	fnstsw ax
  5103e1:	f6 c4 01             	test   ah,0x1
  5103e4:	0f 84 90 00 00 00    	je     0x51047a
  5103ea:	33 ff                	xor    edi,edi
  5103ec:	89 3d 9c bf 54 00    	mov    DWORD PTR ds:0x54bf9c,edi
  5103f2:	89 7d 88             	mov    DWORD PTR [ebp-0x78],edi
  5103f5:	c7 45 80 02 00 00 00 	mov    DWORD PTR [ebp-0x80],0x2
  5103fc:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510401:	8b 08                	mov    ecx,DWORD PTR [eax]
  510403:	50                   	push   eax
  510404:	ff 91 3c 04 00 00    	call   DWORD PTR [ecx+0x43c]
  51040a:	50                   	push   eax
  51040b:	8d 55 d4             	lea    edx,[ebp-0x2c]
  51040e:	52                   	push   edx
  51040f:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  510415:	8b f0                	mov    esi,eax
  510417:	8b 06                	mov    eax,DWORD PTR [esi]
  510419:	8d 4d d0             	lea    ecx,[ebp-0x30]
  51041c:	51                   	push   ecx
  51041d:	57                   	push   edi
  51041e:	56                   	push   esi
  51041f:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510422:	db e2                	fnclex
  510424:	3b c7                	cmp    eax,edi
  510426:	7d 0f                	jge    0x510437
  510428:	6a 40                	push   0x40
  51042a:	68 68 c9 41 00       	push   0x41c968
  51042f:	56                   	push   esi
  510430:	50                   	push   eax
  510431:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510437:	83 ec 10             	sub    esp,0x10
  51043a:	8b d4                	mov    edx,esp
  51043c:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
  51043f:	89 02                	mov    DWORD PTR [edx],eax
  510441:	8b 4d 84             	mov    ecx,DWORD PTR [ebp-0x7c]
  510444:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  510447:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
  51044a:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  51044d:	8b 4d 8c             	mov    ecx,DWORD PTR [ebp-0x74]
  510450:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  510453:	68 01 00 03 68       	push   0x68030001
  510458:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  51045b:	52                   	push   edx
  51045c:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  510462:	8d 45 d0             	lea    eax,[ebp-0x30]
  510465:	50                   	push   eax
  510466:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  510469:	51                   	push   ecx
  51046a:	6a 02                	push   0x2
  51046c:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  510472:	83 c4 0c             	add    esp,0xc
  510475:	e9 0f 02 00 00       	jmp    0x510689
  51047a:	d9 05 9c bf 54 00    	fld    DWORD PTR ds:0x54bf9c
  510480:	d8 1d f8 13 40 00    	fcomp  DWORD PTR ds:0x4013f8
  510486:	df e0                	fnstsw ax
  510488:	f6 c4 41             	test   ah,0x41
  51048b:	75 07                	jne    0x510494
  51048d:	bf 01 00 00 00       	mov    edi,0x1
  510492:	eb 02                	jmp    0x510496
  510494:	33 ff                	xor    edi,edi
  510496:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  51049b:	8b 10                	mov    edx,DWORD PTR [eax]
  51049d:	50                   	push   eax
  51049e:	ff 92 3c 04 00 00    	call   DWORD PTR [edx+0x43c]
  5104a4:	50                   	push   eax
  5104a5:	8d 45 d4             	lea    eax,[ebp-0x2c]
  5104a8:	50                   	push   eax
  5104a9:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  5104af:	8b f0                	mov    esi,eax
  5104b1:	8b 0e                	mov    ecx,DWORD PTR [esi]
  5104b3:	8d 55 d0             	lea    edx,[ebp-0x30]
  5104b6:	52                   	push   edx
  5104b7:	6a 00                	push   0x0
  5104b9:	56                   	push   esi
  5104ba:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  5104bd:	db e2                	fnclex
  5104bf:	85 c0                	test   eax,eax
  5104c1:	7d 0f                	jge    0x5104d2
  5104c3:	6a 40                	push   0x40
  5104c5:	68 68 c9 41 00       	push   0x41c968
  5104ca:	56                   	push   esi
  5104cb:	50                   	push   eax
  5104cc:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5104d2:	6a 00                	push   0x0
  5104d4:	68 01 00 03 68       	push   0x68030001
  5104d9:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  5104dc:	50                   	push   eax
  5104dd:	8d 4d b0             	lea    ecx,[ebp-0x50]
  5104e0:	51                   	push   ecx
  5104e1:	ff d3                	call   ebx
  5104e3:	83 c4 10             	add    esp,0x10
  5104e6:	50                   	push   eax
  5104e7:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  5104ed:	66 8b f0             	mov    si,ax
  5104f0:	66 f7 de             	neg    si
  5104f3:	1b f6                	sbb    esi,esi
  5104f5:	46                   	inc    esi
  5104f6:	f7 de                	neg    esi
  5104f8:	f7 df                	neg    edi
  5104fa:	23 f7                	and    esi,edi
  5104fc:	89 b5 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],esi
  510502:	8d 55 d0             	lea    edx,[ebp-0x30]
  510505:	52                   	push   edx
  510506:	8d 45 d4             	lea    eax,[ebp-0x2c]
  510509:	50                   	push   eax
  51050a:	6a 02                	push   0x2
  51050c:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  510512:	83 c4 0c             	add    esp,0xc
  510515:	8d 4d b0             	lea    ecx,[ebp-0x50]
  510518:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  51051e:	66 85 f6             	test   si,si
  510521:	0f 84 57 01 00 00    	je     0x51067e
  510527:	c7 45 88 64 00 00 00 	mov    DWORD PTR [ebp-0x78],0x64
  51052e:	c7 45 80 02 00 00 00 	mov    DWORD PTR [ebp-0x80],0x2
  510535:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  51053a:	8b 08                	mov    ecx,DWORD PTR [eax]
  51053c:	50                   	push   eax
  51053d:	ff 91 3c 04 00 00    	call   DWORD PTR [ecx+0x43c]
  510543:	50                   	push   eax
  510544:	8d 55 d4             	lea    edx,[ebp-0x2c]
  510547:	52                   	push   edx
  510548:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  51054e:	8b f0                	mov    esi,eax
  510550:	8b 06                	mov    eax,DWORD PTR [esi]
  510552:	8d 4d d0             	lea    ecx,[ebp-0x30]
  510555:	51                   	push   ecx
  510556:	6a 00                	push   0x0
  510558:	56                   	push   esi
  510559:	ff 50 40             	call   DWORD PTR [eax+0x40]
  51055c:	db e2                	fnclex
  51055e:	85 c0                	test   eax,eax
  510560:	7d 0f                	jge    0x510571
  510562:	6a 40                	push   0x40
  510564:	68 68 c9 41 00       	push   0x41c968
  510569:	56                   	push   esi
  51056a:	50                   	push   eax
  51056b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510571:	83 ec 10             	sub    esp,0x10
  510574:	8b d4                	mov    edx,esp
  510576:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
  510579:	89 02                	mov    DWORD PTR [edx],eax
  51057b:	8b 4d 84             	mov    ecx,DWORD PTR [ebp-0x7c]
  51057e:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  510581:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
  510584:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  510587:	8b 4d 8c             	mov    ecx,DWORD PTR [ebp-0x74]
  51058a:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  51058d:	68 01 00 03 68       	push   0x68030001
  510592:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  510595:	52                   	push   edx
  510596:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  51059c:	8d 45 d0             	lea    eax,[ebp-0x30]
  51059f:	50                   	push   eax
  5105a0:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  5105a3:	51                   	push   ecx
  5105a4:	6a 02                	push   0x2
  5105a6:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  5105ac:	83 c4 0c             	add    esp,0xc
  5105af:	c7 85 78 ff ff ff cc 	mov    DWORD PTR [ebp-0x88],0x423ecc
  5105b6:	3e 42 00 
  5105b9:	be 08 00 00 00       	mov    esi,0x8
  5105be:	89 b5 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],esi
  5105c4:	8d 95 70 ff ff ff    	lea    edx,[ebp-0x90]
  5105ca:	8d 4d b0             	lea    ecx,[ebp-0x50]
  5105cd:	ff 15 24 12 40 00    	call   DWORD PTR ds:0x401224
  5105d3:	c7 45 88 0c b4 54 00 	mov    DWORD PTR [ebp-0x78],0x54b40c
  5105da:	c7 45 80 04 40 00 00 	mov    DWORD PTR [ebp-0x80],0x4004
  5105e1:	6a 01                	push   0x1
  5105e3:	6a 01                	push   0x1
  5105e5:	8d 55 b0             	lea    edx,[ebp-0x50]
  5105e8:	52                   	push   edx
  5105e9:	8d 45 80             	lea    eax,[ebp-0x80]
  5105ec:	50                   	push   eax
  5105ed:	8d 4d a0             	lea    ecx,[ebp-0x60]
  5105f0:	51                   	push   ecx
  5105f1:	ff 15 5c 10 40 00    	call   DWORD PTR ds:0x40105c
  5105f7:	c7 85 68 ff ff ff d8 	mov    DWORD PTR [ebp-0x98],0x4243d8
  5105fe:	43 42 00 
  510601:	89 b5 60 ff ff ff    	mov    DWORD PTR [ebp-0xa0],esi
  510607:	8d 55 a0             	lea    edx,[ebp-0x60]
  51060a:	52                   	push   edx
  51060b:	8d 85 60 ff ff ff    	lea    eax,[ebp-0xa0]
  510611:	50                   	push   eax
  510612:	8d 4d 90             	lea    ecx,[ebp-0x70]
  510615:	51                   	push   ecx
  510616:	ff 15 98 11 40 00    	call   DWORD PTR ds:0x401198
  51061c:	50                   	push   eax
  51061d:	ff 15 38 10 40 00    	call   DWORD PTR ds:0x401038
  510623:	8b d0                	mov    edx,eax
  510625:	8d 4d d8             	lea    ecx,[ebp-0x28]
  510628:	ff 15 54 12 40 00    	call   DWORD PTR ds:0x401254
  51062e:	a1 28 b0 54 00       	mov    eax,ds:0x54b028
  510633:	8b 10                	mov    edx,DWORD PTR [eax]
  510635:	8d 4d d8             	lea    ecx,[ebp-0x28]
  510638:	51                   	push   ecx
  510639:	50                   	push   eax
  51063a:	ff 92 fc 06 00 00    	call   DWORD PTR [edx+0x6fc]
  510640:	db e2                	fnclex
  510642:	85 c0                	test   eax,eax
  510644:	7d 18                	jge    0x51065e
  510646:	68 fc 06 00 00       	push   0x6fc
  51064b:	68 ac cc 41 00       	push   0x41ccac
  510650:	8b 15 28 b0 54 00    	mov    edx,DWORD PTR ds:0x54b028
  510656:	52                   	push   edx
  510657:	50                   	push   eax
  510658:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  51065e:	8d 4d d8             	lea    ecx,[ebp-0x28]
  510661:	ff 15 84 12 40 00    	call   DWORD PTR ds:0x401284
  510667:	8d 45 90             	lea    eax,[ebp-0x70]
  51066a:	50                   	push   eax
  51066b:	8d 4d a0             	lea    ecx,[ebp-0x60]
  51066e:	51                   	push   ecx
  51066f:	8d 55 b0             	lea    edx,[ebp-0x50]
  510672:	52                   	push   edx
  510673:	6a 03                	push   0x3
  510675:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  51067b:	83 c4 10             	add    esp,0x10
  51067e:	8b 45 28             	mov    eax,DWORD PTR [ebp+0x28]
  510681:	8b 08                	mov    ecx,DWORD PTR [eax]
  510683:	89 0d 9c bf 54 00    	mov    DWORD PTR ds:0x54bf9c,ecx
  510689:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  51068f:	50                   	push   eax
  510690:	8d 55 d4             	lea    edx,[ebp-0x2c]
  510693:	52                   	push   edx
  510694:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  51069a:	8b f0                	mov    esi,eax
  51069c:	8b 06                	mov    eax,DWORD PTR [esi]
  51069e:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  5106a4:	51                   	push   ecx
  5106a5:	56                   	push   esi
  5106a6:	ff 50 1c             	call   DWORD PTR [eax+0x1c]
  5106a9:	db e2                	fnclex
  5106ab:	85 c0                	test   eax,eax
  5106ad:	7d 0f                	jge    0x5106be
  5106af:	6a 1c                	push   0x1c
  5106b1:	68 d0 b0 41 00       	push   0x41b0d0
  5106b6:	56                   	push   esi
  5106b7:	50                   	push   eax
  5106b8:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5106be:	33 d2                	xor    edx,edx
  5106c0:	8b b5 58 ff ff ff    	mov    esi,DWORD PTR [ebp-0xa8]
  5106c6:	85 f6                	test   esi,esi
  5106c8:	0f 9f c2             	setg   dl
  5106cb:	f7 da                	neg    edx
  5106cd:	8b f2                	mov    esi,edx
  5106cf:	89 b5 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],esi
  5106d5:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  5106d8:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  5106de:	66 85 f6             	test   si,si
  5106e1:	0f 84 e7 00 00 00    	je     0x5107ce
  5106e7:	ba 08 44 42 00       	mov    edx,0x424408
  5106ec:	b9 48 b6 54 00       	mov    ecx,0x54b648
  5106f1:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  5106f7:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  5106fc:	85 c0                	test   eax,eax
  5106fe:	75 10                	jne    0x510710
  510700:	68 10 b0 54 00       	push   0x54b010
  510705:	68 8c 7e 40 00       	push   0x407e8c
  51070a:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  510710:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  510716:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  51071b:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  510721:	b9 09 00 00 00       	mov    ecx,0x9
  510726:	89 8d 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],ecx
  51072c:	ba 01 00 00 00       	mov    edx,0x1
  510731:	89 55 88             	mov    DWORD PTR [ebp-0x78],edx
  510734:	c7 45 80 03 00 00 00 	mov    DWORD PTR [ebp-0x80],0x3
  51073b:	8b 3e                	mov    edi,DWORD PTR [esi]
  51073d:	83 ec 10             	sub    esp,0x10
  510740:	8b dc                	mov    ebx,esp
  510742:	89 0b                	mov    DWORD PTR [ebx],ecx
  510744:	8b 8d 74 ff ff ff    	mov    ecx,DWORD PTR [ebp-0x8c]
  51074a:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  51074d:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  510750:	8b 85 7c ff ff ff    	mov    eax,DWORD PTR [ebp-0x84]
  510756:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  510759:	83 ec 10             	sub    esp,0x10
  51075c:	8b cc                	mov    ecx,esp
  51075e:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
  510761:	89 01                	mov    DWORD PTR [ecx],eax
  510763:	8b 45 84             	mov    eax,DWORD PTR [ebp-0x7c]
  510766:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  510769:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  51076c:	8b 55 8c             	mov    edx,DWORD PTR [ebp-0x74]
  51076f:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  510772:	56                   	push   esi
  510773:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  510779:	db e2                	fnclex
  51077b:	85 c0                	test   eax,eax
  51077d:	7d 12                	jge    0x510791
  51077f:	68 b0 02 00 00       	push   0x2b0
  510784:	68 d8 ae 41 00       	push   0x41aed8
  510789:	56                   	push   esi
  51078a:	50                   	push   eax
  51078b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510791:	c7 85 5c ff ff ff 00 	mov    DWORD PTR [ebp-0xa4],0x0
  510798:	00 00 00 
  51079b:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5107a0:	8b 08                	mov    ecx,DWORD PTR [eax]
  5107a2:	8d 95 5c ff ff ff    	lea    edx,[ebp-0xa4]
  5107a8:	52                   	push   edx
  5107a9:	50                   	push   eax
  5107aa:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  5107b0:	db e2                	fnclex
  5107b2:	85 c0                	test   eax,eax
  5107b4:	7d 18                	jge    0x5107ce
  5107b6:	68 fc 06 00 00       	push   0x6fc
  5107bb:	68 34 e4 41 00       	push   0x41e434
  5107c0:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  5107c6:	51                   	push   ecx
  5107c7:	50                   	push   eax
  5107c8:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5107ce:	6a 00                	push   0x0
  5107d0:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  5107d6:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  5107dc:	9b                   	fwait
  5107dd:	68 26 08 51 00       	push   0x510826
  5107e2:	eb 41                	jmp    0x510825
  5107e4:	8d 4d d8             	lea    ecx,[ebp-0x28]
  5107e7:	ff 15 84 12 40 00    	call   DWORD PTR ds:0x401284
  5107ed:	8d 55 c0             	lea    edx,[ebp-0x40]
  5107f0:	52                   	push   edx
  5107f1:	8d 45 c4             	lea    eax,[ebp-0x3c]
  5107f4:	50                   	push   eax
  5107f5:	8d 4d c8             	lea    ecx,[ebp-0x38]
  5107f8:	51                   	push   ecx
  5107f9:	8d 55 cc             	lea    edx,[ebp-0x34]
  5107fc:	52                   	push   edx
  5107fd:	8d 45 d0             	lea    eax,[ebp-0x30]
  510800:	50                   	push   eax
  510801:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  510804:	51                   	push   ecx
  510805:	6a 06                	push   0x6
  510807:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  51080d:	8d 55 90             	lea    edx,[ebp-0x70]
  510810:	52                   	push   edx
  510811:	8d 45 a0             	lea    eax,[ebp-0x60]
  510814:	50                   	push   eax
  510815:	8d 4d b0             	lea    ecx,[ebp-0x50]
  510818:	51                   	push   ecx
  510819:	6a 03                	push   0x3
  51081b:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  510821:	83 c4 2c             	add    esp,0x2c
  510824:	c3                   	ret
  510825:	c3                   	ret
  510826:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  510829:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  510830:	5f                   	pop    edi
  510831:	5e                   	pop    esi
  510832:	5b                   	pop    ebx
  510833:	8b e5                	mov    esp,ebp
  510835:	5d                   	pop    ebp
  510836:	c2 34 00             	ret    0x34
  510839:	e9 de 3e ef ff       	jmp    0x40471c
  51083e:	ff 15 b0 11 40 00    	call   DWORD PTR ds:0x4011b0
  510844:	90                   	nop
  510845:	90                   	nop
  510846:	90                   	nop
  510847:	90                   	nop
  510848:	90                   	nop
  510849:	90                   	nop
  51084a:	90                   	nop
  51084b:	90                   	nop
  51084c:	90                   	nop
  51084d:	90                   	nop
  51084e:	90                   	nop
  51084f:	90                   	nop
