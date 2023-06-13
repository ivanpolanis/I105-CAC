        .data
M:	.word 5
tabla:	.word 1,2,3,4,5,6,7,8,9
cant: 	.word 0
        .text
        daddi $t0, $0, cant
        daddi $a0, $0, tabla
        dsub $a1, $t0, $a0
        ld $a2, M($0)
        jal rutina
        halt
rutina: daddi $t0, $ra, 0
        daddi $t1, $0, 0
        daddi $v0, $0, 0
loop:   ld $s1, 0($a0)
        slt $t2, $a0, $s1
        dadd $v0, $v0, $t2
        daddi $a0, $a0, 8
        daddi $a1, $a1, -8
        bnez $a1, loop
fin:    jr $ra

