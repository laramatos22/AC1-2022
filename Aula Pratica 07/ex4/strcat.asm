# char *strcat(char *dst, char *src) 
#{ 
# 	char *p = dst; 
#
# 	while(*p != '\0') 
# 		p++; 
# 	strcpy(p, src); 
# 	return dst; 
# } 

# Mapa de registos:
# $a0 -> $s0 : dst
# $a1 -> $s1 : src
# $s2 : p
	
	.globl strcat
	
strcat:
	addiu $sp, $sp, -16
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	move $s0, $a0
	move $s1, $a1
	
while:
	lb $s2, 0($s0)		# char *p = dst; 
	beq $s2, '\0', endw	# while(*p != '\0') 
	addi $s2, $s2, 1	#	p++;
	
	j while
	
endw:
	move $a0, $s2
	move $a1, $s1
	jal strcpy		# strcpy(p, src); 
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addiu $sp, $sp, 16
	
	jr $ra


	