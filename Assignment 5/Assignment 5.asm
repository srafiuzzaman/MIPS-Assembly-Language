# Sahad Rafiuzzaman
# October 31, 2023
# Week 7 MIPS Assignment
# For this assignment, please write the following MIPS programs:
# Implements a loop that will start at the value of 0 and count up by 5s until 200...
# each number must be printed to the console (i.e. 0, 5, 10, 15...etc.). 
# *****Challenge: see if you can insert a line feed after each number divisible by 50.*****

.data
spc:	.asciiz " "
cmm:	.asciiz ","
lnfd:	.asciiz "\n"

.text
main:
	li $t0, 0              # Set initial value to 0 at $t0
	li $t1, 200            # Set final value to 200 at $t1
	li $t2, 5              # Set increment value to 5 at $t2

loop:
	move $a0, $t0	
	jal prntr		#jump to printer
	jal cmm_prntr		#jump to comma printer
	jal spc_prntr		# jump to space printer
    	add $t0, $t0, $t2       # Increment $t0 by 5
    	li $t3, 50              # load divider value
    	div $t0, $t3            # Divide the number by 50
    	mfhi $t4                # check for mod
    	bgt $t0, $t1, exitprgrm	# if $t0 equals $t1, exit the loop.
    	beq $t4,$zero lnfdr 	# if $t4 equals zero, jump to line feeder
    	j loop			# Repeat loop
		
		
exitprgrm:	
	li $v0, 10      # Exit the program  
	syscall  	
           
prntr:
	move $a0, $t0
	li $v0, 1	#Print value
    	syscall           
	jr $ra
	
cmm_prntr:	
	li $v0, 4	# Print comma
    	la $a0, cmm  
	syscall 		
	jr $ra
	
spc_prntr:
	li $v0, 4	# Print space
    	la $a0, spc  
	syscall
	jr $ra

lnfdr:
	move $a0, $t0
	li $v0, 1	#Print value
    	syscall  
    	         
	li $v0, 4	# Print newline
    	la $a0,lnfd   
	syscall
	jr $ra   
