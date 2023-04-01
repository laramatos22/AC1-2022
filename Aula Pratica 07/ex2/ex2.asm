	.data
	.eqv print_string, 4
	
str:	.asciiz "ITED - orievA ed edadisrevinU"

	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)

	la $a0, str
	jal strrev		# strrev(str)
	
	move $a0, $v0
	li $v0, print_string
	syscall			# print_string( strrev(str) ); 
	
	li $v0, 0		# return 0; 
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra

