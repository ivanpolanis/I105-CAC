ORG 1000H
VOC DB "AaEeIiOoUu"
F DB 0
ORG 3000H
ES_VOCAL: CMP BYTE PTR [BX],0  ;Subrutina que recibe el caracter a comprobar via AL y la cadena de vocales por referencia via BX
JZ FIN
CMP AL,[BX] ;Si los caracteres coinciden, significa que AL es vocal
JZ TRUE
INC BX
JMP ES_VOCAL
TRUE: MOV AL,0FFH ;Devolvemos 0FFh si es verdadero
JMP FINAL
FIN: MOV AL,00H ; Devolvemos 00h si es false
FINAL: RET
ORG 2000H
MOV BX, OFFSET VOC
MOV AL,42H
CALL ES_VOCAL
HLT
END