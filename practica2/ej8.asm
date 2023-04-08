        ORG 1000H
MENOS   DB  "-"
NUM     DB  ?
        ORG 2000H
        MOV AL, 1
        MOV BX, OFFSET NUM
        INT 6
        MOV CL, [BX]
        INT 6
        MOV CH, [BX]
        CMP CL, CH
        JNS ELSE
        MOV CH, CL
        MOV CL, [BX]
        MOV BX, OFFSET MENOS
        INT 7
ELSE:   MOV BX, OFFSET NUM
        SUB CL, CH
        ADD CL, 30H
        MOV [BX], CL
        INT 7
        HLT
        END