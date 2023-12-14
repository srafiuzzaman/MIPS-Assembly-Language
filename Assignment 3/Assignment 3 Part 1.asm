# Sahad Rafiuzzaman
# October 10, 2023
# Week 5 MIPS Assignment Part 1
# This program does the following: 
# Stores the values 272 and 86 into variables...
# loads those 2 variables into registers...
# adds the values together...
# and finally prints the result to the console

.data
# Stores the values 272 and 86 into variables...
var1: .word 272       # Variable 1
var2: .word 86        # Variable 2
sum:
.text
main: 
	# loads those 2 variables into registers...
	lw $a0, var1
	lw $a1, var2

	# adds the values together... and store value in $a2
	add $a2, $a0, $a1
	
	# Store the result at sum
	sw $a2, sum  
	
	# Print the result to the console
	li $v0, 1         
	lw $a0, sum    
	syscall           

	# Exit the program
	li $v0, 10        
	syscall           

