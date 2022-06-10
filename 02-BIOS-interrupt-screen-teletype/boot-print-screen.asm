;this program prints a message to the OS screen
;by using the 0x10 interrupt code with the 0x0e 
;teletype code

mov ah, 0x0e ; screen teletype code

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10
mov al, ' '
int 0x10
mov al, 'S'
int 0x10
mov al, 't'
int 0x10
mov al, 'e'
int 0x10
mov al, 'p'
int 0x10
mov al, 'h'
int 0x10
mov al, 'e'
int 0x10
mov al, 'n'
int 0x10
mov al, '.'
int 0x10
mov al, ' '
int 0x10
mov al, 'T'
int 0x10
mov al, 'h'
int 0x10
mov al, 'i'
int 0x10
mov al, 's'
int 0x10
mov al, ' '
int 0x10
mov al, 'i'
int 0x10
mov al, 's'
int 0x10
mov al, ' '
int 0x10
mov al, 'R'
int 0x10
mov al, 'H'
int 0x10
mov al, 'E'
int 0x10
mov al, 'M'
int 0x10
mov al, 'A'
int 0x10
mov al, 'O'
int 0x10
mov al, 'S'
int 0x10

jmp $ ;jump to current address forever

times 510-($-$$) db 0

dw 0xaa55