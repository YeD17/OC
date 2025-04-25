%include "../LIB/pc_iox.inc"

section .text
    extern pBin_n, pBin_b, pBin_w, pBin_dw
    global _start

_start:
    call soloDigitos
    call soloMayusculas
    call imprimirAsteriscos
    call capturarCaracteres
    call imprimirCaracteres

    mov eax, 1
    int 0x80


; Inciso a)

soloDigitos:
    mov edx, buffer

sd_loop:
    call getche
    cmp al, 10
    je sd_fin

    cmp al, '0'
    jl sd_loop
    cmp al, '9'
    jg sd_loop

    call putchar
    mov [edx], al
    inc edx

    cmp al, '5'
    jl sd_msg_menor5

    jmp sd_loop

sd_msg_menor5:
    mov edx, msgMenor5
    call puts
    jmp sd_loop

sd_fin:
    mov byte [edx], 0
    ret

; Inciso B)
soloMayusculas:
    mov edx, buffer

sm_loop:
    call getche
    cmp al, 10
    je sm_fin

    
    cmp al, '0'
    jl sm_es_letra
    cmp al, '9'
    jle sm_es_numero

sm_es_letra:
    cmp al, 'A'
    jl sm_loop
    cmp al, 'Z'
    jg sm_loop

    call putchar
    mov [edx], al
    inc edx
    mov edx, msgEsLetra
    call puts
    jmp sm_loop

sm_es_numero:
    call putchar
    mov [edx], al
    inc edx
    mov edx, msgEsNumero
    call puts
    jmp sm_loop

sm_fin:
    mov byte [edx], 0
    ret

;Inciso C)

imprimirAsteriscos:
    mov ecx, 5
ia_loop:
    cmp ecx, 0
    je ia_fin
    mov al, '*'
    call putchar
    loop ia_loop

    mov al, 10
    call putchar
ia_fin:
    ret

capturarCaracteres:
    mov ecx, 10         
    mov edi, buffer    
    

.cc_loop:
    call getche
    mov [edi], al
    inc edi
    loop .cc_loop
    ret


imprimirCaracteres:
    pusha

 
    mov edx, msgCaracteres
    call puts


    mov ecx, 10
    mov esi, buffer

.ic_loop:
    mov al, [esi]
    call putchar
    mov al, 10         
    call putchar
    inc esi
    loop .ic_loop

    popa
    ret

section .data
    msgMenor5     db " El numero es menor que 5", 10, 0
    msgEsLetra    db " Es una letra mayuscula", 10, 0
    msgEsNumero   db " Es un numero", 10, 0
    msgCaracteres db "Caracteres capturados", 10, 0

section .bss
    buffer resb 256
    