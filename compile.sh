#!/bin/sh

gcc -o gol gol.s rand_array.s rand.s end_of_game.s clear_screen.s print_array.s print_value.s write_new_line.s wait.s next_round.s check_around.s -nostartfiles -no-pie -m32 -g

