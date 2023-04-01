# Mapa de registos:
# dst: $a0
# src: $a1
# i: $t0

	.globl strcpy
	
strcpy:
	li $t0, 0		# int i = 0;
	
do:
	addu $t2, $a1, $t0	# src + i = &src[i]
	lb $t2, 0($t2)		# src[i]
	
	addu $t1, $a0, $t0	# dst + i = &dst[i]
	sb $t2, 0($t1)		# dst[i] = src[i]
	addi $t0, $t0, 1	# i++
	
while:
	bne $t2, '\0', do	# while(src[i++] != '\0');
	
	j end
	
end:
	move $v0, $a0		# return dst;
	
	jr $ra
	
	
