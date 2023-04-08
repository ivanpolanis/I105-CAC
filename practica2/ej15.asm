TIMER   EQU   10H
PIC     EQU   20H
EOI     EQU   20H
N_F10   EQU   10
N_CLK   EQU   11
        ORG   40
IP_F10  DW    RUT_F10
        ORG   44
IP_CLK  DW    RUT_CLK
        ORG   1000H
N       DB    ?
        ORG   3000H
RUT_F10:PUSH  AX
        MOV   AL,   0FDH      ;Enmascaramos para permitir interrupciones por el timer ;11111101
        OUT   PIC+1,AL
        MOV   AL,   EOI       
        OUT   PIC,  AL        ;Avisamos que termino la interrupción
        POP   AX
        IRET

RUT_CLK:PUSH  AX
        INT   7               ;Imprimimos el dígito
        DEC   N
        CMP   N,30H           ;Nos fijamos si llego a 0
        JNZ   RESET
        MOV   AL,   0FEH      ;Enmascaramos para permitir interrupciones por el F10 ;11111110
        OUT   PIC+1,AL
        MOV   CH,0FFH         ;Devolvemos en CH que termino el contador
        JMP   RESET
RESET:  NOP
        MOV   AL,   0
        OUT   TIMER,AL
        MOV   AL,EOI
        OUT   PIC,AL
        POP	  AX
        IRET

        ORG   2000H
        CLI
        MOV   AL,   0FEH    ;Enmascaramos para permitir interrupciones por el F10
        OUT   PIC+1,AL
        MOV   AL,   N_F10   
        OUT   PIC+4,AL      ; PIC: registro INT0
        MOV   AL,   N_CLK
        OUT   PIC+5,AL      ; PIC: registro INT1
        MOV   AL,   1
        OUT   TIMER+1,AL    ; TIMER: registro COMP
        MOV   AL,   0
        OUT   TIMER,AL      ; TIMER: registro CONT
        MOV   BX,   OFFSET N
        MOV   AL,   1
        STI
        INT   6
LAZO:   CMP   CH, 0FFH
        JZ    FIN
        JMP   LAZO
FIN:    HLT
        END