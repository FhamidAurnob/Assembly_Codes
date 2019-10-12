include "emu8086.inc"
.model small
.stack 100h
.data
.code
main proc
    print "Enter the lower case letter: "
    mov ah,1
    int 21h 
    printn
    
    mov bl,al
    
    print "The upper case letter is: "
    
    and bl,0dfh
    
    mov ah,2
    mov dl,bl
    int 21h 
    printn
    mov ah,4ch
    int 21h
    main endp
end main