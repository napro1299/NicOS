%ifndef DISK_H
%define DISK_H

%include "print.S"
%include "constant.S"

; disk_read(LBA Address, Count, Read Location)
disk_read:
    mov ah, [disk_verified_ext]
    or ah, ah
    jz .check_ext_end

    .check_ext: ; Extremely unlikely to fail
        mov ah, 0x41
        mov bx, 0x55aa
        mov dl, 0x80
        int 0x13
        jnc .set_verified

        mov si, DISK_NO_LBA_SUPPORT
        call printstr

        .set_verified:
            mov [disk_verified_ext], 0
    .check_ext_end:


    .dap:
        .size:          db 0x10, 0
        .read_sectors:  dw 0         ; Count
        .read_loc:      dd 0         ; Read Location
        .sector_start:  dd 0, 0      ; LBA Address

    mov ah, 0x42
    mov dl, [BOOT_DRIVE]
    mov si, .dap
    

disk_verified_ext db 1

DISK_NO_LBA_SUPPORT db "Error: LBA not supported", 0ah, 0

%endif