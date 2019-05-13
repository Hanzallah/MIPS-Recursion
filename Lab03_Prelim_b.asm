#############################
#   Text Segment

# def mult(noOfDigits, string):
#    if (noOfDigits == 0):
#        return 1
#    else:
#        return int(string[0]) * mult(noOfDigits - 1,string[1:])
# count = mult(3,"227")
# print(count)
#############################
.globl main
main:
    li $v0, 8
    la $a0, inputString
    li $a1, 1024
    syscall

    # count number of digits
    move $t0, $a0
    li $a1, -1
    for:
        lb $t1, ($t0)
        bne $t1, $zero, adder
        beq $t1, $zero, cont
        adder:
            addi $a1, $a1, 1
            addi $t0, $t0, 1
            j for
        cont:

    li $v0, 1
    jal mult

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

mult:
    addi $sp, $sp, -12
    sw $a0, 8($sp)
    sw $a1, 4($sp)
    sw $ra, ($sp)
    beq $a1, $zero, continue
    j else
    continue:
        sll $v0, $v0, 0
        addi $sp, $sp, 12
        jr $ra
    else:
        sub $a1, $a1, 1 # noOfDigits - 1
        
        
        li $t0, 0
        lb $t0, ($a0)
        li $s4, 0
        addi $s4, $t0, -48  
        mult $v0, $s4
        mflo $v0
        
        addi $a0, $a0, 1 # string[1:]

        jal mult

    
        lw   $ra, ($sp)
        addi $sp, $sp, 12   
        jr   $ra           

#############################
#   Data Segment
#############################
    .data
# Max. 256 char string
inputString: .space 1024
