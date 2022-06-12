;this program demonstrates function calling using 
;the right calling syntax so we don't have to 
;manually control the instruction pointer

mov al, 'H'


print_func:
	mov ah, 0x0e
	int 0x10
	ret
	
call print_func
jmp $
times 510 -($-$$) db 0
dw 0xaa55