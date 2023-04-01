# Mapa de registos:
#
#
#

	.data
	
	.eqv SIZE, 20
	.eqv SIZEmaisUm, 21
	.eqv print_string, 4
	.eqv read_string, 8
	.eqv print_int10, 1
	
str: 	.space SIZEmaisUm
	
string: .asciiz "Introduza uma string: "

	.text
	.globl main
	
main:
	la $a0, string
	li $v0, print_string
	syscall			# print_string("Introduza uma string: ");
	
	la $a0, str
	li $a1, SIZE
	li $v0, read_string
	syscall			# read_string(str, SIZE);
	
	la $t0, str		# p = str;
	
while:
	lb $t1, 0($t0)		# criação do ponteiro (*p = str)
	beqz $t1, endWhile	# while (*p != '\0')
	
	sub $t1, $t1, 0x20	# *p = *p – 'a' + 'A';
	sb $t1, 0($t0)		# renova o registo com o novo carater
	
	addi $t0, $t0, 1	# p++
	
	j while

endWhile:
	move $a0, $t0
	li $v0, print_int10
	syscall			# print_int10(num);
	
	jr $ra			# termina o programa
	
