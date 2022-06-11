;this program simply finds where a variable is stored in memory
;to demonstrate memory addressing by retrieving the variable 
;stored in memory
;this uses the org convention to specify the start of what? 
;it is inconvinient

[org 0x7c00]

mov ah, 0x0e

mov al, [secret]
int 0x10

secret:
	db "X"

jmp $

times 510-($-$$) db 0
dw 0xaa55


