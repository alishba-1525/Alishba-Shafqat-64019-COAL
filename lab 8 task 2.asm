.model small
.stack 100h
.data
.code
main proc    
    
mov cx, 26
mov dx, 97
SmallLet :
Mov ah, 2
Int 21h 

Inc dx
Loop SmallLet      

mov ah, 4ch
int 21h
main endp
end main
