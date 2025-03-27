%include "./LIB/pc_io.inc"
section .text
    global _start       ; Indica el punto de inicio del programa
_start:
    ; sys_write (stdout, message, length)
    ;mov eax, 4          ; Código del sistema para sys_write
    ;mov ebx, 1          ; stdout (archivo de salida estándar)
    ;mov ecx, message    ; Dirección del mensaje
    ;mov edx, length     ; Longitud del mensaje
    ;int 0x80            ; Interrupción para llamar al kernel
    call clrscr
    mov al, 'x'
    call putchar
    mov al, 0x0A
    call putchar
    mov edx, message
    call puts

    ; sys_exit (return_code)
    mov eax, 1          ; Código del sistema para sys_exit
    mov ebx, 0          ; Código de retorno 0 (todo correcto)
    int 0x80            ; Interrupción para salir del programa

section .data
    message: db 'Hello, world', 0x0A,0   ; Mensaje y salto de línea
    length: equ $-message              ; Longitud del mensaje