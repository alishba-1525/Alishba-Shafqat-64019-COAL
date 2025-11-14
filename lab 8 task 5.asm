.model small
.stack 100h
.data
.code
main proc
mov cx, 5
mov dx, 49
printOdd:
mov ah, 2
int 21h
add dx, 2
LOOP printOdd
mov ah, 4ch
int 21h
main endp
end
main
