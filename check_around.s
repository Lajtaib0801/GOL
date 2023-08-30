    .text
    .globl check_around
    .type check_around, @function
check_around:
    pushl %ebp
    movl %esp, %ebp
    #subl $4, %esp
    pushl %ecx
    #EAX contains the mem. loc. of the buffer
    #ECX is the index counter
    #EDX counts the 1s around the cell
    #    [1][2][3]
    #    [4][C][5]
    #    [6][7][8]
    #movl %ecx, 4(%esp) #with this we save the ECX's value
    
    #check the [1] (ECX - 23 )
    subl $23, %ecx
    cmpl $1, (%eax, %ecx, 4)
    jne next1
    inc %edx

next1:
    #check the [2] (ECX - 22 )
    addl $1, %ecx
    cmpl $1, (%eax, %ecx, 4)
    jne next2
    inc %edx

next2:
    #check the [3] (ECX - 21 )
    addl $1, %ecx
    cmpl $1, (%eax, %ecx, 4)
    jne next3
    inc %edx

next3:
    #check the [4] (ECX - 1 )
    addl $20, %ecx
    cmpl $1, (%eax, %ecx, 4)
    jne next4
    inc %edx

next4:
    #check the [5] (ECX + 1 )
    addl $2, %ecx
    cmpl $1, (%eax, %ecx, 4)
    jne next5
    inc %edx
next5:
    #check the [6] (ECX + 21 )
    addl $20, %ecx
    cmpl $1, (%eax, %ecx, 4)
    jne next6
    inc %edx

next6:
    #check the [7] (ECX + 22 )
    addl $1, %ecx
    cmpl $1, (%eax, %ecx, 4)
    jne next7
    inc %edx

next7:
    addl $1, %ecx
    cmpl $1, (%eax, %ecx, 4)
    jne end 
    inc %edx

end:
    
    #movl 4(%esp), %ecx

    
    popl %ecx
    #addl $4, %esp
    movl %ebp, %esp
    popl %ebp
    ret
