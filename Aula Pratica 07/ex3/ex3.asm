# Mapa de registos:
# $t1: exit_value

	.data
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.eqv STR_MAX_SIZE, 30
	.eqv STR_MAX_SIZE1, 31
	
str1:	.asciiz "I serodatupmoC ed arutetiuqrA"
str2: 	.space STR_MAX_SIZE1
str3:	.asciiz "String too long: "
str4:	.asciiz "\n"

	.text
	.globl main
	
main:

if:
	la $a0, str1
	jal strlen			# strlen(str1)
	
	move $t0, $v0
	blt $t0, STR_MAX_SIZE, else	# if(strlen(str1) <= STR_MAX_SIZE)
	
	la $a0, str1
	la $a1, str2
	jal strcpy			# strcpy(str2, str1); 
	
	la $a0, str2
	li $v0, print_string
	syscall				# print_string(str2);
	
	la $a0, str4
	li $v0, print_string
	syscall				# print_string("\n"); 
	
	la $a0, str2
	jal strrev			# strrev(str2)
	
	move $a0, $v0
	li $v0, print_string
	syscall				# print_string(strrev(str2));
	
	li $t1, 0			# exit_value = 0;
	
else:
	la $a0, str3
	li $v0, print_string
	syscall				# print_string("String too long: ");
	
	la $a0, str1
	jal strlen			# strlen(str1)
	
	move $a0, $v0
	li $v0, print_int10
	syscall				# print_int10(strlen(str1)); 
	
	li $t1, -1			# exit_value = -1;
	
end:
	move $v0, $t1			# return exit_value;
	
	jr $ra
	

