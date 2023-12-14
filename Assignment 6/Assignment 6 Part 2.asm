# Sahad Rafiuzzaman
# November 7, 2023
# Week 9 MIPS Assignment Part 2
# For this assignment, please write the following MIPS programs:
# One that will add 14.69 to 16.48 THEN add 19.23 to 11.95...
# then print out the results sorted through code from the least to the greatest sum. 

.data
    value1:  .float 14.69
    value2:  .float 16.48
    value3:  .float 19.23
    value4:  .float 11.95
    result1: .float 0.00
    result2: .float 0.00
    newline: .asciiz "\n"

.text
main:
    # Perform the first addition: 14.69 + 16.48
    lwc1 $f0, result1
    lwc1 $f1, value1
    lwc1 $f2, value2
    add.s $f0, $f1, $f2
    s.s $f0, result1

    # Perform the second addition: 19.23 + 11.95
    lwc1 $f3, result2
    lwc1 $f4, value3
    lwc1 $f5, value4
    add.s $f3, $f4, $f5
    s.s $f3, result2

    # Branching
    c.lt.s $f0, $f3
    bc1t print_true
    bc1f print_false

print_true:
    li $v0, 2
    l.s $f12, result1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 2
    l.s $f12, result2
    syscall
    j exit

print_false:
    li $v0, 2
    l.s $f12, result2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 2
    l.s $f12, result1
    syscall

exit:
    li $v0, 10
    syscall
