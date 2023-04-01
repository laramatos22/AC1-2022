# Mapa de registos:
# $t0 - value
# $t1 - bit
# $t2 - i
# $t3, $t4 - variaveis temporárias

	.data
	
str1:	.asciiz "Introduza um numero: "
str2:	.asciiz "\nO valor em binário é: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char, 11
	
	.text
	.globl main
	
main: 	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Introduza um numero: ");
	
	li $v0, read_int
	syscall
	move $t0, $v0		# value = read_int();
	
	la $a0, str2
	li $v0, print_string
	syscall			# print_string("\nO valor em binário e': "); 
	
	li $t2, 0		# i = 0
	
for:
	bge $t2, 32, endfor	# while (i < 32)
	
	rem $t3, $t2, 4		# i % 4
	bne $t3, $0, eif1	# if((i % 4) == 0)
	
	li $a0, ' '
	li $v0, print_char
	syscall			# print_char(' ');

eif1:
	andi $t4, $t0, 0x80000000	# value & 0x80000000; // isola bit 31
	srl $t1, $t4, 31		# bit = (value & 0x80000000) >> 31;

	addi $t3, $t1, '0'	# 0x30 + bit
	move $a0, $t3
	li $v0, print_char
	syscall			# print_char(0x30 + bit);
	

endif:

	sll $t0, $t0, 1		# value = value << 1; // shift left de 1 bit
	
	addi $t2, $t2, 1	# i++;
	j for

endfor:
	jr $ra