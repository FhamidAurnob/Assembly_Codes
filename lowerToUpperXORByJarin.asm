include "emu8086.inc"

.model small
.stack 100h
.data
.code

main proc
    mov ah,1
    int 21h
    mov bx,ax
    
    xor bx,20h
    printn
    
    mov ah,2
    mov dx,bx
    int 21h
    printn
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main