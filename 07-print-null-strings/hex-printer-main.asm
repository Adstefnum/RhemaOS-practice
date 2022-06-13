;this program calls the hex_printer function
mov dx,0x1fb6
call hex_printer

jmp $
%include "hex-printer.asm"
times 510-($-$$) db 0
dw 0xaa55