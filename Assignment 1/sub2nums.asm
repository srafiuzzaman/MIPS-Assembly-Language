# This program subtracts two numbers.
# Sahad Rafiuzzaman
# September 19, 2023
.data
promptn1:  .asciiz "Please enter an integer for number 1:\n"
promptn2:  .asciiz "Please enter an integer for number 2:\n"
outputtext: .asciiz "The difference is: "

.text
main: li $v0, 4
      la $a0, promptn1
      syscall				# prints promptn1
      
      li $v0, 5
      syscall				# reads num1 into $v0
      add $s0, $zero, $v0		# move $v0 to $s0
      
      li $v0, 4
      la $a0, promptn2
      syscall				# prints promptn2
      
      li $v0, 5
      syscall				# reads num2 into $v0
      add $s1, $zero, $v0		# move $v0 to $s1
      
      sub $s2, $s0, $s1			# s2 = s0 - s1
      
      li $v0, 4
      la $a0, outputtext
      syscall				# prints outputtext
      
      li $v0, 1
      add $a0, $zero, $s2		# prints out the difference in $s2
      syscall
      
      # exit program
      li $v0, 10
      syscall
