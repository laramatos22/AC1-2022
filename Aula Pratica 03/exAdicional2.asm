# Mapa de registos:
# $t0: res
# $t1: i
# $t2: mdor
# $t3: mdo

	.data
	
str1: 	.asciiz "Introduza dois numeros: "
str2: 	.asciiz "Resultado: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	
	.text
	.globl main
	
main:
	li $t0, 0		# unsigned int res = 0;
	li $t1, 0		# unsigned int res = 0;
	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Introduza dois numeros: ");
	
	li $v0, read_int
	syscall
	move $t2, $v0
	andi $t2, $t2, 0x0F	# mdor = read_int() & 0x0F; 
	
	li $v0, read_int
	syscall
	move $t3, $v0
	andi $t3, $t3, 0x0F	# mdo = read_int() & 0x0F; 
	
while:
	li $t5, 4
	sne $t4, $t2, $0
	slt $t5, $t1, $t5
	and $t4, $t4, $t5
	beq $t4, $0, endWhile	# while( (mdor != 0) && (i++ < 4) )
	andi $t1, $t1, 1	# i++
	
if:
	andi $t4, $t2, 0x00000001
	beq $t4, $0, endif	# if( (mdor & 0x00000001) != 0 )
	
	add $t0, $t0, $t3	# res = res + mdo; 
	
endif:
	sll $t3, $t3, 1		# mdo = mdo << 1; 
	srl $t2, $t2, 1		# mdor = mdor >> 1;	

endWhile:
	la $a0, str2
	li $v0, print_string
	syscall			# print_string("Resultado: ");
	
	move $v0, $t0
	li $v0, print_int10
	syscall			# print_int10(res);
	
	jr $ra

	