;this program demonstrates storing function 
;values on the stack using popa and pusha


mov al, 'H'

another_function:
	pusha
	mov al, 'C'
	mov ah, 0x0e 
	int 0x10 ;prints modified value
	popa ; restores what was originally stored in all registers
	ret

call another_function
times 510-($-$$) db 0
dw 0xaa55