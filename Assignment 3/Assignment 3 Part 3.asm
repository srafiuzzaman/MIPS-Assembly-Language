# Sahad Rafiuzzaman
# October 10, 2023
# Week 5 MIPS Assignment Part 3
# This program does the following: 
# Stores the values 413 and 212 into variables...
# Loads those 2 variables into registers...
# Multiplies the values together with the mul instruction...
# and finally prints the result to the console

.data
# Stores the values 413 and 212 into variables...
var1: .word 413       # Variable 1
var2: .word 212       # Variable 2
product:
.text
main: 
	# loads those 2 variables into registers...
	lw $a0, var1
	lw $a1, var2
	
	# Multiplies the values together with the mul instruction... and store value in $a2
	mul $a2, $a0, $a1
	
	# Store the result at product
	sw $a2, product 
	
	# Print the result to the console
	li $v0, 1         
	lw $a0, product    
	syscall           

	# Exit the program
	li $v0, 10        
	syscall           

