      .data
n1:   .word 32
n2:   .word 20
      .code
      ld r2, n2(r0)
      ld r1, n1(r0)
loop: daddi r2, r2, -1
      beqz r2, end
      dadd r3, r3, r1
      beqz r0, loop
end:  nop
      halt