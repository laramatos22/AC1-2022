	.data
	.eqv print_string, 4
	.eqv SIZE, 50
	
	
str1:	.asciiz "Arquitetura de "
str2:	.space SIZE
str3: 	.asciiz "Computadores I"
str4:	.asciiz "\n"

	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, str2
	la $a1, str1
	jal strcpy		# strcpy(str2, str1); 
	
	la $a0, str2
	li $v0, print_string
	syscall			# print_string(str2);
	
	la $a0, str4
	li $v0, print_string
	syscall			# print_string("\n");
	
	la $a0, str2
	la $a1, str3
	jal strcat		# strcat(str2, "Computadores I")
	
	move $a0, $v0
	li $v0, print_string
	syscall			# print_string( strcat(str2, "Computadores I") );
	
	li $v0, 0		# return 0;
	
	jr $ra
	
	


