
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

00505370 <.text+0x104370>:
  505370:	55                   	push   ebp
  505371:	8b ec                	mov    ebp,esp
  505373:	83 ec 14             	sub    esp,0x14
  505376:	68 16 47 40 00       	push   0x404716
  50537b:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  505381:	50                   	push   eax
  505382:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  505389:	83 ec 74             	sub    esp,0x74
  50538c:	53                   	push   ebx
  50538d:	56                   	push   esi
  50538e:	57                   	push   edi
  50538f:	89 65 ec             	mov    DWORD PTR [ebp-0x14],esp
  505392:	c7 45 f0 08 34 40 00 	mov    DWORD PTR [ebp-0x10],0x403408
  505399:	33 f6                	xor    esi,esi
  50539b:	89 75 f4             	mov    DWORD PTR [ebp-0xc],esi
  50539e:	89 75 f8             	mov    DWORD PTR [ebp-0x8],esi
  5053a1:	89 75 cc             	mov    DWORD PTR [ebp-0x34],esi
  5053a4:	89 75 bc             	mov    DWORD PTR [ebp-0x44],esi
  5053a7:	89 75 ac             	mov    DWORD PTR [ebp-0x54],esi
  5053aa:	89 75 a8             	mov    DWORD PTR [ebp-0x58],esi
  5053ad:	89 75 a4             	mov    DWORD PTR [ebp-0x5c],esi
  5053b0:	6a 01                	push   0x1
  5053b2:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  5053b8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  5053bb:	50                   	push   eax
  5053bc:	e8 ef 6a f9 ff       	call   0x49beb0
  5053c1:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  5053c4:	d9 19                	fstp   DWORD PTR [ecx]
  5053c6:	8b 55 64             	mov    edx,DWORD PTR [ebp+0x64]
  5053c9:	66 39 32             	cmp    WORD PTR [edx],si
  5053cc:	75 10                	jne    0x5053de
  5053ce:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
  5053d1:	8b 06                	mov    eax,DWORD PTR [esi]
  5053d3:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  5053d6:	8b 5d 30             	mov    ebx,DWORD PTR [ebp+0x30]
  5053d9:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
  5053dc:	eb 7c                	jmp    0x50545a
  5053de:	68 99 99 e9 3f       	push   0x3fe99999
  5053e3:	68 9a 99 99 99       	push   0x9999999a
  5053e8:	8b 4d 20             	mov    ecx,DWORD PTR [ebp+0x20]
  5053eb:	d9 01                	fld    DWORD PTR [ecx]
  5053ed:	d9 e1                	fabs
  5053ef:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  5053f2:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5053f9:	75 04                	jne    0x5053ff
  5053fb:	d8 32                	fdiv   DWORD PTR [edx]
  5053fd:	eb 07                	jmp    0x505406
  5053ff:	ff 32                	push   DWORD PTR [edx]
  505401:	e8 22 f3 ef ff       	call   0x404728
  505406:	8b 5d 30             	mov    ebx,DWORD PTR [ebp+0x30]
  505409:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  505410:	75 04                	jne    0x505416
  505412:	d8 33                	fdiv   DWORD PTR [ebx]
  505414:	eb 07                	jmp    0x50541d
  505416:	ff 33                	push   DWORD PTR [ebx]
  505418:	e8 0b f3 ef ff       	call   0x404728
  50541d:	df e0                	fnstsw ax
  50541f:	a8 0d                	test   al,0xd
  505421:	0f 85 a7 05 00 00    	jne    0x5059ce
  505427:	83 ec 08             	sub    esp,0x8
  50542a:	dd 1c 24             	fstp   QWORD PTR [esp]
  50542d:	ff 15 f4 11 40 00    	call   DWORD PTR ds:0x4011f4
  505433:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
  505436:	d9 07                	fld    DWORD PTR [edi]
  505438:	d8 0d 34 34 40 00    	fmul   DWORD PTR ds:0x403434
  50543e:	df e0                	fnstsw ax
  505440:	a8 0d                	test   al,0xd
  505442:	0f 85 86 05 00 00    	jne    0x5059ce
  505448:	de c9                	fmulp  st(1),st
  50544a:	d9 5d d4             	fstp   DWORD PTR [ebp-0x2c]
  50544d:	df e0                	fnstsw ax
  50544f:	a8 0d                	test   al,0xd
  505451:	0f 85 77 05 00 00    	jne    0x5059ce
  505457:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
  50545a:	68 99 99 e9 3f       	push   0x3fe99999
  50545f:	68 9a 99 99 99       	push   0x9999999a
  505464:	8b 45 2c             	mov    eax,DWORD PTR [ebp+0x2c]
  505467:	d9 00                	fld    DWORD PTR [eax]
  505469:	8b 4d 5c             	mov    ecx,DWORD PTR [ebp+0x5c]
  50546c:	d8 01                	fadd   DWORD PTR [ecx]
  50546e:	d8 05 30 34 40 00    	fadd   DWORD PTR ds:0x403430
  505474:	df e0                	fnstsw ax
  505476:	a8 0d                	test   al,0xd
  505478:	0f 85 50 05 00 00    	jne    0x5059ce
  50547e:	d9 e1                	fabs
  505480:	8b 55 58             	mov    edx,DWORD PTR [ebp+0x58]
  505483:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50548a:	75 04                	jne    0x505490
  50548c:	d8 32                	fdiv   DWORD PTR [edx]
  50548e:	eb 07                	jmp    0x505497
  505490:	ff 32                	push   DWORD PTR [edx]
  505492:	e8 91 f2 ef ff       	call   0x404728
  505497:	8b 45 24             	mov    eax,DWORD PTR [ebp+0x24]
  50549a:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5054a1:	75 04                	jne    0x5054a7
  5054a3:	d8 30                	fdiv   DWORD PTR [eax]
  5054a5:	eb 07                	jmp    0x5054ae
  5054a7:	ff 30                	push   DWORD PTR [eax]
  5054a9:	e8 7a f2 ef ff       	call   0x404728
  5054ae:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5054b5:	75 04                	jne    0x5054bb
  5054b7:	d8 33                	fdiv   DWORD PTR [ebx]
  5054b9:	eb 07                	jmp    0x5054c2
  5054bb:	ff 33                	push   DWORD PTR [ebx]
  5054bd:	e8 66 f2 ef ff       	call   0x404728
  5054c2:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5054c9:	75 08                	jne    0x5054d3
  5054cb:	dc 35 60 1c 40 00    	fdiv   QWORD PTR ds:0x401c60
  5054d1:	eb 11                	jmp    0x5054e4
  5054d3:	ff 35 64 1c 40 00    	push   DWORD PTR ds:0x401c64
  5054d9:	ff 35 60 1c 40 00    	push   DWORD PTR ds:0x401c60
  5054df:	e8 50 f2 ef ff       	call   0x404734
  5054e4:	df e0                	fnstsw ax
  5054e6:	a8 0d                	test   al,0xd
  5054e8:	0f 85 e0 04 00 00    	jne    0x5059ce
  5054ee:	83 ec 08             	sub    esp,0x8
  5054f1:	dd 1c 24             	fstp   QWORD PTR [esp]
  5054f4:	ff 15 f4 11 40 00    	call   DWORD PTR ds:0x4011f4
  5054fa:	d9 07                	fld    DWORD PTR [edi]
  5054fc:	d8 0d 34 34 40 00    	fmul   DWORD PTR ds:0x403434
  505502:	df e0                	fnstsw ax
  505504:	a8 0d                	test   al,0xd
  505506:	0f 85 c2 04 00 00    	jne    0x5059ce
  50550c:	de c9                	fmulp  st(1),st
  50550e:	d9 5d d8             	fstp   DWORD PTR [ebp-0x28]
  505511:	df e0                	fnstsw ax
  505513:	a8 0d                	test   al,0xd
  505515:	0f 85 b3 04 00 00    	jne    0x5059ce
  50551b:	d9 45 d4             	fld    DWORD PTR [ebp-0x2c]
  50551e:	d8 1e                	fcomp  DWORD PTR [esi]
  505520:	df e0                	fnstsw ax
  505522:	f6 c4 01             	test   ah,0x1
  505525:	74 05                	je     0x50552c
  505527:	8b 0e                	mov    ecx,DWORD PTR [esi]
  505529:	89 4d d4             	mov    DWORD PTR [ebp-0x2c],ecx
  50552c:	d9 06                	fld    DWORD PTR [esi]
  50552e:	d8 0d 2c 34 40 00    	fmul   DWORD PTR ds:0x40342c
  505534:	df e0                	fnstsw ax
  505536:	a8 0d                	test   al,0xd
  505538:	0f 85 90 04 00 00    	jne    0x5059ce
  50553e:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  505544:	d8 5d d8             	fcomp  DWORD PTR [ebp-0x28]
  505547:	df e0                	fnstsw ax
  505549:	f6 c4 41             	test   ah,0x41
  50554c:	75 15                	jne    0x505563
  50554e:	d9 06                	fld    DWORD PTR [esi]
  505550:	d8 0d 2c 34 40 00    	fmul   DWORD PTR ds:0x40342c
  505556:	d9 5d d8             	fstp   DWORD PTR [ebp-0x28]
  505559:	df e0                	fnstsw ax
  50555b:	a8 0d                	test   al,0xd
  50555d:	0f 85 6b 04 00 00    	jne    0x5059ce
  505563:	d9 07                	fld    DWORD PTR [edi]
  505565:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50556c:	75 08                	jne    0x505576
  50556e:	dc 3d 38 30 40 00    	fdivr  QWORD PTR ds:0x403038
  505574:	eb 11                	jmp    0x505587
  505576:	ff 35 3c 30 40 00    	push   DWORD PTR ds:0x40303c
  50557c:	ff 35 38 30 40 00    	push   DWORD PTR ds:0x403038
  505582:	e8 cb f1 ef ff       	call   0x404752
  505587:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50558e:	75 08                	jne    0x505598
  505590:	dc 35 60 1c 40 00    	fdiv   QWORD PTR ds:0x401c60
  505596:	eb 11                	jmp    0x5055a9
  505598:	ff 35 64 1c 40 00    	push   DWORD PTR ds:0x401c64
  50559e:	ff 35 60 1c 40 00    	push   DWORD PTR ds:0x401c60
  5055a4:	e8 8b f1 ef ff       	call   0x404734
  5055a9:	d9 45 d4             	fld    DWORD PTR [ebp-0x2c]
  5055ac:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5055b3:	75 08                	jne    0x5055bd
  5055b5:	dc 3d 38 30 40 00    	fdivr  QWORD PTR ds:0x403038
  5055bb:	eb 11                	jmp    0x5055ce
  5055bd:	ff 35 3c 30 40 00    	push   DWORD PTR ds:0x40303c
  5055c3:	ff 35 38 30 40 00    	push   DWORD PTR ds:0x403038
  5055c9:	e8 84 f1 ef ff       	call   0x404752
  5055ce:	de c1                	faddp  st(1),st
  5055d0:	d9 45 d8             	fld    DWORD PTR [ebp-0x28]
  5055d3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5055da:	75 08                	jne    0x5055e4
  5055dc:	dc 3d 38 30 40 00    	fdivr  QWORD PTR ds:0x403038
  5055e2:	eb 11                	jmp    0x5055f5
  5055e4:	ff 35 3c 30 40 00    	push   DWORD PTR ds:0x40303c
  5055ea:	ff 35 38 30 40 00    	push   DWORD PTR ds:0x403038
  5055f0:	e8 5d f1 ef ff       	call   0x404752
  5055f5:	de c1                	faddp  st(1),st
  5055f7:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5055fe:	75 08                	jne    0x505608
  505600:	dc 3d 38 30 40 00    	fdivr  QWORD PTR ds:0x403038
  505606:	eb 11                	jmp    0x505619
  505608:	ff 35 3c 30 40 00    	push   DWORD PTR ds:0x40303c
  50560e:	ff 35 38 30 40 00    	push   DWORD PTR ds:0x403038
  505614:	e8 39 f1 ef ff       	call   0x404752
  505619:	d9 5d dc             	fstp   DWORD PTR [ebp-0x24]
  50561c:	df e0                	fnstsw ax
  50561e:	a8 0d                	test   al,0xd
  505620:	0f 85 a8 03 00 00    	jne    0x5059ce
  505626:	8b 75 3c             	mov    esi,DWORD PTR [ebp+0x3c]
  505629:	d9 06                	fld    DWORD PTR [esi]
  50562b:	8b 7d 74             	mov    edi,DWORD PTR [ebp+0x74]
  50562e:	d8 1f                	fcomp  DWORD PTR [edi]
  505630:	df e0                	fnstsw ax
  505632:	f6 c4 41             	test   ah,0x41
  505635:	75 25                	jne    0x50565c
  505637:	8b 55 6c             	mov    edx,DWORD PTR [ebp+0x6c]
  50563a:	d9 02                	fld    DWORD PTR [edx]
  50563c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  50563f:	d8 20                	fsub   DWORD PTR [eax]
  505641:	d8 4d dc             	fmul   DWORD PTR [ebp-0x24]
  505644:	8b 4d 68             	mov    ecx,DWORD PTR [ebp+0x68]
  505647:	d8 09                	fmul   DWORD PTR [ecx]
  505649:	d8 0b                	fmul   DWORD PTR [ebx]
  50564b:	8b 55 34             	mov    edx,DWORD PTR [ebp+0x34]
  50564e:	d9 1a                	fstp   DWORD PTR [edx]
  505650:	df e0                	fnstsw ax
  505652:	a8 0d                	test   al,0xd
  505654:	0f 85 74 03 00 00    	jne    0x5059ce
  50565a:	eb 21                	jmp    0x50567d
  50565c:	8b 45 6c             	mov    eax,DWORD PTR [ebp+0x6c]
  50565f:	d9 00                	fld    DWORD PTR [eax]
  505661:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  505664:	d8 21                	fsub   DWORD PTR [ecx]
  505666:	d8 4d dc             	fmul   DWORD PTR [ebp-0x24]
  505669:	8b 55 70             	mov    edx,DWORD PTR [ebp+0x70]
  50566c:	d8 0a                	fmul   DWORD PTR [edx]
  50566e:	8b 4d 34             	mov    ecx,DWORD PTR [ebp+0x34]
  505671:	d9 19                	fstp   DWORD PTR [ecx]
  505673:	df e0                	fnstsw ax
  505675:	a8 0d                	test   al,0xd
  505677:	0f 85 51 03 00 00    	jne    0x5059ce
  50567d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  505680:	52                   	push   edx
  505681:	e8 7a 68 f9 ff       	call   0x49bf00
  505686:	d9 5d e0             	fstp   DWORD PTR [ebp-0x20]
  505689:	d9 06                	fld    DWORD PTR [esi]
  50568b:	d8 1f                	fcomp  DWORD PTR [edi]
  50568d:	df e0                	fnstsw ax
  50568f:	f6 c4 41             	test   ah,0x41
  505692:	75 7b                	jne    0x50570f
  505694:	8b 45 78             	mov    eax,DWORD PTR [ebp+0x78]
  505697:	0f bf 08             	movsx  ecx,WORD PTR [eax]
  50569a:	89 4d 84             	mov    DWORD PTR [ebp-0x7c],ecx
  50569d:	db 45 84             	fild   DWORD PTR [ebp-0x7c]
  5056a0:	d9 5d 80             	fstp   DWORD PTR [ebp-0x80]
  5056a3:	d9 45 80             	fld    DWORD PTR [ebp-0x80]
  5056a6:	8b 55 38             	mov    edx,DWORD PTR [ebp+0x38]
  5056a9:	d8 0a                	fmul   DWORD PTR [edx]
  5056ab:	d8 0d 68 b7 54 00    	fmul   DWORD PTR ds:0x54b768
  5056b1:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5056b8:	75 05                	jne    0x5056bf
  5056ba:	d8 75 e0             	fdiv   DWORD PTR [ebp-0x20]
  5056bd:	eb 08                	jmp    0x5056c7
  5056bf:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
  5056c2:	e8 61 f0 ef ff       	call   0x404728
  5056c7:	8b 45 70             	mov    eax,DWORD PTR [ebp+0x70]
  5056ca:	d8 28                	fsubr  DWORD PTR [eax]
  5056cc:	d8 4d e0             	fmul   DWORD PTR [ebp-0x20]
  5056cf:	8b 4d 48             	mov    ecx,DWORD PTR [ebp+0x48]
  5056d2:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5056d9:	75 04                	jne    0x5056df
  5056db:	d8 31                	fdiv   DWORD PTR [ecx]
  5056dd:	eb 07                	jmp    0x5056e6
  5056df:	ff 31                	push   DWORD PTR [ecx]
  5056e1:	e8 42 f0 ef ff       	call   0x404728
  5056e6:	db 45 84             	fild   DWORD PTR [ebp-0x7c]
  5056e9:	d9 9d 7c ff ff ff    	fstp   DWORD PTR [ebp-0x84]
  5056ef:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5056f6:	75 08                	jne    0x505700
  5056f8:	d8 b5 7c ff ff ff    	fdiv   DWORD PTR [ebp-0x84]
  5056fe:	eb 0b                	jmp    0x50570b
  505700:	ff b5 7c ff ff ff    	push   DWORD PTR [ebp-0x84]
  505706:	e8 1d f0 ef ff       	call   0x404728
  50570b:	d8 07                	fadd   DWORD PTR [edi]
  50570d:	eb 53                	jmp    0x505762
  50570f:	8b 55 70             	mov    edx,DWORD PTR [ebp+0x70]
  505712:	d9 02                	fld    DWORD PTR [edx]
  505714:	8b 45 44             	mov    eax,DWORD PTR [ebp+0x44]
  505717:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50571e:	75 04                	jne    0x505724
  505720:	d8 30                	fdiv   DWORD PTR [eax]
  505722:	eb 07                	jmp    0x50572b
  505724:	ff 30                	push   DWORD PTR [eax]
  505726:	e8 fd ef ef ff       	call   0x404728
  50572b:	d8 4d e0             	fmul   DWORD PTR [ebp-0x20]
  50572e:	8b 4d 78             	mov    ecx,DWORD PTR [ebp+0x78]
  505731:	0f bf 11             	movsx  edx,WORD PTR [ecx]
  505734:	89 95 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],edx
  50573a:	db 85 78 ff ff ff    	fild   DWORD PTR [ebp-0x88]
  505740:	d9 9d 74 ff ff ff    	fstp   DWORD PTR [ebp-0x8c]
  505746:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50574d:	75 08                	jne    0x505757
  50574f:	d8 b5 74 ff ff ff    	fdiv   DWORD PTR [ebp-0x8c]
  505755:	eb 0b                	jmp    0x505762
  505757:	ff b5 74 ff ff ff    	push   DWORD PTR [ebp-0x8c]
  50575d:	e8 c6 ef ef ff       	call   0x404728
  505762:	d9 1e                	fstp   DWORD PTR [esi]
  505764:	df e0                	fnstsw ax
  505766:	a8 0d                	test   al,0xd
  505768:	0f 85 60 02 00 00    	jne    0x5059ce
  50576e:	8b 45 50             	mov    eax,DWORD PTR [ebp+0x50]
  505771:	d9 00                	fld    DWORD PTR [eax]
  505773:	8b 4d 54             	mov    ecx,DWORD PTR [ebp+0x54]
  505776:	d8 19                	fcomp  DWORD PTR [ecx]
  505778:	df e0                	fnstsw ax
  50577a:	f6 c4 01             	test   ah,0x1
  50577d:	74 30                	je     0x5057af
  50577f:	8b 55 60             	mov    edx,DWORD PTR [ebp+0x60]
  505782:	d9 02                	fld    DWORD PTR [edx]
  505784:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50578b:	75 08                	jne    0x505795
  50578d:	d8 35 c8 28 40 00    	fdiv   DWORD PTR ds:0x4028c8
  505793:	eb 0b                	jmp    0x5057a0
  505795:	ff 35 c8 28 40 00    	push   DWORD PTR ds:0x4028c8
  50579b:	e8 88 ef ef ff       	call   0x404728
  5057a0:	d9 5d d0             	fstp   DWORD PTR [ebp-0x30]
  5057a3:	df e0                	fnstsw ax
  5057a5:	a8 0d                	test   al,0xd
  5057a7:	0f 85 21 02 00 00    	jne    0x5059ce
  5057ad:	eb 08                	jmp    0x5057b7
  5057af:	8b 45 24             	mov    eax,DWORD PTR [ebp+0x24]
  5057b2:	8b 08                	mov    ecx,DWORD PTR [eax]
  5057b4:	89 4d d0             	mov    DWORD PTR [ebp-0x30],ecx
  5057b7:	d9 06                	fld    DWORD PTR [esi]
  5057b9:	8b 55 40             	mov    edx,DWORD PTR [ebp+0x40]
  5057bc:	d8 22                	fsub   DWORD PTR [edx]
  5057be:	8b 45 4c             	mov    eax,DWORD PTR [ebp+0x4c]
  5057c1:	d9 00                	fld    DWORD PTR [eax]
  5057c3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5057ca:	75 08                	jne    0x5057d4
  5057cc:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  5057d2:	eb 0b                	jmp    0x5057df
  5057d4:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  5057da:	e8 49 ef ef ff       	call   0x404728
  5057df:	de c1                	faddp  st(1),st
  5057e1:	d9 45 d0             	fld    DWORD PTR [ebp-0x30]
  5057e4:	d8 0d 9c 2f 40 00    	fmul   DWORD PTR ds:0x402f9c
  5057ea:	8b 4d 18             	mov    ecx,DWORD PTR [ebp+0x18]
  5057ed:	d8 29                	fsubr  DWORD PTR [ecx]
  5057ef:	de c9                	fmulp  st(1),st
  5057f1:	dc c0                	fadd   st(0),st
  5057f3:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  5057fa:	75 04                	jne    0x505800
  5057fc:	d8 30                	fdiv   DWORD PTR [eax]
  5057fe:	eb 07                	jmp    0x505807
  505800:	ff 30                	push   DWORD PTR [eax]
  505802:	e8 21 ef ef ff       	call   0x404728
  505807:	8b 55 2c             	mov    edx,DWORD PTR [ebp+0x2c]
  50580a:	d9 02                	fld    DWORD PTR [edx]
  50580c:	d8 0d 9c 2f 40 00    	fmul   DWORD PTR ds:0x402f9c
  505812:	8b 45 58             	mov    eax,DWORD PTR [ebp+0x58]
  505815:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  50581c:	75 04                	jne    0x505822
  50581e:	d8 30                	fdiv   DWORD PTR [eax]
  505820:	eb 07                	jmp    0x505829
  505822:	ff 30                	push   DWORD PTR [eax]
  505824:	e8 ff ee ef ff       	call   0x404728
  505829:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  505830:	75 04                	jne    0x505836
  505832:	d8 33                	fdiv   DWORD PTR [ebx]
  505834:	eb 07                	jmp    0x50583d
  505836:	ff 33                	push   DWORD PTR [ebx]
  505838:	e8 eb ee ef ff       	call   0x404728
  50583d:	de c1                	faddp  st(1),st
  50583f:	df e0                	fnstsw ax
  505841:	a8 0d                	test   al,0xd
  505843:	0f 85 85 01 00 00    	jne    0x5059ce
  505849:	d9 9d 70 ff ff ff    	fstp   DWORD PTR [ebp-0x90]
  50584f:	8b 95 70 ff ff ff    	mov    edx,DWORD PTR [ebp-0x90]
  505855:	8b 4d 28             	mov    ecx,DWORD PTR [ebp+0x28]
  505858:	89 11                	mov    DWORD PTR [ecx],edx
  50585a:	d9 85 70 ff ff ff    	fld    DWORD PTR [ebp-0x90]
  505860:	d8 1d f4 13 40 00    	fcomp  DWORD PTR ds:0x4013f4
  505866:	df e0                	fnstsw ax
  505868:	f6 c4 01             	test   ah,0x1
  50586b:	74 06                	je     0x505873
  50586d:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
  505873:	ff 15 fc 11 40 00    	call   DWORD PTR ds:0x4011fc
  505879:	50                   	push   eax
  50587a:	8d 45 cc             	lea    eax,[ebp-0x34]
  50587d:	50                   	push   eax
  50587e:	ff 15 94 10 40 00    	call   DWORD PTR ds:0x401094
  505884:	8b f0                	mov    esi,eax
  505886:	8b 0e                	mov    ecx,DWORD PTR [esi]
  505888:	8d 55 a4             	lea    edx,[ebp-0x5c]
  50588b:	52                   	push   edx
  50588c:	56                   	push   esi
  50588d:	ff 51 1c             	call   DWORD PTR [ecx+0x1c]
  505890:	db e2                	fnclex
  505892:	85 c0                	test   eax,eax
  505894:	7d 0f                	jge    0x5058a5
  505896:	6a 1c                	push   0x1c
  505898:	68 d0 b0 41 00       	push   0x41b0d0
  50589d:	56                   	push   esi
  50589e:	50                   	push   eax
  50589f:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  5058a5:	33 c0                	xor    eax,eax
  5058a7:	8b 55 a4             	mov    edx,DWORD PTR [ebp-0x5c]
  5058aa:	85 d2                	test   edx,edx
  5058ac:	0f 9f c0             	setg   al
  5058af:	f7 d8                	neg    eax
  5058b1:	8b f0                	mov    esi,eax
  5058b3:	8d 4d cc             	lea    ecx,[ebp-0x34]
  5058b6:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  5058bc:	66 85 f6             	test   si,si
  5058bf:	0f 84 d5 00 00 00    	je     0x50599a
  5058c5:	ba a0 40 42 00       	mov    edx,0x4240a0
  5058ca:	b9 48 b6 54 00       	mov    ecx,0x54b648
  5058cf:	ff 15 d8 11 40 00    	call   DWORD PTR ds:0x4011d8
  5058d5:	a1 10 b0 54 00       	mov    eax,ds:0x54b010
  5058da:	85 c0                	test   eax,eax
  5058dc:	75 10                	jne    0x5058ee
  5058de:	68 10 b0 54 00       	push   0x54b010
  5058e3:	68 8c 7e 40 00       	push   0x407e8c
  5058e8:	ff 15 c8 11 40 00    	call   DWORD PTR ds:0x4011c8
  5058ee:	8b 35 10 b0 54 00    	mov    esi,DWORD PTR ds:0x54b010
  5058f4:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  5058f9:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  5058fc:	b9 09 00 00 00       	mov    ecx,0x9
  505901:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  505904:	ba 01 00 00 00       	mov    edx,0x1
  505909:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
  50590c:	c7 45 bc 03 00 00 00 	mov    DWORD PTR [ebp-0x44],0x3
  505913:	8b 3e                	mov    edi,DWORD PTR [esi]
  505915:	83 ec 10             	sub    esp,0x10
  505918:	8b dc                	mov    ebx,esp
  50591a:	89 0b                	mov    DWORD PTR [ebx],ecx
  50591c:	8b 4d b0             	mov    ecx,DWORD PTR [ebp-0x50]
  50591f:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  505922:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  505925:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  505928:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  50592b:	83 ec 10             	sub    esp,0x10
  50592e:	8b cc                	mov    ecx,esp
  505930:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  505933:	89 01                	mov    DWORD PTR [ecx],eax
  505935:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  505938:	89 41 04             	mov    DWORD PTR [ecx+0x4],eax
  50593b:	89 51 08             	mov    DWORD PTR [ecx+0x8],edx
  50593e:	8b 55 c8             	mov    edx,DWORD PTR [ebp-0x38]
  505941:	89 51 0c             	mov    DWORD PTR [ecx+0xc],edx
  505944:	56                   	push   esi
  505945:	ff 97 b0 02 00 00    	call   DWORD PTR [edi+0x2b0]
  50594b:	db e2                	fnclex
  50594d:	85 c0                	test   eax,eax
  50594f:	7d 12                	jge    0x505963
  505951:	68 b0 02 00 00       	push   0x2b0
  505956:	68 d8 ae 41 00       	push   0x41aed8
  50595b:	56                   	push   esi
  50595c:	50                   	push   eax
  50595d:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  505963:	c7 45 a8 00 00 00 00 	mov    DWORD PTR [ebp-0x58],0x0
  50596a:	a1 24 b0 54 00       	mov    eax,ds:0x54b024
  50596f:	8b 08                	mov    ecx,DWORD PTR [eax]
  505971:	8d 55 a8             	lea    edx,[ebp-0x58]
  505974:	52                   	push   edx
  505975:	50                   	push   eax
  505976:	ff 91 fc 06 00 00    	call   DWORD PTR [ecx+0x6fc]
  50597c:	db e2                	fnclex
  50597e:	85 c0                	test   eax,eax
  505980:	7d 18                	jge    0x50599a
  505982:	68 fc 06 00 00       	push   0x6fc
  505987:	68 34 e4 41 00       	push   0x41e434
  50598c:	8b 0d 24 b0 54 00    	mov    ecx,DWORD PTR ds:0x54b024
  505992:	51                   	push   ecx
  505993:	50                   	push   eax
  505994:	ff 15 68 10 40 00    	call   DWORD PTR ds:0x401068
  50599a:	6a 00                	push   0x0
  50599c:	ff 15 90 10 40 00    	call   DWORD PTR ds:0x401090
  5059a2:	ff 15 80 10 40 00    	call   DWORD PTR ds:0x401080
  5059a8:	9b                   	fwait
  5059a9:	68 bb 59 50 00       	push   0x5059bb
  5059ae:	eb 0a                	jmp    0x5059ba
  5059b0:	8d 4d cc             	lea    ecx,[ebp-0x34]
  5059b3:	ff 15 80 12 40 00    	call   DWORD PTR ds:0x401280
  5059b9:	c3                   	ret
  5059ba:	c3                   	ret
  5059bb:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  5059be:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  5059c5:	5f                   	pop    edi
  5059c6:	5e                   	pop    esi
  5059c7:	5b                   	pop    ebx
  5059c8:	8b e5                	mov    esp,ebp
  5059ca:	5d                   	pop    ebp
  5059cb:	c2 74 00             	ret    0x74
  5059ce:	e9 49 ed ef ff       	jmp    0x40471c
  5059d3:	90                   	nop
  5059d4:	90                   	nop
  5059d5:	90                   	nop
  5059d6:	90                   	nop
  5059d7:	90                   	nop
  5059d8:	90                   	nop
  5059d9:	90                   	nop
  5059da:	90                   	nop
  5059db:	90                   	nop
  5059dc:	90                   	nop
  5059dd:	90                   	nop
  5059de:	90                   	nop
  5059df:	90                   	nop
