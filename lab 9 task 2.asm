.MODEL SMALL
.STACK 100H
.DATA
num1 DB ?
num2 DB ?
msg1 DB 13,10, 'Enter first number: $'
msg2 DB 13,10, 'Enter second number: $'
equalMsg DB 13,10, 'Both numbers are equal.$'
greaterMsg DB 13,10, 'First number is greater.$'
lessMsg DB 13,10, 'First number is smaller.$'   
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX
 LEA DX, msg1
MOV AH, 9
INT 21H

MOV AH, 1
INT 21H
SUB AL, 30H
MOV num1, AL
 
LEA DX, msg2
MOV AH, 9
INT 21H

MOV AH, 1
INT 21H
SUB AL, 30H
MOV num2, AL

MOV AL, num1
CMP AL, num2
JE EQUAL
JG GREATER
JL LESS
EQUAL:
LEA DX, equalMsg
MOV AH,9
INT 21H
JMP EXIT 
GREATER:
LEA DX, greaterMsg
MOV AH, 9
INT 21H
JMP EXIT
LESS:
LEA DX, lessMsg
MOV AH,9
INT 21H
EXIT:
INT 21H
MOV AH, 4CH
INT 21H
main endp
end main
