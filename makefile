AS=nasm
LD=i686-elf-ld

AS_FLAGS=-f bin
LD_FLAGS=

STAGE1=loader0.bin

IMG=disk

build:
	$(AS) stage0.S $(AS_FLAGS) -o $(STAGE1)

img: 
	dd if=/dev/zero of=$(IMG).img count=20000 bs=1024 status=progress
	parted $(IMG).img mklabel gpt

	dd if=loader0.bin of=$(IMG).img bs=512 status=progress # first 512 bytes Protective MBR

run:
	qemu-system-x86_64 -fda $(IMG).img


