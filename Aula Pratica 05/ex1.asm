# Mapa de registos:
# $t0: i
# $t1: lista
# $t2: lista + i

	.data
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv SIZE, 5
	.eqv SIZEx4, 20
	
str: 	.asciiz "\nIntroduza um numero: "	# + terminador '\0'
	.align 2
lista:	.space SIZEx4		# 5 * 4
				# static int lista[SIZE];

	.text
	.globl main
	
main:
	li $t0, 0		# int i = 0;
	
for:
	bgeu $t0, SIZE, endfor	# for(i=0; i < SIZE; i++) 
	
	la $a0, str
	li $v0, print_string
	syscall			# print_string(str); 
	
	li $v0, read_int
	syscall			# read_int()
	
	la $t1, lista		# $t1 = lista (ou &lista[0])
	sll $t2, $t0, 2		# $t2 = i*4
	addu $t2, $t2, $t1	# $t2 = lista + i = &(lista[i])
	sw $v0, 0($t2)		# lista[i] = read_int()
	
	addi $t0, $t0, 1	# i ++
	
	j for
	
	li $v0, 0
	
endfor:
	jr $ra

