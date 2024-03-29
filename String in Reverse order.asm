.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter the string : $'
   PROMPT_2  DB  0DH,0AH,'The string in reverse order is : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS  
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and display PROMPT_1   
     MOV AH, 9
     INT 21H

     XOR CX, CX                   ; clear CX
     MOV AH, 1                    ; set input function

     @INPUT:                      ; jump label
       INT 21H                    ; read a digit
       CMP AL, 0DH                ; compare digit with carriage return 
       JE @END                    ; jump to label @END if carriage return
       PUSH AX                    ; push the input char to STACK
       INC CX                     ; increment CX
     JMP @INPUT                   ; jump to label @INPUT

     @END:                        ; jump label

     LEA DX, PROMPT_2             ; load and display PROMPT_2   
     MOV AH, 9
     INT 21H

     MOV AH, 2                    ; set output function

     @OUTPUT:                     ; jump label
       POP DX                     ; POP a value from STACK to DX

       INT 21H                    ; display digit
     LOOP @OUTPUT                 ; jump to label @OUTPUT

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN