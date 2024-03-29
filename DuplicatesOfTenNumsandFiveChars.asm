INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H

.DATA

	A1 DB 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
	A2 DB 10 DUP(?)
	A3 DB 10 DUP(0)
	A4 DB 0, 1, 3 DUP(2)
	A5 DB 0, 1, 3 DUP(2, 3 DUP(1))
	A6 DB 0, 2, 2 DUP(1, 2 DUP(1, 2))
	
	N DW 65, 66, 67, 68, 69

.CODE

MAIN PROC
	
	MOV AX, @DATA
	MOV DS, AX
	
	;BASE AND INDEX ADDRESSING MODE
	
	MOV CX, 10
	MOV BX, 0
	MOV AH, 2
	
	WHILE3:
	
		MOV DL, A1[BX]
		ADD DL, 48
		INT 21H
		INC BX
	
		LOOP WHILE3
	
	PRINTN
	
	MOV CX, 5
	MOV BX, 0
	MOV AH, 2
	
	WHILE4:
	
		MOV DL, A1[BX]
		ADD DL, 65
		INT 21H
		INC BX
	
		LOOP WHILE4
	
	
	
	MOV AH, 4CH
	INT 21H
	MAIN ENDP

END MAIN
