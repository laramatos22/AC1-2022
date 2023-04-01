# Mapa de registos:
# aux: $t0
# char *c1: $a0
# char *c2: $a1

	.globl exchange
	
exchange:
	lb $t0, 0($a0)		# char aux = *c1; // $t0 = $a0
	lb $t1, 0($a1)
	
	sb $t1, 0($a0)		# *c1 = *c2; // $t1 = $a0
	sb $t0, 0($a1)		# *c2 = aux; // $t0 = $a1
	
	jr $ra