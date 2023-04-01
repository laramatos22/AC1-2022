# $t0: bin
# $t1: gray

	.eqv bin,5

	.data
	.text
	.globl main
	
main:
	ori $t0,$0,bin		# $t0 = bin
	
	srl $t2,$t0,1		# bin >> 1
	xor $t1,$t0,$t2		# gray = bin ^ (bin >> 1);
	
	jr $ra
	
