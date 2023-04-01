# funcao insert()

	.text
	.globl insert
	
insert:
	move $t0, $a0		# array: $a0 -> $t0
	move $t1, $a1		# value: $a1 -> $t1
	move $t2, $a2		# pos: $a2 -> $t2
	move $t3, $a3		# size: $a3 -> $t3
	
if:
	ble $t2, $t3, else	# if(pos > size)
	li $v0, 1		#	return 1;
	
	j endif
	
else:
	move $t4, $t3		# i = size;
	addi $t4, $t4, -1	# i = size - 1;
	
for:
	blt $t4, $t2, endfor	# for(...; i >= pos; ...)
	
	sll $t6, $t4, 2		# i*4
	addu $t0, $t0, $t6	# $t0 = &(array[i])
	lw $t5, 0($t0)		# $t5 = array[i]
	sw $t5, 4($t4)		# array[i+1] = array[i]; 
		
	addi $t4, $t4, -1	# i--
	j for
	
endfor:
	sll $t6, $t4, 2		# i*4
	addu $t0, $t0, $t6	# $t0 = &(array[i])
	sw $t1, -4($t0)		# array[pos] = value; 
	
	li $v0, 0		# return 0;
	
endif:
	jr $ra			# termina o programa
	