            .data
n:          . word 5
res:        .word 0

            .text
            daddi $sp, $0, 0x400
            ld $a0, n($0)
            jal factorial
            sd $v0, res($0)
            halt

            ;a0 recibo el numero
factorial:  daddi $sp, $sp, -16 
            sd $ra, 0($sp)        ;guardo ra
            sd $a0, 8($sp)        ;guardo el valor a0 para no perderlo en la recursión
            slti $t0, $a0, 2      ;veo si a0 = 1
            daddi $v0, $a0, 0
            bnez $t0, else        
            daddi $a0, $a0, -1    ;resto 1 a a0
            jal factorial         ;llamo recursivamente

            ld $a0, 8($sp)        ;recupero el valor de a0 correspondiente
            dmul $v0, $v0, $a0    ;lo multiplico con v0

else:       ld $ra, 0($sp)        ;recupero ra
            daddi $sp, $sp, 16    ;muevo el sp
            jr $ra