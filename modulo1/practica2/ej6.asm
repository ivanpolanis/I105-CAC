      ORG   1000H
N0    DB    "CERO "
N1    DB    "UNO "
N2    DB    "DOS "
N3    DB    "TRES "
N4    DB    "CUATRO "
N5    DB    "CINCO "
N6    DB    "SEIS "
N7    DB    "SIETE "
N8    DB    "OCHO "
N9    DB    "NUEVE "
NUM   DB    ?
      ORG   3000H
RN0:  MOV   BX, OFFSET N0
      MOV   AL, OFFSET N1-OFFSET N0
      RET
RN1:  MOV   BX, OFFSET N1
      MOV   AL, OFFSET N2-OFFSET N1
      RET
RN2:  MOV   BX, OFFSET N2
      MOV   AL, OFFSET N3-OFFSET N2
      RET
RN3:  MOV   BX, OFFSET N3
      MOV   AL, OFFSET N4-OFFSET N3
      RET
RN4:  MOV   BX, OFFSET N4
      MOV   AL, OFFSET N5-OFFSET N4
      RET
RN5:  MOV   BX, OFFSET N5
      MOV   AL, OFFSET N6-OFFSET N5
      RET
RN6:  MOV   BX, OFFSET N6
      MOV   AL, OFFSET N7-OFFSET N6
      RET
RN7:  MOV   BX, OFFSET N7
      MOV   AL, OFFSET N8-OFFSET N6
      RET
RN8:  MOV   BX, OFFSET N8
      MOV   AL, OFFSET N9-OFFSET N8
      RET
RN9:  MOV   BX, OFFSET N9
      MOV   AL, OFFSET NUM-OFFSET N9
      RET
      ORG   2000H
      MOV   CL, 1
      MOV   BX, OFFSET NUM
LAZO: CMP   CL, 0
      JZ    ELSE
COMP: INT   6
      MOV   CH, CL
      SUB   BYTE PTR [BX], 30H
      MOV   CL, [BX]
      CMP   BYTE PTR [BX], 0
      JNZ   E1
      CALL  RN0
      JMP   IMP
E1:   CMP   BYTE PTR [BX], 1
      JNZ   E2
      CALL  RN1
      JMP   IMP
E2:   CMP   BYTE PTR [BX], 2
      JNZ   E3
      CALL  RN2
      JMP   IMP
E3:   CMP   BYTE PTR [BX], 3
      JNZ   E4
      CALL  RN3
      JMP   IMP
E4:   CMP   BYTE PTR [BX], 4
      JNZ   E5
      CALL  RN4
      JMP   IMP
E5:   CMP   BYTE PTR [BX], 5
      JNZ   E6
      CALL  RN5
      JMP   IMP
E6:   CMP   BYTE PTR [BX], 6
      JNZ   E7
      CALL  RN6
      JMP   IMP
E7:   CMP   BYTE PTR [BX], 7
      JNZ   E8
      CALL  RN7
      JMP   IMP
E8:   CMP   BYTE PTR [BX], 8
      JNZ   E9
      CALL  RN8
      JMP   IMP
E9:   CALL  RN9
IMP:  INT   7
      MOV   BX, OFFSET NUM
      JMP   LAZO
ELSE: CMP   CH, 0
      JZ    FIN
      JMP   COMP
FIN:  HLT
      END