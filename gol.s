#32bit GAS Game of Life assembly program

.section .data
clear:
	.ascii "\033c"
	
    .equ len, . - clear

.section .text
.globl _start
_start:
    call clear_screen
    call end_of_game


clear_screen:
    pushl %ebp
    movl %esp, %ebp
    pushl %eax
    pushl %ebx
    pushl %ecx
    pushl %edx

    movl $4, %eax
    movl $1, %ebx
    movl $clear, %ecx
    movl $len, %edx
    int  $0x80
    
    popl %ecx
    popl %ecx
    popl %ebx
    popl %eax
    movl %ebp, %esp
    popl %ebp
    ret

end_of_game:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
