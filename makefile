AS=i686-elf-as
AS_FLAGS=-msyntax=intel

BOOT_FILE=boot.S
BOOT_OBJ=boot.o

boot:
	$(AS) $(AS_FLAGS) $(BOOT_FILE) -o $(BOOT_OBJ)
