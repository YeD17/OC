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
    pop eax           


    movzx eax, bl           
    push eax
    call pBin8b
    pop eax            

    pop ebx
    pop ebp
    ret