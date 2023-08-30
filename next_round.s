    .bss
    .lcomm next_buffer, 1936

    .text
    .type next_round, @function
    .globl next_round
next_round:
    pushl %ebp
    movl %esp, %ebp

    pushl %eax
    pushl %ebx
    pushl %ecx
    pushl %edx
    pushl %esi
    
    #first, we load the next buffer's borders with 2s 
    movl 8(%ebp), %eax              #buffer's mem. loc.
    movl $next_buffer, %ebx         #next_buffer's mem. loc
    movl $0, %ecx                   #index
    movl $0, %edx                   #1s around the cell

loop:
    cmp $484, %ecx
    je before_overwrite
    cmpl $2, (%eax, %ecx, 4)
    je write_two

    call check_around               #EDX got he 1s number around the cell
    cmpl $0, (%eax, %ecx, 4)
    je null
    cmp $2, %edx
    je alive
    cmp $3, %edx
    je alive
    jmp dead


null:
    cmp $3, %edx
    je alive

dead:
    #here the cell will be dead
    movl $0, (%ebx, %ecx, 4)
    xor %edx, %edx
    inc %ecx
    jmp loop


alive:
    movl $1, (%ebx, %ecx, 4)
    xor %edx, %edx
    inc %ecx
    jmp loop


write_two:
    movl $2, (%ebx, %ecx, 4)
    inc %ecx
    jmp loop


before_overwrite:

    xor %esi, %esi                  #ESI will contain the next state of the cell
                                    #We need, ESI, because mov doesn't work with 2 mem. loc. parameters
    xor %ecx, %ecx                  #index reset
overwrite:
    movl (%ebx, %ecx, 4), %esi      #copy the next state into ESI
    movl %esi, (%eax, %ecx, 4)      #copy the next state into the buffer
    inc %ecx
    cmp $484, %ecx
    jne overwrite
    
    popl %esi
    popl %edx
    popl %ecx
    popl %ebx
    popl %eax
    
    movl %ebp, %esp
    popl %ebp
    ret
