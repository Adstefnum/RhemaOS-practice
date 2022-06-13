;this program demonstrates printing null-ending
;strings

[org 0x7c00]
mov bx, HELLO_STRING
call print

call print_nl

mov bx, GOODBYE_STRING
call print

jmp $
%include "printer.asm"

;store data
HELLO_STRING:
	db "Hello my creator" ,0; the zero tells the program where to stop printing

GOODBYE_STRING:
	db "Goodbye my creator, I'll miss you", 0

times 510-($-$$) db 0
dw 0xaa55