# Mapa de registos:
# $t0: i
# $t1: argc
# $t2: argv
	
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.data
	
str1:	.asciiz "Nr. de parametros: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "

	.text
	.globl main
	
main:
	move $t1, $a0		# $t1 = argc
	move $t2, $a1		# $t2 = argv
	
	la $a0, str1
	li $v0, print_string
	syscall			# print_string("Nr. de parametros: "); 
	
	move $a0, $t1
	li $v0, print_int10
	syscall			# print_int10(argc); 
	
	li $t0, 0		# int i = 0;
	
for:
	bge $t0, $t1, endfor	# for(i=0; i < argc; ...)
	
	la $a0, str2
	li $v0, print_string
	syscall			# print_string("\nP"); 
	
	move $a0, $t0
	li $v0, print_int10
	syscall			# print_int(i);
	
	la $a0, str3
	li $v0, print_string 
	syscall			# print_string(": "); 
	
	move $t3, $t0
	sll $t3, $t3, 2		# i * 4
	add $t3, $t2, $t3	# &argv[i]
	lw $a0, 0($t3)		# argv[i]
	li $v0, print_string
	syscall			# print_string(argv[i]);
	
	addi $t0, $t0, 1	# i++
	j for
	
endfor:
	li $v0, 0		# return 0;
	jr $ra 


