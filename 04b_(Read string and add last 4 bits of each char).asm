    .global _start

_start:
    mov r7, #3
    mov r0, #0
    mov r2, #18
    ldr r1, =String
    swi 0

    mov r3, #0		@Initialize Sum
    mov r5, #0		@Loop Counter

loop:
    cmp r5, #18		@Up to 18 characters
    beq _exit

    ldrb r4, [r1], #1

    cmp r4, #10		@Don't include spaces
    beq space

number:
    lsl r4, #28
    lsr r4, #28

    add r3, r4
    
    add r5, #1
    bal loop

space:
    add r5, #1
    bal loop

_exit:
    mov r7, #1
    swi 0

    .data
String:
    .space 18