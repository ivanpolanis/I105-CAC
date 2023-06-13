        ORG   1000H
VARA    DW    1010H
VARB    DW    2323H
        ORG   3000H
SWAP:   PUSH  BX
        MOV   BX,   SP
        ADD   BX,   4
        PUSH  AX
        PUSH  CX
        PUSH  DX
        MOV   AX,   [BX]
        ADD   BX,   2
        MOV   CX,   [BX]
        MOV   BX,   CX
        MOV   DX,   [BX]
        MOV   BX,   AX
        MOV   AX,   [BX]
        MOV   [BX], DX
        MOV   BX,   CX
        MOV   [BX], AX
        POP   DX
        POP   CX
        POP   AX
        POP   BX
        RET
        ORG   2000H
        MOV   BX, OFFSET VARA
        PUSH  BX
        MOV   BX, OFFSET VARB
        PUSH  BX
        CALL  SWAP
        HLT
        END