	.data
w:        .asciiz "8754830094826456674949263746929"
resultat: .byte 0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	la	$a0, w
	li	$a1, 31
	jal	moda
	la	$s0, resultat
	sb	$v0, 0($s0)
	move	$a0, $v0
	li	$v0, 11
	syscall
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra


moda:
# ESCRIU AQUI EL TEU CODI
	addi $sp,$sp,-48
	move $t7,$sp
	li $s4, 0
	li $t2, 10
bucle1:	
	bge $s4,$t2, fibucle1
	sw $zero, 0($t7)
	addi $t7,$t7,4
	addi $s4,$s4,1
	b bucle1
fibucle1:
	li $s2, '0'
	move $s4, $zero
	move $s1, $a1
	li $s3, '0'
	sw $ra, 0($t7)
	addi $t7,$t7,4
	sw $a0, 0($t7)
	
bucle2:
	bge $s4,$s1,fibucle2
	lw $a1, 44($sp)
	addu $a1,$a1,$s4
	lb $a1, 0($a1)
	subu $a1,$a1,$s3	
	subu $a2, $s2, $s3
	move $a0,$sp
	jal update
	addu $s2, $s3, $v0
	addi $s4,$s4,1
	b bucle2
fibucle2:
	lw $ra, 40($sp)
	addi $sp,$sp,48
	move $v0,$s2
	jr $ra
	 
	
	


update:
# ESCRIU AQUI EL TEU CODi
	addi $sp,$sp,-12
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	sb $a1, 8($sp)
	sb $a2, 9($sp)
	jal nofares
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	lb $a1, 8($sp)
	lb $a2, 9($sp)
	sll $t1, $a1, 2
	addu $t1,$t1,$a0
	lw $t2, 0($t1)
	addi $t2,$t2,1
	sw $t2,0($t1)
	sll $t3, $a2, 2
	addu $t3,$t3,$a0
	lw $t4,0($t3)
	addi $sp, $sp, 12
ifupdate:
	
	ble $t2,$t4, elseupdate
	move $v0,$a1
	jr $ra
	
elseupdate:	
	move $v0, $a2
	
	jr $ra