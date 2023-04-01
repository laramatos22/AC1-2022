# Mapa de registos:
# i:	 $t0
# j:	 $t1
# token: $t2
# array: $a0
# dup_array: $a1
# size:	 $a2

	
	.text
	.globl find_duplicates
	
find_duplicates:
	li $t0, 0		# int i = 0;
	
for1:
	bge $t0, $a2, endfor1	# for(i=0; i < size; i++) 
	
	sll $t3, $t0, 2		# i*4
	addu $t3, $a1, $t3	# &(dup_array[i])
	
	
	
	addi $t0, $t0, 1	# i++
	j for1

endfor1:
	jr $ra

	