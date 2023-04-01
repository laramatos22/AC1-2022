# Mapa de registos:
# $t0: p
# $t1: *p (registo temporário para guardar o valor armazenado em memória)
# $t2: lista + SIZE
# $t3: houveTroca
# $t4: i
# $t8: aux

	.data
	.eqv SIZE, 10
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv print_string, 4
	.eqv print_int10, 1
	
str1:	.asciiz "\nConteudo do array:\n"
str2:	.asciiz "; "
str3: 	.asciiz "\nArray ordenado:\n"
	
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
	bgeu $t0, $t2, do	# for(p = lista; p < lista + SIZE; p++)
	
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
		
do:
	ori $t3, $0, FALSE	# houveTroca = FALSE;
	addi $t5, $t2, -1	# SIZE - 1
	
	li $t4, 0		# int i = 0;
	
for1:	
	bge $t4, $t5, endfor	# for (i=0; i < SIZE-1; i++)
	
	la $t0, lista		# $t0 = lista (ou &lista[0])
	sll $t6, $t4, 2		# $t2 = i*4
	addu $t6, $t0, $t6	# $t2 = lista + i = &(lista[i])
	
	#la $t0, lista		# $t0 = lista (ou &lista[0])
	sll $t7, $t4, 2		# $t7 = i*4
	addi $t7, $t7, 1	# $t7 = i + 1
	addu $t7, $t7, $t1	# $t7 = lista + i = &(lista[i+1s])
	
if:
	ble $t6, $t7, endif	# if (lista[i] > lista[i+1])
	
	or $t8, $0, $t6		# aux = lista[i];
	or $t6, $0, $t7		# lista[i] = lista[i+1]; 
	or $t7, $0, $t8		# lista[i+1] = aux; 
	ori $t3,$0, TRUE	# houveTroca = TRUE; 
	
endif:
	
endfor:

while:
	beq $t3, TRUE, do	# while (houveTroca==TRUE);
	

# Código de impressão do conteúdo do array ordenado
	la $a0, str3
	li $v0, print_string
	syscall			# print_string("\nArray ordenado:\n");	
	
for2:
	bgeu $t0, $t2, endfor1	# for(i = 0; i < SIZE; i++)
	
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
	
endfor1:
	jr $ra
	
	
	
