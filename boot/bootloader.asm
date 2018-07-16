	BITS 32

	jmp short start
	nop

start:
	mov ax, 07C0h
	add ax, 288
	cli
	mov ss, ax
	mov sp, 4096
	sti

	mov ax, 07C0h		; Set data segment to where we're loaded
	mov ds, ax

	mov si, bootString
	call printString

	jmp $

	bootString db 'Loading YetAnotherHypervisor', 0


printString:
	mov ah, 0eh

.printLoop:
	lodsb			; Get character from string
	cmp al, 0
	je .done		; Once we get the null character we're done
	int 10h
	jmp .printLoop

.done:
	ret

	times 510-($-$$) db 0	; Pad remainder of boot sector with zeros
	dw 0xAA55		; Boot signature
