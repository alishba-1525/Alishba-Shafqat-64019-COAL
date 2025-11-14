.MODEL SMALL
.STACK 100H

.DATA
values DW 450, 0, 487, 101, 500, 0, 359, 0, 458
count  EQU 9
temp   DW count DUP(?)
msg1   DB 0AH,0DH, 'Non-zero values are:$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    LEA SI, values
    MOV CX, count

PUSH_LOOP:
    PUSH [SI]
    ADD SI, 2
    LOOP PUSH_LOOP

    
    LEA DI, temp
    MOV CX, count

FILTER_LOOP:
    POP AX
    CMP AX, 0
    JE SKIP_ZERO
    MOV [DI], AX
    ADD DI, 2
SKIP_ZERO:
    LOOP FILTER_LOOP

    ; Print message
    MOV AH, 9
    LEA DX, msg1
    INT 21H

    ; Display non-zero values
    LEA SI, temp
    MOV CX, count

PRINT_LOOP:
    MOV AX, [SI]
    CMP AX, 0
    JE NEXT_VALUE
    CALL PRINT_NUM
NEXT_VALUE:
    ADD SI, 2
    LOOP PRINT_LOOP

   
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP


PRINT_NUM PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV BX, 10
    XOR CX, CX

CONVERT_LOOP:
    XOR DX, DX
    DIV BX
    PUSH DX
    INC CX
    CMP AX, 0
    JNE CONVERT_LOOP

PRINT_DIGITS:
    POP DX
    ADD DL, '0'
    MOV AH, 2
    INT 21H
    LOOP PRINT_DIGITS

    MOV DL, ' '
    MOV AH, 2
    INT 21H

    POP DX
    POP CX
    POP BX
    POP AX
    RET
PRINT_NUM ENDP

END MAIN
