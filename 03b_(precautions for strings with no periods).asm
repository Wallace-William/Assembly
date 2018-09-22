/*

        William Wallace

        
*/

    .global _start

_start:
    mov r7, #3
    mov r0, #0
    mov r2, #100
    ldr r1, =String
    swi 0

loop:

    ldrb r3, [r1], #1          @Load first char of input

    cmp r3, #'.'               @Output and exit once a period is reached
    beq output

    cmp r3, #' '               @Skip spaces
    beq loop

    cmp r3, #'a'               @Already lowercase
    bge loop

    cmp r3, #'a'               @Convert to lowercase if Uppercase char is found
    blt change

change:
    cmp r3, #'A'               @Check if input is a symbol
    blt symbol

    cmp r3, #'Z'
    bgt symbol

    add r3, r3,#('a' - 'A')    @Add 32 to get lowercase letters
    strb r3, [r1, #-1]         @Replace capital letter

    bal loop

symbol:
    strb r3, [r1, #-1]    @Leaves symbols alone

    bal loop

output:
    mov r7, #4
    mov r0, #1
    mov r2, #100
    ldr r1, =String
    swi 0

_exit:
    mov r7, #1
    swi 0

    .data
String:
    .space 100

