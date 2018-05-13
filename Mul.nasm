global _start


section .text

_start:

	mov eax, 0xffffffff
	mov bx, 0x6
	mul bx
	
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

section .data

	message: db "Hello bitch!", 0xA, 0xD
	mlen equ $-message
	var: db 0x69
