	# Sessio 3

	.data 
# Declara aqui les variables mat1, mat4 i col
mat1:	.space 120
mat4:	.word 2, 3, 1, 2, 4, 3
col:	.word 2

	.text 
	.globl main
main:
# Escriu aqui el programa principal
	la $s0, mat1
	la $s2, mat4
	addiu $s1, $s0, 108
	move $a0, $s2
	addiu $a1, $s2, 8
	lw $a1, 0($a1)
	la $t0, col
	lw $a2, 0($t0)
	sw $ra, 0($sp)
	jal subr
	sw $v0, 0($s1)
	li $a1, 1
	li $a2, 1
	jal subr
	sw $v0, 0($s0)
	lw $ra, 0($sp)
	jr $ra

subr:
# Escriu aqui el codi de la subrutina
	sll $t4, $a2, 3
	sll $t5, $a2, 4
	addu $t0, $t4, $t5
	addiu $t0, $t0, 20
	addu $t0, $t0, $s0
	sll $t6, $a1, 2
	sll $t7, $a1, 3
	addu $t1, $t6, $t7
	sll $t2, $a2, 2
	addu $t3, $t1, $t2
	addu $t4, $t3, $s2
	lw $t5, 0($t4)
	sw $t5, 0($t0)
	move $v0, $a1
	jr $ra

