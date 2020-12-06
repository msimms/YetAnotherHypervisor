nasm -f bin -o bootloader.bin bootloader.asm
dd status=noxfer conv=notrunc if=bootloader.bin of=bootloader.flp
mkdir iso
mkisofs -o bootloader.iso -b bootloader.flp iso/
