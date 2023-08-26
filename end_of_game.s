    .globl end_of_game
    .type end_of_game, @function
end_of_game:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
    
