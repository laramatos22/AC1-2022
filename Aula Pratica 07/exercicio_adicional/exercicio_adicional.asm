# Mapa de regitos:
#$t0:	i
#$t1:	array_size
#$t2:	insert_value
#$t3:	insert_pos
#$t4:	array+i
#$t5: 	i*4	
	
	.data
	
array:	.space 50

str0:	.asciiz ", "
str1:	.asciiz "Tamanho do array: "
str2:	.asciiz "array["
str3:	.asciiz "] = "
str4:	.asciiz "Insira o valor a ser introduzido: "
str5:	.asciiz "Insira a posição: "
str6:	.asciiz "\nArray original: "
str7:	.asciiz "\nArray modificado: "

	.eqv print_int10, 1
	.eqv print_string, 4
	.eqv read_int, 5
	
	.text
	.globl main
	
main:
	addiu $sp, $sp, -4		# reserva espaço na stack
	sw $ra, 0($sp)
	
	la $a0, str1
	li $v0, print_string
	syscall				# print_string("Tamanho do array : ");
	
	li $v0, read_int
	syscall
	move $t1, $v0			# array_size = read_int();
	
	li $t0, 0			# int i = 0;
	 
for:
	bge $t0, $t1, endfor		# for(... ; i < array_size; ...) 	
	
	la $a0, str2
	li $v0, print_string
	syscall  			# print_string("array[");
	  
	move $a0, $t0
	li $v0, print_int10
	syscall				# print_int10(i); 
	
	la $a0, str3
	li $v0, print_string
	syscall				# print_string("] = ");
	  
	la $t4, array
	sll $t5, $t0, 2			# i*4
	add $t4, $t4, $t5		# array + i = &(array[i])
	li $v0, read_int
	syscall
	sw $v0, 0($t4)			# array[i] = read_int();
	
	addi $t0, $t0, 1		# i++;
	j for
	
endfor:
	la $a0, str4	
	li $v0, print_string
	syscall				# print_string("Insira o valor a ser introduzido: ");
	
	li $v0, read_int
	syscall
	move $t2, $v0			# insert_value = read_int();
	
	la $a0, str5
	li $v0, print_string
	syscall				# print_string("Insira a posição: ");
	
	li $v0, read_int
	syscall
	move $t3, $v0			# insert_pos = read_int(); 
	
	la $a0, str6
	li $v0, print_string
	syscall				# print_string("\nArray original: ");
	
	la $a0, array
	move $a1, $t1
	jal print_array			# print_array(array, array_size); 
	
	la $a0, array
	move $a1, $t2
	move $a2, $t3
	move $a3, $t1
	jal insert 			# insert(array, insert_value, insert_pos, array_size);
	
	la $a0, str7
	li $v0, print_string
	syscall				# "\nArray modificado: "
	
	la $a0, array
	li $a1, 51
	jal print_array			# print_array(array, array_size + 1);
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	
	jr $ra

	