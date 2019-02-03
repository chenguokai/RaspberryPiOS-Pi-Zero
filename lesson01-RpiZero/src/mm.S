.globl memzero
memzero:
	mov r3, #0
	str r3, [r0], #4
	subs r1, r1, #4 // 32bit should have 4 bytes
	bgt memzero
	bx lr
