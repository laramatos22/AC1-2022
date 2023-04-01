# Mapa de registos:
# $t0: p
# $t1: *p (registo temporário para guardar o valor armazenado em memória)
# $t2: lista + SIZE

	.data
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv SIZE, 10
	
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz "; "
	
lista: 	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15

	.text
	.globl main
	
main:
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("\nConteudo do array:\n");
	
	la $t0, lista		# $t0 = p = lista
	
	li $t2, SIZE
	sll $t2, $t2, 2		# SIZE * 4
	addu $t2, $t0, $t2	# $t2 = lista + SIZE = &(lista[SIZE])
	
for:
	bgeu $t0, $t2, endfor	# for(p = lista; p < lista + SIZE; p++)
	
	lw $t1, 0($t0)		# *p -> criação do ponteiro
	move $a0, $t1
	li $v0, print_int10
	syscall			# print_int10( *p );
				# Imprime o conteúdo da posição do array cujo endereço é "p"
	
	la $a0, str2
	li $v0, print_string
	syscall			# print_string("; "); 
	
	addiu $t0, $t0, 4	# p++
	
	j for
		
endfor:
	jr $ra

	