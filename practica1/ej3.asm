ORG 1000H
INI DB 0
FIN DB 15
ORG 2000H
MOV AL, INI
MOV AH, FIN
SUMA: INC AL
CMP AL, AH
JNZ SUMA
HLT
END

;3a)
;Se ejecuta 15 veces. Depende de las variables que se comparan antes de la instruccion de salto. En este caso los registros AL y AH.
;3b)
;1) JS. Se ejecuta 15 veces. Salta cuando el resultado del CMP es negativo.
;2) JZ. Se ejecuta 1 vez. No salta al lazo, ya que solamente se ejecuta si el resultado del CMP es cero.
;3) JMP. Es un bucle infinito.