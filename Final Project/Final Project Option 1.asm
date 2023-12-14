# Sahad Rafiuzzaman
# CIS126T6CF
# December 13, 2023
# Final Project

# Option 1: 
# Create and code a MIPS application that calculates, stores (in an array), and prints numbers to the console
# determined by using the same approach as the Fibonacci sequence. The Fibonacci Sequence is the series of numbers
# where each number is found by adding together the 2 numbers that came before the relevant value.
# Your code will ask the user to input the first 2 integer values that will be the start of the sequence.
# In addition, your code must ask the user to input the number of values (iterations) to be calculated, stored, 
# and shown (valid input should be between 3 and 20 values/iterations inclusively).

# As an example of how this sequence works here is the start of the Fibonacci sequence with relevant description:
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...

# You will notice that the number 2 is calculated by adding the two numbers before it a 1 and a 1…
# 3 is then calculated by adding 2 + 1…5 is calculated by adding 2 + 3…etc. 
# The output should be neat, provide output text to the user, and display the number of iterations specified 
# by the user (neat with appropriate spacing). The code should be easy to read, well documented with comments, 
# and follow all MIPS format and naming conventions. The code must primarily execute properly with the expected 
# result(s). However, the code will be scrutinized and evaluated for a sense of elegance and logic.
# Please see the attached MIPS Application Development Rubric for specific grading criteria.

.data
promptOne: 		.asciiz "Please enter the first integer: " 
promptTwo: 		.asciiz "Please enter the second integer: " 
promptIterations: 	.asciiz "Enter the number of iterations(3-20): "
resultOne: 		.asciiz "The fibonacci sequence of "
resultTwo:		.asciiz " iterations is: "
newline:		.asciiz "\n"
comma:			.asciiz ", "

.align 2
array: 			.space 1000

.text
main:

	#load address of the array
	la $s0, array

	# Ask for the first integer.
      	li $v0, 4
      	la $a0, promptOne 
      	syscall
      	jal newliner			# Prints a newline
      	jal reader			# Reads the first integer
      	move $t0, $v0			# Store the first integer
      	sw $t0, 0($s0)			# Stores the first integer in the array
      	      	      	
      	# Ask for the second integer.
      	li $v0, 4
      	la $a0, promptTwo
      	syscall
      	jal newliner			# Prints a newline
      	jal reader			# Reads the second integer
      	move $t1, $v0			# Store the second integer
      	sw $t1, 4($s0)			# Stores the second integer in the array
      	
      	# Ask for the number of iterations.
      	li $v0, 4
      	la $a0, promptIterations
      	syscall
      	jal newliner			# Prints a newline
      	jal reader			# Reads the number of iterations
      	move $t2, $v0			# Stores the number of iterations
      	
      	# Display the results statement.
      	li $v0, 4
      	la $a0, resultOne		# Part 1 of the results statement
      	syscall
      	
      	li $v0, 1
      	move $a0, $t2			# Display the number of iterations
      	syscall
      	
      	li $v0, 4
      	la $a0, resultTwo		# Part 2 of the results statement
      	syscall
  	
  	jal newliner			# Prints a newline
  	
  	# Print first integer
  	li $v0, 1
	move $a0, $t0
	syscall
	
	jal commaSpacer			# Prints ",_"
	
	# Print second integer
	li $v0, 1
	move $a0, $t1
	syscall
	
	jal commaSpacer			# Prints ",_"
	
 fibonacciLoop:
	beqz $t2, endprogram		# Exit program once iteration count is zero
	jal loader			# Loads the first two integers in the array
			 		# Adds the first two integers 
 	jal printer			# Prints the new integer
    	jal commaSpacer			# Prints ",_"
    	jal increment			# Increment address for the next value
	jal decrement			# Decrement iteration count
    	j fibonacciLoop   		# Jumps to the beginning of loop

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

loader:
	# Loads the first two integers in the array
	lw $t0, 0($s0)
 	lw $t1, 4($s0)
 	
 	# Adds the first two integers 
 	add $t3, $t1, $t0
 	jr $ra				# Return from function

printer:
	# Prints the new integer
	li $v0, 1
	addi $a0, $t3, 0
	syscall
	jr $ra 				# Return from function
	     		      		
commaSpacer:
	# Prints ",_"
	li $v0, 4
	la $a0, comma
	syscall
	jr $ra  			# Return from function
	    	
increment:
	# Increment address for the next value
      	sw $t3, 8($s0)
      	addi $s0, $s0, 4
      	jr $ra				# Return from function
      	
decrement:
	# Decrement iteration count
	addi $t2, $t2, -1   	
	jr $ra  			# Return from function
	
	    	      	    	      	