section .text
global strchr

strchr:
    push ebp
    mov ebp, esp
    mov eax, 0

loop:
    cmp byte [ebp + 8 + eax], 0
    je fin
    cmp byte [ebp + 8 + eax], cl
    je aparece
    inc eax
    jmp loop

fin:
    mov esp, ebp
    pop ebp
    mov eax, 0
    ret

aparece:
    mov eax, [ebp + 8 + eax]
    mov esp, ebp
    pop ebp
    ret