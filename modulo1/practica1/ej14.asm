          ORG   1000H
VOC       DB    "AaEeIiOoUu"
FI        DB    0
CADENA    DB    "HolaMundo"
F         DB    0
          ORG   3000H
ES_VOCAL: CMP   BYTE PTR [BX],  0  ;Subrutina que recibe el caracter a comprobar via AL y la cadena de vocales por referencia via BX
          JZ    FIN
          CMP   AL, [BX] ;Si los caracteres coinciden, significa que AL es vocal
          JZ    TRUE
          INC   BX
          JMP   ES_VOCAL
TRUE:     MOV   AL, 0FFH ;Devolvemos 0FFh si es verdadero
          JMP   FINAL
FIN:      MOV   AL, 00H ; Devolvemos 00h si es false
FINAL:    RET
VOCALES:  CMP   BYTE PTR [BX],  0 ;Subrutina que recibe la cadena por referencia via registro
          JZ    FINAL_V
          MOV   AL, [BX] ; Guardamos el caracter de la cadena en AL
          PUSH  BX ; Guardamos la direccion de memoria en la pila
          MOV   BX, OFFSET VOC
          CALL  ES_VOCAL
          CMP   AL, 0FFH ;Comparamos si la subrutina nos devolvio "TRUE"
          JNZ   FALSE
          INC   AH
FALSE:    POP   BX ;Recuperamos BX Y lo incrementamos en la siguiente linea
          INC   BX
          JMP   VOCALES
FINAL_V:  RET
          ORG   2000H
          MOV   BX, OFFSET CADENA
          CALL  VOCALES
          HLT
          END