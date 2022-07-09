[org 0x7c00]

KERNEL_OFFEST equ 0x1000 ;memory offset for our kernel code

mov [BOOT_DRIVE],dl ;BIOS stores our boot drive in dl so we store it for later use

mov bp,0x9000 ;setup stack pointer
mov sp,bp

mov bx , MSG_REAL_MODE ; Announce that we are starting
call print ; booting from 16 - bit real mode
call load_kernel ; Load our kernel
call switch_to_pm ; Switch to protected mode , from which we will not return
jmp $

% include "../16-bit architecture/09/disk_load.asm"
%include "../32-bit architecture/global-descriptor-table.asm"
%include "../32-bit architecture/print_string.asm"
%include "../16-bit architecture/07-print-null-strings/printer.asm"
%include "/../32-bit architecture/switch_to_pm.asm"

[bits 16]
[bits 32]
