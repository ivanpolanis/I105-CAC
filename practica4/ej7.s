        .data
table:  .word 3,6,9,12,15,23,24,45,65,20
x:      .word 15
qty:    .word 0
res:    .word 0,0,0,0,0,0,0,0,0,0

        .code
        daddi r1,r0, 80
        ld r4, x(r0)
loop:   beq r1,r2, end
        ld  r3, table(r2)
        slt r5, r4, r3 
        sb  r5, res(r2)
        dadd r6, r6, r5
        dsub r5, r5, r5
        daddi r2, r2, 8
        j loop
end:    sb r6,qty(r0)
        halt