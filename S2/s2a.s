	.data

	.text
	.globl main
main:
	li $s1, 23 # Y
	li $s0, 8  # X

# COPIA EL TEU CODI AQUI
	
	li $s2, 0x01
	sllv $s0, $s2, $s0
	addiu $s0, $s0, -1
	xor $s3, $s1, $s0 # 232 a $s3
	
	move $a0, $s3
	li $v0, 1
	syscall
	jr $ra