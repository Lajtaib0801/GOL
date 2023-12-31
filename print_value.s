    .data
zero:   
    .ascii " "
one:
    .ascii "C"

two:
    .ascii "#"

    .text
    .globl print_value
    .type print_value, @function
print_value:
    pushl %ebp
    movl %esp, %ebp
    
    pushl %eax          #We'll get the sole parameter in the ESI (the number)
    pushl %ebx
    pushl %ecx
    pushl %edx
    
    cmp $0, %esi
    je write_zero
    
    cmp $1, %esi
    je write_one

    movl $two, %ecx
    jmp write
    
write_zero:
    movl $zero, %ecx
    jmp write


write_one:
    movl $one, %ecx
    
write:
    movl $4, %eax
    movl $1, %ebx
    movl $1, %edx
    int $0x80


    popl %edx
    popl %ecx
    popl %ebx
    popl %eax
   
    
    movl %ebp, %esp
    popl %ebp
    ret
