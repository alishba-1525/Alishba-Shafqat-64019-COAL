.model small
.data  
    msg1 DB 'Enter number (0-2): $'
    msg2 DB 'Cube: $'
.code 
main proc
    mov ax, @data
    mov ds,ax
    mov ah,9
    mov dx, offset msg1
    int 21h    
    mov ah,1
    int 21h
    sub al,48
    mov bl,al 
    mul bl
    mul bl    
    mov bl,al
    mov dx,10
    mov ah,2
    int 21h
    mov dx, 13
    mov ah,2
    int 21h
    mov ah,9
    mov dx, offset msg2
    int 21h 
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
    mov ah, 4ch
    int 21h
main endp
end main




