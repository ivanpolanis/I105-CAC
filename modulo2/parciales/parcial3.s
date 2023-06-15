.data
a: .word 0
b: .word 0
c: .word 0
res: .word 0
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code

lwu $s0, CONTROL($0)
lwu $s1, DATA($0)
daddi $t1, $0, 8
sd $t1, 0($s0)
ld $a0, 0($s1)
sd $t1, 0($s0)
ld $a1, 0($s1)
sd $t1, 0($s0)
ld $a2, 0($s1)
jal calculo
sd $v0, 0($s1)
daddi $t1, $0, 2
sd $t1, 0($s0)
halt

calculo: daddi $v0, $0, 1
beqz $a2, fin
dsub $t0, $a0, $a1
daddi $v0, $t0, 0
daddi $a2, $a2, -1
beqz $a2, fin
loop: dmul $v0, $t0, $v0
daddi $a2, $a2, -1
bnez $a2, loop
fin: jr $ra
