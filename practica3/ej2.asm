PIC     EQU 20H 
TIMER   EQU 10H
PIO     EQU 30H
N_CLK   EQU 10

        ORG 40
IP_CLK  DW  RUT_CLK

        ORG 1000
INICIO  DB  0

        ORG 3000H
RUT_CLK:INC INICIO
        CMP INICIO, 0FFH
        JNZ LUCES
        MOV INICIO, 0
LUCES:  MOV AL,     INICIO
        OUT PIO+1,  AL
        MOV AL,     0
        OUT TIMER,  AL
        MOV AL,     20H
        OUT PIC,    AL
        IRET

        ORG 2000H
        CLI
        MOV AL,     0FDH
        OUT PIC+1,  AL
        MOV AL,     N_CLK
        OUT PIC+5,  AL
        MOV AL,     1
        OUT TIMER+1,AL
        MOV AL,     0
        OUT PIO+3,  AL
        OUT PIO+1,  AL
        OUT TIMER,  AL
        STI
LAZO:   JMP LAZO
        HLT
        END