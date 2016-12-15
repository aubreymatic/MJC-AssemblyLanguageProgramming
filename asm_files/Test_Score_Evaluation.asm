; Test Score Evaluation Page 238-239

include Irvine32.inc

.data
; variable declarations
str1 BYTE ": The letter grade is ", 0
grade BYTE ?

.code
main proc
	call Randomize					; seed the random number generator	

	mov ecx, 10						; Repeat loop 10 times

again:
	push ecx						; save loop counter
	mov eax, 51						; used for RandomRange
	call RandomRange				; value [0..50]
	add eax, 50						; becomes [50..100]
	call WriteDec					; optional print statement

	call CalcGrade					; returns the grade in AL
	mov grade, al

	; Print the grade (optional)
	mov edx, OFFSET str1			; ": The letter grade is "
	call WriteString
	mov al, grade
	call WriteChar					; display grade letter (AL)
	call crlf

	pop ecx							; restore the loop counter
	loop again

	invoke ExitProcess,0
main endp

GenerateRandom proc					; Generate random numbers to test CalcGrade


	call CalcGrade
GenerateRandom endp

CalcGrade proc						; Procedure to calculate grade
; Calculates a letter grade
; receives: EAX = numeric grade
; Returns: AL = letter grade

Grade_A:
	cmp eax, 90
	jb Grade_B
	mov al, 'A'
	jmp finished

Grade_B:
	cmp eax, 80
	jb Grade_C
	mov al, 'B'
	jmp finished

Grade_C:
	cmp eax, 70
	jb Grade_D
	mov al, 'C'
	jmp finished

Grade_D:
	cmp eax, 60
	jb Grade_F
	mov al, 'D'
	jmp finished

Grade_F:
	mov al, 'F;

finished:
	ret

CalcGrade endp

end main