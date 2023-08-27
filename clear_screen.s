    .data
clear:
	.ascii "\033c"
    clear_len = . - clear

    
    .text
    .type clear_screen, @function
    .globl clear_screen
clear_screen:
    pushl %ebp              
    movl %esp, %ebp

    pushl %eax              #save the registers
    pushl %ebx
    pushl %ecx
    pushl %edx
    
    movl $4, %eax           #write syscall
    movl $1, %ebx           #stdout
    movl $clear, %ecx       #string to be written
    movl $clear_len, %edx   #length of the string
    int  $0x80              #software interrupt
    
    popl %edx               #revert the state of the registers
    popl %ecx
    popl %ebx
    popl %eax

    movl %ebp, %esp
    popl %ebp
    ret
