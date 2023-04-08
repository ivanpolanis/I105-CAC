      ORG 1000H
NUM0  DB  0CAH
NUM1  DB  0
NUM2  DW  ?
NUM3  DW  0ABCDH
NUM4  DW  ?
      ORG 2000H
      MOV BL, NUM0
      MOV BH, 0FFH
      MOV CH, BL
      MOV AX, BX
      MOV NUM1, AL
      MOV NUM2, 1234H
      MOV BX, OFFSET NUM3
      MOV DL, [BX]
      MOV AX, [BX]
      MOV BX, 1006H
      MOV WORD PTR [BX], 1006H
      HLT
      END

;1a)
;8: El operando en este caso el el dato almacenado en NUM0, que es el numero CAh. Utiliza direccionamiento directo de memoria y copia en el registro BL el valor CAh.
;9: El operando en este caso es el valor FFh. Utiliza direccionamiento inmediato y copia en el registro BH el valor FFh.
;10: El operando es el valor almacenado en el registro BL,(CAh en este caso). Utiliza direccionamiento directo de registro y copia en CH el valor almacenado en BL.
;11: El operando es el valor contenido en BX, (FFCAh en este caso). Utiliza direccionamiento directo de registro y copia en AX, el valor de BX.
;12: El operando es el valor contenido en AL, (CAh en este caso). Utiliza direccionamiento directo de registro, donde se copia el valor de AL en la direccion de memoria de NUM1.
;13: El operando es el valor 1234h. Utiliza direccionamiento inmediato y copia el valor 1234h en el lugar de la memoria de NUM2.
;14: El operando es el valor de la memoria donde se encuentra NUM3 (1004h). Utiliza direccionamiento inmediato y copia el valor de la memoxia en el registro BX.
;15: El operando es el valor almacenado en el lugar de la memoria que tiene almacenado BX. Utiliza direccionamiento indirecto con registro y copia el valor que hay en la memoria a DL.
;16: El operando es el valor almacenado en el lugar de la memoria que tiene almacenado BX. Utiliza direccionamiento indirecto con registro y copia el valor de la direccion 1004h a AL y 1005h a AH.
;17: El operando es el valor 1006h. Utiliza direccionamiento inmediato y se almacena en BX.
;18: El operando es el valor 1006h. Utiliza direccionamiento inmediato y almacena el valor 1006h en la direccion que esta apuntando BX y la siguiente, ya que almacena un WORD.

;1b)
;____________________________________________________
;|Instruccion|Direccionamiento|      Resultado      |
;|BL,NUM0    |Dir. de memoria |BL=CAH               |
;|BH,0FFH    |Inmediato       |BH=FFH               |
;|CH,BL      |Dir. de registro|CH=CAH               |
;|AX,BX      |Dir. de registro|AX=FFCAH             |
;|NUM1,AL    |Dir. de registro|1001h=CAH            |
;|NUM2,1234H |Inmediato       |1002h=34H/1003h=12H  |
;|BX, OS NUM3|Inmediato       |BX=1004H             |
;|DL, [BX]   |Indir. de reg.  |DL=CDH               |
;|AX, [BX]   |Indir. de reg.  |AX=ABCDH             |
;|BX, 1006H  |Inmediato       |BX=1006H             |
;|[BX], 1006H|Inmediato       |1006H=06H/1007H=10H  |
;____________________________________________________

;1c)
;El registro RI, aparece cuando hay que acceder a un lugar de memoria que esta siendo referenciado por una variable. Es decir cuando queremos acceder al dato que hay en NUM0, es necesario saber donde se encuetra el valor.
;En el registro ID, se carga el valor que se quiere guardar.