;32 bit protected mode program
[org 0x7c00]

mov bp,0x9000
mov sp,bp  ;set the stack pointer

mov bx,MSG_REAL_MODE
call print

call switch_to_pm ;we never return from here


jmp $
%include "global-descriptor-table.asm"
%include "print_string.asm"
%include "../16-bit architecture/07-print-null-strings/printer.asm"
%include "switch_to_pm.asm"

[bits 32]
BEGIN_PM:
    mov ebx,MSG_PROT_MODE
    call print_string

    jmp $

MSG_REAL_MODE db " Started in 16 - bit Real Mode " , 0
MSG_PROT_MODE db " Successfully landed in 32 - bit Protected Mode " , 0

times 510-($-$$) db 0
dw 0xaa55