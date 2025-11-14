org 100h
include emu8086.inc
.model small
.stack 100h
.data
.code
main proc
mov bx, 0
mov ax, 0
label1:
add ax, bx
inc bx 
cmp bx, 11
jne label1
main endp
call print_num
DEFINE_PRINT_NUM 
DEFINE_PRINT_NUM_UNS 
end main
