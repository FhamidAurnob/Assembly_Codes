INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H

.DATA
    
    STRING1 DB "HELLO$"  
    STRING2 DB "HELLN$"
    
.CODE
    
MAIN PROC
	
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
   
    LEA SI, STRING1
    LEA DI, STRING2
    
    MOV CX, 5
    
    CLD
    REPE CMPSB
    
    JZ ZERO
    
    JNZ NOT_ZERO
    
    ZERO:
        PRINTN "EQUAL"
        JMP EXIT

    NOT_ZERO:
        PRINTN "NOT EQUAL"
    
      
    EXIT:
    MOV AH, 4CH
    INT 21H           
    MAIN ENDP

END MAIN   
