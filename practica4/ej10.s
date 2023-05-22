        .data
cadena: .asciiz "adbdcdedfdgdhdid"
car:    .asciiz "d" 
cant:   .word 0 
        .code
        lb r1, car(r0)
loop:   lbu r2, cadena(r3)
        beqz r2, end
        dsub r2, r2, r1
        bnez r2, else
        daddi r4, r4, 1
else:   daddi r3, r3, 1
        beqz r0, loop
end:    sb    r4,cant(r0)
        halt