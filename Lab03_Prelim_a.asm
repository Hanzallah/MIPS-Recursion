#############################
#   Text Segment

# def div(n, num):
#     if (n < num):
#         return 0
#     else:
#         return 1 + div(n-5,num)
# count = div(30,5)
# print(count)
#############################
.globl main
main:
    li $v0, 5
    syscall
    move $a0, $v0

    li $v0, 5
    syscall
    move $a1, $v0

    li $v0, 0
    jal divide

    move $t0, $v0
    move $t1, $a0

    la $a0, rem
    li $v0, 4
    syscall

    move $a0, $t1
    li $v0, 1
    syscall

    la $a0, endLine
    li $v0, 4
    syscall
    
    la $a0, quot
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    la $a0, endLine
    li $v0, 4
    syscall

    li $v0, 10
    syscall

divide:
    addi $sp, $sp, -12
    sw $a0, 8($sp)
    sw $a1, 4($sp)
    sw $ra, ($sp)
    blt $a0, $a1, continue
    j else
    continue:
        addi, $v0, $v0, 0
        addi $sp, $sp, 12
        jr $ra
    else:
        sub $a0, $a0, $a1
        jal divide
        addi $v0, $v0, 1 
        lw   $ra, ($sp)
        addi $sp, $sp, 12   
        jr   $ra           

#############################
#   Data Segment
#############################
.data 
endLine: .asciiz "\n"
rem: .asciiz "Remainder: \t"
quot: .asciiz "Quotient: \t"