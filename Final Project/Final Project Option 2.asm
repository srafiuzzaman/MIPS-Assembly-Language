# Sahad Rafiuzzaman
# CIS126T6CF
# December 13, 2023
# Final Project

# Option 2: 
# Create and code a MIPS application that asks the user for 2 integers, determines the greatest common divisor
# (GDC), and then prints the result to the console. The GDC can be easily calculated utilizing the Euclidean
# Algorithm. The output should be neat and provide a meaningful output text to the user including the result
# of the GDC value for the user inputted integers. The code should be easy to read, well documented with 
# comments, and follow all MIPS format and naming conventions. The code must primarily execute properly with 
# the expected result(s). However, the code will be scrutinized and evaluated for a sense of elegance and 
# logic. Please see the attached MIPS Application Development Rubric for specific grading criteria.

.data
promptOne: 		.asciiz "Please enter the first integer: " 
promptTwo: 		.asciiz "Please enter the second integer: " 
result: 		.asciiz "The greatest common divisor (GCD) is: "
newline:		.asciiz "\n"

.text
main:
	# Ask for the first integer.
      	li $v0, 4
      	la $a0, promptOne 		# prints prompOne string
      	syscall
      	jal newliner			# Prints a newline
      	jal reader			# Reads the first integer
      	move $t0, $v0			# Store the first integer
      	     	      	
      	# Ask for the second integer.
      	li $v0, 4
      	la $a0, promptTwo		# prints prompTwo string
      	syscall
      	jal newliner			# Prints a newline
      	jal reader			# Reads the second integer
      	move $t1, $v0			# Store the second integer
      	
	# Display the results statement.
      	li $v0, 4
      	la $a0, result			# prints results string
      	syscall
      	
      	jal GCD				# Calculate the GCD
      		
    	# Prints the GCD value
    	li $v0, 1
    	move $a0, $s0		
    	syscall

endprogram:
	# Terminates the program    
      	li $v0, 10	        
	syscall
	
newliner:
	# Prints a newline
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra				# Return from function
	
reader:
      	# Store the value.
      	li $v0, 5
      	syscall
      	jr $ra				# Return from function
      	
GCD:
	beq $t1, $zero, return		# Branch if the remainder is equal to zero
	div  $t0, $t1			# Divides the integers
	mfhi $t2			# Remainder
    	move $t0, $t1			# Rearranges the value such as in Euclidian Algorithm
    	move $t1, $t2			# Rearranges the value such as in Euclidian Algorithm
	j GCD 				# Jump to the beginning of the loop
      	
return:
	# Exits the loop
	move $s0, $t0		
    	jr $ra  			# Return from function
    