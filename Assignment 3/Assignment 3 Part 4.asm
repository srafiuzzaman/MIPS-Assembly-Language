# Sahad Rafiuzzaman
# October 10, 2023
# Week 5 MIPS Assignment Part 4
# This program does the following: 
# Stores the literal values 5000 and 5 directly into registers...
# multiplies the values together with the mult instruction...
# and finally prints the result to the console

.text
main: 
	# Stores the literal values 5000 and 5 directly into registers...
	li $t0, 5000
	li $t1, 5

	# multiplies the values together with the mult instruction...
	mult $t0, $t1
	
	# Extract the result from the HI and LO registers
    	mfhi $t2         
    	mflo $t3         

    	# Print LO register to the console
	li $v0, 1         
    	move $a0, $t3  
	syscall 
	
	# NOT NEEDED: Print HI register to the console
	# li $v0, 1         
    	# move $a1, $t2  
	# syscall

	# Exit the program
	li $v0, 10        
	syscall           

