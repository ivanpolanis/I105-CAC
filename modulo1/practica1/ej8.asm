          ORG 3000H
ROTARIZQ: CMP BX, 0
          JZ  FIN
          ADD AL, AL
          ADC AL, 0
          DEC BX
          JMP ROTARIZQ
FIN:      RET
          ORG 2000H
          MOV BX, 2
          MOV AL, 11000000B
          CALL ROTARIZQ
          HLT
          END