section .text
global color_code
color_code:
    mov rdx, [rdi]
    mov al, 'b'
    cmp al, dl
    jne .white
    mov rax, 0
    ret
.white:
    mov al, 'w'
    cmp al, dl
    jne .orange
    mov rax, 9
    ret
.orange:
    mov rax, 3
    ret

global colors
colors:
    lea rax, [rel color_list]
    ret

section .data
black:
    db "black", 0
brown:
    db "brown", 0
red:
    db "red", 0
orange:
    db "orange", 0
yellow:
    db "yellow", 0
green:
    db "green", 0
blue:
    db "blue", 0
violet:
    db "violet", 0
grey:
    db "grey", 0
white:
    db "white", 0
color_list:
    dq black, brown, red, orange, yellow, green, blue, violet, grey, white

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
