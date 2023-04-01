# Mapa de registos:
# $t0: valor de entrada 1
# $t1: valor de entrada 2
# $t2: and($t0,$t1)
# $t3: or($t0,$t1)
# $t4: nor($t0,$t1)
# $t5: xor($t0,$t1)
	
	.eqv val_1, 0xE543
	.eqv val_2, 0xA3E4
	
	.data
	.text
	.globl main
	
main:
	ori $t0,$0,val_1
	ori $t1,$0,val_2
	
	and $t2,$t0,$t1
	or $t3,$t0,$t1
	nor $t4,$t0,$t1
	xor $t5,$t0,$t1
	nor $t6,$t0,$t0
	
	jr $ra
	