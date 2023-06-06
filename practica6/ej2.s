            .data
num:        .asciiz "CERO"
            .asciiz "UNO"
            .asciiz "DOS"
            .asciiz "TRES"
            .asciiz "CUATRO"
            .asciiz "CINCO"
            .asciiz "SEIS"
            .asciiz "SIETE"
            .asciiz "OCHO"
            .asciiz "NUEVE"
CONTROL:    .word32 0x10000
DATA:       .word32 0x10008
            .text
            lwu     $a0, DATA($0)
            lwu     $a1, CONTROL($0)
            daddi   $t0, $0, 6
            sd      $t0, 0($a1)
            
            jal     ingreso

            daddi   $a2, $0, num
            dadd    $a3, $0, $v0

            jal     imprimir

            halt
ingreso:    daddi   $t0, $0, 8
loop:       sd      $t0, 0($a1)
            ld      $v0, 0($a0)
            slti    $t1, $v0, 9
            beqz    $t1, loop
            slti    $t1, $v0, -1
            bnez    $t1, loop  
            jr      $ra
imprimir:   daddi   $t2, $0, 8
            dmul    $t3, $t2, $a3
            dadd    $t4, $a2, $t3
            daddi   $t1, $0, 4    
            sd      $t4, 0($a0)   ;guardo el numero en DATA
            sd      $t1, 0($a1)   ;doy la orden de impresion
            jr      $ra
