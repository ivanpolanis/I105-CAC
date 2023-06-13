      ORG 1000H
A     DB  41H
      ORG 2000H
      MOV AH, 0
      MOV AL, 1
FOR:  CMP AH, 26
      MOV BX, OFFSET A
      JZ FIN
      INC AH
      INT 7
      ADD BYTE PTR [BX],20H
      INT 7
      SUB BYTE PTR [BX],1FH
      JMP FOR
FIN:  INT 0
      END