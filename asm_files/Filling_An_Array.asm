; Problem 1, page 238: Filling an Array

include Irvine32.inc

.data
; variable declarations
	intArray sdword 50 dup(?)
	count dword 0

.code
main proc
	call Randomize				; seed the random number generator	

	mov esi, OFFSET intArray	; esi points to array
	mov ecx, LENGTHOF intArray	; # of elements in intArray
	mov ebx, 10					; lower limit of number
	mov eax, 20					; higher limit of number

	call FillRandom				; programmer defined proc

	invoke ExitProcess,0
main endp


FillRandom proc
	pushad						; save state of registers

	sub eax, ebx				; interval size
	inc eax

L1: push eax					; save interval size
	call RandomRange			; rand num 0 to eax-1, results is in eax
	add eax, ebx				; put rand num into range
	mov [esi], eax				; place rand num into array
	pop eax						; restore interval size

	add esi, 4					; next element in array due to dword
	loop L1

	popad						; return registers to original state
	ret

FillRandom endp

end main