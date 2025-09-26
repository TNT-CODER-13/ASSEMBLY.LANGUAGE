global _start
section .data
	name1 db 'TANAY',10
	len1 equ $-name1
	
	name2 db 'THUBE',10
	len2 equ $-name2
	
section .text		
	;macro is like a function taking two parameter name &len
	%macro print 2
		mov eax,4
		mov ebx,1
		mov ecx,%1
		mov edx,%2
		int 80h
	%endmacro
	
	_start:
		print name1,len1
		print name2,len2
		
		mov eax,1
		mov ebx,0
		int 80h
