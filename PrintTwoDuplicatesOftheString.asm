INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H

.DATA
    
    STRING1 DB 'HELLO$'
    STRING2 DB 6 DUP(?) 
    STRING3 DB 6 DUP(?)  

.CODE

MAIN PROC
	
   	MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    
    LEA SI, STRING1
    LEA DI, STRING2
    
    MOV CX, 5
    MOV AH, 2
    
    TOP:
	    MOV AL,[SI]
	    MOV [DI],AL
	    MOV DL,[DI] 
	    INT 21H
	    INC SI
	    INC DI            
	    LOOP TOP
        
    PRINTN
    PRINTN
    
    LEA SI, STRING1
    LEA DI, STRING3
            
    CLD
    
    ;MOVSB
    ;MOVSB
    
    MOV CX, 6
    REP MOVSB
    
    MOV AH, 9
    LEA DX, STRING3
    INT 21H
    

    MOV AH, 4CH
    INT 21H        
 	MAIN ENDP

END MAIN   
