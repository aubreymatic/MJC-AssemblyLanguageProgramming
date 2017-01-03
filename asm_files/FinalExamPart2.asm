;

INCLUDE Irvine32.inc


.data
VALID_PIN = 0
PIN_SIZE = 5
;pin numbers
pin1	 BYTE 5,3,5,4,3
pin2	 BYTE 2,1,9,6,2
pin3	 BYTE 5,3,5,4,3
pin4	 BYTE 2,1,9,6,2
;min max range for each digit of pin
minDigit BYTE 5,2,4,1,3
maxDigit BYTE 9,5,8,4,6

.code
main PROC
	mov ESI, OFFSET pin1
	call Validate_PIN

	mov ESI, OFFSET pin2
	call Validate_PIN

	mov ESI OFFSET pin3
	call Validate_PIN

	mov ESI OFFSET pin4
	call Validate_PIN

	exit
main ENDP

Validate_PIN PROC

L1: mov al, [ESI]						; start of pin
	cmp al, minDigit[EDI]
	jb error
	cmp al, minDigit[EDI+1]
	jb error


error:									; between digit 1 through 5
	mov index, edi						;
	popad
	mov eax, index						; return position # of first bad digit
	inc eax								; why?
										; to be between 1 and 5

	ret

Validate_PIN ENDP

;my psuedo code
;-----------------------------------------------------------
;-----------------------------------------------------------
;Validate_PIN PROC

;loop start
;start at first element in minDgit, maxDigit, and pin# array.
; cmp ESI,minDigit[1]
;jb ERROR
;compare maxDigit
;ja ERROR
;continue on by inc next element in the arrays


;ERROR:
;mov EAX,1
;ret

;VALID:
;EAX
;loop end

;ret
;Validate_PIN ENDP

END main