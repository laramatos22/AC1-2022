	.data
	
	.text
	.globl main
	
main:
	ori $v0, $0, 5		# $v0 = 5
	syscall			# read_int()
	
	or $a0, $0, $v0
	ori $v0, $0, 1
	syscall			# print_int10()
	
	jr $ra			# termina o programa