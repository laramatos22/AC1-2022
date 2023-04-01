# O argumento da função é passado em $a0
# O resultado é devolivdo em $v0
# Sub-rotina terminal: não devem ser usados registos $sx

# Mapa de registos:
# $a0 -> $t0: *s
# $t1: len

	.globl strlen

strlen:	
	li  $t1, 0		# int len = 0;
	
while:
	lb $t0, 0($a0)		# *s
	addiu $a0, $a0, 1	# *s++
	beq $t0, '\0', endwhile	# while (*s++ != '\0')
	addi $t1, $t1, 1	# len++
	j while
	
endwhile:
	move $v0, $t1		# return len;
	jr $ra			# o retorno é no $ra
	