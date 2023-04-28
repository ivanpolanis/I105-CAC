TIMER   EQU   10H
PIC     EQU   20H
PIO     EQU   30H 
N_CLK   EQU   10
        ORG   40
IP_CLK  DW    RUT_CLK

        ORG   1000H
N       DB    1

        ORG   3000H
RUT_CLK:PUSH  AX
        MOV   AL, N
        CMP   DL, 0
        JNZ   DER
        ADD   N,  AL
        JNC   RESET
        MOV   DL, 1
DER:    PUSH  CX
        MOV   CX, 1
        CALL  ROTARDER
        POP   CX
        MOV   N,  AL
        CMP   N,  1
        JNZ   RESET
        MOV   DL, 0
RESET:  MOV   AL, 0
        OUT   TIMER,AL
        MOV   AL, N
        OUT   PIO+1,AL
        MOV   AL, 20H
        OUT   PIC,AL
        POP   AX
        IRET

ROTARIZQ: CMP   BX, 0
          JZ    FIN
          ADD   AL, AL
          ADC   AL, 0
          DEC   BX
          JMP   ROTARIZQ
FIN:      RET
ROTARDER: CMP   CX, 0
          JZ    FINAL
          MOV   BX, 7
          CALL  ROTARIZQ
          DEC   CX
          JMP   ROTARDER
FINAL:    RET

        ORG   2000H
        CLI
        MOV   AL, 0FDH
        OUT   PIC+1,AL
        MOV   AL, N_CLK
        OUT   PIC+5,AL
        MOV   AL, 1
        OUT   TIMER+1,AL
        MOV   AL, 0
        OUT   PIO+1,AL
        OUT   PIO+3,AL
        OUT   TIMER,AL
        STI
LAZO:   JMP   LAZO
        HLT