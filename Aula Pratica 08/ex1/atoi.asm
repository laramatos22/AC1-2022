# Mapa de registos:
# res: 	$v0
# s:	$a0
# *s:	$t0
# digit:$t1
# Sub-rotina terminal: não devem ser usados registos $sx

	.text
	.globl atoi

atoi:
	li $v0, 0		# res = 0;
	
while:
	lb $t0, 0($a0)		# lê $a0 -> criação do ponteiro
	blt $t0, '0', endw	# while( (*s >= '0') && (*s <= '9') )
	bgt $t0, '9', endw
	subu $t0, $t0, '0'	# digit = *s++ - '0'; 
	addiu $a0, $a0, 1
	mul $v0, $v0, 10
	addu $v0, $v0, $t0	# res = 10 * res + digit;
	j while
	
endw:
	jr $ra			# return res;