	.text
	.globl insert
	
insert:
	addiu $sp, $sp, -32
	sw $ra, 0($sp)
	sw $s0, 4($sp)	# dst
	sw $s1, 8($sp)	# src
	sw $s2, 12($sp)	# pos
	sw $s3, 16($sp)	# len_dst
	sw $s4, 20($sp)	# len_src
	sw $s5, 24($sp)	# i
	sw $s6, 28($sp) # p
	sw $s7, 32($sp)
	
	move $s0, $a0		# dst:	$a0 -> $s0
	move $s1, $a1		# src:	$a1 -> $s1
	move $s2, $a2		# pos:	$a2 -> $s2
	
	move $s6, $s0		# p = dst;
	
	move $a0, $s0
	jal strlen		# strlen(dst)
	move $s3, $v0		# len_dst = strlen(dst); 
	
	move $a0, $s1
	jal strlen		# strlen(src)
	move $4, $v0		# len_src = strlen(src); 
	
if:
	bgt $s2, $s3, endif	# if(pos <= len_dst) 
	
	move $s5, $s3		# i = len_dst
for1:
	blt $s5, $s2, endfor1	# for(i = len_dst; i >= pos; i--) 
	
	add $t0, $s5, $s4	# i + len_src
	sll $t0, $t0, 2		# $t0 * 4
	addu $t0, $s0, $t0	# &(dst[i + len_src])
	
	
	
	addi $s5, $s5, -1	# i--;
	j for1
	
endfor1:
	li $s5, 0		# i = 0;
for2:
	
	
	
	
