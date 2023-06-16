.data
tabla: .word 4,11,18,6,17,28,9,0,11,23,15,6,37,29,14
menor: .word 20
mayor: .word 10
cant: .word 15
total: .word 0
nuevo: .word 0

.code
ld $s0, menor($0)
ld $s1, mayor($0)
ld $s2, cant($0)
daddi $t0, $0, 0
daddi $t1, $0, 0
daddi $t2, $0, 0
loop: ld $t3, tabla($t0)
slt $t4, $s0, $t3
bnez $t4, fuera
slt $t4, $s1, $t3
beqz $t4, fuera
sd $t3, nuevo($t1)
daddi $t2, $t2, 1
daddi $t1, $t1, 8
fuera: daddi $t0, $t0, 8
daddi $s2, $s2, -1
bnez $s2, loop
sd $t2, total($0)
halt
