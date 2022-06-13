;this program demonstrates function including
;external files

mov al, 'H'
call print_func

jmp $
%include "print_func.asm"

times 510 -($-$$) db 0
dw 0xaa55