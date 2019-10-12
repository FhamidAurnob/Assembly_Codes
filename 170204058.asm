.MODEL SMALL
.STACK 100H
.DATA

STR1 DB 'INITIAL AMOUNT OF ORANGES: $'

STR2 DB 'ORANGES TAKEN BY FIRST BABY: $'

STR3 DB 'ORANGES TAKEN BY SECOND BABY: $'

STR4 DB 'OUTPUT OF THE SOLUTION$'    

STR5 DB 'AFTER EXCHANGE OPERATION$'

STR6 DB 'FIRST BABY TAKES: $'

STR7 DB 'SECOND BABY TAKES: $'


VAL1 DB ?
VAL2 DB ?
VAL3 DB ?
VAL4 DB ?

VALZ EQU 8

REM DB ?





.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,STR1
    MOV AH,9
    INT 21H  
    
    MOV BL,VALZ
    ADD BL,48
    MOV VAL3,BL
    
    MOV AH,2
    MOV DL,VAL3
    INT 21H
    
    
    
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H  
    
    
    LEA DX,STR2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV VAL1,AL 
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H     
    
    
    
    
    LEA DX,STR3
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV VAL2,AL 
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
    LEA DX,STR4
    MOV AH,9
    INT 21H
    
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    
    MOV AH,2
    MOV DL,VAL3
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    MOV AH,2
    MOV DL,'-'
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    MOV AH,2
    MOV DL,'('
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    MOV AH,2
    MOV DL,VAL1
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    MOV AH,2
    MOV DL,'+'
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    MOV AH,2
    MOV DL,VAL2
    INT 21H
    
    MOV AH,2
    MOV DL,')'
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    MOV AH,2
    MOV DL,'='
    INT 21H
    
    MOV AH,2
    MOV DL,' '
    INT 21H
    
    ;CALCULATION 
    
    ;MOV BL,VAL1
    ;ADD BL,VAL2
    ;SUB BL,48
    
    ;MOV VAL4,BL
    
    ;NEG VAL4
    ;MOV BL,VAL4
    
    ;MOV CL,VAL3
    ;ADD BL,CL
    ;SUB BL,48
    
    
    MOV BL,VAL3
    SUB BL,VAL1
    ADD BL,48
    SUB BL,VAL2
    ADD BL,48 
    
    
   
    
    
    MOV REM,BL
    
    MOV AH,2
    MOV DL,REM
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    LEA DX,STR5
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H  
    
    
    MOV BL,VAL1
    MOV VAL3,BL
    
    MOV BL,VAL2
    MOV VAL1,BL
    
    MOV BL,VAL3
    MOV VAL2,BL
    
    
    
    LEA DX,STR6
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,VAL1
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    
    LEA DX,STR7
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,VAL2
    INT 21H
    
      
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN