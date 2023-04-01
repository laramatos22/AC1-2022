	.data
	
	.text
	.globl main
	
main:
	ori $t2, $0, 0x1234	# $t2 = 0x1234
	ori $t3, $0, 0x5678	# $t3 = 0x5678
	
	add $t1, $t3, $t2	# $t1 = 0x68AC
	
	sub $t4, $t3, $t2	# $t4 = 0x4444
	sub $t5, $t2, $t1	# $t5 = 0xFFFFBBBC
	
	jr $ra 			# termina o programa