    .data
new_line:
    .ascii "\n"
    nl_len = . - new_line

    .globl write_new_line
    .type write_new_line, @function
write_new_line:
    pushl %ebp
    movl %esp, %ebp
    
    
    pushl %eax
    pushl %ebx
    pushl %ecx
    pushl %edx
    
    movl $4, %eax
    movl $1, %ebx
    movl $new_line, %ecx
    movl $nl_len, %edx
    int $0x80
    
    popl %edx
    popl %ecx
    popl %ebx
    popl %eax


    movl %ebp, %esp
    popl %ebp
    ret
