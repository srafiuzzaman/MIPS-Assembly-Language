# Sahad Rafiuzzaman
# October 17, 2023
# Week 6 MIPS Assignment Part 2
# This program does the following: 
# divides 2000 by 4 using shift right logical (srl) and prints the result to the console

.data

.text
main: 
	# load 2000 and 4
	li $t0, 2000
	li $t1, 4

	# Divide using shift right logical (srl)
	srl $t2, $t0, 2   # $t0 / 4

	# Print the result to the console
	li $v0, 1
	move $a0,$t2
	syscall

	endprog: 
	li $v0, 10	#terminate program        
	syscall
