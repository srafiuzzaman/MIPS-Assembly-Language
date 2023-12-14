# Program to demonstrate while 
# Sahad Rafiuzzaman
# October 10, 2023

.data
i: .word 0
.text
  
    lw $t0, i
    
While:
       beq $t0, 10, endwhile
       addi $t0, $t0, 1
       
j While

endwhile:
li $v0, 1
move $a0,$t0
syscall

endprog: 
li $v0, 10	#terminate program        
syscall