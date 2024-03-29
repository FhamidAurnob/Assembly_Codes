.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  'Enter the binary number (max 16-bit) : $'
   PROMPT_2  DB  0DH,0AH,'The number of 1 bits is : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS  
     MOV DS, AX

     LEA DX, PROMPT_1             ; load and display PROMPT_1   
     MOV AH, 9
     INT 21H

     XOR BX, BX                   ; clear BX 
     MOV CX, 16                   ; initialize loop counter
     MOV AH, 1                    ; set input function

     @INPUT:                      ; jump label
       INT 21H                    ; read a digit
       CMP AL, 0DH                ; compare digit with carriage return 
       JE @END                    ; jump to label @END if carriage return
       AND AL, 0FH                ; convert ascii to decimal code
       SHL BX, 1                  ; rotate BX to left by 1 bit
       OR BL, AL                  ; set the LSB of BX with input
     LOOP @INPUT                  ; jump to label @INPUT

     @END:                        ; jump label

     MOV CX, 16                   ; initialize loop counter
     XOR AX, AX                   ; clear AX

     @LOOP:
       ROL BX, 1                  ; rotate BX to left by 1 bit
       JNC @NEXT                  ; jump to label @NEXT if CF=0
       INC AX                     ; increment AX

     @NEXT:                       ; jump label
     LOOP @LOOP                   ; jump to label @LOOP

     MOV CX, AX                   ; save AX in CX

     LEA DX, PROMPT_2             ; load and display PROMPT_2   
     MOV AH, 9
     INT 21H

     MOV AH, 2                    ; set output function
     CMP CL, 10                   ; compare the contents of CL

     JAE @TWO_DIGIT               ; jump to label @TWO_DIGIT

     OR  CL, 30H                  ; convert decimal to Ascii code
     MOV DL, CL                   ; set output value               

     JMP @DISPLAY                 ; jump to label @DISPLAY

     @TWO_DIGIT:                  ; jump label
       MOV DL, 31H                ; display digit 1
       INT 21H

       SUB CL, 10                 ; subtract 10 from CL
       OR  CL, 30H                ; convert decimal to ASCII code
       MOV DL, CL                 ; set output value

     @DISPLAY:                    ; jump label
       INT 21H                    ; display the value

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN