%ifndef PRINT_H
%define PRINT_H

printc: ; printc(al) non-BCC
	pusha
	mov ah, 0x0e
	int 0x10
	popa
	ret

printstr: ; printstr(si) non-BCC
	pusha
	mov ah, 0x0e
	xor bh, bh
    
	.printstr_L:
		lodsb
		or al, al
		jz .printstr_end
		int 0x10
		jmp .printstr_L

	.printstr_end:
	    popa
	    ret

%endif