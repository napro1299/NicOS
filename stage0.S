;
; Bootloader Calling Convention (BCC)
; Parameters are pushed onto the stack from left
; to right.
;
%include "constant.S"

org STAGE_0_ADDR
bits 16

mov bp, 0x7c00

xor ax, ax
mov es, ax
mov ds, ax
mov ss, ax
mov sp, bp

_start:
	mov si, MSG_STAGE2_LOAD
	call printstr
	; load second stage


	mov si, MSG_STAGE2_LOAD_FAIL
	call printstr

	jmp $

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

MSG_STAGE2_LOAD: db 'Loading stage2 bootloader...', 0x0a, 0
MSG_STAGE2_LOAD_FAIL: db 'Failed to load stage2 bootloader.', 0x0a, 0

TBL_HEX: db '0123456789ABCDEF', 0
STR_HEX_PRE: db '0x', 0

times 510 - ($ - $$) db 0
dw 0xAA55