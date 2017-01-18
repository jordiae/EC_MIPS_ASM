	# Sessio 3

	.data 
mat:	.word 0,0,2,0,0,0
	.word 0,0,4,0,0,0
	.word 0,0,6,0,0,0
	.word 0,0,8,0,0,0

resultat:.space 4
	.text 
	.globl main
main:
# Escriu aqui el teu codi del main
	la $a0, mat
	sw $ra, 0($sp)
	jal suma_col
	la $s0, resultat
	sw $v0, 0($s0)
	lw $ra, 0($sp)
	jr $ra

suma_col:
# Escriu aqui el teu codi de la subrutina
	move $t0, $zero
	move $t1, $a0
	addiu $t1, $t1, 8
	move $t2, $zero
	li $t3, 4
for:	bge $t2, $t3, fifor
	lw $t4, 0($t1)
	addu $t0, $t0, $t4
	addiu $t1, $t1, 24
	addiu $t2, $t2, 1
	b for
fifor:	move $v0, $t0
	jr $ra



