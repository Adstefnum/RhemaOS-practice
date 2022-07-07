;this is the print function that will be called in
;the other file
print_func:
	mov ah, 0x0e
	int 0x10
	ret