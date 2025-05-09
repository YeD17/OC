section .text
    global getBit

getBit:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]
    mov edx, 1
    shl edx, cl
    and eax, edx
    cmp eax, 0
    je fin
    mov eax, 1

fin:
    pop ebp
    ret