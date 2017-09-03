global _start


section .text
_start:

	jmp begin

zaza:

	mov rax, 0x10
	xor rbx, rbx

begin:
	mov rax, 0xb

printHW:

	push rax
	
	;write sys call is 0x04 ??
	mov rax, 0x04
	mov rbx, 1
	mov rcx, message
	mov rdx, mlen
	int 0x80

	pop rax
	dec rax
	jnz printHW

	mov rax, 0x1
	mov rbx, 0xa
	int 0x80

section .data

	message: db " no one is touching zaza ! "
	mlen 	 equ $-message
