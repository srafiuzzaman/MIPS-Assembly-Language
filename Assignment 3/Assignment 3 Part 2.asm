# Sahad Rafiuzzaman
# October 10, 2023
# Week 5 MIPS Assignment Part 2
# This program does the following: 
# Stores the values 3844 and 791 into variables...
# Loads those 2 variables into registers...
# Subtracts the lower number from the greater...
# and finally prints the result to the console

.data
# Stores the values 3844 and 791 into variables...
var1: .word 3844       # Variable 1
var2: .word 791       # Variable 2
difference:
.text
main: 
	# loads those 2 variables into registers...
	lw $a0, var1
	lw $a1, var2

	# Compare var1 and var2
	bgt $a0, $a1, larger 	# Branch if var1 > var2
	
	# subtracts var2 from var1... and store value in $a2
larger:	
	sub $a2, $a0, $a1
	
	# Store the result at difference
	sw $a2, difference 
	
	# Print the result to the console
	li $v0, 1         
	lw $a0, difference    
	syscall           

	# Exit the program
	li $v0, 10        
	syscall           

