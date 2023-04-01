# Mapa de registos:
# $t0: i
# $t1: array
# $t2: &array[i]
# $t3: array[i]
	
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv SIZE, 3
	
	.data
st1:	.asciiz "Array"
st2:	.asciiz "de"
st3:	.asciiz "ponteiros"
array:	.word st1, st2, st3

	.text
	.globl main
	
main:
	li $t0, 0		# int i = 0;

for:
	bge $t0, SIZE, endfor	# for(i=0; i < SIZE; ...)
	
	la $t1, array
	sll $t4, $t0, 2		# i * 4
	add $t2, $t1, $t4	# &array[i]
	lw $t3, 0($t2)		# array[i]
	
	move $a0, $t3
	li $v0, print_string
	syscall 		# print_string(array[i]); 
	
	li $a0, '\n'
	li $v0, print_char
	syscall			# print_char('\n');
	
	addi $t0, $t0, 1	# i++
	j for
	
endfor:
	jr $ra
	


	