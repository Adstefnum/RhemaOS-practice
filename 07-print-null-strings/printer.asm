;this program prints strings continually unti
;we hit a null character

; we also add the printing of a newline

print:
	pusha
	

	start:
		mov al, [bx] ;move the string into al from its address
		cmp al, 0 ;compare if the character in the string is equal to zero
		je end ;jump to the end if true

		mov ah, 0x0e
		int 0x10

		add bx, 1; increase the loop pointer
		jmp start

	end:
		popa
		ret


print_nl:
	pusha ; push all registers to the stack

	mov ah, 0x0e ; teletype interrupt
	mov al,0x0a ; newline character
	int 0x10
	mov al, 0x0d ; carriage return character
	int 0x10

	popa ; restore all registers to previous values

	ret