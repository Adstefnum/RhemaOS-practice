[bits 16]

switch_to_pm:
    cli ;switch off interrupts for the mean time so they don't disturb us

    lgdt [gdt_descriptor] ;load the gdt which defines protected mode segments

    mov eax,cr0 ;change the first bit of the control register cr0 to switch to 
    or eax,0x1 ;protected mode
    mov cr0,eax

    jmp CODE_SEG:init_pm ;make a far jump so as to flush the pipeline and allow
                         ;the program run in one pipeline

[bits 32]
init_pm:
    mov ax, DATA_SEG ;our old segment registers are now useless so we must point
    mov ds,ax                ;them to the data segment defined in our gdt.
    mov ss,ax
    mov es,ax
    mov fs,ax
    mov gs,ax

    mov ebp,0x9000 ;move our stack pointer to the start of the free space
    mov esp,ebp

    call BEGIN_PM