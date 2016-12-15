; 

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


.data
; variable declarations


.code
main proc
	mov ecx, 4	; assigning counter value to 4
	mov eax, 0	; assign eax to 0
	call CallMe	

INVOKE ExitProcess,0 
main ENDP					; end of main procedure

CallMe proc
	inc eax
	loop L1
	ret

L1: call CallMe
	ret

CallMe ENDP

END main					; end of program as a whole