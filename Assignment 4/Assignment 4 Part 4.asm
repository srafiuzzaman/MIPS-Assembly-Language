# Sahad Rafiuzzaman
# October 17, 2023
# Week 6 MIPS Assignment Part 4
# This program does the following: 
# Compare 2 values using logic operations (the beq, bne, j, and slt instructions) 
# and statement labels as needed that will subtract the least value from the greatest value 
# and print the result to the console. PLEASE NOTE: in order to receive credit your decision structure 
# and code must work properly regardless which variable is holding the larger value 
# and which is holding the smaller value.

.data
.text
main:
	li $t0, 51    # Load first value   
	li $t1, 10    # Load second value
        beq $t0, $t1, equal	#branch if first value and second value equals
               	
	slt $t2, $t0, $t1	# compare less than
	beq $t2, $zero, less	# branch if $t2 is not equal to zero
				
	sub $t3, $t1, $t0
	j endsubtract

less:
	sub $t3, $t0, $t1
	j endsubtract
equal:
	sub $t3, $t1, $t0
	j endsubtract	
		
endsubtract:
	# Print the result to the console
	li $v0, 1
	move $a0, $t3
	syscall

	endprog: 
	li $v0, 10	#terminate program        
	syscall
       
