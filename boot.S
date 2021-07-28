.code16
.org 0x7c00
.byte 34,5,23,45

movs %ax, %bx
shit: .byte 3,3,3,3,3
fuck: .byte 2,2,2,2

boot:
    .id: .byte 3
    .version: .byte 2

