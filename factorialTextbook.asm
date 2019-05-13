# From the textbook, Harris & Harris p. 331.
# Slightly modified (bge: used) for clarity.
	.text
	li	$a0, 4
	jal	factorial
	move	$a0, $v0
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall


factorial: addi $sp, $sp, -8  # make room for 2 items
           sw   $a0, 4($sp)   # push $a0
           sw   $ra, 0($sp)   # push $ra
           addi	$t0, $zero, 2
       	   bge  $a0, $t0, else 
           addi $v0, $0, 1    # yes: return 1
           addi $sp, $sp, 8   # restore $sp
           jr   $ra           # return
   else: addi $a0, $a0, -1  # n = n - 1
         jal  factorial     # recursive call: 
                                   # factorial(n-1)
         lw   $a0, 4($sp)   # pop $a0 (= saved n)
         mul  $v0, $a0, $v0 # n * factorial(n-1)
         lw   $ra, 0($sp)   # pop $ra
         addi $sp, $sp, 8   # restore $sp
         jr   $ra           # return
