;this program demonstrates printing via segmentation
;registers ss, stack registers es. Deals majorly with
;segment offsetting


;I need to understand these new registers.
mov ah,0x0e

mov al, [secret]
int 0x10

mov bx , 0x7c00 ; Can ’t set ds directly , so set bx
mov ds , bx ; then copy bx to ds.
mov al , [secret]
int 0x10 ; Does this print an X?

mov al , [es:secret] ; Tell the CPU to use the es ( not ds ) segment.
int 0x10 ; Does this print an X?

mov bx , 0x7c00
mov es , bx
mov al , [es:secret]
int 0x10 ; Does this print an X?


jmp $
secret:
	db "X"

times 510-($-$$) db 0
dw 0xaa55