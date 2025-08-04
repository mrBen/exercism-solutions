section .text
global egg_count
egg_count:
    xor eax, eax
.loop:
    mov rdx, 1
    and rdx, rdi
    add rax, rdx
    shr rdi, 1
    jnz .loop
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
