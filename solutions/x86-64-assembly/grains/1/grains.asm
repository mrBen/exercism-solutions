section .text
global square
square:
    xor eax, eax
    cmp rdi, 64
    jle .while
    ret
.do:
    shl rax, 1
    jnz .nz
    inc rax
.nz:
    dec rdi
.while:
    cmp rdi, 1
    jge .do
    ret

global total
total:
    xor eax, eax
    mov rcx, 65
    jmp .while
.do:
    push rax
    mov rdi, rcx
    push rcx
    call square
    mov rdx, rax
    pop rcx
    pop rax
    add rax, rdx
.while:
    dec rcx
    jnz .do
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
