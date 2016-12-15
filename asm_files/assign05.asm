; Chris Golpashin
; Assignment 5 due December 9 2016 at 11:59 PM
; Problem 6. Greatest Common Divisor (GCD)
; Page 285

INCLUDE Irvine32.inc

.data
int1 sdword ?											;variable to hold first number
int2 sdword ?											;variable to hold second number
msgInt1   byte "Enter first integer: ",0
msgInt2   byte "Enter second integer: ",0
msgAns    byte "Greatest common divisor is: ",0

.code
main PROC
        call Clrscr										;clears screen
        call enterInt									;calls procedure to get integer from user

	exit												;exit program
main ENDP

;procedure to obtain values from user
enterInt PROC

    push edx											;save register

    mov  edx,OFFSET msgInt1								;ask user for input
	call WriteString									;display msgInt1
	call ReadInt										;read integer
    mov  int1,eax										;push integer into first variable
	mov  edx,OFFSET msgInt2								;ask user for input
    call WriteString									;display msgInt2
	call ReadInt										;read integer
    mov  int2,eax										;push integer into second variable

	;move both variables into two registers
    mov eax,int1
    mov ebx,int2

    call findGCD										;call procedure to calculate the GCD

	;displaying GCD after done calculating
	mov  edx,OFFSET msgAns
	call WriteString
	call WriteDec
	call Crlf

    call WaitMsg
    pop edx
    ret													;returns back to main procedure

enterInt ENDP

;procedure to calculate the GCD
findGCD PROC

	;save regisers for later
	push ebx
	push edx

	or eax,eax											;explicitly set sign flag
	.IF SIGN?											;in the event of a neg int in EAX and EBX
	  neg eax
	.ENDIF
	or ebx,ebx
	.IF SIGN?
	  neg ebx
	.ENDIF

        L1:
        mov  edx,0										;zero out EAX register
	div ebx												;divide int1 by int2
	cmp  edx,0											;does remainder = 0 ?
	je   L2												;yes: quit
	mov  eax,ebx										;no: prepare for
	mov  ebx,edx										;next iteration
	jmp  L1

        L2:
        mov eax,ebx										;EAX = GCD

	;restore registers from stack
	pop edx
	pop ebx

	ret													;exit from procedure

findGCD ENDP

END main