.data
a: .word 1
b: .word 5
res: .word 0

.text
ld $t0, a($0)
ld $t1, b($0)
dadd $s0, $0, $0
beqz $t1, fin
beqz $t0, fin
daddi $s0, $t0, 0
loop: daddi $t1, $t1, -1
beqz $t1, fin
dadd $s0, $s0, $t0
j loop
fin: sd $s0, res($0)
halt