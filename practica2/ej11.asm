PIC     EQU   20H
EOI     EQU   20H
N_F10   EQU   10
        ORG   40
IP_F10  DW    RUT_F10
        ORG   1000H
LETRA   DB    "A"
        ORG   3000H
RUT_F10:PUSH  AX
        MOV   CH, 0FFH; Modificamos el registro CH, para avisar que interrumpimos y seleccionamos la letra de esa iteración
        MOV   AL, EOI
        OUT   EOI, AL ; PIC: registro EOI
        POP   AX
        IRET
        ORG   2000H
        CLI
        MOV   AL, 0FEH  ; 11111110
        OUT   PIC+1, AL ; PIC: registro IMR
        MOV   AL, N_F10
        OUT   PIC+4, AL ; PIC: registro INT0
        MOV   CH, 0
        MOV   BX, OFFSET LETRA
        STI
LAZO:   CMP  CH,0FFH   ; Hasta que no seamos interrumpidos, CH sera 0
        JZ   IMP
        INC  BYTE PTR [BX] ; Avanzamos a la siguiente letra
        CMP  BYTE PTR [BX], 90 ; Comparamos que la letra no sea Z 
        JNZ  RLAZO
        SUB  BYTE PTR [BX], 25 ; Si es Z, volvemos a la A
RLAZO:  JMP  LAZO
IMP:    MOV   AL, 1
        INT  7
        HLT
        END