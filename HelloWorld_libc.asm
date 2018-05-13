extern printf 
extern exit 

global main   


section .text

main:
	push message
	call printf
	add esp, 0x4 ;pushed one param, so increment the stack (abandon the current top)
	
	mov eax, 0x0
	call exit
	

section .data
	message: db "Hello world!", 0xA, 0xD

