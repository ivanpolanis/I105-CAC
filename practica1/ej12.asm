          ORG   3000H
ROTARIZQ: CMP   BX, 0
          JZ    FIN
          ADD   AL, AL
          ADC   AL, 0
          DEC   BX
          JMP   ROTARIZQ
FIN:      RET
ROTARDER: CMP   CX, 0
          JZ    FINAL
          MOV   BX, 7
          CALL  ROTARIZQ
          DEC   CX
          JMP   ROTARDER
FINAL:    RET
          ORG   2000H
          MOV   CX, 2
          MOV   AL, 11000000B
          CALL  ROTARDER
          HLT
          END