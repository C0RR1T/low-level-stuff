[org 0x7c00]
mov ah, 0x0e
mov cl, 0

fb_loop:
    inc cl
    cmp cl, 10
    jg exit
    test cl, 1
    je print_equal_number
    jmp print_odd_number

print_equal:
    mov bx, equal
    jmp print_while_not_null

print_equal_number:
    mov al, cl
    add al, 48
    int 0x10
    mov al, ':'
    int 0x10
    jmp print_equal

print_odd_number:
    mov al, cl
    add al, 48
    int 0x10
    mov al, ':'
    int 0x10
    jmp print_not_equal

print_not_equal:
    mov bx, not_equal
    jmp print_while_not_null

print_while_not_null:
    mov al, [bx]
    int 0x10
    cmp al, 0
    je fb_loop ; If String is finished, go back to the loop!
    inc bx
    jmp print_while_not_null

equal: db "Is Equal", 13, 10, 0
not_equal: db "Not equal", 13, 10 , 0
exit:
    jmp $
times 510-($-$$) db 0
db 0x55, 0xaa

