PIC     EQU     20H
EOI     EQU     20H
PIO     EQU     30H
N_F10   EQU     10

        ORG     40
IP_F10  DW      RUT_F10

        ORG     1000H
LETRA   DB      ?

        ORG     3000H
RUT_F10:PUSH    AX
        MOV     CL,     1
        MOV     AL,     0FFH
        OUT     PIC+1,  AL
        MOV     AL,     EOI
        OUT     PIC,    AL
        POP     AX
        IRET

        ORG     2000H
        MOV     AL,     0FDH
        OUT     PIO+2,  AL
        MOV     AL,     0
        OUT     PIO+3,  AL
        IN      AL,     PIO
        AND     AL,     0FDH
        OUT     PIO,    AL
        CLI
        MOV     AL,     0FEH
        OUT     PIC+1,  AL
        MOV     AL,     N_F10
        OUT     PIC+4,  AL
        STI
        MOV     BX,     OFFSET LETRA
        MOV     CL,     0
        MOV     DL,     0
LEER:   CMP     CL,     0
        JNZ     PRINT
        INT     6
        INC     BX
        INC     DL
        JMP     LEER
PRINT:  DEC     DL
        MOV     BX,     OFFSET LETRA
POLL:   IN      AL,     PIO
        AND     AL,     1
        JNZ     POLL
        MOV     AL,     [BX]
        OUT     PIO+1,  AL
        IN      AL,     PIO
        OR      AL,     02H
        OUT     PIO,    AL
        IN      AL,     PIO
        AND     AL,     0FDH
        OUT     PIO,    AL
        INC     BX
        DEC     DL
        JNZ     POLL
        HLT
        END
