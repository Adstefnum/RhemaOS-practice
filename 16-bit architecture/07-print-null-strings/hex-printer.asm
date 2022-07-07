;this program demonstrates printing hexadecmials
;this will be useful in debugging at this low-level

%include "printer.asm"

hex_printer:
	pusha
	mov cx,0 ; using this register to store the iterator variable

	hex_loop:
		cmp cx,4 ;if iterator variable is equal to 4(lenght of hex without null character) jump to the end
		je hex_end

		mov ax,dx ;move the value in dx to ax for calculation
		and ax,0x000f ; retain only a single number by using and operation 3&0 = 0, 3&f =3
		; could have used shr al,3 and used the carry flag to retrieve shifted values
		add al,0x30 ; add this to get the ASCII of the number
		cmp al, 0x39 ;if the number is less than or equal to 0x39 = 9 go to step 2
		jle step2
		add al,7 ;else add 7 to get to actual ASCII values of A-F(65-70)=> hex(0x41-0x46)
		;i.e 0x30 + 0xA = 0x3A = (16x3)+10 = 58
		; A in ASCII = 65, 65-58 = 7. Same offest for A-F

	step2:
		mov bx,HEX_OUT+5; bx = address of HEX_OUT +5(len of string) should be 4 but ends with a zero(null character)
		sub bx,cx ;get the memory address to put the single ASCII character
		;characters are stored on the stack in different but continuous location
		;e.g the word Bird is stored like this on the stack
			;0x08048374      42         ‘B’ 
			;0x08048375      69         ‘i’ 
			;0x08048376      72         ‘r’ 
			;0x08048377      64         ‘d’ 
			;0x08048378      00      <Null> 
		; each ASCII character is stored separately so we have to find correct memory 
		; location to put the ASCII char that corresponds to the hex no components1,F,B,6 
		; in 0x1FB6
		mov [bx],al ;move the ASCII char in al to the expression/variable bx not as memory
		;address but as the actual character
		ror dx,4 ;rotating the input argument in 4 steps back to normal,
		;0x1234 -> 0x4123 -> 0x3412 -> 0x2341 -> 0x1234
		; why do we need to do this?
	
		add cx,1 ;increment iterator variable
		jmp hex_loop

	hex_end:
		mov bx, HEX_OUT
		call print
		popa
		ret

HEX_OUT:
	db "0x0000", 0
