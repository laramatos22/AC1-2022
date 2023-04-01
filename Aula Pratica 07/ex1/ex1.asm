# Mapa de registos:
# $a0: argumentos
# $v0: resultado

	.data
	.eqv print_int10, 1
	
str:	.asciiz "Arquitetura de Computadores I"		# static char str[]="Arquitetura de Computadores I";

	.text
	.globl main
	
main:
	addiu $sp, $sp, -4		# reserva espaço na stack
	sw $ra, 0($sp)			# gaurda o valor de $ra
	
	la $a0, str
	jal strlen			# strlen(str)
	
	move $a0, $v0
	li $v0, print_int10
	syscall				# print_int10(strlen(str));
	
	lw $ra, 0($sp)			# atualiza o valor de $ra
	addiu $sp, $sp, 4		# liberta o espaço reservado
	
	li $v0, 0			# return 0;
	
	jr $ra
	