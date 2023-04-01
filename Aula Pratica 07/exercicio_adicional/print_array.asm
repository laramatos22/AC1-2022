# funcao print_array

	.data
	.eqv print_int10, 1
	.eqv print_string, 4
str:	.asciiz ", "
	.text
	.globl print_array

print_array:
	move $t0, $a0
	move $t1, $a1
	
	sll $t1, $t1, 4		# n*4
	addu $t2, $t0, $t1	# p = &(a + n)
	
for:
	bge $t0, $t1, endfor	# for(; a < p; ...)
	
	lw $a0, 0($t0)		# $a0 = *a;
	li $v0, print_int10
	syscall  		# print_int10( *a );
	
	la, str
	li $v0, print_string
	syscall 		# print_string(", ");
	 
	addiu $t0, $t0, 4	# a++;
	j for
	 
endfor:
	jr $ra
