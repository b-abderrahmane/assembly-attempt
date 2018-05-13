global _start


section .text

_start:

	mov eax, [var]
 	lea ebx, [message]
	
	push eax
	push ebx
	pop ebx
	pop eax

	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

section .data

	message: db "Hello world!", 0xA, 0xD
	mlen equ $-message
	var: db 0x69
