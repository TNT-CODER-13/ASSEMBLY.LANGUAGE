global _start       ; entry point

section .bss
    num1   resb 2   ; reserve 2 bytes for first input
    num2   resb 2   ; reserve 2 bytes for second input
    result resb 2   ; reserve 2 bytes for result (up to 2 digits)

section .text
_start:
    ; ===== Read first number =====
    mov eax, 3      ; sys_read
    mov ebx, 0      ; stdin
    mov ecx, num1
    mov edx, 2
    int 0x80

    ; ===== Read second number =====
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 2
    int 0x80

    ; ===== Convert ASCII to number =====
    mov al, [num1]
    sub al, '0'     ; AL = num1
    mov bl, al      ; BL = num1

    mov al, [num2]
    sub al, '0'     ; AL = num2

    ; ===== Multiply =====
    mul bl          ; AL * BL -> AX (low byte = AL, high byte = AH)

    ; ===== Convert result to ASCII =====
    ; AX holds result (0–81). Divide by 10 to get tens & ones.
    mov bl, 10
    div bl          ; AL / 10 -> AL=quotient (tens), AH=remainder (ones)

    add al, '0'     ; convert tens to ASCII
    mov [result], al
    add ah, '0'     ; convert ones to ASCII
    mov [result+1], ah

    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    mov ecx, result
    mov edx, 2      ; always print 2 characters (e.g. "09")
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
