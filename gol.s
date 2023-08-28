#32bit GAS Game of Life assembly program


    .bss
    .lcomm buffer, 1936         #22*22 table of 32-bit integers (1600 bytes)


    
    .text
    .globl _start
_start:
    call clear_screen           #call clear_screen


    pushl $1                    #upper bound of the random numbers (inclusive)
    pushl $0                    #lower bound (inclusive)
    pushl $484                  #generated number of numbers (22*22=484 numbers)
    pushl $0                    #extra offset between elements
    pushl $buffer               #memory location 
    call rand_array             #fills the buffer with random 1s and 0s
    addl $20, %esp              #sets the ESP back to the state before 'rand_array' (we put 5 32-bit values onto the stack, which is 5x4bytes=20bytes)
    
    pushl $22                   #length of a line
    pushl $484                  #number of numbers
    pushl $buffer
    call print_array
    addl $12, %esp
    
    
    call end_of_game



