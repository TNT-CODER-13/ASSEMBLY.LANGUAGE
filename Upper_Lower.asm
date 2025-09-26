global _start

section .data
	s1 db "HELLO WORLD", 0
	len equ $-s1
	
section .bss
	s2 resb 20
	
section .text
	_start:
	 mov ecx, len
	 mov esi, s1
	 mov edi, s2

loop_here:
	lodsb
	or al, 20h
	stosb
	loop	 loop_here
	cld 
	rep movsb
	mov edx, 20
	mov ecx, s2
	mov ebx, 1
	mov eax,4
	int 80h
	
	mov eax, 1
	int 80h
	
	
