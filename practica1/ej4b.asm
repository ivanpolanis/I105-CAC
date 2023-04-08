      ORG 2000H
      MOV AL, 0FFH
      MOV BL, 0F0H
      MOV CL, 0
      CMP AL, BL
      JZ IF
      JNC ELSE
IF:   MOV CL, AL
      JMP FIN
ELSE: MOV CL, BL
FIN:  HLT
      END