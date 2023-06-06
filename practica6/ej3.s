            .data
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008
            .text
            lwu $a0, DATA($0)
            lwu $a1, CONTROL($0)

            jal ingreso
            dadd $a2, $v0, $0  
            jal ingreso
            dadd $a3, $v0, $0
            jal resultado

            halt
ingreso:    daddi $t0, $0, 8
loop:       sd $t0, 0($a1)
            ld $v0, 0($a0)
            slti $t1, $v0, 9
            beqz $t1, loop
            slti $t1, $v0, -1
            bnez $t1, loop  
            jr $ra
resultado:  dadd $t0, $a2, $a3
            daddi $t2, $0, 1
            sd $t0, 0($a0)
            sd $t2, 0($a1)
            jr $ra