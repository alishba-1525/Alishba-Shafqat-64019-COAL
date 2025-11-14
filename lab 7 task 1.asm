.model small
.data
    msg1 db 'Enter base: $'
    msg2 db 'Enter height: $'
    msg3 db 'Area: $'
.code
main proc 
    
    mov ax, @data
    mov ds, ax
    mov ah, 9
    mov dx, offset msg1
    int 21h
    mov ah, 1
    int 21h
    sub al,48
    mov bl, al      
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h   
    mov ah, 9
    mov dx, offset msg2
    int 21h
    mov ah, 1
    int 21h
    sub al,48
    mov cl, al
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h          
    mov al, bl      
    mul cl          
    mov bl, 2       
    div bl             
    mov bl, al      
    mov ah, 9
    mov dx, offset msg3
    int 21h    
    mov dl, bl
    add dl,48    
    mov ah, 2
    int 21h
    mov ah, 4ch
    int 21h
main endp
end main






