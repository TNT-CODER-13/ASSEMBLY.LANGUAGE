global _start       ; entry point

section .bss
    num1   resb 2   ; reserve 2 bytes for first input
    num2   resb 2   ; reserve 2 bytes for second input

section .text
_start:
    mov eax, 3      ; sys_read syscall number
    mov ebx, 0      ; file descriptor 0 = stdin
    mov ecx, num1   ; buffer for first input
    mov edx, 2      ; number of bytes to read
    int 0x80        ; call kernel

    mov eax, 3      ; sys_read syscall number
    mov ebx, 0      ; stdin
    mov ecx, num2   ; buffer for second input
    mov edx, 2      ; read 2 bytes
    int 0x80        ; call kernel

    mov al, [num1]  ; load first input ASCII into AL
    sub al, '0'     ; convert ASCII to numeric value
    mov bl, al      ; save first number in BL

    mov al, [num2]  ; load second input ASCII into AL
    sub al, '0'     ; convert ASCII to numeric value

    add al, bl      ; add first and second number, result in AL

    mov eax, 1      ; sys_exit syscall number
    xor ebx, ebx    ; exit code 0
    int 0x80        ; call kernel
