      ORG 1000H
MSJ   DB  "INGRESE UN NUMERO:"
FIN   DB  ?
      ORG 1500H
NUM   DB  ?
      ORG 2000H
      MOV BX, OFFSET MSJ
      MOV AL, OFFSET FIN-OFFSET MSJ
      INT 7
      MOV BX, OFFSET NUM
      INT 6
      MOV AL, 1
      INT 7
      MOV CL, NUM
      INT 0
      END