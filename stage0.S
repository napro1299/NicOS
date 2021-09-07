%include "print.inc"

org 0x7c00
bits 16

_start:
	mov bp, 0x7c00

	xor ax, ax
	mov es, ax
	mov ds, ax
	mov ss, ax
	mov sp, bp

	mov si, MSG_STAGE1_LOAD
	call printstr
	
	.read_stage:


	mov si, MSG_STAGE1_LOAD_FAIL
	call printstr

	cli
	.idle: hlt
		jmp .idle

MSG_STAGE1_LOAD: db 'Loading stage2 bootloader...', 0x0a, 0
MSG_STAGE1_LOAD_FAIL: db 'Failed to load stage2 bootloader.', 0x0a, 0

times 510 - ($ - $$) db 0
dw 0xAA55