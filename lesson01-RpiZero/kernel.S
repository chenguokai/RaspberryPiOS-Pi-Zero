
build/kernel.elf:     file format elf32-littlearm


Disassembly of section .text.boot:

00000000 <_start>:
   0:	e59f0018 	ldr	r0, [pc, #24]	; 20 <proc_hang+0x4>
   4:	e59f1018 	ldr	r1, [pc, #24]	; 24 <proc_hang+0x8>
   8:	e0411000 	sub	r1, r1, r0
   c:	eb0000ae 	bl	2cc <memzero>
  10:	e3a0d501 	mov	sp, #4194304	; 0x400000
  14:	eb000093 	bl	268 <kernel_main>
  18:	eaffffff 	b	1c <proc_hang>

0000001c <proc_hang>:
  1c:	eafffffe 	b	1c <proc_hang>
  20:	000002f8 	strdeq	r0, [r0], -r8
  24:	000002f8 	strdeq	r0, [r0], -r8

Disassembly of section .text:

00000028 <uart_send>:
  28:	e92d4800 	push	{fp, lr}
  2c:	e28db004 	add	fp, sp, #4
  30:	e24dd008 	sub	sp, sp, #8
  34:	e1a03000 	mov	r3, r0
  38:	e54b3005 	strb	r3, [fp, #-5]
  3c:	e59f0038 	ldr	r0, [pc, #56]	; 7c <uart_send+0x54>
  40:	eb00009c 	bl	2b8 <get32>
  44:	e1a03000 	mov	r3, r0
  48:	e2033020 	and	r3, r3, #32
  4c:	e3530000 	cmp	r3, #0
  50:	1a000000 	bne	58 <uart_send+0x30>
  54:	eafffff8 	b	3c <uart_send+0x14>
  58:	e1a00000 	nop			; (mov r0, r0)
  5c:	e55b3005 	ldrb	r3, [fp, #-5]
  60:	e1a01003 	mov	r1, r3
  64:	e59f0014 	ldr	r0, [pc, #20]	; 80 <uart_send+0x58>
  68:	eb000090 	bl	2b0 <put32>
  6c:	e1a00000 	nop			; (mov r0, r0)
  70:	e24bd004 	sub	sp, fp, #4
  74:	e8bd4800 	pop	{fp, lr}
  78:	e12fff1e 	bx	lr
  7c:	20215054 	eorcs	r5, r1, r4, asr r0
  80:	20215040 	eorcs	r5, r1, r0, asr #32

00000084 <uart_recv>:
  84:	e92d4800 	push	{fp, lr}
  88:	e28db004 	add	fp, sp, #4
  8c:	e59f0040 	ldr	r0, [pc, #64]	; d4 <uart_recv+0x50>
  90:	eb000088 	bl	2b8 <get32>
  94:	e1a03000 	mov	r3, r0
  98:	e2033001 	and	r3, r3, #1
  9c:	e3530000 	cmp	r3, #0
  a0:	1a000000 	bne	a8 <uart_recv+0x24>
  a4:	eafffff8 	b	8c <uart_recv+0x8>
  a8:	e1a00000 	nop			; (mov r0, r0)
  ac:	e59f0024 	ldr	r0, [pc, #36]	; d8 <uart_recv+0x54>
  b0:	eb000080 	bl	2b8 <get32>
  b4:	e1a03000 	mov	r3, r0
  b8:	e20330ff 	and	r3, r3, #255	; 0xff
  bc:	e203307f 	and	r3, r3, #127	; 0x7f
  c0:	e20330ff 	and	r3, r3, #255	; 0xff
  c4:	e1a00003 	mov	r0, r3
  c8:	e24bd004 	sub	sp, fp, #4
  cc:	e8bd4800 	pop	{fp, lr}
  d0:	e12fff1e 	bx	lr
  d4:	20215054 	eorcs	r5, r1, r4, asr r0
  d8:	20215040 	eorcs	r5, r1, r0, asr #32

000000dc <uart_send_string>:
  dc:	e92d4800 	push	{fp, lr}
  e0:	e28db004 	add	fp, sp, #4
  e4:	e24dd010 	sub	sp, sp, #16
  e8:	e50b0010 	str	r0, [fp, #-16]
  ec:	e3a03000 	mov	r3, #0
  f0:	e50b3008 	str	r3, [fp, #-8]
  f4:	ea000008 	b	11c <uart_send_string+0x40>
  f8:	e51b3008 	ldr	r3, [fp, #-8]
  fc:	e51b2010 	ldr	r2, [fp, #-16]
 100:	e0823003 	add	r3, r2, r3
 104:	e5d33000 	ldrb	r3, [r3]
 108:	e1a00003 	mov	r0, r3
 10c:	ebffffc5 	bl	28 <uart_send>
 110:	e51b3008 	ldr	r3, [fp, #-8]
 114:	e2833001 	add	r3, r3, #1
 118:	e50b3008 	str	r3, [fp, #-8]
 11c:	e51b3008 	ldr	r3, [fp, #-8]
 120:	e51b2010 	ldr	r2, [fp, #-16]
 124:	e0823003 	add	r3, r2, r3
 128:	e5d33000 	ldrb	r3, [r3]
 12c:	e3530000 	cmp	r3, #0
 130:	1afffff0 	bne	f8 <uart_send_string+0x1c>
 134:	e1a00000 	nop			; (mov r0, r0)
 138:	e24bd004 	sub	sp, fp, #4
 13c:	e8bd4800 	pop	{fp, lr}
 140:	e12fff1e 	bx	lr

00000144 <uart_init>:
 144:	e92d4800 	push	{fp, lr}
 148:	e28db004 	add	fp, sp, #4
 14c:	e24dd008 	sub	sp, sp, #8
 150:	e59f00e4 	ldr	r0, [pc, #228]	; 23c <uart_init+0xf8>
 154:	eb000057 	bl	2b8 <get32>
 158:	e50b0008 	str	r0, [fp, #-8]
 15c:	e51b3008 	ldr	r3, [fp, #-8]
 160:	e3c33a07 	bic	r3, r3, #28672	; 0x7000
 164:	e50b3008 	str	r3, [fp, #-8]
 168:	e51b3008 	ldr	r3, [fp, #-8]
 16c:	e3833a02 	orr	r3, r3, #8192	; 0x2000
 170:	e50b3008 	str	r3, [fp, #-8]
 174:	e51b3008 	ldr	r3, [fp, #-8]
 178:	e3c3390e 	bic	r3, r3, #229376	; 0x38000
 17c:	e50b3008 	str	r3, [fp, #-8]
 180:	e51b3008 	ldr	r3, [fp, #-8]
 184:	e3833801 	orr	r3, r3, #65536	; 0x10000
 188:	e50b3008 	str	r3, [fp, #-8]
 18c:	e51b1008 	ldr	r1, [fp, #-8]
 190:	e59f00a4 	ldr	r0, [pc, #164]	; 23c <uart_init+0xf8>
 194:	eb000045 	bl	2b0 <put32>
 198:	e3a01000 	mov	r1, #0
 19c:	e59f009c 	ldr	r0, [pc, #156]	; 240 <uart_init+0xfc>
 1a0:	eb000042 	bl	2b0 <put32>
 1a4:	e3a00096 	mov	r0, #150	; 0x96
 1a8:	eb000044 	bl	2c0 <delay>
 1ac:	e3a01903 	mov	r1, #49152	; 0xc000
 1b0:	e59f008c 	ldr	r0, [pc, #140]	; 244 <uart_init+0x100>
 1b4:	eb00003d 	bl	2b0 <put32>
 1b8:	e3a00096 	mov	r0, #150	; 0x96
 1bc:	eb00003f 	bl	2c0 <delay>
 1c0:	e3a01000 	mov	r1, #0
 1c4:	e59f0078 	ldr	r0, [pc, #120]	; 244 <uart_init+0x100>
 1c8:	eb000038 	bl	2b0 <put32>
 1cc:	e3a01001 	mov	r1, #1
 1d0:	e59f0070 	ldr	r0, [pc, #112]	; 248 <uart_init+0x104>
 1d4:	eb000035 	bl	2b0 <put32>
 1d8:	e3a01000 	mov	r1, #0
 1dc:	e59f0068 	ldr	r0, [pc, #104]	; 24c <uart_init+0x108>
 1e0:	eb000032 	bl	2b0 <put32>
 1e4:	e3a01000 	mov	r1, #0
 1e8:	e59f0060 	ldr	r0, [pc, #96]	; 250 <uart_init+0x10c>
 1ec:	eb00002f 	bl	2b0 <put32>
 1f0:	e3a01003 	mov	r1, #3
 1f4:	e59f0058 	ldr	r0, [pc, #88]	; 254 <uart_init+0x110>
 1f8:	eb00002c 	bl	2b0 <put32>
 1fc:	e3a01000 	mov	r1, #0
 200:	e59f0050 	ldr	r0, [pc, #80]	; 258 <uart_init+0x114>
 204:	eb000029 	bl	2b0 <put32>
 208:	e3a010c6 	mov	r1, #198	; 0xc6
 20c:	e59f0048 	ldr	r0, [pc, #72]	; 25c <uart_init+0x118>
 210:	eb000026 	bl	2b0 <put32>
 214:	e59f1044 	ldr	r1, [pc, #68]	; 260 <uart_init+0x11c>
 218:	e59f0044 	ldr	r0, [pc, #68]	; 264 <uart_init+0x120>
 21c:	eb000023 	bl	2b0 <put32>
 220:	e3a01003 	mov	r1, #3
 224:	e59f0020 	ldr	r0, [pc, #32]	; 24c <uart_init+0x108>
 228:	eb000020 	bl	2b0 <put32>
 22c:	e1a00000 	nop			; (mov r0, r0)
 230:	e24bd004 	sub	sp, fp, #4
 234:	e8bd4800 	pop	{fp, lr}
 238:	e12fff1e 	bx	lr
 23c:	20200004 	eorcs	r0, r0, r4
 240:	20200094 	mlacs	r0, r4, r0, r0
 244:	20200098 	mlacs	r0, r8, r0, r0
 248:	20215004 	eorcs	r5, r1, r4
 24c:	20215060 	eorcs	r5, r1, r0, rrx
 250:	20215044 	eorcs	r5, r1, r4, asr #32
 254:	2021504c 	eorcs	r5, r1, ip, asr #32
 258:	20215050 	eorcs	r5, r1, r0, asr r0
 25c:	20215048 	eorcs	r5, r1, r8, asr #32
 260:	0000010e 	andeq	r0, r0, lr, lsl #2
 264:	20215068 	eorcs	r5, r1, r8, rrx

00000268 <kernel_main>:
 268:	e92d4800 	push	{fp, lr}
 26c:	e28db004 	add	fp, sp, #4
 270:	ebffffb3 	bl	144 <uart_init>
 274:	e3a0005a 	mov	r0, #90	; 0x5a
 278:	ebffff6a 	bl	28 <uart_send>
 27c:	e59f0024 	ldr	r0, [pc, #36]	; 2a8 <kernel_main+0x40>
 280:	ebffff95 	bl	dc <uart_send_string>
 284:	e59f0020 	ldr	r0, [pc, #32]	; 2ac <kernel_main+0x44>
 288:	ebffff93 	bl	dc <uart_send_string>
 28c:	ebffff7c 	bl	84 <uart_recv>
 290:	e1a03000 	mov	r3, r0
 294:	e2833001 	add	r3, r3, #1
 298:	e20330ff 	and	r3, r3, #255	; 0xff
 29c:	e1a00003 	mov	r0, r3
 2a0:	ebffff60 	bl	28 <uart_send>
 2a4:	eafffff8 	b	28c <kernel_main+0x24>
 2a8:	000002e0 	andeq	r0, r0, r0, ror #5
 2ac:	000002f0 	strdeq	r0, [r0], -r0	; <UNPREDICTABLE>

000002b0 <put32>:
 2b0:	e5801000 	str	r1, [r0]
 2b4:	e12fff1e 	bx	lr

000002b8 <get32>:
 2b8:	e5900000 	ldr	r0, [r0]
 2bc:	e12fff1e 	bx	lr

000002c0 <delay>:
 2c0:	e2500001 	subs	r0, r0, #1
 2c4:	1afffffd 	bne	2c0 <delay>
 2c8:	e12fff1e 	bx	lr

000002cc <memzero>:
 2cc:	e3a03000 	mov	r3, #0
 2d0:	e4803008 	str	r3, [r0], #8
 2d4:	e2511008 	subs	r1, r1, #8
 2d8:	cafffffb 	bgt	2cc <memzero>
 2dc:	e12fff1e 	bx	lr

Disassembly of section .rodata:

000002e0 <bss_begin-0x18>:
 2e0:	6c6c6548 	cfstr64vs	mvdx6, [ip], #-288	; 0xfffffee0
 2e4:	77202c6f 	strvc	r2, [r0, -pc, ror #24]!
 2e8:	646c726f 	strbtvs	r7, [ip], #-623	; 0xfffffd91
 2ec:	000a0d21 	andeq	r0, sl, r1, lsr #26
 2f0:	00333231 	eorseq	r3, r3, r1, lsr r2

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <bss_begin+0x10d0a2c>
   4:	35312820 	ldrcc	r2, [r1, #-2080]!	; 0xfffff7e0
   8:	332e363a 			; <UNDEFINED> instruction: 0x332e363a
   c:	732b312e 			; <UNDEFINED> instruction: 0x732b312e
  10:	35326e76 	ldrcc	r6, [r2, #-3702]!	; 0xfffff18a
  14:	39333033 	ldmdbcc	r3!, {r0, r1, r4, r5, ip, sp}
  18:	622b312d 	eorvs	r3, fp, #1073741835	; 0x4000000b
  1c:	36202931 			; <UNDEFINED> instruction: 0x36202931
  20:	312e332e 			; <UNDEFINED> instruction: 0x312e332e
  24:	31303220 	teqcc	r0, r0, lsr #4
  28:	32363037 	eorscc	r3, r6, #55	; 0x37
  2c:	Address 0x000000000000002c is out of bounds.


Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002d41 	andeq	r2, r0, r1, asr #26
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000023 	andeq	r0, r0, r3, lsr #32
  10:	4d524105 	ldfmie	f4, [r2, #-20]	; 0xffffffec
  14:	4d445437 	cfstrdmi	mvd5, [r4, #-220]	; 0xffffff24
  18:	02060049 	andeq	r0, r6, #73	; 0x49
  1c:	01090108 	tsteq	r9, r8, lsl #2
  20:	01140412 	tsteq	r4, r2, lsl r4
  24:	03170115 	tsteq	r7, #1073741829	; 0x40000005
  28:	011a0118 	tsteq	sl, r8, lsl r1
  2c:	Address 0x000000000000002c is out of bounds.

