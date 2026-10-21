  510850:	55                   	push   ebp
  510851:	8b ec                	mov    ebp,esp
  510853:	83 ec 14             	sub    esp,0x14
  510856:	68 16 47 40 00       	push   0x404716
  51085b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  510861:	50                   	push   eax
  510862:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  510869:	81 ec 78 01 00 00    	sub    esp,0x178
  51086f:	53                   	push   ebx
  510870:	56                   	push   esi
  510871:	57                   	push   edi
  510872:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  510875:	c7 45 f0 68 35 40 00 	mov    DWORD PTR [ebp-0x10],0x403568
  51087c:	33 f6                	xor    esi,esi
  51087e:	89 75 f4             	mov    DWORD PTR [ebp-0xc],esi
  510881:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
  510884:	89 75 e0             	mov    DWORD PTR [ebp-0x20],esi
  510887:	89 75 dc             	mov    DWORD PTR [ebp-0x24],esi
  51088a:	89 75 d8             	mov    DWORD PTR [ebp-0x28],esi
  51088d:	89 75 d4             	mov    DWORD PTR [ebp-0x2c],esi
  510890:	89 75 d0             	mov    DWORD PTR [ebp-0x30],esi
  510893:	89 75 cc             	mov    DWORD PTR [ebp-0x34],esi
  510896:	89 75 c8             	mov    DWORD PTR [ebp-0x38],esi
  510899:	89 75 b8             	mov    DWORD PTR [ebp-0x48],esi
  51089c:	89 75 a8             	mov    DWORD PTR [ebp-0x58],esi
  51089f:	89 75 98             	mov    DWORD PTR [ebp-0x68],esi
  5108a2:	89 75 88             	mov    DWORD PTR [ebp-0x78],esi
  5108a5:	89 b5 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],esi
  5108ab:	89 b5 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],esi
  5108b1:	89 b5 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],esi
  5108b7:	89 b5 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],esi
  5108bd:	89 b5 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],esi
  5108c3:	89 b5 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],esi
  5108c9:	89 b5 18 ff ff ff    	mov    DWORD PTR [ebp-0xe8],esi
  5108cf:	89 b5 f8 fe ff ff    	mov    DWORD PTR [ebp-0x108],esi
  5108d5:	89 b5 e8 fe ff ff    	mov    DWORD PTR [ebp-0x118],esi
  5108db:	89 b5 e4 fe ff ff    	mov    DWORD PTR [ebp-0x11c],esi
  5108e1:	89 b5 e0 fe ff ff    	mov    DWORD PTR [ebp-0x120],esi
  5108e7:	89 b5 dc fe ff ff    	mov    DWORD PTR [ebp-0x124],esi
  5108ed:	89 b5 d8 fe ff ff    	mov    DWORD PTR [ebp-0x128],esi
  5108f3:	89 b5 cc fe ff ff    	mov    DWORD PTR [ebp-0x134],esi
  5108f9:	6a 01                	push   0x1
  5108fb:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  510901:	89 35 e8 b2 54 00    	mov    DWORD PTR ds:0x54b2e8,esi
  510907:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  51090a:	d9 00                	fld    DWORD PTR [eax]
  51090c:	8b 4d 0c             	mov    ecx,DWORD PTR [ebp+0xc]
  51090f:	d8 19                	fcomp  DWORD PTR [ecx]
  510911:	df e0                	fnstsw ax
  510913:	f6 c4 41             	test   ah,0x41
  510916:	c7 85 ac fe ff ff 01 	mov    DWORD PTR [ebp-0x154],0x1
  51091d:	00 00 00 
  510920:	75 06                	jne    0x510928
  510922:	89 b5 ac fe ff ff    	mov    DWORD PTR [ebp-0x154],esi
  510928:	56                   	push   esi
  510929:	68 0f 00 03 68       	push   0x6803000f
  51092e:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510933:	8b 10                	mov    edx,DWORD PTR [eax]
  510935:	50                   	push   eax
  510936:	ff 92 1c 05 00 00    	call   DWORD PTR [edx+0x51c]
  51093c:	50                   	push   eax
  51093d:	8d 45 dc             	lea    eax,[ebp-0x24]
  510940:	50                   	push   eax
  510941:	8b 35 94 10 40 00    	mov    esi,DWORD PTR ds:0x401094
  510947:	ff d6                	call   esi
  510949:	50                   	push   eax
  51094a:	8d 4d b8             	lea    ecx,[ebp-0x48]
  51094d:	51                   	push   ecx
  51094e:	8b 1d 34 11 40 00    	mov    ebx,DWORD PTR ds:0x401134
  510954:	ff d3                	call   ebx
  510956:	83 c4 10             	add    esp,0x10
  510959:	50                   	push   eax
  51095a:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  510960:	66 8b f8             	mov    di,ax
  510963:	66 f7 df             	neg    di
  510966:	1b ff                	sbb    edi,edi
  510968:	47                   	inc    edi
  510969:	f7 df                	neg    edi
  51096b:	33 d2                	xor    edx,edx
  51096d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  510970:	66 39 10             	cmp    WORD PTR [eax],dx
  510973:	0f 94 c2             	sete   dl
  510976:	f7 da                	neg    edx
  510978:	23 fa                	and    edi,edx
  51097a:	8b 85 ac fe ff ff    	mov    eax,DWORD PTR [ebp-0x154]
  510980:	f7 d8                	neg    eax
  510982:	23 f8                	and    edi,eax
  510984:	8d 4d dc             	lea    ecx,[ebp-0x24]
  510987:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  51098d:	8d 4d b8             	lea    ecx,[ebp-0x48]
  510990:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  510996:	66 85 ff             	test   di,di
  510999:	0f 84 75 03 00 00    	je     0x510d14
  51099f:	8b 4d 1c             	mov    ecx,DWORD PTR [ebp+0x1c]
  5109a2:	8b 11                	mov    edx,DWORD PTR [ecx]
  5109a4:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  5109a7:	89 10                	mov    DWORD PTR [eax],edx
  5109a9:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  5109ac:	66 c7 01 01 00       	mov    WORD PTR [ecx],0x1
  5109b1:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5109b6:	8b 10                	mov    edx,DWORD PTR [eax]
  5109b8:	50                   	push   eax
  5109b9:	ff 92 18 05 00 00    	call   DWORD PTR [edx+0x518]
  5109bf:	50                   	push   eax
  5109c0:	8d 45 dc             	lea    eax,[ebp-0x24]
  5109c3:	50                   	push   eax
  5109c4:	ff d6                	call   esi
  5109c6:	8b f8                	mov    edi,eax
  5109c8:	8b 0f                	mov    ecx,DWORD PTR [edi]
  5109ca:	8d 55 d8             	lea    edx,[ebp-0x28]
  5109cd:	52                   	push   edx
  5109ce:	6a 00                	push   0x0
  5109d0:	57                   	push   edi
  5109d1:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  5109d4:	db e2                	fnclex
  5109d6:	85 c0                	test   eax,eax
  5109d8:	7d 0f                	jge    0x5109e9
  5109da:	6a 40                	push   0x40
  5109dc:	68 68 c9 41 00       	push   0x41c968
  5109e1:	57                   	push   edi
  5109e2:	50                   	push   eax
  5109e3:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5109e9:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5109ee:	8b 08                	mov    ecx,DWORD PTR [eax]
  5109f0:	50                   	push   eax
  5109f1:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  5109f7:	50                   	push   eax
  5109f8:	8d 55 d4             	lea    edx,[ebp-0x2c]
  5109fb:	52                   	push   edx
  5109fc:	ff d6                	call   esi
  5109fe:	8b f8                	mov    edi,eax
  510a00:	89 bd cc fe ff ff    	mov    DWORD PTR [ebp-0x134],edi
  510a06:	8b 07                	mov    eax,DWORD PTR [edi]
  510a08:	8d 4d d0             	lea    ecx,[ebp-0x30]
  510a0b:	51                   	push   ecx
  510a0c:	6a 00                	push   0x0
  510a0e:	57                   	push   edi
  510a0f:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510a12:	db e2                	fnclex
  510a14:	85 c0                	test   eax,eax
  510a16:	7d 0f                	jge    0x510a27
  510a18:	6a 40                	push   0x40
  510a1a:	68 68 c9 41 00       	push   0x41c968
  510a1f:	57                   	push   edi
  510a20:	50                   	push   eax
  510a21:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510a27:	6a 00                	push   0x0
  510a29:	68 05 00 03 68       	push   0x68030005
  510a2e:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  510a31:	52                   	push   edx
  510a32:	8d 45 b8             	lea    eax,[ebp-0x48]
  510a35:	50                   	push   eax
  510a36:	ff d3                	call   ebx
  510a38:	83 c4 10             	add    esp,0x10
  510a3b:	50                   	push   eax
  510a3c:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  510a42:	66 8b f8             	mov    di,ax
  510a45:	66 f7 df             	neg    di
  510a48:	1b ff                	sbb    edi,edi
  510a4a:	47                   	inc    edi
  510a4b:	f7 df                	neg    edi
  510a4d:	6a 00                	push   0x0
  510a4f:	68 04 00 03 68       	push   0x68030004
  510a54:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  510a57:	51                   	push   ecx
  510a58:	8d 55 a8             	lea    edx,[ebp-0x58]
  510a5b:	52                   	push   edx
  510a5c:	ff d3                	call   ebx
  510a5e:	83 c4 10             	add    esp,0x10
  510a61:	50                   	push   eax
  510a62:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  510a68:	f7 d0                	not    eax
  510a6a:	23 f8                	and    edi,eax
  510a6c:	8d 45 d0             	lea    eax,[ebp-0x30]
  510a6f:	50                   	push   eax
  510a70:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  510a73:	51                   	push   ecx
  510a74:	8d 55 d8             	lea    edx,[ebp-0x28]
  510a77:	52                   	push   edx
  510a78:	8d 45 dc             	lea    eax,[ebp-0x24]
  510a7b:	50                   	push   eax
  510a7c:	6a 04                	push   0x4
  510a7e:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  510a84:	8d 4d a8             	lea    ecx,[ebp-0x58]
  510a87:	51                   	push   ecx
  510a88:	8d 55 b8             	lea    edx,[ebp-0x48]
  510a8b:	52                   	push   edx
  510a8c:	6a 02                	push   0x2
  510a8e:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  510a94:	83 c4 20             	add    esp,0x20
  510a97:	66 85 ff             	test   di,di
  510a9a:	0f 84 96 00 00 00    	je     0x510b36
  510aa0:	c7 85 40 ff ff ff 64 	mov    DWORD PTR [ebp-0xc0],0x64
  510aa7:	00 00 00 
  510aaa:	c7 85 38 ff ff ff 02 	mov    DWORD PTR [ebp-0xc8],0x2
  510ab1:	00 00 00 
  510ab4:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510ab9:	8b 08                	mov    ecx,DWORD PTR [eax]
  510abb:	50                   	push   eax
  510abc:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  510ac2:	50                   	push   eax
  510ac3:	8d 55 dc             	lea    edx,[ebp-0x24]
  510ac6:	52                   	push   edx
  510ac7:	ff d6                	call   esi
  510ac9:	8b f8                	mov    edi,eax
  510acb:	8b 07                	mov    eax,DWORD PTR [edi]
  510acd:	8d 4d d8             	lea    ecx,[ebp-0x28]
  510ad0:	51                   	push   ecx
  510ad1:	6a 00                	push   0x0
  510ad3:	57                   	push   edi
  510ad4:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510ad7:	db e2                	fnclex
  510ad9:	85 c0                	test   eax,eax
  510adb:	7d 0f                	jge    0x510aec
  510add:	6a 40                	push   0x40
  510adf:	68 68 c9 41 00       	push   0x41c968
  510ae4:	57                   	push   edi
  510ae5:	50                   	push   eax
  510ae6:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510aec:	83 ec 10             	sub    esp,0x10
  510aef:	8b d4                	mov    edx,esp
  510af1:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc8]
  510af7:	89 02                	mov    DWORD PTR [edx],eax
  510af9:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xc4]
  510aff:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  510b02:	8b 85 40 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc0]
  510b08:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  510b0b:	8b 8d 44 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xbc]
  510b11:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  510b14:	68 05 00 03 68       	push   0x68030005
  510b19:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  510b1c:	52                   	push   edx
  510b1d:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  510b23:	8d 45 d8             	lea    eax,[ebp-0x28]
  510b26:	50                   	push   eax
  510b27:	8d 4d dc             	lea    ecx,[ebp-0x24]
  510b2a:	51                   	push   ecx
  510b2b:	6a 02                	push   0x2
  510b2d:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  510b33:	83 c4 0c             	add    esp,0xc
  510b36:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510b3b:	8b 10                	mov    edx,DWORD PTR [eax]
  510b3d:	50                   	push   eax
  510b3e:	ff 92 18 05 00 00    	call   DWORD PTR [edx+0x518]
  510b44:	50                   	push   eax
  510b45:	8d 45 dc             	lea    eax,[ebp-0x24]
  510b48:	50                   	push   eax
  510b49:	ff d6                	call   esi
  510b4b:	8b f8                	mov    edi,eax
  510b4d:	8b 0f                	mov    ecx,DWORD PTR [edi]
  510b4f:	8d 55 d8             	lea    edx,[ebp-0x28]
  510b52:	52                   	push   edx
  510b53:	6a 01                	push   0x1
  510b55:	57                   	push   edi
  510b56:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  510b59:	db e2                	fnclex
  510b5b:	85 c0                	test   eax,eax
  510b5d:	7d 0f                	jge    0x510b6e
  510b5f:	6a 40                	push   0x40
  510b61:	68 68 c9 41 00       	push   0x41c968
  510b66:	57                   	push   edi
  510b67:	50                   	push   eax
  510b68:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510b6e:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510b73:	8b 08                	mov    ecx,DWORD PTR [eax]
  510b75:	50                   	push   eax
  510b76:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  510b7c:	50                   	push   eax
  510b7d:	8d 55 d4             	lea    edx,[ebp-0x2c]
  510b80:	52                   	push   edx
  510b81:	ff d6                	call   esi
  510b83:	8b f8                	mov    edi,eax
  510b85:	89 bd cc fe ff ff    	mov    DWORD PTR [ebp-0x134],edi
  510b8b:	8b 07                	mov    eax,DWORD PTR [edi]
  510b8d:	8d 4d d0             	lea    ecx,[ebp-0x30]
  510b90:	51                   	push   ecx
  510b91:	6a 01                	push   0x1
  510b93:	57                   	push   edi
  510b94:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510b97:	db e2                	fnclex
  510b99:	85 c0                	test   eax,eax
  510b9b:	7d 0f                	jge    0x510bac
  510b9d:	6a 40                	push   0x40
  510b9f:	68 68 c9 41 00       	push   0x41c968
  510ba4:	57                   	push   edi
  510ba5:	50                   	push   eax
  510ba6:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510bac:	6a 00                	push   0x0
  510bae:	68 05 00 03 68       	push   0x68030005
  510bb3:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  510bb6:	52                   	push   edx
  510bb7:	8d 45 b8             	lea    eax,[ebp-0x48]
  510bba:	50                   	push   eax
  510bbb:	ff d3                	call   ebx
  510bbd:	83 c4 10             	add    esp,0x10
  510bc0:	50                   	push   eax
  510bc1:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  510bc7:	66 8b f8             	mov    di,ax
  510bca:	66 f7 df             	neg    di
  510bcd:	1b ff                	sbb    edi,edi
  510bcf:	47                   	inc    edi
  510bd0:	f7 df                	neg    edi
  510bd2:	6a 00                	push   0x0
  510bd4:	68 04 00 03 68       	push   0x68030004
  510bd9:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  510bdc:	51                   	push   ecx
  510bdd:	8d 55 a8             	lea    edx,[ebp-0x58]
  510be0:	52                   	push   edx
  510be1:	ff d3                	call   ebx
  510be3:	83 c4 10             	add    esp,0x10
  510be6:	50                   	push   eax
  510be7:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  510bed:	f7 d0                	not    eax
  510bef:	23 f8                	and    edi,eax
  510bf1:	8d 45 d0             	lea    eax,[ebp-0x30]
  510bf4:	50                   	push   eax
  510bf5:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  510bf8:	51                   	push   ecx
  510bf9:	8d 55 d8             	lea    edx,[ebp-0x28]
  510bfc:	52                   	push   edx
  510bfd:	8d 45 dc             	lea    eax,[ebp-0x24]
  510c00:	50                   	push   eax
  510c01:	6a 04                	push   0x4
  510c03:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  510c09:	8d 4d a8             	lea    ecx,[ebp-0x58]
  510c0c:	51                   	push   ecx
  510c0d:	8d 55 b8             	lea    edx,[ebp-0x48]
  510c10:	52                   	push   edx
  510c11:	6a 02                	push   0x2
  510c13:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  510c19:	83 c4 20             	add    esp,0x20
  510c1c:	66 85 ff             	test   di,di
  510c1f:	0f 84 96 00 00 00    	je     0x510cbb
  510c25:	c7 85 40 ff ff ff 64 	mov    DWORD PTR [ebp-0xc0],0x64
  510c2c:	00 00 00 
  510c2f:	c7 85 38 ff ff ff 02 	mov    DWORD PTR [ebp-0xc8],0x2
  510c36:	00 00 00 
  510c39:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510c3e:	8b 08                	mov    ecx,DWORD PTR [eax]
  510c40:	50                   	push   eax
  510c41:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  510c47:	50                   	push   eax
  510c48:	8d 55 dc             	lea    edx,[ebp-0x24]
  510c4b:	52                   	push   edx
  510c4c:	ff d6                	call   esi
  510c4e:	8b f8                	mov    edi,eax
  510c50:	8b 07                	mov    eax,DWORD PTR [edi]
  510c52:	8d 4d d8             	lea    ecx,[ebp-0x28]
  510c55:	51                   	push   ecx
  510c56:	6a 01                	push   0x1
  510c58:	57                   	push   edi
  510c59:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510c5c:	db e2                	fnclex
  510c5e:	85 c0                	test   eax,eax
  510c60:	7d 0f                	jge    0x510c71
  510c62:	6a 40                	push   0x40
  510c64:	68 68 c9 41 00       	push   0x41c968
  510c69:	57                   	push   edi
  510c6a:	50                   	push   eax
  510c6b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510c71:	83 ec 10             	sub    esp,0x10
  510c74:	8b d4                	mov    edx,esp
  510c76:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc8]
  510c7c:	89 02                	mov    DWORD PTR [edx],eax
  510c7e:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xc4]
  510c84:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  510c87:	8b 85 40 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc0]
  510c8d:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  510c90:	8b 8d 44 ff ff ff    	mov    ecx,DWORD PTR [ebp-0xbc]
  510c96:	89 4a 0c             	mov    DWORD PTR [edx+0xc],ecx
  510c99:	68 05 00 03 68       	push   0x68030005
  510c9e:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  510ca1:	52                   	push   edx
  510ca2:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  510ca8:	8d 45 d8             	lea    eax,[ebp-0x28]
  510cab:	50                   	push   eax
  510cac:	8d 4d dc             	lea    ecx,[ebp-0x24]
  510caf:	51                   	push   ecx
  510cb0:	6a 02                	push   0x2
  510cb2:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  510cb8:	83 c4 0c             	add    esp,0xc
  510cbb:	33 c0                	xor    eax,eax
  510cbd:	89 85 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],eax
  510cc3:	b9 02 00 00 00       	mov    ecx,0x2
  510cc8:	89 8d 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],ecx
  510cce:	83 ec 10             	sub    esp,0x10
  510cd1:	8b d4                	mov    edx,esp
  510cd3:	89 0a                	mov    DWORD PTR [edx],ecx
  510cd5:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xc4]
  510cdb:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  510cde:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  510ce1:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [ebp-0xbc]
  510ce7:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
  510cea:	68 0f 00 03 68       	push   0x6803000f
  510cef:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510cf4:	8b 08                	mov    ecx,DWORD PTR [eax]
  510cf6:	50                   	push   eax
  510cf7:	ff 91 1c 05 00 00    	call   DWORD PTR [ecx+0x51c]
  510cfd:	50                   	push   eax
  510cfe:	8d 55 dc             	lea    edx,[ebp-0x24]
  510d01:	52                   	push   edx
  510d02:	ff d6                	call   esi
  510d04:	50                   	push   eax
  510d05:	ff 15 64 12 40 00    	call   DWORD PTR ds:0x401264
  510d0b:	8d 4d dc             	lea    ecx,[ebp-0x24]
  510d0e:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  510d14:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510d19:	8b 08                	mov    ecx,DWORD PTR [eax]
  510d1b:	50                   	push   eax
  510d1c:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  510d22:	50                   	push   eax
  510d23:	8d 55 dc             	lea    edx,[ebp-0x24]
  510d26:	52                   	push   edx
  510d27:	ff d6                	call   esi
  510d29:	8b f8                	mov    edi,eax
  510d2b:	8b 07                	mov    eax,DWORD PTR [edi]
  510d2d:	8d 4d d8             	lea    ecx,[ebp-0x28]
  510d30:	51                   	push   ecx
  510d31:	6a 00                	push   0x0
  510d33:	57                   	push   edi
  510d34:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510d37:	db e2                	fnclex
  510d39:	85 c0                	test   eax,eax
  510d3b:	7d 0f                	jge    0x510d4c
  510d3d:	6a 40                	push   0x40
  510d3f:	68 68 c9 41 00       	push   0x41c968
  510d44:	57                   	push   edi
  510d45:	50                   	push   eax
  510d46:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510d4c:	6a 00                	push   0x0
  510d4e:	68 05 00 03 68       	push   0x68030005
  510d53:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  510d56:	52                   	push   edx
  510d57:	8d 45 b8             	lea    eax,[ebp-0x48]
  510d5a:	50                   	push   eax
  510d5b:	ff d3                	call   ebx
  510d5d:	83 c4 10             	add    esp,0x10
  510d60:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510d65:	8b 08                	mov    ecx,DWORD PTR [eax]
  510d67:	50                   	push   eax
  510d68:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  510d6e:	50                   	push   eax
  510d6f:	8d 55 d4             	lea    edx,[ebp-0x2c]
  510d72:	52                   	push   edx
  510d73:	ff d6                	call   esi
  510d75:	8b f8                	mov    edi,eax
  510d77:	89 bd cc fe ff ff    	mov    DWORD PTR [ebp-0x134],edi
  510d7d:	8b 07                	mov    eax,DWORD PTR [edi]
  510d7f:	8d 4d d0             	lea    ecx,[ebp-0x30]
  510d82:	51                   	push   ecx
  510d83:	6a 01                	push   0x1
  510d85:	57                   	push   edi
  510d86:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510d89:	db e2                	fnclex
  510d8b:	85 c0                	test   eax,eax
  510d8d:	7d 0f                	jge    0x510d9e
  510d8f:	6a 40                	push   0x40
  510d91:	68 68 c9 41 00       	push   0x41c968
  510d96:	57                   	push   edi
  510d97:	50                   	push   eax
  510d98:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510d9e:	6a 00                	push   0x0
  510da0:	68 05 00 03 68       	push   0x68030005
  510da5:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  510da8:	52                   	push   edx
  510da9:	8d 45 a8             	lea    eax,[ebp-0x58]
  510dac:	50                   	push   eax
  510dad:	ff d3                	call   ebx
  510daf:	83 c4 10             	add    esp,0x10
  510db2:	c7 85 dc fe ff ff 7c 	mov    DWORD PTR [ebp-0x124],0x54b27c
  510db9:	b2 54 00 
  510dbc:	c7 85 e0 fe ff ff 60 	mov    DWORD PTR [ebp-0x120],0x54b260
  510dc3:	b2 54 00 
  510dc6:	8d 4d a8             	lea    ecx,[ebp-0x58]
  510dc9:	51                   	push   ecx
  510dca:	8b 3d a0 11 40 00    	mov    edi,DWORD PTR ds:0x4011a0
  510dd0:	ff d7                	call   edi
  510dd2:	66 8b d0             	mov    dx,ax
  510dd5:	8d 45 b8             	lea    eax,[ebp-0x48]
  510dd8:	50                   	push   eax
  510dd9:	66 89 95 aa fe ff ff 	mov    WORD PTR [ebp-0x156],dx
  510de0:	ff d7                	call   edi
  510de2:	66 8b 8d aa fe ff ff 	mov    cx,WORD PTR [ebp-0x156]
  510de9:	66 03 c8             	add    cx,ax
  510dec:	0f 80 f9 0c 00 00    	jo     0x511aeb
  510df2:	0f bf d1             	movsx  edx,cx
  510df5:	89 95 a4 fe ff ff    	mov    DWORD PTR [ebp-0x15c],edx
  510dfb:	db 85 a4 fe ff ff    	fild   DWORD PTR [ebp-0x15c]
  510e01:	d9 9d a0 fe ff ff    	fstp   DWORD PTR [ebp-0x160]
  510e07:	8d 85 dc fe ff ff    	lea    eax,[ebp-0x124]
  510e0d:	50                   	push   eax
  510e0e:	8d 8d e0 fe ff ff    	lea    ecx,[ebp-0x120]
  510e14:	51                   	push   ecx
  510e15:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  510e18:	52                   	push   edx
  510e19:	e8 c2 16 00 00       	call   0x5124e0
  510e1e:	d8 8d a0 fe ff ff    	fmul   DWORD PTR [ebp-0x160]
  510e24:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  510e2b:	75 08                	jne    0x510e35
  510e2d:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  510e33:	eb 0b                	jmp    0x510e40
  510e35:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  510e3b:	e8 e8 38 ef ff       	call   0x404728
  510e40:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
  510e43:	d9 19                	fstp   DWORD PTR [ecx]
  510e45:	df e0                	fnstsw ax
  510e47:	a8 0d                	test   al,0xd
  510e49:	0f 85 97 0c 00 00    	jne    0x511ae6
  510e4f:	8d 55 d0             	lea    edx,[ebp-0x30]
  510e52:	52                   	push   edx
  510e53:	8d 45 d4             	lea    eax,[ebp-0x2c]
  510e56:	50                   	push   eax
  510e57:	8d 4d d8             	lea    ecx,[ebp-0x28]
  510e5a:	51                   	push   ecx
  510e5b:	8d 55 dc             	lea    edx,[ebp-0x24]
  510e5e:	52                   	push   edx
  510e5f:	6a 04                	push   0x4
  510e61:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  510e67:	8d 45 a8             	lea    eax,[ebp-0x58]
  510e6a:	50                   	push   eax
  510e6b:	8d 4d b8             	lea    ecx,[ebp-0x48]
  510e6e:	51                   	push   ecx
  510e6f:	6a 02                	push   0x2
  510e71:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  510e77:	83 c4 20             	add    esp,0x20
  510e7a:	6a 00                	push   0x0
  510e7c:	68 0f 00 03 68       	push   0x6803000f
  510e81:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510e86:	8b 10                	mov    edx,DWORD PTR [eax]
  510e88:	50                   	push   eax
  510e89:	ff 92 1c 05 00 00    	call   DWORD PTR [edx+0x51c]
  510e8f:	50                   	push   eax
  510e90:	8d 45 dc             	lea    eax,[ebp-0x24]
  510e93:	50                   	push   eax
  510e94:	ff d6                	call   esi
  510e96:	50                   	push   eax
  510e97:	8d 4d b8             	lea    ecx,[ebp-0x48]
  510e9a:	51                   	push   ecx
  510e9b:	ff d3                	call   ebx
  510e9d:	83 c4 10             	add    esp,0x10
  510ea0:	50                   	push   eax
  510ea1:	ff d7                	call   edi
  510ea3:	33 d2                	xor    edx,edx
  510ea5:	66 3d 02 00          	cmp    ax,0x2
  510ea9:	0f 94 c2             	sete   dl
  510eac:	f7 da                	neg    edx
  510eae:	66 8b fa             	mov    di,dx
  510eb1:	8d 4d dc             	lea    ecx,[ebp-0x24]
  510eb4:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  510eba:	8d 4d b8             	lea    ecx,[ebp-0x48]
  510ebd:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  510ec3:	66 85 ff             	test   di,di
  510ec6:	0f 84 dc 03 00 00    	je     0x5112a8
  510ecc:	d9 05 fc b2 54 00    	fld    DWORD PTR ds:0x54b2fc
  510ed2:	d8 0d f0 30 40 00    	fmul   DWORD PTR ds:0x4030f0
  510ed8:	df e0                	fnstsw ax
  510eda:	a8 0d                	test   al,0xd
  510edc:	0f 85 04 0c 00 00    	jne    0x511ae6
  510ee2:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  510ee8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  510eeb:	d8 18                	fcomp  DWORD PTR [eax]
  510eed:	df e0                	fnstsw ax
  510eef:	f6 c4 41             	test   ah,0x41
  510ef2:	0f 85 87 03 00 00    	jne    0x51127f
  510ef8:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510efd:	8b 08                	mov    ecx,DWORD PTR [eax]
  510eff:	50                   	push   eax
  510f00:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  510f06:	50                   	push   eax
  510f07:	8d 55 dc             	lea    edx,[ebp-0x24]
  510f0a:	52                   	push   edx
  510f0b:	ff d6                	call   esi
  510f0d:	8b f8                	mov    edi,eax
  510f0f:	8b 07                	mov    eax,DWORD PTR [edi]
  510f11:	8d 4d d8             	lea    ecx,[ebp-0x28]
  510f14:	51                   	push   ecx
  510f15:	6a 00                	push   0x0
  510f17:	57                   	push   edi
  510f18:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510f1b:	db e2                	fnclex
  510f1d:	85 c0                	test   eax,eax
  510f1f:	7d 0f                	jge    0x510f30
  510f21:	6a 40                	push   0x40
  510f23:	68 68 c9 41 00       	push   0x41c968
  510f28:	57                   	push   edi
  510f29:	50                   	push   eax
  510f2a:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510f30:	6a 00                	push   0x0
  510f32:	68 05 00 03 68       	push   0x68030005
  510f37:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  510f3a:	52                   	push   edx
  510f3b:	8d 45 b8             	lea    eax,[ebp-0x48]
  510f3e:	50                   	push   eax
  510f3f:	ff d3                	call   ebx
  510f41:	83 c4 10             	add    esp,0x10
  510f44:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510f49:	8b 08                	mov    ecx,DWORD PTR [eax]
  510f4b:	50                   	push   eax
  510f4c:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  510f52:	50                   	push   eax
  510f53:	8d 55 d4             	lea    edx,[ebp-0x2c]
  510f56:	52                   	push   edx
  510f57:	ff d6                	call   esi
  510f59:	8b f8                	mov    edi,eax
  510f5b:	89 bd cc fe ff ff    	mov    DWORD PTR [ebp-0x134],edi
  510f61:	8b 07                	mov    eax,DWORD PTR [edi]
  510f63:	8d 4d d0             	lea    ecx,[ebp-0x30]
  510f66:	51                   	push   ecx
  510f67:	6a 01                	push   0x1
  510f69:	57                   	push   edi
  510f6a:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510f6d:	db e2                	fnclex
  510f6f:	85 c0                	test   eax,eax
  510f71:	7d 0f                	jge    0x510f82
  510f73:	6a 40                	push   0x40
  510f75:	68 68 c9 41 00       	push   0x41c968
  510f7a:	57                   	push   edi
  510f7b:	50                   	push   eax
  510f7c:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510f82:	6a 00                	push   0x0
  510f84:	68 05 00 03 68       	push   0x68030005
  510f89:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  510f8c:	52                   	push   edx
  510f8d:	8d 45 a8             	lea    eax,[ebp-0x58]
  510f90:	50                   	push   eax
  510f91:	ff d3                	call   ebx
  510f93:	83 c4 10             	add    esp,0x10
  510f96:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  510f9b:	8b 08                	mov    ecx,DWORD PTR [eax]
  510f9d:	50                   	push   eax
  510f9e:	ff 91 20 05 00 00    	call   DWORD PTR [ecx+0x520]
  510fa4:	50                   	push   eax
  510fa5:	8d 55 cc             	lea    edx,[ebp-0x34]
  510fa8:	52                   	push   edx
  510fa9:	ff d6                	call   esi
  510fab:	8b f8                	mov    edi,eax
  510fad:	8b 07                	mov    eax,DWORD PTR [edi]
  510faf:	8d 4d c8             	lea    ecx,[ebp-0x38]
  510fb2:	51                   	push   ecx
  510fb3:	6a 00                	push   0x0
  510fb5:	57                   	push   edi
  510fb6:	ff 50 40             	call   DWORD PTR [eax+0x40]
  510fb9:	db e2                	fnclex
  510fbb:	85 c0                	test   eax,eax
  510fbd:	7d 0f                	jge    0x510fce
  510fbf:	6a 40                	push   0x40
  510fc1:	68 68 c9 41 00       	push   0x41c968
  510fc6:	57                   	push   edi
  510fc7:	50                   	push   eax
  510fc8:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  510fce:	6a 00                	push   0x0
  510fd0:	68 00 00 03 68       	push   0x68030000
  510fd5:	8b 55 c8             	mov    edx,DWORD PTR [ebp-0x38]
  510fd8:	52                   	push   edx
  510fd9:	8d 45 98             	lea    eax,[ebp-0x68]
  510fdc:	50                   	push   eax
  510fdd:	ff d3                	call   ebx
  510fdf:	83 c4 10             	add    esp,0x10
  510fe2:	8d 4d a8             	lea    ecx,[ebp-0x58]
  510fe5:	51                   	push   ecx
  510fe6:	8b 3d a0 11 40 00    	mov    edi,DWORD PTR ds:0x4011a0
  510fec:	ff d7                	call   edi
  510fee:	66 8b d0             	mov    dx,ax
  510ff1:	8d 45 b8             	lea    eax,[ebp-0x48]
  510ff4:	50                   	push   eax
  510ff5:	66 89 95 9e fe ff ff 	mov    WORD PTR [ebp-0x162],dx
  510ffc:	ff d7                	call   edi
  510ffe:	66 8b 8d 9e fe ff ff 	mov    cx,WORD PTR [ebp-0x162]
  511005:	66 03 c8             	add    cx,ax
  511008:	0f 80 dd 0a 00 00    	jo     0x511aeb
  51100e:	0f bf d1             	movsx  edx,cx
  511011:	89 95 98 fe ff ff    	mov    DWORD PTR [ebp-0x168],edx
  511017:	db 85 98 fe ff ff    	fild   DWORD PTR [ebp-0x168]
  51101d:	d9 9d 94 fe ff ff    	fstp   DWORD PTR [ebp-0x16c]
  511023:	d9 85 94 fe ff ff    	fld    DWORD PTR [ebp-0x16c]
  511029:	d8 0d 78 b5 54 00    	fmul   DWORD PTR ds:0x54b578
  51102f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  511036:	75 08                	jne    0x511040
  511038:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  51103e:	eb 0b                	jmp    0x51104b
  511040:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  511046:	e8 dd 36 ef ff       	call   0x404728
  51104b:	8b 45 24             	mov    eax,DWORD PTR [ebp+0x24]
  51104e:	d9 00                	fld    DWORD PTR [eax]
  511050:	8b 45 28             	mov    eax,DWORD PTR [ebp+0x28]
  511053:	d8 20                	fsub   DWORD PTR [eax]
  511055:	de c9                	fmulp  st(1),st
  511057:	d9 05 9c 32 40 00    	fld    DWORD PTR ds:0x40329c
  51105d:	d8 20                	fsub   DWORD PTR [eax]
  51105f:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  511066:	75 04                	jne    0x51106c
  511068:	de f9                	fdivp  st(1),st
  51106a:	eb 09                	jmp    0x511075
  51106c:	50                   	push   eax
  51106d:	b0 0d                	mov    al,0xd
  51106f:	e8 c6 36 ef ff       	call   0x40473a
  511074:	58                   	pop    eax
  511075:	df e0                	fnstsw ax
  511077:	a8 0d                	test   al,0xd
  511079:	0f 85 67 0a 00 00    	jne    0x511ae6
  51107f:	d9 9d 90 fe ff ff    	fstp   DWORD PTR [ebp-0x170]
  511085:	8d 4d 98             	lea    ecx,[ebp-0x68]
  511088:	51                   	push   ecx
  511089:	ff d7                	call   edi
  51108b:	0f bf d0             	movsx  edx,ax
  51108e:	89 95 8c fe ff ff    	mov    DWORD PTR [ebp-0x174],edx
  511094:	db 85 8c fe ff ff    	fild   DWORD PTR [ebp-0x174]
  51109a:	d9 9d 88 fe ff ff    	fstp   DWORD PTR [ebp-0x178]
  5110a0:	d9 85 90 fe ff ff    	fld    DWORD PTR [ebp-0x170]
  5110a6:	d8 8d 88 fe ff ff    	fmul   DWORD PTR [ebp-0x178]
  5110ac:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5110b3:	75 08                	jne    0x5110bd
  5110b5:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  5110bb:	eb 0b                	jmp    0x5110c8
  5110bd:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  5110c3:	e8 60 36 ef ff       	call   0x404728
  5110c8:	8b 4d 20             	mov    ecx,DWORD PTR [ebp+0x20]
  5110cb:	d9 19                	fstp   DWORD PTR [ecx]
  5110cd:	df e0                	fnstsw ax
  5110cf:	a8 0d                	test   al,0xd
  5110d1:	0f 85 0f 0a 00 00    	jne    0x511ae6
  5110d7:	8d 55 c8             	lea    edx,[ebp-0x38]
  5110da:	52                   	push   edx
  5110db:	8d 45 cc             	lea    eax,[ebp-0x34]
  5110de:	50                   	push   eax
  5110df:	8d 4d d0             	lea    ecx,[ebp-0x30]
  5110e2:	51                   	push   ecx
  5110e3:	8d 55 d4             	lea    edx,[ebp-0x2c]
  5110e6:	52                   	push   edx
  5110e7:	8d 45 d8             	lea    eax,[ebp-0x28]
  5110ea:	50                   	push   eax
  5110eb:	8d 4d dc             	lea    ecx,[ebp-0x24]
  5110ee:	51                   	push   ecx
  5110ef:	6a 06                	push   0x6
  5110f1:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  5110f7:	8d 55 98             	lea    edx,[ebp-0x68]
  5110fa:	52                   	push   edx
  5110fb:	8d 45 a8             	lea    eax,[ebp-0x58]
  5110fe:	50                   	push   eax
  5110ff:	8d 4d b8             	lea    ecx,[ebp-0x48]
  511102:	51                   	push   ecx
  511103:	6a 03                	push   0x3
  511105:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  51110b:	83 c4 2c             	add    esp,0x2c
  51110e:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  511111:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
  511117:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  51111c:	8b 08                	mov    ecx,DWORD PTR [eax]
  51111e:	50                   	push   eax
  51111f:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  511125:	50                   	push   eax
  511126:	8d 55 dc             	lea    edx,[ebp-0x24]
  511129:	52                   	push   edx
  51112a:	ff d6                	call   esi
  51112c:	8b f8                	mov    edi,eax
  51112e:	8b 07                	mov    eax,DWORD PTR [edi]
  511130:	8d 4d d8             	lea    ecx,[ebp-0x28]
  511133:	51                   	push   ecx
  511134:	6a 00                	push   0x0
  511136:	57                   	push   edi
  511137:	ff 50 40             	call   DWORD PTR [eax+0x40]
  51113a:	db e2                	fnclex
  51113c:	85 c0                	test   eax,eax
  51113e:	7d 0f                	jge    0x51114f
  511140:	6a 40                	push   0x40
  511142:	68 68 c9 41 00       	push   0x41c968
  511147:	57                   	push   edi
  511148:	50                   	push   eax
  511149:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  51114f:	6a 00                	push   0x0
  511151:	68 05 00 03 68       	push   0x68030005
  511156:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  511159:	52                   	push   edx
  51115a:	8d 45 b8             	lea    eax,[ebp-0x48]
  51115d:	50                   	push   eax
  51115e:	ff d3                	call   ebx
  511160:	83 c4 10             	add    esp,0x10
  511163:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  511168:	8b 08                	mov    ecx,DWORD PTR [eax]
  51116a:	50                   	push   eax
  51116b:	ff 91 18 05 00 00    	call   DWORD PTR [ecx+0x518]
  511171:	50                   	push   eax
  511172:	8d 55 d4             	lea    edx,[ebp-0x2c]
  511175:	52                   	push   edx
  511176:	ff d6                	call   esi
  511178:	8b f0                	mov    esi,eax
  51117a:	89 b5 cc fe ff ff    	mov    DWORD PTR [ebp-0x134],esi
  511180:	8b 06                	mov    eax,DWORD PTR [esi]
  511182:	8d 4d d0             	lea    ecx,[ebp-0x30]
  511185:	51                   	push   ecx
  511186:	6a 01                	push   0x1
  511188:	56                   	push   esi
  511189:	ff 50 40             	call   DWORD PTR [eax+0x40]
  51118c:	db e2                	fnclex
  51118e:	85 c0                	test   eax,eax
  511190:	7d 0f                	jge    0x5111a1
  511192:	6a 40                	push   0x40
  511194:	68 68 c9 41 00       	push   0x41c968
  511199:	56                   	push   esi
  51119a:	50                   	push   eax
  51119b:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5111a1:	6a 00                	push   0x0
  5111a3:	68 05 00 03 68       	push   0x68030005
  5111a8:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  5111ab:	52                   	push   edx
  5111ac:	8d 45 a8             	lea    eax,[ebp-0x58]
  5111af:	50                   	push   eax
  5111b0:	ff d3                	call   ebx
  5111b2:	83 c4 10             	add    esp,0x10
  5111b5:	c7 85 d8 fe ff ff 7c 	mov    DWORD PTR [ebp-0x128],0x54b27c
  5111bc:	b2 54 00 
  5111bf:	c7 85 dc fe ff ff 60 	mov    DWORD PTR [ebp-0x124],0x54b260
  5111c6:	b2 54 00 
  5111c9:	c7 85 e0 fe ff ff 00 	mov    DWORD PTR [ebp-0x120],0x42c80000
  5111d0:	00 c8 42 
  5111d3:	8d 4d a8             	lea    ecx,[ebp-0x58]
  5111d6:	51                   	push   ecx
  5111d7:	8b 35 a0 11 40 00    	mov    esi,DWORD PTR ds:0x4011a0
  5111dd:	ff d6                	call   esi
  5111df:	66 8b f8             	mov    di,ax
  5111e2:	8d 55 b8             	lea    edx,[ebp-0x48]
  5111e5:	52                   	push   edx
  5111e6:	ff d6                	call   esi
  5111e8:	66 03 f8             	add    di,ax
  5111eb:	0f 80 fa 08 00 00    	jo     0x511aeb
  5111f1:	0f bf c7             	movsx  eax,di
  5111f4:	89 85 84 fe ff ff    	mov    DWORD PTR [ebp-0x17c],eax
  5111fa:	db 85 84 fe ff ff    	fild   DWORD PTR [ebp-0x17c]
  511200:	d9 9d 80 fe ff ff    	fstp   DWORD PTR [ebp-0x180]
  511206:	8d 8d d8 fe ff ff    	lea    ecx,[ebp-0x128]
  51120c:	51                   	push   ecx
  51120d:	8d 95 dc fe ff ff    	lea    edx,[ebp-0x124]
  511213:	52                   	push   edx
  511214:	8d 85 e0 fe ff ff    	lea    eax,[ebp-0x120]
  51121a:	50                   	push   eax
  51121b:	e8 c0 12 00 00       	call   0x5124e0
  511220:	d8 8d 80 fe ff ff    	fmul   DWORD PTR [ebp-0x180]
  511226:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51122d:	75 08                	jne    0x511237
  51122f:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  511235:	eb 0b                	jmp    0x511242
  511237:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  51123d:	e8 e6 34 ef ff       	call   0x404728
  511242:	d9 1d e8 b2 54 00    	fstp   DWORD PTR ds:0x54b2e8
  511248:	df e0                	fnstsw ax
  51124a:	a8 0d                	test   al,0xd
  51124c:	0f 85 94 08 00 00    	jne    0x511ae6
  511252:	8d 4d d0             	lea    ecx,[ebp-0x30]
  511255:	51                   	push   ecx
  511256:	8d 55 d4             	lea    edx,[ebp-0x2c]
  511259:	52                   	push   edx
  51125a:	8d 45 d8             	lea    eax,[ebp-0x28]
  51125d:	50                   	push   eax
  51125e:	8d 4d dc             	lea    ecx,[ebp-0x24]
  511261:	51                   	push   ecx
  511262:	6a 04                	push   0x4
  511264:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  51126a:	8d 55 a8             	lea    edx,[ebp-0x58]
  51126d:	52                   	push   edx
  51126e:	8d 45 b8             	lea    eax,[ebp-0x48]
  511271:	50                   	push   eax
  511272:	6a 02                	push   0x2
  511274:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  51127a:	83 c4 20             	add    esp,0x20
  51127d:	eb 12                	jmp    0x511291
  51127f:	8b 4d 20             	mov    ecx,DWORD PTR [ebp+0x20]
  511282:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
  511288:	8b 55 14             	mov    edx,DWORD PTR [ebp+0x14]
  51128b:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
  511291:	8b 45 2c             	mov    eax,DWORD PTR [ebp+0x2c]
  511294:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  51129a:	8b 4d 30             	mov    ecx,DWORD PTR [ebp+0x30]
  51129d:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
  5112a3:	e9 5f 06 00 00       	jmp    0x511907
  5112a8:	6a 00                	push   0x0
  5112aa:	68 0f 00 03 68       	push   0x6803000f
  5112af:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5112b4:	8b 10                	mov    edx,DWORD PTR [eax]
  5112b6:	50                   	push   eax
  5112b7:	ff 92 1c 05 00 00    	call   DWORD PTR [edx+0x51c]
  5112bd:	50                   	push   eax
  5112be:	8d 45 dc             	lea    eax,[ebp-0x24]
  5112c1:	50                   	push   eax
  5112c2:	ff d6                	call   esi
  5112c4:	50                   	push   eax
  5112c5:	8d 4d b8             	lea    ecx,[ebp-0x48]
  5112c8:	51                   	push   ecx
  5112c9:	ff d3                	call   ebx
  5112cb:	83 c4 10             	add    esp,0x10
  5112ce:	50                   	push   eax
  5112cf:	ff 15 a0 11 40 00    	call   DWORD PTR ds:0x4011a0
  5112d5:	66 8b f8             	mov    di,ax
  5112d8:	66 4f                	dec    di
  5112da:	66 f7 df             	neg    di
  5112dd:	1b ff                	sbb    edi,edi
  5112df:	47                   	inc    edi
  5112e0:	f7 df                	neg    edi
  5112e2:	8d 4d dc             	lea    ecx,[ebp-0x24]
  5112e5:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  5112eb:	8d 4d b8             	lea    ecx,[ebp-0x48]
  5112ee:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  5112f4:	66 85 ff             	test   di,di
  5112f7:	0f 84 ad 02 00 00    	je     0x5115aa
  5112fd:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  511302:	8b 10                	mov    edx,DWORD PTR [eax]
  511304:	50                   	push   eax
  511305:	ff 92 18 05 00 00    	call   DWORD PTR [edx+0x518]
  51130b:	50                   	push   eax
  51130c:	8d 45 dc             	lea    eax,[ebp-0x24]
  51130f:	50                   	push   eax
  511310:	ff d6                	call   esi
  511312:	8b f8                	mov    edi,eax
  511314:	8b 0f                	mov    ecx,DWORD PTR [edi]
  511316:	8d 55 d8             	lea    edx,[ebp-0x28]
  511319:	52                   	push   edx
  51131a:	6a 00                	push   0x0
  51131c:	57                   	push   edi
  51131d:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  511320:	db e2                	fnclex
  511322:	85 c0                	test   eax,eax
  511324:	7d 0f                	jge    0x511335
  511326:	6a 40                	push   0x40
  511328:	68 68 c9 41 00       	push   0x41c968
  51132d:	57                   	push   edi
  51132e:	50                   	push   eax
  51132f:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  511335:	6a 00                	push   0x0
  511337:	68 05 00 03 68       	push   0x68030005
  51133c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  51133f:	50                   	push   eax
  511340:	8d 4d b8             	lea    ecx,[ebp-0x48]
  511343:	51                   	push   ecx
  511344:	ff d3                	call   ebx
  511346:	83 c4 10             	add    esp,0x10
  511349:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  51134e:	8b 10                	mov    edx,DWORD PTR [eax]
  511350:	50                   	push   eax
  511351:	ff 92 18 05 00 00    	call   DWORD PTR [edx+0x518]
  511357:	50                   	push   eax
  511358:	8d 45 d4             	lea    eax,[ebp-0x2c]
  51135b:	50                   	push   eax
  51135c:	ff d6                	call   esi
  51135e:	8b f8                	mov    edi,eax
  511360:	89 bd cc fe ff ff    	mov    DWORD PTR [ebp-0x134],edi
  511366:	8b 0f                	mov    ecx,DWORD PTR [edi]
  511368:	8d 55 d0             	lea    edx,[ebp-0x30]
  51136b:	52                   	push   edx
  51136c:	6a 01                	push   0x1
  51136e:	57                   	push   edi
  51136f:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  511372:	db e2                	fnclex
  511374:	85 c0                	test   eax,eax
  511376:	7d 0f                	jge    0x511387
  511378:	6a 40                	push   0x40
  51137a:	68 68 c9 41 00       	push   0x41c968
  51137f:	57                   	push   edi
  511380:	50                   	push   eax
  511381:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  511387:	6a 00                	push   0x0
  511389:	68 05 00 03 68       	push   0x68030005
  51138e:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  511391:	50                   	push   eax
  511392:	8d 4d a8             	lea    ecx,[ebp-0x58]
  511395:	51                   	push   ecx
  511396:	ff d3                	call   ebx
  511398:	83 c4 10             	add    esp,0x10
  51139b:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5113a0:	8b 10                	mov    edx,DWORD PTR [eax]
  5113a2:	50                   	push   eax
  5113a3:	ff 92 20 05 00 00    	call   DWORD PTR [edx+0x520]
  5113a9:	50                   	push   eax
  5113aa:	8d 45 cc             	lea    eax,[ebp-0x34]
  5113ad:	50                   	push   eax
  5113ae:	ff d6                	call   esi
  5113b0:	8b f0                	mov    esi,eax
  5113b2:	8b 0e                	mov    ecx,DWORD PTR [esi]
  5113b4:	8d 55 c8             	lea    edx,[ebp-0x38]
  5113b7:	52                   	push   edx
  5113b8:	6a 00                	push   0x0
  5113ba:	56                   	push   esi
  5113bb:	ff 51 40             	call   DWORD PTR [ecx+0x40]
  5113be:	db e2                	fnclex
  5113c0:	85 c0                	test   eax,eax
  5113c2:	7d 0f                	jge    0x5113d3
  5113c4:	6a 40                	push   0x40
  5113c6:	68 68 c9 41 00       	push   0x41c968
  5113cb:	56                   	push   esi
  5113cc:	50                   	push   eax
  5113cd:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5113d3:	6a 00                	push   0x0
  5113d5:	68 00 00 03 68       	push   0x68030000
  5113da:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  5113dd:	50                   	push   eax
  5113de:	8d 4d 98             	lea    ecx,[ebp-0x68]
  5113e1:	51                   	push   ecx
  5113e2:	ff d3                	call   ebx
  5113e4:	83 c4 10             	add    esp,0x10
  5113e7:	8d 55 a8             	lea    edx,[ebp-0x58]
  5113ea:	52                   	push   edx
  5113eb:	8b 3d a0 11 40 00    	mov    edi,DWORD PTR ds:0x4011a0
  5113f1:	ff d7                	call   edi
  5113f3:	66 8b f0             	mov    si,ax
  5113f6:	8d 45 b8             	lea    eax,[ebp-0x48]
  5113f9:	50                   	push   eax
  5113fa:	ff d7                	call   edi
  5113fc:	66 03 f0             	add    si,ax
  5113ff:	0f 80 e6 06 00 00    	jo     0x511aeb
  511405:	0f bf ce             	movsx  ecx,si
  511408:	89 8d 7c fe ff ff    	mov    DWORD PTR [ebp-0x184],ecx
  51140e:	db 85 7c fe ff ff    	fild   DWORD PTR [ebp-0x184]
  511414:	d9 9d 78 fe ff ff    	fstp   DWORD PTR [ebp-0x188]
  51141a:	d9 85 78 fe ff ff    	fld    DWORD PTR [ebp-0x188]
  511420:	d8 0d 78 b5 54 00    	fmul   DWORD PTR ds:0x54b578
  511426:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51142d:	75 08                	jne    0x511437
  51142f:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  511435:	eb 0b                	jmp    0x511442
  511437:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  51143d:	e8 e6 32 ef ff       	call   0x404728
  511442:	8b 5d 34             	mov    ebx,DWORD PTR [ebp+0x34]
  511445:	d9 03                	fld    DWORD PTR [ebx]
  511447:	8b 75 28             	mov    esi,DWORD PTR [ebp+0x28]
  51144a:	d8 26                	fsub   DWORD PTR [esi]
  51144c:	de c9                	fmulp  st(1),st
  51144e:	d9 05 9c 32 40 00    	fld    DWORD PTR ds:0x40329c
  511454:	d8 26                	fsub   DWORD PTR [esi]
  511456:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51145d:	75 04                	jne    0x511463
  51145f:	de f9                	fdivp  st(1),st
  511461:	eb 09                	jmp    0x51146c
  511463:	50                   	push   eax
  511464:	b0 0d                	mov    al,0xd
  511466:	e8 cf 32 ef ff       	call   0x40473a
  51146b:	58                   	pop    eax
  51146c:	df e0                	fnstsw ax
  51146e:	a8 0d                	test   al,0xd
  511470:	0f 85 70 06 00 00    	jne    0x511ae6
  511476:	d9 9d 74 fe ff ff    	fstp   DWORD PTR [ebp-0x18c]
  51147c:	8d 55 98             	lea    edx,[ebp-0x68]
  51147f:	52                   	push   edx
  511480:	ff d7                	call   edi
  511482:	0f bf c0             	movsx  eax,ax
  511485:	89 85 70 fe ff ff    	mov    DWORD PTR [ebp-0x190],eax
  51148b:	db 85 70 fe ff ff    	fild   DWORD PTR [ebp-0x190]
  511491:	d9 9d 6c fe ff ff    	fstp   DWORD PTR [ebp-0x194]
  511497:	d9 85 74 fe ff ff    	fld    DWORD PTR [ebp-0x18c]
  51149d:	d8 8d 6c fe ff ff    	fmul   DWORD PTR [ebp-0x194]
  5114a3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5114aa:	75 08                	jne    0x5114b4
  5114ac:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  5114b2:	eb 0b                	jmp    0x5114bf
  5114b4:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  5114ba:	e8 69 32 ef ff       	call   0x404728
  5114bf:	8b 7d 30             	mov    edi,DWORD PTR [ebp+0x30]
  5114c2:	d9 1f                	fstp   DWORD PTR [edi]
  5114c4:	df e0                	fnstsw ax
  5114c6:	a8 0d                	test   al,0xd
  5114c8:	0f 85 18 06 00 00    	jne    0x511ae6
  5114ce:	8d 4d c8             	lea    ecx,[ebp-0x38]
  5114d1:	51                   	push   ecx
  5114d2:	8d 55 cc             	lea    edx,[ebp-0x34]
  5114d5:	52                   	push   edx
  5114d6:	8d 45 d0             	lea    eax,[ebp-0x30]
  5114d9:	50                   	push   eax
  5114da:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  5114dd:	51                   	push   ecx
  5114de:	8d 55 d8             	lea    edx,[ebp-0x28]
  5114e1:	52                   	push   edx
  5114e2:	8d 45 dc             	lea    eax,[ebp-0x24]
  5114e5:	50                   	push   eax
  5114e6:	6a 06                	push   0x6
  5114e8:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  5114ee:	8d 4d 98             	lea    ecx,[ebp-0x68]
  5114f1:	51                   	push   ecx
  5114f2:	8d 55 a8             	lea    edx,[ebp-0x58]
  5114f5:	52                   	push   edx
  5114f6:	8d 45 b8             	lea    eax,[ebp-0x48]
  5114f9:	50                   	push   eax
  5114fa:	6a 03                	push   0x3
  5114fc:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  511502:	83 c4 2c             	add    esp,0x2c
  511505:	d9 05 1c ba 54 00    	fld    DWORD PTR ds:0x54ba1c
  51150b:	8b 4d 14             	mov    ecx,DWORD PTR [ebp+0x14]
  51150e:	d8 01                	fadd   DWORD PTR [ecx]
  511510:	8b 4d 2c             	mov    ecx,DWORD PTR [ebp+0x2c]
  511513:	d9 19                	fstp   DWORD PTR [ecx]
  511515:	df e0                	fnstsw ax
  511517:	a8 0d                	test   al,0xd
  511519:	0f 85 c7 05 00 00    	jne    0x511ae6
  51151f:	c7 05 e8 b2 54 00 00 	mov    DWORD PTR ds:0x54b2e8,0x0
  511526:	00 00 00 
  511529:	d9 03                	fld    DWORD PTR [ebx]
  51152b:	d8 25 dc 1b 40 00    	fsub   DWORD PTR ds:0x401bdc
  511531:	d9 01                	fld    DWORD PTR [ecx]
  511533:	d8 05 f8 13 40 00    	fadd   DWORD PTR ds:0x4013f8
  511539:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  511540:	75 04                	jne    0x511546
  511542:	d8 3f                	fdivr  DWORD PTR [edi]
  511544:	eb 07                	jmp    0x51154d
  511546:	ff 37                	push   DWORD PTR [edi]
  511548:	e8 f9 31 ef ff       	call   0x404746
  51154d:	de e9                	fsubp  st(1),st
  51154f:	d9 1d 2c b7 54 00    	fstp   DWORD PTR ds:0x54b72c
  511555:	df e0                	fnstsw ax
  511557:	a8 0d                	test   al,0xd
  511559:	0f 85 87 05 00 00    	jne    0x511ae6
  51155f:	d9 06                	fld    DWORD PTR [esi]
  511561:	d8 25 dc 1b 40 00    	fsub   DWORD PTR ds:0x401bdc
  511567:	df e0                	fnstsw ax
  511569:	a8 0d                	test   al,0xd
  51156b:	0f 85 75 05 00 00    	jne    0x511ae6
  511571:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  511577:	d8 1d 2c b7 54 00    	fcomp  DWORD PTR ds:0x54b72c
  51157d:	df e0                	fnstsw ax
  51157f:	f6 c4 41             	test   ah,0x41
  511582:	75 18                	jne    0x51159c
  511584:	d9 06                	fld    DWORD PTR [esi]
  511586:	d8 25 dc 1b 40 00    	fsub   DWORD PTR ds:0x401bdc
  51158c:	d9 1d 2c b7 54 00    	fstp   DWORD PTR ds:0x54b72c
  511592:	df e0                	fnstsw ax
  511594:	a8 0d                	test   al,0xd
  511596:	0f 85 4a 05 00 00    	jne    0x511ae6
  51159c:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
  51159f:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
  5115a5:	e9 5d 03 00 00       	jmp    0x511907
  5115aa:	33 c0                	xor    eax,eax
  5115ac:	89 85 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],eax
  5115b2:	b9 02 00 00 00       	mov    ecx,0x2
  5115b7:	89 8d 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],ecx
  5115bd:	83 ec 10             	sub    esp,0x10
  5115c0:	8b d4                	mov    edx,esp
  5115c2:	89 0a                	mov    DWORD PTR [edx],ecx
  5115c4:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xc4]
  5115ca:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  5115cd:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  5115d0:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [ebp-0xbc]
  5115d6:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
  5115d9:	68 0f 00 03 68       	push   0x6803000f
  5115de:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5115e3:	8b 08                	mov    ecx,DWORD PTR [eax]
  5115e5:	50                   	push   eax
  5115e6:	ff 91 1c 05 00 00    	call   DWORD PTR [ecx+0x51c]
  5115ec:	50                   	push   eax
  5115ed:	8d 55 dc             	lea    edx,[ebp-0x24]
  5115f0:	52                   	push   edx
  5115f1:	ff d6                	call   esi
  5115f3:	50                   	push   eax
  5115f4:	8b 1d 64 12 40 00    	mov    ebx,DWORD PTR ds:0x401264
  5115fa:	ff d3                	call   ebx
  5115fc:	8d 4d dc             	lea    ecx,[ebp-0x24]
  5115ff:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  511605:	8b 7d 38             	mov    edi,DWORD PTR [ebp+0x38]
  511608:	d9 07                	fld    DWORD PTR [edi]
  51160a:	d9 05 1c ba 54 00    	fld    DWORD PTR ds:0x54ba1c
  511610:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  511613:	d8 00                	fadd   DWORD PTR [eax]
  511615:	d8 05 14 bb 54 00    	fadd   DWORD PTR ds:0x54bb14
  51161b:	8b 4d 3c             	mov    ecx,DWORD PTR [ebp+0x3c]
  51161e:	d8 09                	fmul   DWORD PTR [ecx]
  511620:	df e0                	fnstsw ax
  511622:	a8 0d                	test   al,0xd
  511624:	0f 85 bc 04 00 00    	jne    0x511ae6
  51162a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  511631:	75 08                	jne    0x51163b
  511633:	dc 35 78 30 40 00    	fdiv   QWORD PTR ds:0x403078
  511639:	eb 11                	jmp    0x51164c
  51163b:	ff 35 7c 30 40 00    	push   DWORD PTR ds:0x40307c
  511641:	ff 35 78 30 40 00    	push   DWORD PTR ds:0x403078
  511647:	e8 e8 30 ef ff       	call   0x404734
  51164c:	de e9                	fsubp  st(1),st
  51164e:	d9 1f                	fstp   DWORD PTR [edi]
  511650:	df e0                	fnstsw ax
  511652:	a8 0d                	test   al,0xd
  511654:	0f 85 8c 04 00 00    	jne    0x511ae6
  51165a:	8b 55 20             	mov    edx,DWORD PTR [ebp+0x20]
  51165d:	c7 02 00 00 00 00    	mov    DWORD PTR [edx],0x0
  511663:	8b 45 30             	mov    eax,DWORD PTR [ebp+0x30]
  511666:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  51166c:	d9 07                	fld    DWORD PTR [edi]
  51166e:	d8 1d 80 b5 54 00    	fcomp  DWORD PTR ds:0x54b580
  511674:	df e0                	fnstsw ax
  511676:	f6 c4 01             	test   ah,0x1
  511679:	0f 84 88 02 00 00    	je     0x511907
  51167f:	b8 01 00 00 00       	mov    eax,0x1
  511684:	89 85 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],eax
  51168a:	b9 02 00 00 00       	mov    ecx,0x2
  51168f:	89 8d 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],ecx
  511695:	83 ec 10             	sub    esp,0x10
  511698:	8b d4                	mov    edx,esp
  51169a:	89 0a                	mov    DWORD PTR [edx],ecx
  51169c:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xc4]
  5116a2:	89 4a 04             	mov    DWORD PTR [edx+0x4],ecx
  5116a5:	89 42 08             	mov    DWORD PTR [edx+0x8],eax
  5116a8:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [ebp-0xbc]
  5116ae:	89 42 0c             	mov    DWORD PTR [edx+0xc],eax
  5116b1:	68 0f 00 03 68       	push   0x6803000f
  5116b6:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5116bb:	8b 08                	mov    ecx,DWORD PTR [eax]
  5116bd:	50                   	push   eax
  5116be:	ff 91 1c 05 00 00    	call   DWORD PTR [ecx+0x51c]
  5116c4:	50                   	push   eax
  5116c5:	8d 55 dc             	lea    edx,[ebp-0x24]
  5116c8:	52                   	push   edx
  5116c9:	ff d6                	call   esi
  5116cb:	50                   	push   eax
  5116cc:	ff d3                	call   ebx
  5116ce:	8d 4d dc             	lea    ecx,[ebp-0x24]
  5116d1:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  5116d7:	d9 07                	fld    DWORD PTR [edi]
  5116d9:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5116e0:	75 08                	jne    0x5116ea
  5116e2:	d8 35 7c b5 54 00    	fdiv   DWORD PTR ds:0x54b57c
  5116e8:	eb 0b                	jmp    0x5116f5
  5116ea:	ff 35 7c b5 54 00    	push   DWORD PTR ds:0x54b57c
  5116f0:	e8 33 30 ef ff       	call   0x404728
  5116f5:	df e0                	fnstsw ax
  5116f7:	a8 0d                	test   al,0xd
  5116f9:	0f 85 e7 03 00 00    	jne    0x511ae6
  5116ff:	dc 0d 48 2e 40 00    	fmul   QWORD PTR ds:0x402e48
  511705:	d9 9d 40 ff ff ff    	fstp   DWORD PTR [ebp-0xc0]
  51170b:	df e0                	fnstsw ax
  51170d:	a8 0d                	test   al,0xd
  51170f:	0f 85 d1 03 00 00    	jne    0x511ae6
  511715:	b8 04 00 00 00       	mov    eax,0x4
  51171a:	89 85 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],eax
  511720:	83 ec 10             	sub    esp,0x10
  511723:	8b cc                	mov    ecx,esp
  511725:	89 01                	mov    DWORD PTR [ecx],eax
  511727:	8b 95 3c ff ff ff    	mov    edx,DWORD PTR [ebp-0xc4]
  51172d:	89 51 04             	mov    DWORD PTR [ecx+0x4],edx
  511730:	8b 85 40 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc0]
  511736:	89 41 08             	mov    DWORD PTR [ecx+0x8],eax
  511739:	8b 95 44 ff ff ff    	mov    edx,DWORD PTR [ebp-0xbc]
  51173f:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  511742:	68 0f 00 03 68       	push   0x6803000f
  511747:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  51174c:	8b 08                	mov    ecx,DWORD PTR [eax]
  51174e:	50                   	push   eax
  51174f:	ff 91 40 04 00 00    	call   DWORD PTR [ecx+0x440]
  511755:	50                   	push   eax
  511756:	8d 55 dc             	lea    edx,[ebp-0x24]
  511759:	52                   	push   edx
  51175a:	ff d6                	call   esi
  51175c:	50                   	push   eax
  51175d:	ff d3                	call   ebx
  51175f:	8d 4d dc             	lea    ecx,[ebp-0x24]
  511762:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  511768:	c7 85 30 ff ff ff cc 	mov    DWORD PTR [ebp-0xd0],0x423ecc
  51176f:	3e 42 00 
  511772:	c7 85 28 ff ff ff 08 	mov    DWORD PTR [ebp-0xd8],0x8
  511779:	00 00 00 
  51177c:	8d 95 28 ff ff ff    	lea    edx,[ebp-0xd8]
  511782:	8d 4d b8             	lea    ecx,[ebp-0x48]
  511785:	8b 35 24 12 40 00    	mov    esi,DWORD PTR ds:0x401224
  51178b:	ff d6                	call   esi
  51178d:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  511790:	89 85 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],eax
  511796:	c7 85 38 ff ff ff 04 	mov    DWORD PTR [ebp-0xc8],0x4004
  51179d:	40 00 00 
  5117a0:	6a 01                	push   0x1
  5117a2:	6a 01                	push   0x1
  5117a4:	8d 4d b8             	lea    ecx,[ebp-0x48]
  5117a7:	51                   	push   ecx
  5117a8:	8d 95 38 ff ff ff    	lea    edx,[ebp-0xc8]
  5117ae:	52                   	push   edx
  5117af:	8d 45 a8             	lea    eax,[ebp-0x58]
  5117b2:	50                   	push   eax
  5117b3:	8b 1d 5c 10 40 00    	mov    ebx,DWORD PTR ds:0x40105c
  5117b9:	ff d3                	call   ebx
  5117bb:	c7 85 20 ff ff ff 18 	mov    DWORD PTR [ebp-0xe0],0x424418
  5117c2:	44 42 00 
  5117c5:	b8 08 00 00 00       	mov    eax,0x8
  5117ca:	89 85 18 ff ff ff    	mov    DWORD PTR [ebp-0xe8],eax
  5117d0:	c7 85 00 ff ff ff 4c 	mov    DWORD PTR [ebp-0x100],0x423f4c
  5117d7:	3f 42 00 
  5117da:	89 85 f8 fe ff ff    	mov    DWORD PTR [ebp-0x108],eax
  5117e0:	8d 95 f8 fe ff ff    	lea    edx,[ebp-0x108]
  5117e6:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  5117ec:	ff d6                	call   esi
  5117ee:	d9 07                	fld    DWORD PTR [edi]
  5117f0:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5117f7:	75 08                	jne    0x511801
  5117f9:	d8 35 24 b3 54 00    	fdiv   DWORD PTR ds:0x54b324
  5117ff:	eb 0b                	jmp    0x51180c
  511801:	ff 35 24 b3 54 00    	push   DWORD PTR ds:0x54b324
  511807:	e8 1c 2f ef ff       	call   0x404728
  51180c:	d9 5d 90             	fstp   DWORD PTR [ebp-0x70]
  51180f:	df e0                	fnstsw ax
  511811:	a8 0d                	test   al,0xd
  511813:	0f 85 cd 02 00 00    	jne    0x511ae6
  511819:	c7 45 88 04 00 00 00 	mov    DWORD PTR [ebp-0x78],0x4
  511820:	6a 01                	push   0x1
  511822:	6a 01                	push   0x1
  511824:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  51182a:	51                   	push   ecx
  51182b:	8d 55 88             	lea    edx,[ebp-0x78]
  51182e:	52                   	push   edx
  51182f:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  511835:	50                   	push   eax
  511836:	ff d3                	call   ebx
  511838:	c7 85 f0 fe ff ff 54 	mov    DWORD PTR [ebp-0x110],0x424454
  51183f:	44 42 00 
  511842:	c7 85 e8 fe ff ff 08 	mov    DWORD PTR [ebp-0x118],0x8
  511849:	00 00 00 
  51184c:	8d 4d a8             	lea    ecx,[ebp-0x58]
  51184f:	51                   	push   ecx
  511850:	8d 95 18 ff ff ff    	lea    edx,[ebp-0xe8]
  511856:	52                   	push   edx
  511857:	8d 45 98             	lea    eax,[ebp-0x68]
  51185a:	50                   	push   eax
  51185b:	8b 35 98 11 40 00    	mov    esi,DWORD PTR ds:0x401198
  511861:	ff d6                	call   esi
  511863:	50                   	push   eax
  511864:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  51186a:	51                   	push   ecx
  51186b:	8d 95 58 ff ff ff    	lea    edx,[ebp-0xa8]
  511871:	52                   	push   edx
  511872:	ff d6                	call   esi
  511874:	50                   	push   eax
  511875:	8d 85 e8 fe ff ff    	lea    eax,[ebp-0x118]
  51187b:	50                   	push   eax
  51187c:	8d 8d 48 ff ff ff    	lea    ecx,[ebp-0xb8]
  511882:	51                   	push   ecx
  511883:	ff d6                	call   esi
  511885:	50                   	push   eax
  511886:	ff 15 38 10 40 00    	call   DWORD PTR ds:0x401038
  51188c:	8b d0                	mov    edx,eax
  51188e:	8d 4d e0             	lea    ecx,[ebp-0x20]
  511891:	ff 15 54 12 40 00    	call   DWORD PTR ds:0x401254
  511897:	a1 28 b0 54 00       	mov    eax,ds:0x54b028
  51189c:	8b 10                	mov    edx,DWORD PTR [eax]
  51189e:	8d 4d e0             	lea    ecx,[ebp-0x20]
  5118a1:	51                   	push   ecx
  5118a2:	50                   	push   eax
  5118a3:	ff 92 fc 06 00 00    	call   DWORD PTR [edx+0x6fc]
  5118a9:	db e2                	fnclex
  5118ab:	85 c0                	test   eax,eax
  5118ad:	7d 18                	jge    0x5118c7
  5118af:	68 fc 06 00 00       	push   0x6fc
  5118b4:	68 ac cc 41 00       	push   0x41ccac
  5118b9:	8b 15 28 b0 54 00    	mov    edx,DWORD PTR ds:0x54b028
  5118bf:	52                   	push   edx
  5118c0:	50                   	push   eax
  5118c1:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5118c7:	8d 4d e0             	lea    ecx,[ebp-0x20]
  5118ca:	ff 15 84 12 40 00    	call   DWORD PTR ds:0x401284
  5118d0:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  5118d6:	50                   	push   eax
  5118d7:	8d 8d 58 ff ff ff    	lea    ecx,[ebp-0xa8]
  5118dd:	51                   	push   ecx
  5118de:	8d 95 68 ff ff ff    	lea    edx,[ebp-0x98]
  5118e4:	52                   	push   edx
  5118e5:	8d 45 98             	lea    eax,[ebp-0x68]
  5118e8:	50                   	push   eax
  5118e9:	8d 8d 78 ff ff ff    	lea    ecx,[ebp-0x88]
  5118ef:	51                   	push   ecx
  5118f0:	8d 55 88             	lea    edx,[ebp-0x78]
  5118f3:	52                   	push   edx
  5118f4:	8d 45 a8             	lea    eax,[ebp-0x58]
  5118f7:	50                   	push   eax
  5118f8:	8d 4d b8             	lea    ecx,[ebp-0x48]
  5118fb:	51                   	push   ecx
  5118fc:	6a 08                	push   0x8
  5118fe:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  511904:	83 c4 24             	add    esp,0x24
  511907:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  51190d:	50                   	push   eax
  51190e:	8d 55 dc             	lea    edx,[ebp-0x24]
  511911:	52                   	push   edx
  511912:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  511918:	8b f0                	mov    esi,eax
  51191a:	8b 06                	mov    eax,DWORD PTR [esi]
  51191c:	8d 8d e0 fe ff ff    	lea    ecx,[ebp-0x120]
  511922:	51                   	push   ecx
  511923:	56                   	push   esi
  511924:	ff 50 1c             	call   DWORD PTR [eax+0x1c]
  511927:	db e2                	fnclex
  511929:	85 c0                	test   eax,eax
  51192b:	7d 0f                	jge    0x51193c
  51192d:	6a 1c                	push   0x1c
  51192f:	68 d0 b0 41 00       	push   0x41b0d0
  511934:	56                   	push   esi
  511935:	50                   	push   eax
  511936:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  51193c:	33 d2                	xor    edx,edx
  51193e:	8b b5 e0 fe ff ff    	mov    esi,DWORD PTR [ebp-0x120]
  511944:	85 f6                	test   esi,esi
  511946:	0f 9f c2             	setg   dl
  511949:	f7 da                	neg    edx
  51194b:	8b f2                	mov    esi,edx
  51194d:	89 b5 cc fe ff ff    	mov    DWORD PTR [ebp-0x134],esi
  511953:	8d 4d dc             	lea    ecx,[ebp-0x24]
  511956:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  51195c:	66 85 f6             	test   si,si
  51195f:	0f 84 f6 00 00 00    	je     0x511a5b
  511965:	ba 58 38 42 00       	mov    edx,0x423858
  51196a:	b9 48 b6 54 00       	mov    ecx,0x54b648
  51196f:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  511975:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  51197a:	85 c0                	test   eax,eax
  51197c:	75 10                	jne    0x51198e
  51197e:	68 10 b0 54 00       	push   0x54b010
  511983:	68 8c 7e 40 00       	push   0x407e8c
  511988:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  51198e:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  511994:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  511999:	89 85 30 ff ff ff    	mov    DWORD PTR [ebp-0xd0],eax
  51199f:	b9 09 00 00 00       	mov    ecx,0x9
  5119a4:	89 8d 28 ff ff ff    	mov    DWORD PTR [ebp-0xd8],ecx
  5119aa:	ba 01 00 00 00       	mov    edx,0x1
  5119af:	89 95 40 ff ff ff    	mov    DWORD PTR [ebp-0xc0],edx
  5119b5:	c7 85 38 ff ff ff 03 	mov    DWORD PTR [ebp-0xc8],0x3
  5119bc:	00 00 00 
  5119bf:	8b 3e                	mov    edi,DWORD PTR [esi]
  5119c1:	83 ec 10             	sub    esp,0x10
  5119c4:	8b dc                	mov    ebx,esp
  5119c6:	89 0b                	mov    DWORD PTR [ebx],ecx
  5119c8:	8b 8d 2c ff ff ff    	mov    ecx,DWORD PTR [ebp-0xd4]
  5119ce:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  5119d1:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  5119d4:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [ebp-0xcc]
  5119da:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  5119dd:	83 ec 10             	sub    esp,0x10
  5119e0:	8b cc                	mov    ecx,esp
  5119e2:	8b 85 38 ff ff ff    	mov    eax,DWORD PTR [ebp-0xc8]
  5119e8:	89 01                	mov    DWORD PTR [ecx],eax
  5119ea:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [ebp-0xc4]
  5119f0:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  5119f3:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  5119f6:	8b 95 44 ff ff ff    	mov    edx,DWORD PTR [ebp-0xbc]
  5119fc:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  5119ff:	56                   	push   esi
  511a00:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  511a06:	db e2                	fnclex
  511a08:	85 c0                	test   eax,eax
  511a0a:	7d 12                	jge    0x511a1e
  511a0c:	68 b0 02 00 00       	push   0x2b0
  511a11:	68 d8 ae 41 00       	push   0x41aed8
  511a16:	56                   	push   esi
  511a17:	50                   	push   eax
  511a18:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  511a1e:	c7 85 e4 fe ff ff 00 	mov    DWORD PTR [ebp-0x11c],0x0
  511a25:	00 00 00 
  511a28:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  511a2d:	8b 08                	mov    ecx,DWORD PTR [eax]
  511a2f:	8d 95 e4 fe ff ff    	lea    edx,[ebp-0x11c]
  511a35:	52                   	push   edx
  511a36:	50                   	push   eax
  511a37:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  511a3d:	db e2                	fnclex
  511a3f:	85 c0                	test   eax,eax
  511a41:	7d 18                	jge    0x511a5b
  511a43:	68 fc 06 00 00       	push   0x6fc
  511a48:	68 34 e4 41 00       	push   0x41e434
  511a4d:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  511a53:	51                   	push   ecx
  511a54:	50                   	push   eax
  511a55:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  511a5b:	6a 00                	push   0x0
  511a5d:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  511a63:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  511a69:	9b                   	fwait
  511a6a:	68 d3 1a 51 00       	push   0x511ad3
  511a6f:	eb 61                	jmp    0x511ad2
  511a71:	8d 4d e0             	lea    ecx,[ebp-0x20]
  511a74:	ff 15 84 12 40 00    	call   DWORD PTR ds:0x401284
  511a7a:	8d 55 c8             	lea    edx,[ebp-0x38]
  511a7d:	52                   	push   edx
  511a7e:	8d 45 cc             	lea    eax,[ebp-0x34]
