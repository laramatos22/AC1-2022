# Mapa de registos:
# v:	$a0 -> $v0	
	
	.text
	.globl toascii
	
toascii:
	addi $v0, $a0, '0'		# v += '0'; 
	
if:
	ble $v0, '9', endif		# if( v > '9' )
	
	addi $v0, $v0, 7		# v += 7; // 'A' - '9' - 1
	
endif:
	jr $ra				# return v;
	