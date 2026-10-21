
analysis/program/PCTran.exe:     file format pei-i386


Disassembly of section .text:

0051b0fe <.text+0x11a0fe>:
  51b0fe:	d9 05 30 b3 54 00    	fld    DWORD PTR ds:0x54b330
  51b104:	d8 0d 20 b1 54 00    	fmul   DWORD PTR ds:0x54b120
  51b10a:	d9 05 a0 b2 54 00    	fld    DWORD PTR ds:0x54b2a0
  51b110:	d8 25 28 b1 54 00    	fsub   DWORD PTR ds:0x54b128
  51b116:	83 3d 00 b0 54 00 00 	cmp    DWORD PTR ds:0x54b000,0x0
  51b11d:	75 04                	jne    0x51b123
  51b11f:	de f9                	fdivp  st(1),st
  51b121:	eb 09                	jmp    0x51b12c
  51b123:	50                   	push   eax
  51b124:	b0 0d                	mov    al,0xd
  51b126:	e8 0f 96 ee ff       	call   0x40473a
  51b12b:	58                   	pop    eax
  51b12c:	d9 1d fc b6 54 00    	fstp   DWORD PTR ds:0x54b6fc
