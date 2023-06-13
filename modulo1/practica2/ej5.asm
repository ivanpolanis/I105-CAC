        ORG   1000H
MSJ     DB    "INGRESE UN NUMERO:"
ERROR   DB    "CARACTER NO VALIDO"
FIN     DB    ?
        ORG   1500H
NUM     DB    ?
        ORG   3000H
ES_NUM: NOP
        CMP   BYTE PTR [BX], 30H
        JZ    TRUE
        JS    FALSE
        CMP   BYTE PTR [BX], 39H
        JS    TRUE
FALSE:  MOV   AH, 00H
        JMP   FINAL
TRUE:   MOV   AH, 0FFH        
FINAL:  RET

        ORG   2000H
        MOV   BX, OFFSET MSJ
        MOV   AL, OFFSET ERROR-OFFSET MSJ
        INT   7
        MOV   BX, OFFSET NUM
        INT   6
        CALL  ES_NUM
        CMP   AH,00H
        JNZ   ELSE
        MOV   BX, OFFSET ERROR
        MOV   AL, OFFSET FIN-OFFSET ERROR
        JMP   IMP
ELSE:   NOP
        MOV   AL, 1
IMP:    INT   7
        MOV   CL, NUM
        INT   0
        END