;this program demonstrates function including
;external files

mov al, 'H'
%include "print_func.asm"
	
call print_func
jmp $
times 510 -($-$$) db 0
dw 0xaa55