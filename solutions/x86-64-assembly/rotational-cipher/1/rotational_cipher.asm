section .text
global rotate
rotate:
    xor ecx, ecx
    jmp .while
.do:
    xor eax, eax
    mov al, byte [rdi + rcx]

    cmp ax, 'A'
    jl .copy
    cmp ax, 'Z'
    jle .upper
    cmp ax, 'a'
    jl .copy
    cmp ax, 'z'
    jle .lower
    jmp .copy

.upper:
    mov bx, 'Z'
    jmp .rot
.lower:
    mov bx, 'z'

.rot:
    add ax, si
    cmp ax, bx
    jle .copy
    sub ax, 26

.copy:
    mov byte [rdx + rcx], al
    inc rcx
.while:
    cmp byte [rdi + rcx], 0
    jne .do
    mov byte [rdx + rcx], 0
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
