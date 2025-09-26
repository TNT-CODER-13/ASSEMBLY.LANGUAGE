; this asm code represents addition of single digit numbers in array
; sum exceeding or equal to 10 wouldn't be visible

section .text
	global _start

_start:
	mov eax,x	;number bytes to be summed
	mov ebx,0	;EBX will store the sum
	mov ecx,5	;ECX will point to the current element to be summed
	
top:	add ebx,[eax]
	add eax,1	;move pointer to next element
	
	loop top	;if counter not 0, then loop again 
	
done:
	add ebx,'0'
	mov [sum],ebx	;done, store result in "sum"
	
display:
	mov edx,1	;message length
	mov ecx,sum	;message to write
	mov ebx,1	;file descriptoe (stdout)
	mov eax,4	;sys_write
	int 80h
	
	mov eax,1
	int 80h
	
section .data
global x
x:
	db	1
	db	2
	db	3
	db	1
	db	2
	
sum:
	db 0,0xa
