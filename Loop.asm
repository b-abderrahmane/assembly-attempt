global _start


section .text


print_text:

        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, [text]
        mov edx, mlen
        int 0x80
	ret

_start:

	mov ecx, 0x5
	mov eax, message
	mov [text], eax



printer:
	push ecx
	call print_text	
	pop ecx
	dec ecx
	jnz printer

	
        mov eax, 0x1
        mov ebx, 0x0
        int 0x80

section .data

	message: db "Hello world!", 0xA, 0xD
	mlen equ $-message
	var: db 0x69

section .bss
	text resw 2
