
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
    movl 12(%ebp), %ecx     #the EBP location - 12 bytes --> clear's memory location on the stack
    movl 8(%ebp), %edx      #EBP - 8 bytes --> the 'len' on the stack
    int  $0x80              #software interrupt
    
    popl %edx               #revert the state of the registers
    popl %ecx
    popl %ebx
    popl %eax

    movl %ebp, %esp
    popl %ebp
    ret
