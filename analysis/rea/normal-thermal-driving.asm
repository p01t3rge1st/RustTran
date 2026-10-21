
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0051f476 <.text+0x11e476>:
  51f476:	d9 05 58 b5 54 00    	fld    DWORD PTR ds:0x54b558
  51f47c:	d8 0d 20 b1 54 00    	fmul   DWORD PTR ds:0x54b120
  51f482:	d8 0d 1c b4 54 00    	fmul   DWORD PTR ds:0x54b41c
  51f488:	d8 0d 30 b3 54 00    	fmul   DWORD PTR ds:0x54b330
  51f48e:	d9 1d 54 ba 54 00    	fstp   DWORD PTR ds:0x54ba54
  51f494:	df e0                	fnstsw ax
  51f496:	a8 0d                	test   al,0xd
  51f498:	0f 85 8a 51 00 00    	jne    0x524628
  51f49e:	d9 05 54 ba 54 00    	fld    DWORD PTR ds:0x54ba54
  51f4a4:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f4ab:	75 08                	jne    0x51f4b5
  51f4ad:	d8 35 30 b3 54 00    	fdiv   DWORD PTR ds:0x54b330
  51f4b3:	eb 0b                	jmp    0x51f4c0
  51f4b5:	ff 35 30 b3 54 00    	push   DWORD PTR ds:0x54b330
  51f4bb:	e8 68 52 ee ff       	call   0x404728
  51f4c0:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f4c7:	75 08                	jne    0x51f4d1
  51f4c9:	d8 35 20 b1 54 00    	fdiv   DWORD PTR ds:0x54b120
  51f4cf:	eb 0b                	jmp    0x51f4dc
  51f4d1:	ff 35 20 b1 54 00    	push   DWORD PTR ds:0x54b120
  51f4d7:	e8 4c 52 ee ff       	call   0x404728
  51f4dc:	d8 0d c8 28 40 00    	fmul   DWORD PTR ds:0x4028c8
  51f4e2:	d9 1d 64 ba 54 00    	fstp   DWORD PTR ds:0x54ba64
  51f4e8:	df e0                	fnstsw ax
  51f4ea:	a8 0d                	test   al,0xd
  51f4ec:	0f 85 36 51 00 00    	jne    0x524628
  51f4f2:	a1 30 b6 54 00       	mov    eax,ds:0x54b630
  51f4f7:	66 83 78 0e ff       	cmp    WORD PTR [eax+0xe],0xffff
  51f4fc:	75 0a                	jne    0x51f508
  51f4fe:	c7 05 90 b1 54 00 80 	mov    DWORD PTR ds:0x54b190,0x47c34f80
  51f505:	4f c3 47 
  51f508:	33 ff                	xor    edi,edi
  51f50a:	66 39 78 0e          	cmp    WORD PTR [eax+0xe],di
  51f50e:	0f 85 40 01 00 00    	jne    0x51f654
  51f514:	66 39 3d c8 be 54 00 	cmp    WORD PTR ds:0x54bec8,di
  51f51b:	0f 84 33 01 00 00    	je     0x51f654
  51f521:	dd 05 44 bf 54 00    	fld    QWORD PTR ds:0x54bf44
  51f527:	dc 1d 38 30 40 00    	fcomp  QWORD PTR ds:0x403038
  51f52d:	df e0                	fnstsw ax
  51f52f:	f6 c4 41             	test   ah,0x41
  51f532:	75 7c                	jne    0x51f5b0
  51f534:	dd 05 b0 be 54 00    	fld    QWORD PTR ds:0x54beb0
  51f53a:	dc 0d d8 39 40 00    	fmul   QWORD PTR ds:0x4039d8
  51f540:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f547:	75 08                	jne    0x51f551
  51f549:	dc 3d 44 bf 54 00    	fdivr  QWORD PTR ds:0x54bf44
  51f54f:	eb 11                	jmp    0x51f562
  51f551:	ff 35 48 bf 54 00    	push   DWORD PTR ds:0x54bf48
  51f557:	ff 35 44 bf 54 00    	push   DWORD PTR ds:0x54bf44
  51f55d:	e8 f0 51 ee ff       	call   0x404752
  51f562:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f569:	75 08                	jne    0x51f573
  51f56b:	d8 35 30 b3 54 00    	fdiv   DWORD PTR ds:0x54b330
  51f571:	eb 0b                	jmp    0x51f57e
  51f573:	ff 35 30 b3 54 00    	push   DWORD PTR ds:0x54b330
  51f579:	e8 aa 51 ee ff       	call   0x404728
  51f57e:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f585:	75 08                	jne    0x51f58f
  51f587:	d8 35 20 b1 54 00    	fdiv   DWORD PTR ds:0x54b120
  51f58d:	eb 0b                	jmp    0x51f59a
  51f58f:	ff 35 20 b1 54 00    	push   DWORD PTR ds:0x54b120
  51f595:	e8 8e 51 ee ff       	call   0x404728
  51f59a:	dc 0d a0 28 40 00    	fmul   QWORD PTR ds:0x4028a0
  51f5a0:	d9 1d 68 ba 54 00    	fstp   DWORD PTR ds:0x54ba68
  51f5a6:	df e0                	fnstsw ax
  51f5a8:	a8 0d                	test   al,0xd
  51f5aa:	0f 85 78 50 00 00    	jne    0x524628
  51f5b0:	68 b8 be 54 00       	push   0x54beb8
  51f5b5:	e8 06 d6 00 00       	call   0x52cbc0
  51f5ba:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f5c1:	75 08                	jne    0x51f5cb
  51f5c3:	dc 35 c0 28 40 00    	fdiv   QWORD PTR ds:0x4028c0
  51f5c9:	eb 11                	jmp    0x51f5dc
  51f5cb:	ff 35 c4 28 40 00    	push   DWORD PTR ds:0x4028c4
  51f5d1:	ff 35 c0 28 40 00    	push   DWORD PTR ds:0x4028c0
  51f5d7:	e8 58 51 ee ff       	call   0x404734
  51f5dc:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f5e3:	75 08                	jne    0x51f5ed
  51f5e5:	d8 35 20 b1 54 00    	fdiv   DWORD PTR ds:0x54b120
  51f5eb:	eb 0b                	jmp    0x51f5f8
  51f5ed:	ff 35 20 b1 54 00    	push   DWORD PTR ds:0x54b120
  51f5f3:	e8 30 51 ee ff       	call   0x404728
  51f5f8:	dc 0d a0 28 40 00    	fmul   QWORD PTR ds:0x4028a0
  51f5fe:	d9 1d 64 ba 54 00    	fstp   DWORD PTR ds:0x54ba64
  51f604:	df e0                	fnstsw ax
  51f606:	a8 0d                	test   al,0xd
  51f608:	0f 85 1a 50 00 00    	jne    0x524628
  51f60e:	d9 05 04 b3 54 00    	fld    DWORD PTR ds:0x54b304
  51f614:	dc 0d fc bd 54 00    	fmul   QWORD PTR ds:0x54bdfc
  51f61a:	d8 05 00 b3 54 00    	fadd   DWORD PTR ds:0x54b300
  51f620:	d9 1d 54 b5 54 00    	fstp   DWORD PTR ds:0x54b554
  51f626:	df e0                	fnstsw ax
  51f628:	a8 0d                	test   al,0xd
  51f62a:	0f 85 f8 4f 00 00    	jne    0x524628
  51f630:	d9 05 04 b3 54 00    	fld    DWORD PTR ds:0x54b304
  51f636:	dc 0d 04 be 54 00    	fmul   QWORD PTR ds:0x54be04
  51f63c:	d8 05 00 b3 54 00    	fadd   DWORD PTR ds:0x54b300
  51f642:	d9 1d d4 ba 54 00    	fstp   DWORD PTR ds:0x54bad4
  51f648:	df e0                	fnstsw ax
  51f64a:	a8 0d                	test   al,0xd
  51f64c:	0f 85 d6 4f 00 00    	jne    0x524628
  51f652:	eb 6f                	jmp    0x51f6c3
  51f654:	d9 05 50 b5 54 00    	fld    DWORD PTR ds:0x54b550
  51f65a:	d8 25 98 b4 54 00    	fsub   DWORD PTR ds:0x54b498
  51f660:	d8 0d fc b6 54 00    	fmul   DWORD PTR ds:0x54b6fc
  51f666:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f66d:	75 08                	jne    0x51f677
  51f66f:	d8 35 30 b3 54 00    	fdiv   DWORD PTR ds:0x54b330
  51f675:	eb 0b                	jmp    0x51f682
  51f677:	ff 35 30 b3 54 00    	push   DWORD PTR ds:0x54b330
  51f67d:	e8 a6 50 ee ff       	call   0x404728
  51f682:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f689:	75 08                	jne    0x51f693
  51f68b:	d8 35 20 b1 54 00    	fdiv   DWORD PTR ds:0x54b120
  51f691:	eb 0b                	jmp    0x51f69e
  51f693:	ff 35 20 b1 54 00    	push   DWORD PTR ds:0x54b120
  51f699:	e8 8a 50 ee ff       	call   0x404728
  51f69e:	d8 0d c8 28 40 00    	fmul   DWORD PTR ds:0x4028c8
  51f6a4:	d9 1d 68 ba 54 00    	fstp   DWORD PTR ds:0x54ba68
  51f6aa:	df e0                	fnstsw ax
  51f6ac:	a8 0d                	test   al,0xd
  51f6ae:	0f 85 74 4f 00 00    	jne    0x524628
  51f6b4:	a1 50 b5 54 00       	mov    eax,ds:0x54b550
  51f6b9:	a3 54 b5 54 00       	mov    ds:0x54b554,eax
  51f6be:	a3 d4 ba 54 00       	mov    ds:0x54bad4,eax
  51f6c3:	d9 05 54 b5 54 00    	fld    DWORD PTR ds:0x54b554
  51f6c9:	d8 05 98 b4 54 00    	fadd   DWORD PTR ds:0x54b498
  51f6cf:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51f6d6:	75 08                	jne    0x51f6e0
  51f6d8:	d8 35 0c 1a 40 00    	fdiv   DWORD PTR ds:0x401a0c
  51f6de:	eb 0b                	jmp    0x51f6eb
  51f6e0:	ff 35 0c 1a 40 00    	push   DWORD PTR ds:0x401a0c
  51f6e6:	e8 3d 50 ee ff       	call   0x404728
  51f6eb:	d9 1d 6c b5 54 00    	fstp   DWORD PTR ds:0x54b56c
  51f6f1:	df e0                	fnstsw ax
  51f6f3:	a8 0d                	test   al,0xd
  51f6f5:	0f 85 2d 4f 00 00    	jne    0x524628
