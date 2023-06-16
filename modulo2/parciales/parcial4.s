.data
vector: .word 1234,2345,3456,4567,5678
nuevo: .word 0

.code
daddi $s0, $0, 5
daddi $t0, $0, 0
loop: ld $t1, vector($t0)
daddi $s0, $s0, -1
daddi $t1, $t1, 1
sd $t1, nuevo($t0)
daddi $t0, $t0, 8
bnez $s0, loop
halt