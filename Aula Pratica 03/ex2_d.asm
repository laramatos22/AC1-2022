# Mapa de registos:
# $t0 - value
# $t1 - bit
# $t2 - i
# $t3- flag

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
	li $t3, 0		# flag = 0
	
for:
	bge $t2, 32, endfor
	
	srl $t1, $t0, 31	# bit = value >> 31; 
	
if1:
	seq $t4, $t3, 1		# flag = 1
	sne $t5, $t1, $0	# bit != 0
	or $t6, $t4, $t5	# flag == 1 || bit != 0
	bne $t6, 1, endif1	# if (flag == 1 || bit != 0)
	
	li $t3, 1		# flag = 1;
	 
if2:
	rem $t3, $t2, 4		# i % 4
	bne $t3, $0, eif2	# if((i % 4) == 0)
	
	li $a0, ' '
	li $v0, print_char
	syscall			# print_char(' ');
	
eif2:
	addi $a0, $t1, '0'	# 0x30 + bit
	li $v0, print_char
	syscall			# print_char(0x30 + bit);	
	
endif1:
	sll $t0, $t0, 1		# value = value << 1;
	
	addi $t2, $t2, 1	# i++
	
	j for
	
endfor:	
	jr $ra
	
	
