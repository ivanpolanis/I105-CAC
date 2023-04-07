      ORG 1000H
INI   DB  01H
      ORG 2000H
FOR:  CMP AH, 126
      JZ  FIN
      MOV BX, OFFSET INI
      MOV AL, 1
      INC AH
      INT 7
      ADD BYTE PTR [BX],1
      JMP FOR
FIN:  INT 0
      END