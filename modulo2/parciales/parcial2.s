.data
tabla: .word 4,11,18,6,17,28,9,0,11,23,15,6,37,29,14
menor: .word 20
mayor: .word 10
cantidad: .word 15
total: .word 0
nuevo: .word 0

.code
ld $t1, cantidad($0)
ld $t2, menor($0)
ld $t3, mayor($0)
daddi $t0, $0, 0
daddi $t6, $0, 0
daddi $t7, $0, 0
loop: ld $t4, tabla($t0)
slt $t5, $t3, $t4
beqz $t5, fuera 
slt $t5, $t2, $t4
bnez $t5, fuera
sd $t4, nuevo($t7)
daddi $t7, $t7, 8
daddi $t6, $t6, 1
fuera: daddi $t0, $t0, 8
daddi $t1, $t1, -1
bnez $t1, loop
halt

