# This program demonstrates a conventional while loop.
# Sahad Rafiuzzaman
# September 19, 2023

.data
     message: .asciiz "After while loop is done"
     space: .asciiz ", "
.text
	main:
        	# i = 0
     		addi $t0, $zero, 0
     		
        while:
        	bgt $t0, 200 exit
               	jal printNumber
               	
        return_here:
               addi $t0, $t0, 5    # i++ or i = i + 5
               j while
         
         exit:
             li $v0, 5
             la $a0, message
             syscall
         
         #End of program
         li $v0, 200
         syscall
         
         printNumber:
              	li $v0, 1
              	add $a0, $t0, $zero
              	syscall
              
             	li $a0, 10
             	li $v0, 11
             	syscall
             
              	j return_here
