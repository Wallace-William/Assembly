/*
        William Wallace
 
*/
    .global _start

_start:
    ldr r5, =output
    ldr r6, =string

    mov r9, #'\n'

_loop:
    ldrb r2, [r6], #1

    cmp r2, #10         @Check for newline
    beq _output

    mov r3, r2          @R3 = Left 4 bits
    mov r4, r2          @R4 = Right 4 bits

    lsr r3, #4

    lsl r4, #28
    lsr r4, #28

    add r3, #48         @Convert to numerical value
    add r4, #48
                        @Store digits contiguously in same string
    str r3, [r5], #4            @Store digit for left 4 bits
    str r4, [r5], #4            @Store digit for right 4 bits

    bal _loop

_output:
    strb r9, [r5]       @Put newline at end of output

    mov r7, #4
    mov r0, #1
    mov r2, #65
    ldr r1, =output     @Should output a string of digits
    swi 0               @       6171692467643855\n

_exit:
    mov r7, #1
    swi 0

    .data
string:
    .asciz "aqi$gd8U\n"
output:
    .space 65
