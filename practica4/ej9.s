      .data
a:    .word 10
x:    .word 10
y:    .word 15
      .code
      ld  r1, a(r0)
      ld  r2, x(r0)
      ld  r3, y(r0)
loop: daddi r1, r1, -1
      beqz r1, end
      dadd r2, r2, r3
      beqz r0, loop
end:  sb r2, x(r0)
      halt