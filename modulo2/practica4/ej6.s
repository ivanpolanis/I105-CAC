        .data
A:      .byte 0x13
B:      .byte 0x12
C:      .byte 0x12
D:      .byte 0x00

        .code
        lb r1, A(r0)
        lb r2, B(r0)
        lb r3, C(r0)
        dadd r6, r0, r0
        daddi r4, r0, 2
        dsub r5, r1, r2
        bnez r5, sigo1
        dadd r6, r6, r4
        daddi r4, r4, -1
sigo1:  dsub r5, r2, r3
        bnez r5, sigo2
        dadd r6, r6, r4
        daddi r4, r4, -1
        beqz r4, fin
sigo2:  dsub r5, r1, r3
        bnez r5,  fin
        dadd r6, r6, r4
        daddi r4, r4, -1
fin:    sb r6, D(r0)
        halt