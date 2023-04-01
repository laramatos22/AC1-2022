# Mapa de registos
# $t0: p
# $t1: pultimo
# $t2: *p
# $t3: soma

	.data 
	
	.eqv SIZE, 4		# array de 4 posicoes
	.eqv print_int10, 1
	
array:	.word 7692, 23, 5, 234

	.text
	.globl main
	
main:
	li $t3, 0		# int soma = 0;
	
	li $t4, SIZE
	sub $t4, $t4, 1		# $t4 = 3
	sll $t4, $t4, 2		# ou "mul $t4,$t4,4"
	la $t0, array		# p = array;
				# "p" é preenchido com o endereço inicial do array
	
	addu $t1, $t0, $t4	# pultimo=array+SIZE-1;
	
while:
	bgtu $t0, $t1, endWhile
	lw $t2, 0($t0)		# $t2 = (*p) -> criação do ponteiro
	add $t3, $t3, $t2	# soma = soma + (*p); 
	addiu $t0, $t0, 4	# p++;
	
	j while
	
endWhile:
	move $a0, $t3
	li $v0, print_int10
	syscall			# print_int10(num);
	
	jr $ra			# termina o programa
	
