INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H

.DATA



.CODE

MAIN PROC
	
	MOV BL, 5BH	;FOR STORING FIRST CAPITAL LETTER
	MOV BH, 40H	;FOR STORING LAST CAPITAL LETTER
	
	MOV CL, 0	;FOR FLAG, THIS WILL BE SET TO 1 IF THERE'S ANY CAPITAL LETTER
	
	PRINT "Enter a string: "
	
	;INPUT LOOP
	
	INPUT:
	
	MOV AH, 1
	INT 21H
	
	;END INPUT LOOP, IF ENTER IS PRESSED
	CMP AL, 0DH
	JE END_INPUT_LOOP
	
	;CHECKING IF THE INPUT IS A CAPITAL LETTER
	;IF IT'S NOT, THEN SKIP TO THE NEXT INPUT
	
	CMP AL, 5BH
	JNL INPUT
	
	CMP AL, 40H
	JNG INPUT
	
	MOV CL, 1	;MAKING THE FLAG 1, AS THE INPUT HAS CAPITAL LETTER	
	
	;CHECKING IF THE INPUT IS LESS THEN THE PREVIOUS FIRST CAPITAL LETTER
	;IF IT IS, THEN IT WILL BE THE NEW FIRST CAPITAL LETTER
	CMP AL, BL
	JL FIRST
	
	;CHECKING IF THE INPUT IS GREATER THEN THE PREVIOUS LAST CAPITAL LETTER
	;IF IT IS, THEN IT WILL BE THE NEW LAST CAPITAL LETTER
	CMP AL, BH
	JG SECOND
	
	JMP INPUT	;IF IT IS NEITHER A NEW FIRST NOR A NEW LAST CAPITAL LETTER
	
	;STORING NEW FISRT CAPITAL LETTER
	FIRST:
	
	MOV BL, AL
	
	JMP INPUT
	
	;STORING NEW LAST CAPITAL LETTER
	SECOND:
	
	MOV BH, AL  
	
	JMP INPUT
	
	END_INPUT_LOOP:
	
	PRINTN
	
	
	;DISPLAYING OUTPUT
	
	CMP CL, 0    
	JE NO_UPPER_CASE
	
	PRINTN
	PRINT "First capital letter: "
	
	MOV AH, 2
	MOV DL, BL
	INT 21H
	
	PRINTN
	PRINT "Last capital letter: "
	
	MOV AH, 2
	MOV DL, BH
	INT 21H
	
	JMP RETURN_0
	
	NO_UPPER_CASE:
	
	PRINTN
	PRINT "No capital letters!"
	
	
	RETURN_0:
	
	MOV AH, 4CH
	INT 21H
	
	MAIN ENDP

END MAIN