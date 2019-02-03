#include "mm.h"

.section ".text.boot"

.globl _start
_start:

master:
	ldr	r0, =bss_begin
	ldr	r1, =bss_end
	sub	r1, r1, r0
	bl 	memzero

	mov	sp, #LOW_MEMORY 
	bl	kernel_main
	b 	proc_hang		// should never come here

proc_hang:
	b proc_hang
