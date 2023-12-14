# Sahad Rafiuzzaman
# Octtber 3rd, 2023
# Week 4 MIPS Assignment

# This program does the following:
# Print the string "Hello World"
# Print the character 'P'
# Print the integer 19
# Print the floating point number 15.4

.data
hello_world: .asciiz "Hello World\n"
int_nineteen: .word 19
floating_num: .float 15.4
newline: .asciiz "\n"

.text
main:
	# Print the string "Hello World"
	li $v0, 4
	la $a0, hello_world
	syscall
	
	# Print the character 'P'
	li $a0, 'P'
	li $v0, 11
	syscall
	
	# Print a newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# Print the integer 19
	lw $a0, int_nineteen
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	# Print the floating point number 15.4
	l.s $f12, floating_num
	li $v0, 2
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	# Exit program
	li $v0, 10
	syscall
