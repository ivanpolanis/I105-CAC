        ORG   1000H
CADENA  DB    "HOLA0"
FINAL   DB    0
X       DB    "X"
        ORG   3000H
CONCAR: MOV   AL, [BX]
        CMP   AL, 0
        JZ    FIN
        CMP   AL, CL
        JNZ   ELSE
        INC   AH
        MOV   CH, X
        MOV   [BX], CH
ELSE:   INC   BX
        JMP   CONCAR
FIN:    RET
        ORG   2000H
        MOV   BX, OFFSET CADENA
        MOV   CL, 41h
        CALL  CONCAR
        HLT
        END