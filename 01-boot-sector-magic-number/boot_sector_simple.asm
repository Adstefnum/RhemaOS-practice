;this is an emulation of a boot sector read by the BIOS
;it however just loops forever after reading the 0xaa55 magic number
;compile with nasm -f bin boot_sector_simple.asm -o boot_sector_simple.bin
;run with qemu boot_sector_simple.bin

;runs an infinite loop with the manufacture instruction, e9 fd ff
loop:
	jmp loop

;fill with x zeros where x max block size(512 bytes) - size of magic number (2 bytes) - space for
;previous instruction
times 510 - ($-$$) db 0

;add the magic number
dw 0xaa55
