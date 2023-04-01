# Mapa de registos:
# $t0: num
# $t1: i
# $t2: str
# $t3: str + i
# $t4: str[i]

	.data
	
	.eqv SIZE, 20
	.eqv SIZEmais1, 21
	.eqv read_string, 8
	.eqv print_int10, 1
	
str:	.space SIZEmais1

	.text
	.globl main
	
main:
	la $a0, str		# $a0 = &str[0] (endereço da posição 0 do array, 
				# i.e., endereço inicial do array)
	li $a1, SIZE
	li $v0, read_string
	syscall			# read_string(str, SIZE);
	
	ori $t0, $0, 0		# num = 0;
	ori $t1, $0, 0		# i = 0;
	
while:				
	la $t2, str		# $t2 = str ou &str[0]
	addu $t3, $t2, $t1	# $t3 = str+i ou &str[i]
	lb $t4, 0($t3)		# $t4 = str[i]
	
	beqz $t4, endWhile 	# while(str[i] != '\0')
	
if:
	sge $t5, $t4, '0'	# str[i] >= '0'
	sle $t6, $t4, '9'	# str[i] <= '9'
	and $t7, $t5, $t6	# (str[i] >= '0') && (str[i] <= '9')
	
	beqz $t7, endif		# if( (str[i] >= '0') && (str[i] <= '9') )
	
	addi $t0, $t0, 1	# num++;
	
endif:
	addiu $t1, $t1, 1	# i++;

	j while
	
endWhile:
	move $a0, $t0
	li $v0, print_int10
	syscall			# print_int10(num); 
	
	jr $ra			# termina o programa

