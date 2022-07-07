[bits 32]

VIDEO_MEMORY equ 0xb8000 ;video memory location
WHITE_ON_BLACK equ 0x0f ;background and foreground color

print_string:
    pusha
    mov edx, VIDEO_MEMORY ;set edx to the start of the video memory

print_string_loop:
    mov ah,[ebx] ;move the charcter into ah
    mov al, WHITE_ON_BLACK ;move the character attributes into al

    cmp al,0 ;check if we are at the end of the string i.e \0
    je done ;if so jump to done

    mov [edx], ax ;move the character and its attributes to the character 
    ;cell at the current video memory address

    add ebx,1 ;move to the next character
    add edx,2 ;move to the next character cell in video memory

    jmp print_string_loop


done:
    popa
    ret


times 510-($-$$) db 0
dw 0xaa55