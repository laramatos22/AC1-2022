# Mapa de registos
# $t0: p
# $t1: i
# $t2: soma

	.data 
	
	.eqv SIZE, 4		# array de 4 posicoes
	.eqv print_int10, 1
	
array:	.word 7692, 23, 5, 234

	.text
	.globl main
	
main:
	li $t2, 0		# int soma = 0;
	li $t1, 0		# int i = 0;
	
while:
	bge $t1, SIZE, endWhile	# while (i < SIZE)
	
	la $t0 array		# p = array;
	
	sll $t3, $t1, 2		# $t3 = i * 4
	addu $t3, $t0, $t3	# $t3 = array + i = &array[i]
	
	lw $t3, 0($t3)		# $t3 = array[i]
	add $t2, $t2, $t3	# soma = soma + array[i]
	
	addiu $t1, $t1, 1
	
	j while
	
endWhile:
	move $a0, $t2
	li $v0, print_int10
	syscall			# print_int10(num);
	
	jr $ra			# termina o programa
	
