            .data
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008
            .text    
            lwu   $a0, DATA($0)
            lwu   $a1, CONTROL($0)
            jal   ing_f
            jal   ing
            daddi $a2, $v0, 0
            jal   a_la_pot
            halt
ing_f:      daddi $t0, $0, 8
            sd    $t0, 0($a1)
            l.d   f0, 0($a0) 
            jr    $ra
ing:        daddi $t0, $0, 8
            sd    $t0, 0($a1)
            ld    $v0, 0($a0)
            jr    $ra
a_la_pot:   mov.d f1,  f0
            slti  $t0, $a2, 1
            bnez  $t0, cero
            daddi $t1, $a2, 0
loop:       slti  $t2, $t1, 2
            bnez  $t2, fin
            mul.d f1,  f1,  f0
            daddi $t1, $t1, -1
            j     loop
cero:       daddi $t0, $0, 1
            sd    $t0, 0($a0)
            sd    $t0, 0($a1)
            j     final
fin:        daddi $t0, $0, 3
            s.d   f1,  0($a0)
            sd    $t0, 0($a1)
final:      jr    $ra