.model small
.stack 100h
.data
.code
main proc
mov cx, 7
mov dx, 97
printAlphabets:
mov ah, 2
int 21h
add dx, 4
LOOP printAlphabets
mov ah, 4ch
int 21h
main endp
end main
