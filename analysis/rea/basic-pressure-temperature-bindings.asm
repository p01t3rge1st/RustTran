
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

004c7540 <.text+0xc6540>:
  4c7540:	d6                   	salc
  4c7541:	8d 45 cc             	lea    eax,[ebp-0x34]
  4c7544:	50                   	push   eax
  4c7545:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  4c754b:	d9 1d 20 b1 54 00    	fstp   DWORD PTR ds:0x54b120
  4c7551:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4c7554:	8d 55 e0             	lea    edx,[ebp-0x20]
  4c7557:	51                   	push   ecx
  4c7558:	52                   	push   edx
  4c7559:	6a 02                	push   0x2
  4c755b:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  4c7561:	83 c4 0c             	add    esp,0xc
  4c7564:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4c7567:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  4c756d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  4c7570:	8d 55 e0             	lea    edx,[ebp-0x20]
  4c7573:	52                   	push   edx
  4c7574:	50                   	push   eax
  4c7575:	8b 08                	mov    ecx,DWORD PTR [eax]
  4c7577:	ff 91 b4 00 00 00    	call   DWORD PTR [ecx+0xb4]
  4c757d:	85 c0                	test   eax,eax
  4c757f:	db e2                	fnclex
  4c7581:	7d 11                	jge    0x4c7594
  4c7583:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  4c7586:	68 b4 00 00 00       	push   0xb4
  4c758b:	68 6c be 41 00       	push   0x41be6c
  4c7590:	51                   	push   ecx
  4c7591:	50                   	push   eax
  4c7592:	ff d6                	call   esi
  4c7594:	8d 5d dc             	lea    ebx,[ebp-0x24]
  4c7597:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4c759a:	53                   	push   ebx
  4c759b:	ba 08 00 00 00       	mov    edx,0x8
  4c75a0:	83 ec 10             	sub    esp,0x10
  4c75a3:	8b 38                	mov    edi,DWORD PTR [eax]
  4c75a5:	8b dc                	mov    ebx,esp
  4c75a7:	b9 28 21 42 00       	mov    ecx,0x422128
  4c75ac:	50                   	push   eax
  4c75ad:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  4c75b3:	89 13                	mov    DWORD PTR [ebx],edx
  4c75b5:	8b 55 a0             	mov    edx,DWORD PTR [ebp-0x60]
  4c75b8:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
  4c75bb:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  4c75be:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  4c75c1:	89 4b 0c             	mov    DWORD PTR [ebx+0xc],ecx
  4c75c4:	ff 57 30             	call   DWORD PTR [edi+0x30]
  4c75c7:	85 c0                	test   eax,eax
  4c75c9:	db e2                	fnclex
  4c75cb:	7d 11                	jge    0x4c75de
  4c75cd:	8b 95 74 ff ff ff    	mov    edx,DWORD PTR [ebp-0x8c]
  4c75d3:	6a 30                	push   0x30
  4c75d5:	68 40 c3 41 00       	push   0x41c340
  4c75da:	52                   	push   edx
  4c75db:	50                   	push   eax
  4c75dc:	ff d6                	call   esi
  4c75de:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4c75e1:	8d 55 cc             	lea    edx,[ebp-0x34]
  4c75e4:	52                   	push   edx
  4c75e5:	50                   	push   eax
  4c75e6:	8b 08                	mov    ecx,DWORD PTR [eax]
  4c75e8:	8b f8                	mov    edi,eax
  4c75ea:	ff 51 44             	call   DWORD PTR [ecx+0x44]
  4c75ed:	85 c0                	test   eax,eax
  4c75ef:	db e2                	fnclex
  4c75f1:	7d 0b                	jge    0x4c75fe
  4c75f3:	6a 44                	push   0x44
  4c75f5:	68 50 c3 41 00       	push   0x41c350
  4c75fa:	57                   	push   edi
  4c75fb:	50                   	push   eax
  4c75fc:	ff d6                	call   esi
  4c75fe:	a1 fc b2 54 00       	mov    eax,ds:0x54b2fc
  4c7603:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4c7606:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
  4c7609:	8d 55 8c             	lea    edx,[ebp-0x74]
  4c760c:	51                   	push   ecx
  4c760d:	8d 45 bc             	lea    eax,[ebp-0x44]
  4c7610:	52                   	push   edx
  4c7611:	50                   	push   eax
  4c7612:	c7 45 8c 04 00 00 00 	mov    DWORD PTR [ebp-0x74],0x4
  4c7619:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  4c761f:	50                   	push   eax
  4c7620:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  4c7626:	d9 1d 24 b1 54 00    	fstp   DWORD PTR ds:0x54b124
  4c762c:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4c762f:	8d 55 e0             	lea    edx,[ebp-0x20]
  4c7632:	51                   	push   ecx
  4c7633:	52                   	push   edx
  4c7634:	6a 02                	push   0x2
  4c7636:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  4c763c:	83 c4 0c             	add    esp,0xc
  4c763f:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4c7642:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  4c7648:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  4c764b:	8d 55 e0             	lea    edx,[ebp-0x20]
  4c764e:	52                   	push   edx
  4c764f:	50                   	push   eax
  4c7650:	8b 08                	mov    ecx,DWORD PTR [eax]
  4c7652:	ff 91 b4 00 00 00    	call   DWORD PTR [ecx+0xb4]
  4c7658:	85 c0                	test   eax,eax
  4c765a:	db e2                	fnclex
  4c765c:	7d 11                	jge    0x4c766f
  4c765e:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  4c7661:	68 b4 00 00 00       	push   0xb4
  4c7666:	68 6c be 41 00       	push   0x41be6c
  4c766b:	51                   	push   ecx
  4c766c:	50                   	push   eax
  4c766d:	ff d6                	call   esi
  4c766f:	8d 5d dc             	lea    ebx,[ebp-0x24]
  4c7672:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4c7675:	53                   	push   ebx
  4c7676:	ba 08 00 00 00       	mov    edx,0x8
  4c767b:	83 ec 10             	sub    esp,0x10
  4c767e:	8b 38                	mov    edi,DWORD PTR [eax]
  4c7680:	8b dc                	mov    ebx,esp
  4c7682:	b9 34 21 42 00       	mov    ecx,0x422134
  4c7687:	50                   	push   eax
  4c7688:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  4c768e:	89 13                	mov    DWORD PTR [ebx],edx
  4c7690:	8b 55 a0             	mov    edx,DWORD PTR [ebp-0x60]
  4c7693:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
  4c7696:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  4c7699:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  4c769c:	89 4b 0c             	mov    DWORD PTR [ebx+0xc],ecx
  4c769f:	ff 57 30             	call   DWORD PTR [edi+0x30]
  4c76a2:	85 c0                	test   eax,eax
  4c76a4:	db e2                	fnclex
  4c76a6:	7d 11                	jge    0x4c76b9
  4c76a8:	8b 95 74 ff ff ff    	mov    edx,DWORD PTR [ebp-0x8c]
  4c76ae:	6a 30                	push   0x30
  4c76b0:	68 40 c3 41 00       	push   0x41c340
  4c76b5:	52                   	push   edx
  4c76b6:	50                   	push   eax
  4c76b7:	ff d6                	call   esi
  4c76b9:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4c76bc:	8d 55 cc             	lea    edx,[ebp-0x34]
  4c76bf:	52                   	push   edx
  4c76c0:	50                   	push   eax
  4c76c1:	8b 08                	mov    ecx,DWORD PTR [eax]
  4c76c3:	8b f8                	mov    edi,eax
  4c76c5:	ff 51 44             	call   DWORD PTR [ecx+0x44]
  4c76c8:	85 c0                	test   eax,eax
  4c76ca:	db e2                	fnclex
  4c76cc:	7d 0b                	jge    0x4c76d9
  4c76ce:	6a 44                	push   0x44
  4c76d0:	68 50 c3 41 00       	push   0x41c350
  4c76d5:	57                   	push   edi
  4c76d6:	50                   	push   eax
  4c76d7:	ff d6                	call   esi
  4c76d9:	a1 04 b3 54 00       	mov    eax,ds:0x54b304
  4c76de:	8b 0d 00 b3 54 00    	mov    ecx,DWORD PTR ds:0x54b300
  4c76e4:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
  4c76e7:	b8 04 00 00 00       	mov    eax,0x4
  4c76ec:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
  4c76ef:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  4c76f5:	8d 55 cc             	lea    edx,[ebp-0x34]
  4c76f8:	89 4d 84             	mov    DWORD PTR [ebp-0x7c],ecx
  4c76fb:	8d 45 8c             	lea    eax,[ebp-0x74]
  4c76fe:	52                   	push   edx
  4c76ff:	8d 4d bc             	lea    ecx,[ebp-0x44]
  4c7702:	50                   	push   eax
  4c7703:	51                   	push   ecx
  4c7704:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  4c770a:	50                   	push   eax
  4c770b:	8d 95 7c ff ff ff    	lea    edx,[ebp-0x84]
  4c7711:	8d 45 ac             	lea    eax,[ebp-0x54]
  4c7714:	52                   	push   edx
  4c7715:	50                   	push   eax
  4c7716:	ff 15 14 12 40 00    	call   DWORD PTR ds:0x401214
  4c771c:	50                   	push   eax
  4c771d:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  4c7723:	d9 1d 28 b1 54 00    	fstp   DWORD PTR ds:0x54b128
  4c7729:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4c772c:	8d 55 e0             	lea    edx,[ebp-0x20]
  4c772f:	51                   	push   ecx
  4c7730:	52                   	push   edx
  4c7731:	6a 02                	push   0x2
  4c7733:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  4c7739:	8d 45 ac             	lea    eax,[ebp-0x54]
  4c773c:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4c773f:	50                   	push   eax
  4c7740:	51                   	push   ecx
  4c7741:	6a 02                	push   0x2
  4c7743:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  4c7749:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  4c774c:	83 c4 18             	add    esp,0x18
  4c774f:	8d 4d e0             	lea    ecx,[ebp-0x20]
  4c7752:	8b 10                	mov    edx,DWORD PTR [eax]
  4c7754:	51                   	push   ecx
  4c7755:	50                   	push   eax
  4c7756:	ff 92 b4 00 00 00    	call   DWORD PTR [edx+0xb4]
  4c775c:	85 c0                	test   eax,eax
  4c775e:	db e2                	fnclex
  4c7760:	7d 11                	jge    0x4c7773
  4c7762:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
  4c7765:	68 b4 00 00 00       	push   0xb4
  4c776a:	68 6c be 41 00       	push   0x41be6c
  4c776f:	52                   	push   edx
  4c7770:	50                   	push   eax
  4c7771:	ff d6                	call   esi
  4c7773:	8d 5d dc             	lea    ebx,[ebp-0x24]
  4c7776:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4c7779:	53                   	push   ebx
  4c777a:	ba 08 00 00 00       	mov    edx,0x8
  4c777f:	83 ec 10             	sub    esp,0x10
  4c7782:	8b 38                	mov    edi,DWORD PTR [eax]
  4c7784:	8b dc                	mov    ebx,esp
  4c7786:	b9 40 21 42 00       	mov    ecx,0x422140
  4c778b:	50                   	push   eax
  4c778c:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  4c7792:	89 13                	mov    DWORD PTR [ebx],edx
  4c7794:	8b 55 a0             	mov    edx,DWORD PTR [ebp-0x60]
  4c7797:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
  4c779a:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  4c779d:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  4c77a0:	89 4b 0c             	mov    DWORD PTR [ebx+0xc],ecx
  4c77a3:	ff 57 30             	call   DWORD PTR [edi+0x30]
  4c77a6:	85 c0                	test   eax,eax
  4c77a8:	db e2                	fnclex
  4c77aa:	7d 11                	jge    0x4c77bd
  4c77ac:	8b 95 74 ff ff ff    	mov    edx,DWORD PTR [ebp-0x8c]
  4c77b2:	6a 30                	push   0x30
  4c77b4:	68 40 c3 41 00       	push   0x41c340
  4c77b9:	52                   	push   edx
  4c77ba:	50                   	push   eax
  4c77bb:	ff d6                	call   esi
  4c77bd:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4c77c0:	8d 55 cc             	lea    edx,[ebp-0x34]
  4c77c3:	52                   	push   edx
  4c77c4:	50                   	push   eax
  4c77c5:	8b 08                	mov    ecx,DWORD PTR [eax]
  4c77c7:	8b f8                	mov    edi,eax
  4c77c9:	ff 51 44             	call   DWORD PTR [ecx+0x44]
  4c77cc:	85 c0                	test   eax,eax
  4c77ce:	db e2                	fnclex
  4c77d0:	7d 0b                	jge    0x4c77dd
  4c77d2:	6a 44                	push   0x44
  4c77d4:	68 50 c3 41 00       	push   0x41c350
  4c77d9:	57                   	push   edi
  4c77da:	50                   	push   eax
  4c77db:	ff d6                	call   esi
  4c77dd:	a1 08 b3 54 00       	mov    eax,ds:0x54b308
  4c77e2:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4c77e5:	89 45 94             	mov    DWORD PTR [ebp-0x6c],eax
  4c77e8:	8d 55 8c             	lea    edx,[ebp-0x74]
  4c77eb:	51                   	push   ecx
  4c77ec:	8d 45 bc             	lea    eax,[ebp-0x44]
  4c77ef:	52                   	push   edx
  4c77f0:	50                   	push   eax
  4c77f1:	c7 45 8c 04 00 00 00 	mov    DWORD PTR [ebp-0x74],0x4
  4c77f8:	ff 15 58 11 40 00    	call   DWORD PTR ds:0x401158
  4c77fe:	50                   	push   eax
  4c77ff:	ff 15 30 11 40 00    	call   DWORD PTR ds:0x401130
  4c7805:	d9 1d 2c b1 54 00    	fstp   DWORD PTR ds:0x54b12c
  4c780b:	8d 4d dc             	lea    ecx,[ebp-0x24]
  4c780e:	8d 55 e0             	lea    edx,[ebp-0x20]
  4c7811:	51                   	push   ecx
  4c7812:	52                   	push   edx
  4c7813:	6a 02                	push   0x2
  4c7815:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  4c781b:	83 c4 0c             	add    esp,0xc
  4c781e:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4c7821:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  4c7827:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  4c782a:	8d 55 e0             	lea    edx,[ebp-0x20]
  4c782d:	52                   	push   edx
  4c782e:	50                   	push   eax
  4c782f:	8b 08                	mov    ecx,DWORD PTR [eax]
  4c7831:	ff 91 b4 00 00 00    	call   DWORD PTR [ecx+0xb4]
  4c7837:	85 c0                	test   eax,eax
  4c7839:	db e2                	fnclex
  4c783b:	7d 11                	jge    0x4c784e
  4c783d:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  4c7840:	68 b4 00 00 00       	push   0xb4
  4c7845:	68 6c be 41 00       	push   0x41be6c
  4c784a:	51                   	push   ecx
  4c784b:	50                   	push   eax
  4c784c:	ff d6                	call   esi
  4c784e:	8d 5d dc             	lea    ebx,[ebp-0x24]
  4c7851:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4c7854:	53                   	push   ebx
  4c7855:	ba 08 00 00 00       	mov    edx,0x8
  4c785a:	83 ec 10             	sub    esp,0x10
  4c785d:	8b 38                	mov    edi,DWORD PTR [eax]
  4c785f:	8b dc                	mov    ebx,esp
  4c7861:	b9 50 21 42 00       	mov    ecx,0x422150
  4c7866:	50                   	push   eax
  4c7867:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  4c786d:	89 13                	mov    DWORD PTR [ebx],edx
  4c786f:	8b 55 a0             	mov    edx,DWORD PTR [ebp-0x60]
  4c7872:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
  4c7875:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  4c7878:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  4c787b:	89 4b 0c             	mov    DWORD PTR [ebx+0xc],ecx
  4c787e:	ff 57 30             	call   DWORD PTR [edi+0x30]
  4c7881:	85 c0                	test   eax,eax
  4c7883:	db e2                	fnclex
  4c7885:	7d 11                	jge    0x4c7898
  4c7887:	8b 95 74 ff ff ff    	mov    edx,DWORD PTR [ebp-0x8c]
  4c788d:	6a 30                	push   0x30
  4c788f:	68 40 c3 41 00       	push   0x41c340
  4c7894:	52                   	push   edx
  4c7895:	50                   	push   eax
  4c7896:	ff d6                	call   esi
  4c7898:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4c789b:	8d 55 cc             	lea    edx,[ebp-0x34]
  4c789e:	52                   	push   edx
  4c789f:	50                   	push   eax
  4c78a0:	8b 08                	mov    ecx,DWORD PTR [eax]
  4c78a2:	8b f8                	mov    edi,eax
  4c78a4:	ff 51 44             	call   DWORD PTR [ecx+0x44]
  4c78a7:	85 c0                	test   eax,eax
  4c78a9:	db e2                	fnclex
  4c78ab:	7d 0b                	jge    0x4c78b8
  4c78ad:	6a 44                	push   0x44
  4c78af:	68 50 c3 41 00       	push   0x41c350
  4c78b4:	57                   	push   edi
  4c78b5:	50                   	push   eax
  4c78b6:	ff d6                	call   esi
  4c78b8:	8d 45 cc             	lea    eax,[ebp-0x34]
  4c78bb:	50                   	push   eax
  4c78bc:	ff                   	.byte 0xff
  4c78bd:	15                   	.byte 0x15
  4c78be:	30 11                	xor    BYTE PTR [ecx],dl
