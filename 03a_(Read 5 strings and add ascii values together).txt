/*
        William Wallace
        
*/



   .global _start

_start:
    mov r3, #0
    mov r4, #0
loop:
    cmp r4, #5
    beq _exit

    mov r7, #3
    mov r0, #0
    mov r2, #2
    ldr r1, =String
    swi 0

numbers:
    ldrb r6, [r1], #1

    cmp r6, #'0'
    blt skip

    cmp r6, #'9'
    bgt skip

    sub r6, #'0'
    bal sum

skip:
    add r4, #1
    bal loop

sum:
    add r3, r6
    add r4, #1
    bal loop

_exit:
    mov r0, r3
    mov r7, #1
    swi 0

    .data
String:
    .space 100
