global _start


section .text

_start:
	; print message 1
	mov eax, 0x4
	mov ebx, 0x1
	mov ecx, msg1
	mov edx, mlen
	int 0x80		

	; read first text	
	mov eax, 0x3
        mov ebx, 0x1
        mov ecx, str1
        mov edx, 0xA
        int 0x80

	; print message 2
        mov eax, 0x4 
        mov ebx, 0x1 
        mov ecx, msg2
        mov edx, mlen
        int 0x80    
   	
	; read second text 
        mov eax, 0x3 
        mov ebx, 0x1 
        mov ecx, str2
        mov edx, 0xA 
        int 0x80
	
	; compare strings
	mov ecx, 0xa
	lea esi, [str1]
	lea edi, [str2]
	repe cmpsb
	
	jz Equal
	jmp NotEqual
Equal:
	mov eax, 0x4
        mov ebx, 0x1 
        mov ecx, str1
        mov edx, mlen
        int 0x80

NotEqual:
	; exit gracefully
	mov eax, 0x1
	mov ebx, 0x0
	int 0x80

section .data

	msg1: db "Write string number 1", 0xA, 0xD
	mlen equ $-msg1
	msg2: db "write string number 2", 0xA, 0xD

section .bss
	str1 resw 10
	str2 resw 10
	str3 resw 10
