include "emu8086.inc"
 .MODEL SMALL
 .STACK 100H
 .DATA
 .CODE
   MAIN PROC
     
     print "enter the 1st character: "  
     mov ah,1
     int 21h
     mov bl,al
     
     
     printn
     print "enter the 2nd character: "
     mov ah,1
     int 21h
     mov bh,al 
       
     CMP BL, BH               
     JNBE else                 

     MOV DL, BL                   
     JMP print                

    else:                       
       MOV DL, BH                

     print:                    
       printn
       print "the smallest character is: "
       MOV AH, 2
       int 21h                 

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP
 END MAIN