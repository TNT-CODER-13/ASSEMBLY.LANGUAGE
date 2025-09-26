global _start

section .data
    msgQ db 'Quotient: ',0      ; label for quotient
    lenQ equ $-msgQ

    msgR db 10,'Remainder: ',0  ; newline + label for remainder
    lenR equ $-msgR

section .bss
    num1   resb 2
    num2   resb 2
    qstr   resb 1   ; buffer for quotient
    rstr   resb 1   ; buffer for remainder

section .text
_start:
    ; ===== Read first number =====
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 2
    int 0x80

    ; ===== Read second number =====
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; ===== Convert ASCII to numbers =====
    mov al, [num1]
    sub al, '0'     ; AL = num1
    mov ah, 0       ; clear AH
    mov bl, [num2]
    sub bl, '0'     ; BL = num2

    ; ===== Perform Division =====
    div bl          ; AX ÷ BL → AL=quotient, AH=remainder

    ; ===== Convert quotient and remainder to ASCII =====
    add al, '0'
    mov [qstr], al
    add ah, '0'
    mov [rstr], ah

    ; ===== Print "Quotient: X" =====
    mov eax, 4
    mov ebx, 1
    mov ecx, msgQ
    mov edx, lenQ-1   ; exclude terminating 0
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, qstr
    mov edx, 1
    int 0x80

    ; ===== Print "Remainder: Y" =====
    mov eax, 4
    mov ebx, 1
    mov ecx, msgR
    mov edx, lenR-1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, rstr
    mov edx, 1
    int 0x80

    ; ===== Exit =====
    mov eax, 1
    xor ebx, ebx
    int 0x80
