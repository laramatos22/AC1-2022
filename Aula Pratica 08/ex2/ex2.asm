# Mapa de registos:
# val:	$s0
# O main é, neste caso, uma sub-rotina intermédia

	.data
	.eqv MAX_STR_SIZE, 33
	.eqv print_string, 4
	.eqv read_int, 5
	
str:	.space MAX_STR_SIZE

	.text
	.globl main
	
main:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
do:
	li $v0, read_int
	syscall
	move $s0, $v0		# val = read_int();
	
	move $a0, $s0
	li $a1, 2
	la $a2, str
	jal itoa		# itoa(val, 2, str)
	move $a0, $v0
	li $v0, print_string
	syscall			# print_string( itoa(val, 2, str) );
	
	move $a0, $s0
	li $a1, 8
	la $a2, str
	jal itoa		# itoa(val, 8, str)
	move $a0, $v0
	li $v0, print_string
	syscall			# print_string( itoa(val, 8, str) );
	
	move $a0, $s0
	li $a1, 16
	la $a2, str
	jal itoa		# itoa(val, 16, str)
	move $a0, $v0
	li $v0, print_string
	syscall			# print_string( itoa(val, 16, str) );
	
while:
	bne $s0, $0, do		#  while(val != 0); 
	
	li $v0, 0		# return 0;
	
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	addiu $sp, $sp, 8
	
	jr $ra
	
