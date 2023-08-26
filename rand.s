    .text
    .globl rand
    .type rand, @function
rand:
    pushl %ebp
    movl %esp, %ebp

    pushl %edi
    pushl %esi
    pushl %edx


    inc %esi                    #increase upper bound by 1

is_random:
    rdrand %eax                 #random (32-bit) value into EAX
    jnc is_random               #if the instruction somehow fails, carry flag is set

    xor %edx, %edx              #0 the value of EDX --> zero out the high bits for division
    subl %edi, %esi             #range of possible values into ESI
    div %esi                    #overflow remainder into RDX
    addl %edx, %edi             #adjust remainder to start of range

    movl %edi, %eax             #reutrn value into EAX
    

    

    popl %edx
    popl %esi
    popl %edi

    movl %ebp, %esp
    popl %ebp
    ret
