INCLUDE "EMU8086.INC"
.MODEL SAMLL
.STACK 100H
.DATA
.CODE

MAIN PROC
      
    MOV AH,1
    MOV CL,0

    TOP:
    INT 21H
    MOV BL,AL
    
    CMP BL,'a'
    JE COUNT
    CMP BL,'e'
    JE COUNT
    CMP BL,'i'
    JE COUNT
    CMP BL,'o'
    JE COUNT
    CMP BL,'u'
    JE COUNT
    CMP BL,'A'
    JE COUNT
    CMP BL,'E'
    JE COUNT
    CMP BL,'I'
    JE COUNT 
    CMP BL,'O'
    JE COUNT 
    CMP BL,'U'
    JE COUNT  

    CMP BL,20H
    JE C1 
    
    CMP BL,0DH
    JE PRINT  
    
    C1:
    JMP TOP
    
    COUNT:
    INC CL
    JMP TOP
       
    PRINT:
    PRINTN 
    add cl,48
    mov dl,cl
    mov ah,2
    int 21h

    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN