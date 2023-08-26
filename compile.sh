#!/bin/sh

gcc -o gol gol.s rand_array.s rand.s end_of_game.s clear_screen.s -nostartfiles -no-pie -m32

