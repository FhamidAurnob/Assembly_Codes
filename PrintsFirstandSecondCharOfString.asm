INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H

.DATA
    
    STRING1 DB "HELLO$"  

.CODE

MAIN PROC
	
    MOV AX, @DATA
    MOV DS, AX
   
    MOV AL, 'A'
    
    MOV AH, 2
    LEA SI, STRING1
    
    CLD        
    LODSB  ;LOAD FIRST BYTE INTO AL      
    
    MOV DL, AL
    INT 21H
    
    LODSB  ;LOAD SECOND BYTE INTO AL
    
    MOV DL, AL
    INT 21H  
    
    MOV AH, 4CH
    INT 21H           
    MAIN ENDP

END MAIN   
