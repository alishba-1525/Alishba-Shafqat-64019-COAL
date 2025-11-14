.model small
.stack 100h
.data
msg1 DB 'Enter any number (0-9):$'
msg2 DB 0DH, 0AH, 'my name is: $'
msg3 DB 0DH, 0AH, 'Alishba Shafqat$'
.code
main proc
  mov ax, @data
 mov ds, ax
mov ah, 9
mov dx,offset msg1
int 21h
mov ah, 1
int 21h
sub al, 48
mov cl, al
mov ch, 0
mov ah, 9
mov dx, Offset msg2
int 21h
PrintMyName:
mov ah, 9
mov dx, Offset msg3
int 21h
loop PrintMyName
mov ah, 4ch
int 21h
main endp
end main
