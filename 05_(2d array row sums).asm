/*
        William Wallace

*/
    .global _start

_start:
    ldr r1, =array
    mov r0, #0          @Output
    mov r2, #0          @Column Counter
    mov r3, #0          @Row Counter
    mov r4, #0          @initialize sum

loop:
    cmp r3, #3          @If last row exit
    beq _exit

    cmp r2, #4          @If last colum go to nextrow
    beq nextrow

    ldr r5, [r1], #4

    add r4, r5          @Row sum


    add r2, #1          @Column increment
    bal loop

nextrow:
    cmp r4, r0          @If, row sum is larger than last sum, save in R0
    bgt save

    add r3, #1
    mov r4, #0          @else, reset values and increment row counter
    mov r2, #0
    bal loop

save:
    mov r0, r4          @Save sum in R0, then reset row sum and column counter
    mov r2, #0
    mov r4, #0
    add r3, #1          @Increment row counter
    bal loop


_exit:
    mov r7, #1
    swi 0

    .data
array:
    .word 12, 10, 3, 0
    .word 5, 0, 16, 22
    .word 7, 15, 0, 10
