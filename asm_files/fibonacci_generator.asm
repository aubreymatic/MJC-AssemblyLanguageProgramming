; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

FIB_Count = 47				; number of vals to generate

.data
; variable declarations
array dword FIB_COUNT dup(?)

.code
main proc
	mov ecx, FIB_COUNT		; size of array for counter
	mov esi, OFFSET array	; address of array into esi
	call generate_fibonacci

INVOKE ExitProcess,0 
main ENDP					; end of main procedure

; procedure uses eax, ebx, and ecx
; pre-condition: esi points to array, ecx is number of elements
; post-condition: fibonacci sequence generated
generate_fibonacci proc
	mov eax, 1				; init fib(1) = 1
	mov ebx, 0				; fib(2) will be fib(1) + 1


L1: add eax, ebx			; generate the next number

	mov [esi], eax			; store value in array
	xchg eax, ebx			; step up the sequence
	add esi, TYPE dword		; goes to next 4 bits due to dword size
	loop L1

	ret						; returns back to where procedure was called
generate_fibonacci ENDP		; end of generate_fibonacci procedure

END main					; end of program as a whole