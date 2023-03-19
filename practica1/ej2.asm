ORG 1000H
NUM0 DB 80H
NUM1 DB 200
NUM2 DB -1
BYTE0 DB 01111111B
BYTE1 DB 10101010B
ORG 2000H
MOV AL, NUM0
ADD AL, AL;         1101100
INC NUM1;           1010100
MOV BH, NUM1
MOV BL, BH
DEC BL;             1010101
SUB BL, BH;         1010110
MOV CH, BYTE1;      
AND CH, BYTE0;      1000011
NOT BYTE0;          1000011
OR CH, BYTE0;       1000011
XOR CH, 11111111B;  
HLT
END

;2b) 
;NUM1=11001000b BSS
;NUM2=11111111b CA2

;2c)
;___________________________________
;|OP.|  A  |  B  |Destino|Resultado|
;|ADD|AL   |AL   |AL     |0        |
;|INC|NUM1 |1    |1001H  |C9H      | 
;|DEC|BL   | -1  |BL     |C8H      |
;|SUB|BL   |BH   |BL     |FFH      |
;|AND|CH   |BYTE1|CH     |2AH      |
;|NOT|BYTE0|     |1003H  |80H      |
;|OR |CH   |BYTE0|CH     |AAH      |
;|XOR|CH   |FFH  |CH     |55H      |
;___________________________________