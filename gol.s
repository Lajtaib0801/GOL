#32bit GAS Game of Life assembly program


    .data
clear:
	.ascii "\033c"
    .equ len, . - clear


kiir:
    .asciz "A szam: %d\n"


    .bss
    .comm buffer, 1600         #20*20 table of 32-bit integers (1600 bytes)


    
    .text
    .globl _start
_start:
    pushl $clear                #push clear's memory address onto the stack
    pushl $len                  #push the length onto the stack
    call clear_screen           #call clear_screen
    addl $8, %esp               #move back the ESP to the original location


    pushl $1                    #upper bound of the random numbers (inclusive)
    pushl $0                    #lower bound (inclusive)
    pushl $400                  #generated numbers numbers (20*20=400 numbers)
    pushl $0                    #extra offset between elements
    pushl $buffer               #memory location 
    call rand_array             #fills the buffer with random 1s and 0s
    addl $20, %esp              #sets the ESP back to the state before 'rand_array' (we put 5 32-bit values onto the stack, which is 5x4bytes=20bytes)
    
    call end_of_game



