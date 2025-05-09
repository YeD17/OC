section .text
global strlen1

strlen1:
    push ebp
    mov ebp, esp
    mov eax, 0
loop:
    mov cl, [ebp + 8 + eax]
    cmp cl, 0
    je fin
    inc eax
    jmp loop
    
fin:
    mov esp, ebp
    pop ebp
    ret