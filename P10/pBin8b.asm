%include "../LIB/pc_iox.inc"

global pBin8b

section .text
pBin8b:
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edi

    mov bl, [ebp + 8]
    mov ecx, 8
    mov edi, buffer

.next_bit:
    mov al, bl
    shr al, 7
    and al, 1
    add al, '0'
    mov [edi], al
    inc edi
    shl bl, 1
    loop .next_bit

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 8
    int 0x80

    pop edi
    pop ecx
    pop ebx
    pop ebp
    ret

section .data
buffer times 8 db 0