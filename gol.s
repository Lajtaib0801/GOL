#32bit GAS Game of Life assembly program

.data
clear:
	.ascii "\033c"
	
    .equ len, . - clear

.text
.globl _start
_start:
    pushl $clear                #push clear's memory address onto the stack
    pushl $len                  #push the length onto the stack
    call clear_screen           #call clear_screen
    addl $8, %esp               #move back the ESP to the original location
    call end_of_game


.type end_of_game, @function
end_of_game:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
    
