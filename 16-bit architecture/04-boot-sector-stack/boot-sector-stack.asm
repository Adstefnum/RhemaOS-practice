;this program demonstrates that the stack grows downwards

mov ah, 0x0e

mov bp, 0x8000
mov sp,bp


push 'A'
push 'b'
push 'C'

pop bx
mov al,bl
int 0x10

pop bx
mov al,bl
int 0x10

pop bx
mov al,bl
int 0x10

mov al,[0xffe2] ; 0xffe2 = 0x8000-0x2
int 0x10 

jmp $
times 510-($-$$) db 0
dw 0xaa55