;this program simply finds where a variable is stored in memory
;to demonstrate memory addressing by retrieving the variable 
;stored in memory

mov ah, 0x0e

;one way
mov bx, secret ; get location of secret in memory
add bx, 0x7c00 ; add to the start of the loaded boot sector
mov al, [bx]
int 0x10

;another- exact memory address
mov al, [0x7c1e]
int 0x10

secret:
	db "X"

jmp $

times 510-($-$$) db 0
dw 0xaa55


