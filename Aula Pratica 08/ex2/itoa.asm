# Mapa de registos:
# n:	$a0 -> $s0
# b: 	$a1 -> $s1
# s:	$a2 -> $s2
# p: 	$s3
# digit: $t0
# Sub-rotina intermedia

	.text
	.globl itoa
	
itoa:
	addiu $sp, $sp, -20
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s3, 16($sp)
	
				# cópia para regitos: "callee-saved"
	move $s0, $a0		# $s0 = n
	move $s1, $a1		# $s1 = b
	move $s2, $a2		# $s2 = s
	
	move $s3, $a2		# p = s;
	
do:
	rem $t0, $s0, $s1	# digit = n % b;
	div $s0, $s0, $s1	# n = n / b; 
	
	move $a0, $t0
	jal toascii		# toascii( digit )
	sb $v0, 0($s3)		# *p = toascii( digit );
	addiu $s3, $s3, 1	# *p++
	
while:
	bgt $s0, 0, do		# while( n > 0 ); 
	
	sb $0, 0($s3)		# *p = '\0'; 
	
	move $a0, $s2
	jal strrev		# strrev( s );
	
	move $v0, $s2		# return s;
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	addiu $sp, $sp, 20
	
	jr $ra			# termina o programa


