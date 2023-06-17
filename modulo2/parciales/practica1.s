.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
n: .byte 255, 255, 0, 0, 5, 7

.code
lwu $s0, CONTROL($0)
lwu $s1, DATA($0)
daddi $t1, $0, 8
sd $t1, 0($s0)
ld $t2, 0($s1)
ld $t3, n($0)
sd $t3, 0($s1)
daddi $t1, $0, 5
sd $t1, 0($s0)
halt