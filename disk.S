
; disk_read(LBA Address, Count, Read Location)
disk_read:
    .lba_read:
        mov ah, 0x02
        pop cx                 ; Sector + track ()
        pop al                 ; Count
        mov dh, 0b0100000      ; Head
        pop bx                 ; Buffer

    .chs_read: ; If LBA not supported by drive

    .error:
        stc ; set CF (gotta jc)