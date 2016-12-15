; Chris Golpashin
; Assignment 1 due 9/30/16 at 11:59 PM (assign01.asm)
; I need to convert from big endian to little endian.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:DWORD

.data
	; declare variables here
	bigEndian BYTE 12h,34h,56h,78h	;8 bit variable
	littleEndian DWORD ?			;32 bit variable

.code
main proc
	; write your code here
	mov esi, OFFSET bigEndian
    mov eax, 0			;Zereos out the EAX register
    mov al, [esi+3]     ;seperates out 5678h two at a time, using two 8 bit registers, into the EAX register.
    mov ah, [esi+2]		;^

    mov ebx, 0			;Zeroes out the EBX register
    mov bl, [esi+1]     ;Seperates out 1234h two at a time, using two 8 bit registers, into the 32 bit EBX register.
    mov bh, [esi]		;^

	mov esi, OFFSET littleEndian
    mov [esi], eax      ;Move 5678h into lower 16bits of littleEndian
    mov [esi+2], ebx    ;Move 1234h into higher 16bits of littleEndian

	INVOKE ExitProcess,0
main ENDP
END main