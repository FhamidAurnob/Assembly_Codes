#make_COM#

; COM file is loaded at CS:0100h
org 100h

; ********************************
; *    Program: ASCIICONV.ASM    *
; ********************************

include 'emu8086.inc'
.model small
.stack 100h

.data
   size equ 2d
   buffer db size dup ('x')
   
.code
   entry:						; Do the character entry
      print 'Enter a ASCII character: '
      lea di, buffer
      mov dx, size
      call GET_STRING
      putc 13d
      putc 10d
      
      print 'The ASCII code of the character ['
      mov si, di
      call PRINT_STRING
      print '] in binary is equivalent of: '
      
      mov ax, [di]
      mov ah, 10000000b			; mask for a binary value test
      mov cx, 08h				; definition of the 8 bits counter
      write_bit:				; Routine of the binary value presentation
         test al, ah			; verify if the AL interrupt didn't have been modified
         jz write_0				; if the bit test be 0, write it as 0
         putc '1'				; if not, write 1
         jmp next_bit			; get the next bit of the sequence
         write_0:
            putc '0'			; write zero
         next_bit:
         shr ah, 01h			; move one bit from the mask to the right
      loop write_bit
      
      putc 13d
      putc 10d
      print 'Want to finish the execution (Y/N): '
      lea di, buffer
      mov dx, size
      call GET_STRING
      putc 13d
      putc 10d
      mov ax, [di]
      
      cmp ax, 079h				; If the character entered was 'y'
      je get_capital			; convert it to 'Y'
      jne get_normal			; if not, stay the entered
      get_capital:
         sub ax, 020h
      get_normal:
      cmp ax, 059h				; if the answer be different than 'Y'
      je exit					; exit the program
   jmp entry					; if not, enter the next character
   exit:
      hlt
      
   DEFINE_GET_STRING
   DEFINE_PRINT_STRING
end