# Mapa de registos:
# $t0: num
# $t1: p
# $t2: *p

	.data
	
	.eqv SIZE, 20
	.eqv SIZEmaisUm, 21
	.eqv read_string, 8
	.eqv print_int10, 1
	
str:	.space SIZEmaisUm

	.text
	.globl main
	
main: 
	li $t0, 0		# int num = 0;
	
	la $a0, str
	li $a1, SIZE
	li $v0, read_string
	syscall			# read_string(str, SIZE);
	
	la $t1, str		# p = str;
	
while:
	lb $t2, 0($t1)		# criação do ponteiro para carater
	beq $t2, '\0', endWhile	# while( *p != '\0' )
				# Acede ao byte apontado pelo ponteiro "p" (*p) e compara o valor
				# lido com o carater terminador ('\0' = 0x00)

if:
	sge $t3, $t2, '0'	# *p >= '0'
	sle $t4, $t2, '9'	# *p <= '9'
	and $t5, $t3, $t4	# (*p >= '0') && (*p <= '9') 
	
	beqz $t5, endif		# if( (*p >= '0') && (*p <= '9') )
	
	addi $t0, $t0, 1	# num ++;

endif:
	addiu $t1, $t1, 1	# p++;
				# incrementa o ponteiro
	
	j while
	
endWhile:
	move $a0, $t0
	li $v0, print_int10
	syscall			# print_int10(num);
	
	jr $ra
	
	
	
	
