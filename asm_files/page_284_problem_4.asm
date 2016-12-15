; page 284 problem 4 

INCLUDE Irvine32.inc

.data
	; declare variables here
	key BYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
	keySize = $ - key
	plainText BYTE "This is a secret message, which will be encryoted", 0


.code
main proc
	; write your code here
	call Clrscr																	; clear screen

	mov esi, OFFSET plainText													; pointer to beginning plainText

L1:	mov ecx, keySize															; outer loop to cycle through key (10 character)
	mov edi, OFFSET key															; pointer to beginning of key
	call Encode																	; procedure to encode
	jnz L1																		; continue if ZF not set

	; you could also program decryption here if you wanted
	; may come back to this

	Encode proc
	; encodes a string using rotation based on key
	; pre-condition: ECX - size of key in bytes
	;				 ESI - points to beginning of plainText
	;				 EDI - address of the key
	; post-condition: ZF = 1 if the end of string is found

L1: push ecx																	; save my loop count

	cmp BYTE PTR[esi], 0														; end of string
	je L4																		; yes, then quit with ZF = 1

	mov cl, [edi]																; mov element key into cl
	cmp cl, 0
	jge  L2																		; if cl is positive
	neg cl																		; cl is negative, make it positive
	rol BYTE PTR[esi], cl														; encrypt character at BYTE PTR[esi]
																				; which happens to change plainText
	jmp L3																		; go to next byte in plainText
L2: ror BYTE PTR[esi], cl														; rotate right, cl is positive
																				; if cl is zero, do nothing
L3: inc esi																		; moving to next character in plainText
	inc edi	; moveing to next value in key
	pop ecx	; restore loop count
	loop L1	

	; Clear the zero flag to indicate that we have not yet reached the end of the string
	or eax, 1
	jmp L5

L4: pop ecx; RESTORE ECX
L5: ret

Encode endp

	invoke ExitProcess, 0
main ENDP

END main