section .text
    global _start

_start:
    mov eax, x        ; EAX points to start of array
    xor ebx, ebx      ; EBX will hold the sum
    mov ecx, 5        ; 5 elements to sum

top:
    mov dl, [eax]     ; get current byte
    add bl, dl      ; add it to sum
    add eax, 1        ; move to next element
    loop top          ; decrement ECX and repeat

done:
    ; EBX now has total sum
    mov eax, ebx      ; put sum in EAX
    mov ecx, 10
    xor edx, edx
    div ecx           ; EAX / 10 → quotient in AL, remainder in DL

    add al, '0'       ; convert quotient to ASCII
    add dl, '0'       ; convert remainder to ASCII

    mov [sum], al
    mov [sum+1], dl

display:
    mov edx, 3        ; message length (2 digits + newline)
    mov ecx, sum      ; message to write
    mov ebx, 1        ; file descriptor (stdout)
    mov eax, 4        ; sys_write
    int 80h

    mov eax, 1        ; exit
    int 80h

section .data
global x
x:
    db 10
    db 22
    db 11
    db 11
    db 22

sum:
    db 0, 0xa
