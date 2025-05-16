%include "../LIB/pc_iox.inc"

extern pBin8b
global pBin16b

section .text
pBin16b:
    push ebp
    mov ebp, esp
    push ebx

    mov bx, [ebp + 8]       

    movzx eax, bh           
    push eax
    call pBin8b
    add esp, 4             


    movzx eax, bl           
    push eax
    call pBin8b
    add esp, 4              

    pop ebx
    pop ebp
    ret