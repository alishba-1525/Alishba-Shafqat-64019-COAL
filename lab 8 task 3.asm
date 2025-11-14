.model small
.stack 100h
.data
.code
main proc
mov ax, 0
mov cx, 4
mov bx, 0
addno:
add ax, bx
inc bx
loop addno
add ax, 30h
mov dl, al
mov ah, 2
int 21h
mov ah, 4ch
int 21h
main endp
end main
