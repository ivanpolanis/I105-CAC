.code
daddi $t1, $0, 10
loop: daddi $t1, $t1, -1
daddi $t2, $t2, 1
bnez $t1, loop
halt