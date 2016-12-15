; Chris Golpashin
; Assignment 3 Color Matrix due October 30, 2016

INCLUDE Irvine32.inc


.data
Character DWORD ?				; Creates a 32 bit variable named "Character"


.code
main PROC						; Main procedure of the program
	mov Character, "A"			; Moves "A" into the "Character" variable. This can be any character you want to be displayed.
    call Clrscr					; Makes sure that the console windows is actually empty.
	call GenerateColorMatrix	; Call the procedure to generate all of the possible colors

main ENDP						; End of the main procedure

GenerateColorMatrix PROC		; procedure to generate colors and display them.
    mov  eax,0					; puts zero into the EAX register This starts the color by black for the first time.

    mov  ecx,16					; Puts 16 into the ECX register. ECX is the loop counter.
L1: push ecx					; loop for background colors. Saves loop counter by pushing ECX onto the stack

    mov  ecx,16					; sets ECX back to 16, so the loop can continue to display 16 different colored characters for each row of new backgrounc colors.
L2: call SetTextColor			; nested loop for text colors. SetTextColor=Sets the foreground and background colors of all subsequent text output to the console. Page 167 of Assembly Language for x86 Processors Edition 7 by Kip Irvine. http://programming.msjc.edu/asm/help/source/irvinelib/settextcolor.htm
    push eax					; pushes value from the EAX register onto stack, so it can be saved for later
    mov  eax,Character			; Moves the value from "Character" into EAX
    call WriteChar				; Writes a single character to the console window. Page 169 of Assembly Language for x86 Processors Edition 7 by Kip Irvine.
    pop  eax					; Restores the value of EAX by popping the stack

    inc  al						; inc the text color	AL+AH=AX->EAX Page 39 of Assembly Language for x86 Processors Edition 7 by Kip Irvine.
    loop L2						; end of loop L2. Will continue the L2 loop unless it reaches the last 16th character color. ECX decrements when it reaches the end of loop L2. But when ECX reaches zero, it will continue after L2 into L1.

    sub  al,16					; resets the text color for next iteration
    add  al,16					; goes to the next background color
    call Crlf					; goes to the next line in the console. Page 159 of Assembly Language for x86 Processors Edition 7 by Kip Irvine.

    pop  ecx					; restores the loop counter value by popping the stack and storing that value int ECX.
    loop L1						; end of loop L1. ECX decreases by one when it reaches the end of loop L1.
								; ECX is also being used as a loop counter for L1. When ECX reaches zero, the program will continue, after L1, into the GenerateColorMatrix procedure.
	
	mov eax, 7
	call SetTextColor			; Resets text color back to the default value, just in case.
	
    exit						; exits the program
GenerateColorMatrix ENDP		; end of GenerateColorMatrix procedure

END main