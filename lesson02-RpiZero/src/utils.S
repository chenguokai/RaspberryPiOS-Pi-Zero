.global __aeabi_uidiv

__aeabi_uidiv:
	mov r3, #0
	cmp r0, r1
	blt div_end
div_loop:
	add r3, #1
	sub r0, r0, r1
	cmp r0, r1
	bge div_loop
	b div_end

div_end:
	mov r0, r3
	bx lr


.global __aeabi_uidivmod

__aeabi_uidivmod:
	cmp r0, r1
	blt mod_end

mod_loop:
	sub r0, r0, r1
	cmp r0, r1
	bge mod_loop
	b mod_end

mod_end:
	bx lr


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
