# Sahad Rafiuzzaman
# October 17, 2023
# Week 6 MIPS Assignment Part 1
# This program does the following: 
# Multiplies 5 and 16 using shift left logical (sll) and prints the result to the console

.data

.text
main: 
	# load 5 and 16
	li $t0, 5
	li $t1, 16

	# Multiply using shift left logical (sll)
	sll $t2, $t0, 4   # $t0 * 16

	# Print the result to the console
	li $v0, 1
	move $a0,$t2
	syscall

	endprog: 
	li $v0, 10	#terminate program        
	syscall
