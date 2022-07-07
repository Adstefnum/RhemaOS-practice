;this program demonstrates function calling
mov al, 'H'
jmp print_func

print_func:
	mov ah, 0x0e
	int 0x10
	jmp return_here

return_here:
	jmp $
	times 510 -($-$$) db 0
	dw 0xaa55
