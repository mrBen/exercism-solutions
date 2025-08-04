section .text
global nucleotide_counts
nucleotide_counts:
    mov qword [rsi + 0*8], 0
    mov qword [rsi + 1*8], 0
    mov qword [rsi + 2*8], 0
    mov qword [rsi + 3*8], 0
    
    xor ecx, ecx
    jmp .while
.do:

    cmp byte [rdi + rcx], 'A'
    je .a
    cmp byte [rdi + rcx], 'C'
    je .c
    cmp byte [rdi + rcx], 'G'
    je .g
    cmp byte [rdi + rcx], 'T'
    je .t
    jmp .invalid

.a:
    inc qword [rsi + 0*8]
    jmp .done
.c:
    inc qword [rsi + 1*8]
    jmp .done
.g:
    inc qword [rsi + 2*8]
    jmp .done
.t:
    inc qword [rsi + 3*8]
.done:

    inc rcx
.while:
    mov dl, byte [rdi + rcx]
    cmp dl, 0
    jne .do

jmp .return
.invalid:
    mov qword [rsi + 0*8], -1
    mov qword [rsi + 1*8], -1
    mov qword [rsi + 2*8], -1
    mov qword [rsi + 3*8], -1
.return:
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
