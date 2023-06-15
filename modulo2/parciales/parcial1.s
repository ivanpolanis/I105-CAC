.data
tabla1: .double 12.0,15.5,31.2,56.4,44.3,78.1
MIN: .double 20.0
MAX: .double 50.0
CANT: .word 6
RES: .word 0
tabla2: .double 0.0

.code
LD $t0, CANT($0)
L.D f1, MIN($0)
L.D f2, MAX($0)
DADD $t3, $0, $0
DADD $t4, $0, $0
DADD $t5, $0, $0
LOOP: L.D f3, tabla1($t4)
C.LT.D f3,f1
BC1T FUERA
C.LT.D f2, f3
BC1T FUERA
DADDI $t3, $t3, 1
S.D f3, tabla2($t5)
daddi $t5, $t5, 8
FUERA: DADDI $t4, $t4, 8
DADDI $t0, $t0, -1
BNEZ $t0, LOOP
SD $t3, RES($0)
HALT
