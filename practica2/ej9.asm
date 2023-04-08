        ORG   1000H
CLAVE   DB    "ASDF"
INGRESO DB    "XXXX"
AP      DB    "ACCESO PERMITIDO"
AD      DB    "ACCESO DENEGADO"
FIN     DB    ?

        ORG   3000H
MATCH:  NOP   ;Subrutina en la comparamos si las coinciden
LAZO_M: CMP   CH, 4 ;Comprobamos si el lazo se ejecuto 4 veces
        JZ    TRUE
        MOV   CL, [BX]  ;Movemos a CL un caracter de la contraseña ingresada
        SUB   BX, 4 ;Nos desplazamos a la clave guardada
        CMP   CL, [BX]  ;Si no es cero devolvemos false
        JNZ   FALSE
        ADD   BX, 5 ;Vamos a la siguiente posición de la cadena
        INC   CH  
        JMP   LAZO_M
TRUE:   MOV   AH, 0FFH
        JMP   FIN_M
FALSE:  MOV   AH, 00H
FIN_M:  RET

        ORG   2000H
        MOV   CL, 0
        MOV   BX, OFFSET INGRESO
LAZO:   CMP   CL, 4 ;Lazo que se encarga de cargar la contraseña
        JZ    FIN_L
        INT   6
        INC   BX  ;Incrementamos BX para no sobreescribir el caracter anterior
        INC   CL
        JMP   LAZO
FIN_L:  MOV   BX, OFFSET INGRESO
        MOV   AH, 0
        CALL  LAZO_M
        CMP   AH, 0FFH
        JZ    ELSE
        MOV   BX, OFFSET AD
        MOV   AL, OFFSET FIN-OFFSET AD
        JMP   IMP
ELSE:   MOV   BX, OFFSET AP
        MOV   AL, OFFSET AD-OFFSET AP
IMP:    INT   7
        HLT
        END
