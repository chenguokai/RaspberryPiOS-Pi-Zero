// lack get_el function

.globl get_el
get_el:
	mrs r0, cpsr
	and r0, r0, #31 // 0x1F
	bx lr

// The ARMv6 instruction set does not have EL concept. CPSR bits may share some similarities.
.globl put32
put32:
	str r1,[r0]
	bx lr

.globl get32
get32:
	ldr r0,[r0]
	bx lr

.globl delay
delay:
	subs r0, r0, #1
	bne delay
	bx lr
