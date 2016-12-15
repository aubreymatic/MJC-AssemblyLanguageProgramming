; Page 240 Probabillities and Colors

INCLUDE Irvine32.inc

.data
	; declare variables here
	TextToDisplay BYTE "Color Text", 0

.code
main proc
	; write your code here
	mov ECX, 20								; counter for loop

	call ClrScr
	call Randomize							; seed for random number generator

	mov EDX, OFFSET TextToDisplay			; used in WriteString

L1:
	call ChooseColor						; need create
	call SetTextColor						; set display color using eax
	call WriteString						; display line of text using edx
	call CrLf								; carriage return, line feed
	loop L1

	invoke ExitProcess, 0
main ENDP

; procedure to choose a color for outputted text
; pre-condition: assumes eax is free
; post-condition: returns color in EAX
ChooseColor proc

	mov eax, 10								; generate number between 0 and 9
	call RandomRange

J_Green:
	cmp eax, 4								; is random # is btw 4 and 9
	jb J_Blue								; if random # is < 4, jump to J_Blue
	mov eax, green							; set color to green
	jmp J_Finished

J_Blue:
	cmp eax, 3
	jne J_White									; if random # is not 3, jump to white
	mov eax, blue								; set color to blue
	jmp J_Finished

j_White:
	mov eax, white								; set color to white (number btw 0 and )

J_Finished:
	ret

ChooseColor ENDP

END main