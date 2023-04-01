# Mapa de registos:
# lista: $t0
# i: $t1
# j: $t2

	.data
	.eqv SIZE, 10
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv read_int, 5
	
lista:	.space 40
	
str1: 	.asciiz "\nIntroduza um numero:\n "
str2: 	.asciiz "\nConteudo do Array: \n "
str3:	.asciiz "; "

	.text
	.globl main
	
main:
	li $t1, 0		# int i = 0;
	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("\nIntroduza um numero: ");

for1:
	bge $t1, SIZE, endfor1	# for (i = 0; i < SIZE; ...)
	
	la $t0, lista		# $t0 = lista
	sll $t3, $t1, 2		# i * 4
	add $t3, $t0, $t3	# $t3 = &lista[i]
	
	li $v0, read_int
	syscall
	sw $v0, 0($t3)		# lista[i] = read_int();
	
	addi $t1, $t1, 1	# i++
	j for1
	
endfor1:
	li $t1, 0		# i = 0

for2:
	bge $t1, 9, endfor2	# for (i = 0; i < SIZE-1; ...)
	
	addi $t2, $t1, 1	# j = i+1
	
for3:
	bge $t2, SIZE, endfor3	# for (j = i+1; j < SIZE; j++)

	la $t0, lista		# $t2 = lista
	sll $t3, $t1, 2		# i * 4
	add $t3, $t0, $t3	# $t3 = &lista[i]
	lw $t4, 0($t3)		# $t4 = lista[i]
	
	la $t0, lista		# $t2 = lista
	sll $t5, $t2, 2		# $t5 = j * 4
	add $t5, $t0, $t5	# $t5 = &lista[j]
	lw $t6, 4($t5)		# $t6 = lista[j]
	
if:	
	ble $t4, $t6, endif	# if (lista[i] < lista[j])
	
	lw $t7, 0($t4)		# aux = lista[i]
	sw $t6, 0($t3)		# lista[i] = lista[j];
	sw $t7, 0($t5)		# 
	
endif:
	addi $t2, $t2, 1	# j++
	j for3

endfor3:	
	addi $t1, $t1, 1	# i++
	j for2
	
endfor2:
	la $a0, str2
	li $v0, print_string
	syscall			# print_string("\nConteudo do Array: \n");		
	
	la $t0, lista		# $t0 = p = lista
	li $t2, SIZE
	sll $t2, $t2, 2		# SIZE * 4
	addu $t2, $t2, $t0	# $t2 = lista + SIZE = &lista[SIZE]
	
for4:
	bge $t0, $t2, endfor4	# for (p = lista; p < lista + SIZE; ...)
	
	lw $a0, 0($t0)		# criação de *p
	li $v0, print_int10
	syscall			# print_int10(*p);
	
	la $a0, str3
	li $v0, print_string
	syscall			# print_string("; ");
	
	addiu $t0, $t0, 4	# p++;
	j for4
	
endfor4:
	jr $ra
 