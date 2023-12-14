# Sahad Rafiuzzaman
# November 7, 2023
# Week 9 MIPS Assignment Part 1
# For this assignment, please write the following MIPS programs:
# One that fills an array with every multiple of 11 from 1 to 1000 inclusively 
# (meaning any value >= 1 TO any value <= 1000 AND the included values must also be a multiple of 11). 
# After you have filled the array then print the array contents to the console using a loop. 

.data
array:      .space 4000    
newline:    .asciiz "\n"   

.text
main:
    la $t0, array   
    li $t1, 1       # start at 1
    li $t2, 11      # multiples of 11
    li $t3, 1000    # max number is 1000 inclusively

chck_array:
    beq $t1, $t3, printer  # printer
    bgt $t2, $t3, exit_array   #exit

    sw $t2, 0($t0)     # store
    addi $t1, $t1, 1   # counter
    addi $t2, $t2, 11  # multiplier
    addi $t0, $t0, 4   # element size 4 so move to next element

    j chck_array   	# Repeat the loop

exit_array:
printer:
    la $t0, array   
    li $t1, 1       
print_loop:
    lw $t2, 0($t0)   
    beqz $t2, exit_print 
 
    li $v0, 1		# Print the array
    move $a0, $t2
    syscall

    li $v0, 4		# Print a newline
    la $a0, newline
    syscall

    addi $t0, $t0, 4     # move to the next 
    addi $t1, $t1, 1   	 # counter
    j print_loop         # jump to loop

exit_print:
    li $v0, 10
    syscall
