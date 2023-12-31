.text
    .globl rand_array
    .type rand_array, @function
rand_array:
    pushl %ebp                  #parameters:    1st: 8(%ebp)    address
    movl %esp, %ebp             #               2nd: 12(%ebp)   extra offset
                                #               3rd: 16(%ebp)   number of elemets
                                #               4th: 20(%ebp)   lower bound
                                #               5th: 24(%ebp)   upper bound
    pushl %eax
    pushl %ebx
    pushl %ecx
    pushl %edx
    pushl %esi
    pushl %edi
    
    movl 8(%ebp), %ebx          #load the memory address of buffer into EBX
    movl 16(%ebp), %ecx         #loads the number of elements into ECX
    dec %ecx                    #we use idexes to fill the memory locations, so we need to decrement ECX by one (this will be the highest index)
    movl $0, %edx               #index counter of array
    movl 20(%ebp), %edi         #loads the lower bound into EDI
    movl 24(%ebp), %esi         #loads the upper bound into ESI
loop:
    #the EDI is 0 and the ESI is 1, so the rand function will do everything we need
    call rand                   #return value is in the EAX
    cmp $22, %edx
    jl first_line
    cmp $461, %edx
    jg last_line

    jmp test_remainder
after_test:
    movl %eax, (%ebx, %edx, 4)  #move EAX into the EBX+EDX*4 memory location (EDX is the index, 4 is the 32-bits in bytes) 
back:
    inc %edx
    cmp %ecx, %edx
    jne loop
    jmp end

first_line:
    movl $2, (%ebx, %edx, 4)
    jmp back

last_line:
    movl $2, (%ebx, %edx, 4)
    jmp back

end:
    movl $2, (%ebx, %edx, 4)

    popl %edi
    popl %esi
    popl %edx
    popl %ecx
    popl %ebx
    popl %eax

    movl %ebp, %esp
    popl %ebp
    ret

test_remainder:
    pushl %eax
    pushl %ebx
    pushl %ecx
    pushl %edx

    movl %edx, %eax
    movl $0, %edx
    movl $22, %ebx
    div %ebx
    
    cmp $0, %edx
    je first_last_col
    
    movl %edx, %eax
    movl $0, %edx
    movl $21, %ebx
    div %ebx
    cmp $0, %edx
    jne no_remainder

first_last_col:
    popl %edx
    popl %ecx
    popl %ebx
    popl %eax

    movl $2, (%ebx, %edx, 4)
    jmp back 
no_remainder:
    popl %edx
    popl %ecx
    popl %ebx
    popl %eax
    jmp after_test
    
