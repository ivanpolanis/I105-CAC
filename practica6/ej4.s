            .data
clave:      .asciiz "nase"
ingresada:  .asciiz "xxxx"
msj:        .asciiz "Bienvenido"
            .asciiz "ERROR"
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008
            .text
            lwu $a1, CONTROL($0)
            lwu $a0, DATA($0)
            daddi $a2, $0, clave
            daddi $a3, $0, msj
loopp:      jal ingreso
            jal comprobar
            bnez $v0, loopp
            halt
ingreso:    daddi $t0, $0, 9
            daddi $t1, $0, 0
            daddi $t4, $a2, 8
loop:       sd $t0, 0($a1)
            lb $t2, 0($a0)
            sb $t2, 0($t4)
            daddi $t4, $t4, 1
            daddi $t1, $t1, 1
            slti $t3, $t1, 4
            bnez $t3, loop
            jr $ra
comprobar:  ld $t1, 0($a2)
            daddi $t4, $a2, 8
            ld $t2, 0($t4)
            dsub $t0, $t1, $t2
            daddi $t3, $0, 4
            bnez $t0, false
            sd $a3, 0($a0)
            daddi $v0, $0, 0
            j fin
false:      daddi $t1, $a3, 16
            sd $t1, 0($a0)
            daddi $v0, $0, 1
fin:        sd $t3, 0($a1) 
            jr $ra

