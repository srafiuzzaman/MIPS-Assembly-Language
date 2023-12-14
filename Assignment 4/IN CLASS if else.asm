# Program to demonstrate if else
# Sahad Rafiuzzaman
# October 10, 2023

.data
x: .word 10		# variable x
text1: .asciiz "if x is "
text2: .asciiz "else x is "
.text
   lw $t0, x		#
   bne $t0, 10, else
   
   li $v0, 4
   la $a0, text1
   syscall
      
   li $v0, 1
   move $a0, $t0
   syscall
      
   j endelse
   else:
   li $v0, 4
   la $a0, text2
   syscall
   
   li $v0, 1
   move $a0, $t0
   syscall
   
   endelse:	 
   endprog: 
   li $v0, 10	#terminate program        
   syscall  