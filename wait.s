    .data
timespec:
    #.int 0, 500000000
    .int 1, 0 
    
    .bss
    .lcomm rem, 8

    
    .text
    .globl wait
    .type wait, @function
wait:
    pushl %ebp
    movl %esp, %ebp
    pushl %eax
    pushl %ebx
    pushl %ecx

    movl $162, %eax
    movl $timespec, %ebx
    movl $rem, %ecx
    int $0x80

    popl %eax
    popl %ebx
    popl %ecx

    movl %ebp, %esp
    popl %ebp
    ret
