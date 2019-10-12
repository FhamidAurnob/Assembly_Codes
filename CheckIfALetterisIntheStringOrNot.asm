INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H

.DATA
    
    STRING1 DB "HELLO$"  

.CODE

MAIN PROC
	
    MOV AX, @DATA
    MOV ES, AX
   
    MOV AL, 'L'
    
    MOV CX, 5
    CLD
    
    REPNE SCASB
    
    JZ ZERO
    JNZ NOT_ZERO
    
    ZERO:
        PRINTN "L IS FOUND"
        JMP EXIT
        
    NOT_ZERO:
        PRINTN "L NOT FOUND"
    
      
    EXIT:
    MOV AH, 4CH
    INT 21H        
    MAIN ENDP

END MAIN   
