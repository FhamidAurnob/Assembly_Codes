INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H

.DATA



.CODE

MAIN PROC
	
	MOV BL, 0
		
	;INPUT LOOP
	
	INPUT:
	
	MOV AH, 1
	INT 21H
	
	CMP AL, 0DH
	JE END_INPUT
	
	INC BL
	
	JMP INPUT
	
	END_INPUT: 
	
	;PRINTING RESULT
	
	PRINTN
	
	ADD BL, 48
	
	MOV AH, 2
	MOV DL, BL
	INT 21H
	
	
	MOV AH, 4CH
	INT 21H
	
	MAIN ENDP

END MAIN