    .text
    .globl print_array
    .type print_array, @function
print_array:
    pushl %ebp          #parameter: 1st: 8(%ebp)    buffer start
    movl %esp, %ebp     #           2nd: 12(%ebp)   numbers
                        #           3rd: 16(%ebp)   line length
    pushl %eax
    pushl %ebx
    pushl %ecx
    pushl %edx
    pushl %esi
    pushl %edi
    
    movl 8(%ebp), %eax  #buffer's start
    movl 12(%ebp), %ebx #numbers
    dec %ebx            #because of the indexin, we need to decrement EBX by 1
    movl 16(%ebp), %ecx #lenght of a line
    dec %ecx            #because of the indexes it's easier to use line length - 1 
    movl $0, %edx       #index
    movl $0, %edi       #this will count the cols

    
loop:
    cmp %ecx, %edi      #EDI = 19?
    je new_line

back:
    
    movl (%eax, %edx, 4), %esi
    call print_value
    inc %edi
    inc %edx
    cmp %ebx, %edx
    jne loop
    jmp exit

new_line:
    call write_new_line
    movl $0, %edi
    jmp back

exit:   
    call write_new_line
    
    popl %edi
    popl %esi
    popl %edx
    popl %ecx
    popl %ebx
    popl %eax

    movl %ebp, %esp
    popl %ebp
    ret



