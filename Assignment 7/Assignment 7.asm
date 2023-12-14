# Sahad Rafiuzzaman
# November 28, 2023
# Week 11 MIPS Assignment
# This program does the following: 
# Create a single assembly program that starts by asking the user for 2 integer inputs and stores the values in appropriate registers
# (be sure to utilize meaningful input prompts to tell the user the input expectations). 
# With those 2 values within the variables perform the following: 
	# Add the 2 integer inputs and print out the result to the console in the following format:
		# Least Value + Greatest Value = Result
	# Subtract the smaller value from the greatest value and print out the result to the console in the following format: 
		# Greatest Value - Least Value = Result
	# Subtract the smaller value from the greatest...then use a loop to add up every number from 1 to the subtracted result value. 
	# Meaning if the subtraction instruction produced a result of 4 then the loop would add together 
	# 1 + 2 + 3 + 4 to produce a result. Then output the final loop result to the console with meaningful text.
	
# Each output should be on its own line (there are a couple of ways to force a line feed/return in MIPS...
# perhaps you could find some code examples through an Internet search). Be sure to utilize meaningful text to guide the end-users...
# remember that normal end-users will not be able to see your uncompiled code.

.data
promptOne: 	.asciiz "Please enter the first integer: \n" 
promptTwo: 	.asciiz "Please enter the second integer: \n" 
addition: 	.asciiz "Least Value + Greatest Value = \n"
subtraction: 	.asciiz "\nGreatest Value - Least Value = \n"
subSumResult: 	.asciiz "\nSummation from 1 to the result of subtraction = \n"

.text
main:
      # Ask for the first integer.
      li $v0, 4
      la $a0, promptOne 
      syscall
      
      # Store the first integer.
      li $v0, 5
      syscall
      move $t0, $v0
      
      # Ask for the second integer.
      li $v0, 4
      la $a0, promptTwo
      syscall
      
      # Read the second integer.
      li $v0, 5
      syscall
      move $t1, $v0 
      
      # Assign the Value
      blt $t0, $t1 FirstIsLessThanSecond
      blt $t1, $t0 FirstIsGreaterThanSecond
               
FirstIsLessThanSecond:
	# Add the 2 integer inputs and print out the result to the console in the following format:
	# Least Value + Greatest Value = Result 
	add $t2, $t1, $t0
	
	li $v0, 4
      	la $a0, addition
	syscall
     
      	move $a0, $t2
      	li $v0, 1 
      	syscall
	
	# Subtract the smaller value from the greatest value and print out the result to the console in the following format: 
	# Greatest Value - Least Value = Result
      	sub $t3, $t1, $t0
	
	li $v0, 4
      	la $a0, subtraction
	syscall
     
      	move $a0, $t3
      	li $v0, 1 
      	syscall
     
        # Subtract the smaller value from the greatest...then use a loop to add up every number from 1 to the subtracted result value. 
	# Meaning if the subtraction instruction produced a result of 4 then the loop would add together 
	# 1 + 2 + 3 + 4 to produce a result. Then output the final loop result to the console with meaningful text.
	
	li $t4, 0
	  
	loop:
		add $t4, $t4, $t3
	    	addi $t3, $t3, -1
	    	bgtz $t3, loop
	    	j print  
                               
FirstIsGreaterThanSecond:
	# Rearrange values	
	move $t5, $t0
	move $t6, $t1
	move $t0, $t6
	move $t1, $t5
	j FirstIsLessThanSecond
	
print:
	# Print the result to the console
	li $v0, 4
	la $a0, subSumResult
	syscall
	
	move $a0, $t4
	li $v0, 1
	syscall
	
endprog: 
	#terminate program
	li $v0, 10	        
	syscall
	
       
