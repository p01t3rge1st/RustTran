
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0049c1e0 <.text+0x9b1e0>:
  49c1e0:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  49c1e4:	56                   	push   esi
  49c1e5:	50                   	push   eax
  49c1e6:	e8 f5 fb ff ff       	call   0x49bde0
  49c1eb:	8b 74 24 08          	mov    esi,DWORD PTR [esp+0x8]
  49c1ef:	d9 5c 24 0c          	fstp   DWORD PTR [esp+0xc]
  49c1f3:	56                   	push   esi
  49c1f4:	e8 07 fd ff ff       	call   0x49bf00
  49c1f9:	d9 06                	fld    DWORD PTR [esi]
  49c1fb:	d8 64 24 0c          	fsub   DWORD PTR [esp+0xc]
  49c1ff:	5e                   	pop    esi
  49c200:	df e0                	fnstsw ax
  49c202:	a8 0d                	test   al,0xd
  49c204:	75 19                	jne    0x49c21f
  49c206:	dc 0d 10 1d 40 00    	fmul   QWORD PTR ds:0x401d10
  49c20c:	de e9                	fsubp  st(1),st
  49c20e:	d9 5c 24 08          	fstp   DWORD PTR [esp+0x8]
  49c212:	df e0                	fnstsw ax
  49c214:	a8 0d                	test   al,0xd
  49c216:	75 07                	jne    0x49c21f
  49c218:	d9 44 24 08          	fld    DWORD PTR [esp+0x8]
  49c21c:	c2 08 00             	ret    0x8
  49c21f:	e9 f8 84 f6 ff       	jmp    0x40471c
  49c224:	90                   	nop
  49c225:	90                   	nop
  49c226:	90                   	nop
  49c227:	90                   	nop
  49c228:	90                   	nop
  49c229:	90                   	nop
  49c22a:	90                   	nop
  49c22b:	90                   	nop
  49c22c:	90                   	nop
  49c22d:	90                   	nop
  49c22e:	90                   	nop
  49c22f:	90                   	nop
  49c230:	55                   	push   ebp
  49c231:	8b ec                	mov    ebp,esp
  49c233:	83 ec 0c             	sub    esp,0xc
  49c236:	68 16 47 40 00       	push   0x404716
  49c23b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  49c241:	50                   	push   eax
  49c242:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  49c249:	81 ec d0 00 00 00    	sub    esp,0xd0
  49c24f:	53                   	push   ebx
  49c250:	56                   	push   esi
  49c251:	57                   	push   edi
  49c252:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  49c255:	c7 45 f8 18 1d 40 00 	mov    DWORD PTR [ebp-0x8],0x401d18
  49c25c:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  49c25f:	8b c6                	mov    eax,esi
  49c261:	83 e0 01             	and    eax,0x1
  49c264:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  49c267:	83 e6 fe             	and    esi,0xfffffffe
  49c26a:	56                   	push   esi
  49c26b:	89 75 08             	mov    DWORD PTR [ebp+0x8],esi
  49c26e:	8b 0e                	mov    ecx,DWORD PTR [esi]
  49c270:	ff 51 04             	call   DWORD PTR [ecx+0x4]
  49c273:	8b 16                	mov    edx,DWORD PTR [esi]
  49c275:	33 db                	xor    ebx,ebx
  49c277:	56                   	push   esi
  49c278:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
  49c27b:	89 5d e4             	mov    DWORD PTR [ebp-0x1c],ebx
  49c27e:	89 5d e0             	mov    DWORD PTR [ebp-0x20],ebx
  49c281:	89 5d dc             	mov    DWORD PTR [ebp-0x24],ebx
  49c284:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  49c287:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
  49c28a:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
  49c28d:	89 5d cc             	mov    DWORD PTR [ebp-0x34],ebx
  49c290:	89 5d c8             	mov    DWORD PTR [ebp-0x38],ebx
  49c293:	89 5d c4             	mov    DWORD PTR [ebp-0x3c],ebx
  49c296:	89 5d c0             	mov    DWORD PTR [ebp-0x40],ebx
  49c299:	89 5d b0             	mov    DWORD PTR [ebp-0x50],ebx
  49c29c:	89 5d a0             	mov    DWORD PTR [ebp-0x60],ebx
  49c29f:	89 5d 90             	mov    DWORD PTR [ebp-0x70],ebx
  49c2a2:	89 5d 80             	mov    DWORD PTR [ebp-0x80],ebx
  49c2a5:	89 9d 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],ebx
  49c2ab:	ff 92 fc 02 00 00    	call   DWORD PTR [edx+0x2fc]
  49c2b1:	50                   	push   eax
  49c2b2:	8d 45 c8             	lea    eax,[ebp-0x38]
  49c2b5:	50                   	push   eax
  49c2b6:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  49c2bc:	8b f8                	mov    edi,eax
  49c2be:	8d 55 e8             	lea    edx,[ebp-0x18]
  49c2c1:	52                   	push   edx
  49c2c2:	57                   	push   edi
  49c2c3:	8b 0f                	mov    ecx,DWORD PTR [edi]
  49c2c5:	ff 91 a0 00 00 00    	call   DWORD PTR [ecx+0xa0]
  49c2cb:	3b c3                	cmp    eax,ebx
  49c2cd:	db e2                	fnclex
  49c2cf:	7d 12                	jge    0x49c2e3
  49c2d1:	68 a0 00 00 00       	push   0xa0
  49c2d6:	68 d0 be 41 00       	push   0x41bed0
  49c2db:	57                   	push   edi
  49c2dc:	50                   	push   eax
  49c2dd:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  49c2e3:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  49c2e6:	56                   	push   esi
  49c2e7:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  49c2ea:	8b 06                	mov    eax,DWORD PTR [esi]
  49c2ec:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
  49c2ef:	c7 45 b0 08 00 00 00 	mov    DWORD PTR [ebp-0x50],0x8
  49c2f6:	ff 90 fc 02 00 00    	call   DWORD PTR [eax+0x2fc]
  49c2fc:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  49c2ff:	50                   	push   eax
  49c300:	51                   	push   ecx
  49c301:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  49c307:	8b f8                	mov    edi,eax
  49c309:	8d 45 e4             	lea    eax,[ebp-0x1c]
  49c30c:	50                   	push   eax
  49c30d:	57                   	push   edi
  49c30e:	8b 17                	mov    edx,DWORD PTR [edi]
  49c310:	ff 92 a0 00 00 00    	call   DWORD PTR [edx+0xa0]
  49c316:	3b c3                	cmp    eax,ebx
  49c318:	db e2                	fnclex
  49c31a:	7d 12                	jge    0x49c32e
  49c31c:	68 a0 00 00 00       	push   0xa0
  49c321:	68 d0 be 41 00       	push   0x41bed0
  49c326:	57                   	push   edi
  49c327:	50                   	push   eax
  49c328:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  49c32e:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  49c331:	51                   	push   ecx
  49c332:	ff 15 00 11 40 00    	call   DWORD PTR ds:0x401100
  49c338:	d8 5e 34             	fcomp  DWORD PTR [esi+0x34]
  49c33b:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [ebp-0xdc],0x1
  49c342:	00 00 00 
  49c345:	df e0                	fnstsw ax
  49c347:	f6 c4 01             	test   ah,0x1
  49c34a:	75 06                	jne    0x49c352
  49c34c:	89 9d 24 ff ff ff    	mov    DWORD PTR [ebp-0xdc],ebx
  49c352:	8b 16                	mov    edx,DWORD PTR [esi]
  49c354:	56                   	push   esi
  49c355:	ff 92 fc 02 00 00    	call   DWORD PTR [edx+0x2fc]
  49c35b:	50                   	push   eax
  49c35c:	8d 45 c0             	lea    eax,[ebp-0x40]
  49c35f:	50                   	push   eax
  49c360:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  49c366:	8b f8                	mov    edi,eax
  49c368:	8d 55 e0             	lea    edx,[ebp-0x20]
  49c36b:	52                   	push   edx
  49c36c:	57                   	push   edi
  49c36d:	8b 0f                	mov    ecx,DWORD PTR [edi]
  49c36f:	ff 91 a0 00 00 00    	call   DWORD PTR [ecx+0xa0]
  49c375:	3b c3                	cmp    eax,ebx
  49c377:	db e2                	fnclex
  49c379:	7d 12                	jge    0x49c38d
  49c37b:	68 a0 00 00 00       	push   0xa0
  49c380:	68 d0 be 41 00       	push   0x41bed0
  49c385:	57                   	push   edi
  49c386:	50                   	push   eax
  49c387:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  49c38d:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  49c390:	50                   	push   eax
  49c391:	ff 15 00 11 40 00    	call   DWORD PTR ds:0x401100
  49c397:	d8 5e 38             	fcomp  DWORD PTR [esi+0x38]
  49c39a:	c7 85 20 ff ff ff 01 	mov    DWORD PTR [ebp-0xe0],0x1
  49c3a1:	00 00 00 
  49c3a4:	df e0                	fnstsw ax
  49c3a6:	f6 c4 41             	test   ah,0x41
  49c3a9:	74 06                	je     0x49c3b1
  49c3ab:	89 9d 20 ff ff ff    	mov    DWORD PTR [ebp-0xe0],ebx
  49c3b1:	8d 4d b0             	lea    ecx,[ebp-0x50]
  49c3b4:	51                   	push   ecx
  49c3b5:	ff 15 04 11 40 00    	call   DWORD PTR ds:0x401104
  49c3bb:	66 8b f8             	mov    di,ax
  49c3be:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [ebp-0xe0]
  49c3c4:	f7 d7                	not    edi
  49c3c6:	f7 d8                	neg    eax
  49c3c8:	0b f8                	or     edi,eax
  49c3ca:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [ebp-0xdc]
  49c3d0:	f7 d8                	neg    eax
  49c3d2:	0b f8                	or     edi,eax
  49c3d4:	8d 55 e0             	lea    edx,[ebp-0x20]
  49c3d7:	8d 45 e4             	lea    eax,[ebp-0x1c]
  49c3da:	52                   	push   edx
  49c3db:	50                   	push   eax
  49c3dc:	6a 02                	push   0x2
  49c3de:	ff 15 e4 11 40 00    	call   DWORD PTR ds:0x4011e4
  49c3e4:	8d 4d c0             	lea    ecx,[ebp-0x40]
  49c3e7:	8d 55 c4             	lea    edx,[ebp-0x3c]
  49c3ea:	51                   	push   ecx
  49c3eb:	8d 45 c8             	lea    eax,[ebp-0x38]
  49c3ee:	52                   	push   edx
  49c3ef:	50                   	push   eax
  49c3f0:	6a 03                	push   0x3
  49c3f2:	ff 15 48 10 40 00    	call   DWORD PTR ds:0x401048
  49c3f8:	83 c4 1c             	add    esp,0x1c
  49c3fb:	8d 4d b0             	lea    ecx,[ebp-0x50]
  49c3fe:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  49c404:	66 3b fb             	cmp    di,bx
  49c407:	0f 84 30 01 00 00    	je     0x49c53d
  49c40d:	b9 04 00 02 80       	mov    ecx,0x80020004
  49c412:	b8 0a 00 00 00       	mov    eax,0xa
  49c417:	89 4d 88             	mov    DWORD PTR [ebp-0x78],ecx
  49c41a:	89 4d 98             	mov    DWORD PTR [ebp-0x68],ecx
  49c41d:	8d 95 70 ff ff ff    	lea    edx,[ebp-0x90]
  49c423:	8d 4d a0             	lea    ecx,[ebp-0x60]
  49c426:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
  49c429:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
  49c42c:	c7 85 78 ff ff ff e8 	mov    DWORD PTR [ebp-0x88],0x41f6e8
  49c433:	f6 41 00 
  49c436:	c7 85 70 ff ff ff 08 	mov    DWORD PTR [ebp-0x90],0x8
  49c43d:	00 00 00 
  49c440:	ff 15 24 12 40 00    	call   DWORD PTR ds:0x401224
  49c446:	8b 1d 58 10 40 00    	mov    ebx,DWORD PTR ds:0x401058
  49c44c:	68 80 f6 41 00       	push   0x41f680
  49c451:	68 c0 f6 41 00       	push   0x41f6c0
  49c456:	ff d3                	call   ebx
  49c458:	8b 3d 54 12 40 00    	mov    edi,DWORD PTR ds:0x401254
  49c45e:	8b d0                	mov    edx,eax
  49c460:	8d 4d e8             	lea    ecx,[ebp-0x18]
  49c463:	ff d7                	call   edi
  49c465:	8b 4e 34             	mov    ecx,DWORD PTR [esi+0x34]
  49c468:	50                   	push   eax
  49c469:	51                   	push   ecx
  49c46a:	ff 15 28 11 40 00    	call   DWORD PTR ds:0x401128
  49c470:	8b d0                	mov    edx,eax
  49c472:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  49c475:	ff d7                	call   edi
  49c477:	50                   	push   eax
  49c478:	ff d3                	call   ebx
  49c47a:	8b d0                	mov    edx,eax
  49c47c:	8d 4d e0             	lea    ecx,[ebp-0x20]
  49c47f:	ff d7                	call   edi
  49c481:	50                   	push   eax
  49c482:	68 cc f6 41 00       	push   0x41f6cc
  49c487:	ff d3                	call   ebx
  49c489:	8b d0                	mov    edx,eax
  49c48b:	8d 4d dc             	lea    ecx,[ebp-0x24]
  49c48e:	ff d7                	call   edi
  49c490:	8b 56 38             	mov    edx,DWORD PTR [esi+0x38]
  49c493:	50                   	push   eax
  49c494:	52                   	push   edx
  49c495:	ff 15 28 11 40 00    	call   DWORD PTR ds:0x401128
  49c49b:	8b d0                	mov    edx,eax
  49c49d:	8d 4d d8             	lea    ecx,[ebp-0x28]
  49c4a0:	ff d7                	call   edi
  49c4a2:	50                   	push   eax
  49c4a3:	ff d3                	call   ebx
  49c4a5:	8b d0                	mov    edx,eax
  49c4a7:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  49c4aa:	ff d7                	call   edi
  49c4ac:	50                   	push   eax
  49c4ad:	68 d8 f6 41 00       	push   0x41f6d8
  49c4b2:	ff d3                	call   ebx
  49c4b4:	8b d0                	mov    edx,eax
  49c4b6:	8d 4d d0             	lea    ecx,[ebp-0x30]
  49c4b9:	ff d7                	call   edi
  49c4bb:	50                   	push   eax
  49c4bc:	8b 46 3c             	mov    eax,DWORD PTR [esi+0x3c]
  49c4bf:	50                   	push   eax
  49c4c0:	ff d3                	call   ebx
  49c4c2:	8b d0                	mov    edx,eax
  49c4c4:	8d 4d cc             	lea    ecx,[ebp-0x34]
  49c4c7:	ff d7                	call   edi
  49c4c9:	50                   	push   eax
  49c4ca:	68 e0 f6 41 00       	push   0x41f6e0
  49c4cf:	ff d3                	call   ebx
  49c4d1:	8d 4d 80             	lea    ecx,[ebp-0x80]
  49c4d4:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  49c4d7:	8d 55 90             	lea    edx,[ebp-0x70]
  49c4da:	51                   	push   ecx
  49c4db:	8d 45 a0             	lea    eax,[ebp-0x60]
  49c4de:	52                   	push   edx
  49c4df:	50                   	push   eax
  49c4e0:	8d 4d b0             	lea    ecx,[ebp-0x50]
  49c4e3:	6a 10                	push   0x10
  49c4e5:	51                   	push   ecx
  49c4e6:	c7 45 b0 08 00 00 00 	mov    DWORD PTR [ebp-0x50],0x8
  49c4ed:	ff 15 8c 10 40 00    	call   DWORD PTR ds:0x40108c
  49c4f3:	8d 55 cc             	lea    edx,[ebp-0x34]
  49c4f6:	8d 45 d0             	lea    eax,[ebp-0x30]
  49c4f9:	52                   	push   edx
  49c4fa:	50                   	push   eax
  49c4fb:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  49c4fe:	8d 55 d8             	lea    edx,[ebp-0x28]
  49c501:	51                   	push   ecx
  49c502:	8d 45 dc             	lea    eax,[ebp-0x24]
  49c505:	52                   	push   edx
  49c506:	8d 4d e0             	lea    ecx,[ebp-0x20]
  49c509:	50                   	push   eax
  49c50a:	8d 55 e4             	lea    edx,[ebp-0x1c]
  49c50d:	51                   	push   ecx
  49c50e:	8d 45 e8             	lea    eax,[ebp-0x18]
  49c511:	52                   	push   edx
  49c512:	50                   	push   eax
  49c513:	6a 08                	push   0x8
  49c515:	ff 15 e4 11 40 00    	call   DWORD PTR ds:0x4011e4
  49c51b:	8d 4d 80             	lea    ecx,[ebp-0x80]
  49c51e:	8d 55 90             	lea    edx,[ebp-0x70]
  49c521:	51                   	push   ecx
  49c522:	8d 45 a0             	lea    eax,[ebp-0x60]
  49c525:	52                   	push   edx
  49c526:	8d 4d b0             	lea    ecx,[ebp-0x50]
  49c529:	50                   	push   eax
  49c52a:	51                   	push   ecx
  49c52b:	6a 04                	push   0x4
  49c52d:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  49c533:	83 c4 38             	add    esp,0x38
  49c536:	33 db                	xor    ebx,ebx
  49c538:	e9 b7 00 00 00       	jmp    0x49c5f4
  49c53d:	8b 16                	mov    edx,DWORD PTR [esi]
  49c53f:	56                   	push   esi
  49c540:	ff 92 fc 02 00 00    	call   DWORD PTR [edx+0x2fc]
  49c546:	50                   	push   eax
  49c547:	8d 45 c8             	lea    eax,[ebp-0x38]
  49c54a:	50                   	push   eax
  49c54b:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  49c551:	8b f8                	mov    edi,eax
  49c553:	8d 55 e8             	lea    edx,[ebp-0x18]
  49c556:	52                   	push   edx
  49c557:	57                   	push   edi
  49c558:	8b 0f                	mov    ecx,DWORD PTR [edi]
  49c55a:	ff 91 a0 00 00 00    	call   DWORD PTR [ecx+0xa0]
  49c560:	3b c3                	cmp    eax,ebx
  49c562:	db e2                	fnclex
  49c564:	7d 12                	jge    0x49c578
  49c566:	68 a0 00 00 00       	push   0xa0
  49c56b:	68 d0 be 41 00       	push   0x41bed0
  49c570:	57                   	push   edi
  49c571:	50                   	push   eax
  49c572:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  49c578:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  49c57b:	50                   	push   eax
  49c57c:	ff 15 00 11 40 00    	call   DWORD PTR ds:0x401100
  49c582:	d9 1d d0 bb 54 00    	fstp   DWORD PTR ds:0x54bbd0
  49c588:	8d 4d e8             	lea    ecx,[ebp-0x18]
  49c58b:	ff 15 84 12 40 00    	call   DWORD PTR ds:0x401284
  49c591:	8d 4d c8             	lea    ecx,[ebp-0x38]
  49c594:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  49c59a:	39 1d 60 d3 54 00    	cmp    DWORD PTR ds:0x54d360,ebx
  49c5a0:	75 10                	jne    0x49c5b2
  49c5a2:	68 60 d3 54 00       	push   0x54d360
  49c5a7:	68 30 b0 41 00       	push   0x41b030
  49c5ac:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  49c5b2:	8b 3d 60 d3 54 00    	mov    edi,DWORD PTR ds:0x54d360
  49c5b8:	8d 4d c8             	lea    ecx,[ebp-0x38]
  49c5bb:	56                   	push   esi
  49c5bc:	51                   	push   ecx
  49c5bd:	8b 17                	mov    edx,DWORD PTR [edi]
  49c5bf:	89 95 1c ff ff ff    	mov    DWORD PTR [ebp-0xe4],edx
  49c5c5:	ff 15 9c 10 40 00    	call   DWORD PTR ds:0x40109c
  49c5cb:	8b 95 1c ff ff ff    	mov    edx,DWORD PTR [ebp-0xe4]
  49c5d1:	50                   	push   eax
  49c5d2:	57                   	push   edi
  49c5d3:	ff 52 10             	call   DWORD PTR [edx+0x10]
  49c5d6:	3b c3                	cmp    eax,ebx
  49c5d8:	db e2                	fnclex
  49c5da:	7d 0f                	jge    0x49c5eb
  49c5dc:	6a 10                	push   0x10
  49c5de:	68 20 b0 41 00       	push   0x41b020
  49c5e3:	57                   	push   edi
  49c5e4:	50                   	push   eax
  49c5e5:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  49c5eb:	8d 4d c8             	lea    ecx,[ebp-0x38]
  49c5ee:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  49c5f4:	89 5d fc             	mov    DWORD PTR [ebp-0x4],ebx
  49c5f7:	9b                   	fwait
  49c5f8:	68 58 c6 49 00       	push   0x49c658
  49c5fd:	eb 58                	jmp    0x49c657
  49c5ff:	8d 45 cc             	lea    eax,[ebp-0x34]
  49c602:	8d 4d d0             	lea    ecx,[ebp-0x30]
  49c605:	50                   	push   eax
  49c606:	8d 55 d4             	lea    edx,[ebp-0x2c]
  49c609:	51                   	push   ecx
  49c60a:	8d 45 d8             	lea    eax,[ebp-0x28]
  49c60d:	52                   	push   edx
  49c60e:	8d                   	.byte 0x8d
  49c60f:	4d                   	dec    ebp
