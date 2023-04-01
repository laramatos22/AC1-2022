# Codigo em C:
# print_string("Introduza 2 numeros "); 
# a = read_int(); 
# b = read_int(); 
# print_string("A soma dos dois numeros e': "); 
# print_int10(a + b);	
	
	.data
str1:	.asciiz "Introduza 2 numeros\n"
str2: 	.asciiz "A soma dos dois numeros é: "
	
	.eqv	print_string,4
	.eqv 	read_int,
	.eqv 	print_int10,
	
	.text
	.globl main
	
main:
	la $a0,str1
	ori $v0,$0,print_string
	syscall				# print_string(str1);
	
	ori $v0,$0,read_int
	syscall			
	or $t0,$v0,$0			# a = $t0 = read_int()
	
	ori $v0,$0,read_int
	syscall
	or $t1,$v0,$0			# b = $t1 = read_int()	
	
	la $a0,str2
	ori $v0,$0,print_String
	syscall				# print_string(str2);
	
	add $t2,$t0,$t1			# $t2 = a + b
	ori $v0,$0,print_int10
	syscall				# print_int10(a + b);
	
	jr $ra
	
	
