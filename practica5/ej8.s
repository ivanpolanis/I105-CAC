		.data
c1:		.asciiz "Holamundo"
c2:		.asciiz "Holamundo"
		.text
		daddi $a0, $0, c1
		daddi $a1, $0, c2
		jal cmp
		halt
cmp:	daddi $v0, $0, 0
loop:	lbu $t1, 0($a0)
		lbu $t2, 0($a1)
		bne $t1, $t2, final
		beqz $t1, fin
		daddi $a0, $a0, 1
		daddi $a1, $a1, 1
		daddi $v0, $v0, 1
		j loop
fin:	daddi $v0, $0, -1
final:	jr $ra
