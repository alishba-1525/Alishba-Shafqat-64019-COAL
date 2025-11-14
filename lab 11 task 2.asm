.MODEL SMALL
.STACK 100H
.DATA
msg db 'Enter a string: $'
msg2 db 0Ah,0Dh,'Reversed string: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, msg
    INT 21H

    
    MOV CX, 0       

INPUT_LOOP:
    MOV AH, 1       
    INT 21H
    CMP AL, 13       
    JE PRINT_REVERSE
    PUSH AX          
    INC CX
    JMP INPUT_LOOP

    
PRINT_REVERSE:
    MOV AH, 9
    LEA DX, msg2
    INT 21H

PRINT_LOOP:
    CMP CX, 0
    JE END_PROGRAM
    POP DX
    MOV AH, 2
    INT 21H
    DEC CX
    JMP PRINT_LOOP

END_PROGRAM:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN