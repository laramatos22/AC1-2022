# $t0: gray
# $t1: num
# $t2: bin

	.eqv gray,7
	
	.data
	.text
	.globl main
	
main:
	or $t1,$0,$t0		# num = gray; 
	
	srl $t1,$t1,4		# num >> 4 
	xor $t1,$t1,$t1		# num = num ^ (num >> 4);
	
	srl $t1,$t1,2		# num >> 2
	xor $t1,$t1,$t1		# num = num ^ (num >> 2);
	
	srl $t1,$t1,1		# num >> 1
	xor $t1,$t1,$t1		# num = num ^ (num >> 1);
	
	or $t2,$0,$t1		# bin = num;
