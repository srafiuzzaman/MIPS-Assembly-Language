# Sahad Rafiuzzaman
# October 10, 2023
# Week 5 MIPS Assignment Part 5
# This program does the following: 
# Stores the literal values 716 and 19 directly into registers...
# Divides 716 by 19...
# and finally prints the result AND the remainder to the console.

.data
newline: .asciiz "\n"  

.text
main: 
	# Stores the literal values 716 and 19 directly into registers...
	li $t0, 716
	li $t1, 19

	# Divide the values using the div instruction
	div $t0, $t1
	
	# Extract the result from the HI and LO registers
    	mflo $t2       # integer quotient  
    	mfhi $t3       # remainder  

    	# Print quotient to the console
	li $v0, 1         
    	move $a0, $t2  
	syscall 
	
	# Print newline
	li $v0, 4         
    	la $a0, newline  
	syscall

	# Print the remainder to the console
    	li $v0, 1         
    	move $a0, $t3
	syscall
	
	# Exit the program
	li $v0, 10        
	syscall           

