;a program to learn a bit about conditionals

mov ah, 0x0e

mov bx, 30

cmp bx, 4
jle lessorequal

cmp bx,40
jl less

mov al,'C'
int 0x10
jmp end

lessorequal:
	mov al, 'A'
	int 0x10
less:
	mov al, 'B'
	int 0x10
end:
	jmp $
	times 510 -($-$$) db 0
	dw 0xaa55


