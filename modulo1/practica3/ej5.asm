PIO     EQU 30H
        ORG 1000H
NUM_CAR DB 5
CAR     DB ?
;Subrutina de inicialización impresora
        ORG 3000H
INI_IMP:MOV AL,     0FDH
        OUT PIO+2,  AL
        MOV AL,     0
        OUT PIO+3,  AL
        IN  AL,     PIO
        AND AL,     0FDH
        OUT PIO,    AL
        RET
;SUBRUTINA DE GENERACIÓN DE PULSO "STROBE"
        ORG 4000H
PULSO:  IN  AL,     PIO
        OR  AL,     02H
        OUT PIO,    AL
        IN  AL,     PIO
        AND AL,     0FDH
        OUT PIO,    AL
        RET

; PROGRAMA PRINCIPAL
        ORG 2000H
        PUSH AX
        CALL INI_IMP
        POP AX
        MOV BX, OFFSET CAR
        MOV CL, NUM_CAR
LAZO:   INT 6
POLL:   IN AL, PIO
        AND AL, 1
        JNZ POLL
        MOV AL, [BX]
        OUT PIO+1, AL
        PUSH AX
        CALL PULSO
        POP AX
        DEC CL
        JNZ LAZO
        INT 0
        END