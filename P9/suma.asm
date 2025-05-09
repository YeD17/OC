section .text
    global suma
    
suma:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]
    add eax, ecx
    jmp fin

fin:
    pop ebp
    ret