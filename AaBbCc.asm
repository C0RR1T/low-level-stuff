mov ah, 0x0e
mov al, 'A'
int 0x10
add al, 0x20
int 0x10
sub al, 0x20
loop:
    inc al
    cmp al, 'Z' + 1
    je exit
    int 0x10
    add al, 0x20 ; Print the lowercase of the  character
    int 0x10
    sub al, 0x20 ; Reset to uppercase of the character
    jmp loop


exit:
    jmp $
times 510-($-$$) db 0
db 0x55, 0xaa