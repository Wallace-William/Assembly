/*

        William Wallace
        

*/


    .global _start

_start:
    ldr r1, =values
    mov r2, #0          @Initialize Sum
    mov r3, #0          @Loop Counter

loop:

    cmp r3, #10
    beq _exit

    ldr r4, [r1], #4

upperbound:             @Check upperbound <=44
    cmp r4, #44
    ble lowerbound

    add r3, #1
    bal loop

lowerbound:
    cmp r4, #26         @Check lowerbound 26<=
    bge even

    add r3, #1
    bal loop

even:
    and r5, r4, #1      @Check if number is even
    cmp r5, #0
    beq sum

    add r3, #1
    bal loop

sum:                    @If cleared all tests, add to total sum
    add r2, r4

    add r3, #1
    bal loop

_exit:
    mov r0, r2
    mov r7, #1
    swi 0

    .data
values:
    .word 12, 44, 21, 100, 36, 28, 50, 41, 32, 27
