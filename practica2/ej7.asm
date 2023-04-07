      ORG   1000H
NUM   DB    ?
      ORG   2000H
      MOV   AL, 1
      MOV   BX, OFFSET NUM
      INT   6
      MOV   CL, BYTE PTR [BX]
      INT   6
      MOV   CH, BYTE PTR [BX]
      ADD   CH, CL
      SUB   CH, 60H
      CMP   CH, 10
      JS    ELSE
      SUB   CH, 10
      MOV   BYTE PTR [BX],31H
      INT   7
ELSE: MOV   BYTE PTR [BX],CH
      ADD   BYTE PTR [BX],30H
      INT 7
      HLT
      END