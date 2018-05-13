global _start


section .text

_start:

	mov ecx, 0x5

printer:
	push ecx
	
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, message
	mov edx, mlen
	int 0x80		
	
	pop ecx
	dec ecx
	jnz printer

	mov ecx, 0x5
	mov eax, '0'

	
loopityloop:

	mov [num], eax
	mov eax, 4
	mov ebx, 1
	push ecx
	
	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, [num]
	inc eax
	
	pop ecx
	loop loopityloop

	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

section .data

	message: db "Hello bitch!", 0xA, 0xD
	mlen equ $-message
	var: db 0x69

section .bss
	num resb 1
