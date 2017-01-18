	.data
result: .word 0
num:	.byte '7'

	.text
	.globl main
main:

# COPIA EL TEU CODI AQUI

	la $s0, num
	lb $s2, 0($s0)
	la $s1, result
	
	slti $t0, $s2, 'a'
	xori $t0, $t0, 1
	li $t8, 'z'
	addiu $t9, $t8, 1
	slt $t1, $s2, $t9
	and $t4, $t0, $t1
	bne $t4, $zero, if
	
	slti $t0, $s2, 'A'
	xori $t0, $t0, 1
	li $t8, 'Z'
	addiu $t9, $t8, 1
	slt $t1, $s2, $t9
	and $t5, $t0, $t1
	beq $t5, $zero, else
	
if:	sb $s2, 0($s1)
	j endasciiresult

else: 	slti $t0, $s2, '0'
	xori $t0, $t0, 1
	li $t8, '9'
	addiu $t9, $t8, 1
	slt $t1, $s2, $t9
	and $t4, $t0, $t1
	beq $t4, $zero, elsedinselse
	
ifdinselse: li $t8, '0'
	subu $t9, $s2, $t8
	sb $t9, 0($s1)
	lb $a0, 0($s1)
	j endinsresult
	
elsedinselse: li $a0, -1
	j endinsresult
	
endasciiresult: li $v0, 11
	lb $t9, 0($s1)
	move $a0, $t9
	syscall
	jr $ra
	
endinsresult: li $v0, 1
	syscall
	jr $ra

