# Sahad Rafiuzzaman
# October 17, 2023
# Week 6 MIPS Assignment Part 3
# This program does the following: 
# Adds the following numbers: 9, 18, 21, 28, 35 and prints the result to the console

.data
numbers: .word 9, 18, 21, 28, 35
array_length: .word 5

.text
main: 
	la $t0, numbers		# Load address of numbers into $t0
	la $t1, array_length	# Load address of array_length into $t1
	
	lw $t1, 0($t1) 		# Load the length into $t1
	li $t2, 0       	# Begin summation at 0
	li $t3, 0       	# Start loop counter at 0 
	
    
While:
       beq $t3, $t1, endwhile	# Loop counter must equal array_length to exit while loop
       
       lw $t4, 0 ($t0)		# Load number into $t4
       
       add $t2, $t2, $t4	# Add to sum
       
       addi $t0, $t0, 4		# Loop increment. Word = 4 bytes
       
       addi $t3, $t3, 1		# Loop counter increment
       
j While				# repeat loop

	endwhile:
	li $v0, 1         
	move $a0, $t2    
    	syscall           
    	
	endprog: 
	li $v0, 10	#terminate program        
	syscall
