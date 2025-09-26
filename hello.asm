global _start
section .data
	hello db "Hello World!",10
	length equ $-hello
section .text
_start:
	mov eax,4
	mov ebx,1
	mov ecx,hello
	mov edx,length
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h
