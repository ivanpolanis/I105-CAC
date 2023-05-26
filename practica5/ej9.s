		.data
valor: 	.word 5
result: .word 0
		.text
        daddi   $sp, $0, 0x400      ; Inicializa el puntero al tope de la pila (1)
        ld      $a0, valor($0)
        jal     factos
        sd      $v0, result($0)
        halt

;recibe en a0 el numero
factos: daddi   $sp, $sp, -8        ;pusheo ra
        sd      $ra, 0($sp)
        daddi   $t0, $a0, -1
        beqz    $t0, ret1           ; si a0 es 1, devuelvo 1
        daddi   $sp, $sp, -8        ;push a0
        sd      $a0 ,0($sp)
        daddi   $a0, $a0, -1        ;decremento a0
        jal     factos
        ld      $a0, 0($sp)
        daddi   $sp, $sp, 8        ;pop a0
        dmul    $v0, $a0, $v0
        j fin

ret1:   daddi   $v0, r0, 1
    
fin:    ld      $ra, 0($sp)        ;pop $ra
        daddi   $sp, $sp, 8
        jr      $ra 