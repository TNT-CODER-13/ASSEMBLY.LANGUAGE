global _start       ; entry point

section .bss
    num1   resb 2   ; reserve 2 bytes for first input
    num2   resb 2   ; reserve 2 bytes for second input

section .text
_start:
    ; Read first number
    mov eax, 3      ; sys_read
    mov ebx, 0      ; stdin
    mov ecx, num1   ; buffer for first input
    mov edx, 2      ; number of bytes to read
    int 0x80

    ; Read second number
    mov eax, 3      ; sys_read
    mov ebx, 0      ; stdin
    mov ecx, num2   ; buffer for second input
    mov edx, 2
    int 0x80

    ; Convert ASCII to numeric for num1
    mov al, [num1]
    sub al, '0'
    mov bl, al      ; BL = num1

    ; Convert ASCII to numeric for num2
    mov al, [num2]
    sub al, '0'

    ; Perform subtraction: num1 - num2
    sub bl, al      ; BL = BL - AL
    mov al, bl      ; result in AL

    ; Exit program
    mov eax, 1      ; sys_exit
    xor ebx, ebx
    int 0x80
