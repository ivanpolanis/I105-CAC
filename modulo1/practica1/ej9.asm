        ORG   1000H
CADENA  DB    "HOLA0"
FINAL   DB    0
        ORG   3000H
CONCAR: MOV   AL, [BX]
        CMP   AL, 0
        JZ    FIN
        INC   AH
        INC   BX
        JMP   CONCAR
FIN:    RET
        ORG   2000H
        MOV   BX, OFFSET CADENA
        CALL  CONCAR
        HLT
        END