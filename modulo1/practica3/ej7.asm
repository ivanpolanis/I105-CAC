HAND    EQU 40H
        ORG 1000H
MSJ     DB  "INGENIERIA E "
        DB  "INFORMATICA"
FIN     DB  ?
        ORG 2000H
        IN  AL, HAND+1
        AND AL, 7FH
        OUT HAND+1, AL
        MOV BX, OFFSET MSJ
        MOV CL, OFFSET FIN-OFFSET MSJ
POLL:   IN  AL, HAND+1
        AND AL, 1
        JNZ POLL
        MOV AL, [BX]
        OUT HAND, AL
        INC BX
        DEC CL
        JNZ POLL
        INT 0
        END