ORG 1000H
VARA DW 1010H
VARB DW 2323H
ORG 3000H
SWAP: PUSH BX
MOV BX,SP
SUB BX,6
PUSH AX
PUSH CX
MOV CX,[BX]
ADD BX,2
MOV AX,[BX]
SUB BX,2
MOV [BX],AX
ADD BX,2
MOV [BX],CX
POP CX
POP AX
POP BX
ORG 2000H
MOV BX, OFFSET VARA
PUSH BX
MOV BX, OFFSET VARB
PUSH BX
CALL SWAP
HLT
END