# Ejercicio 2

**a)** Para analizar el programa paso a paso, asumiremos que estamos utilizando el simulador de MIPS sin la opción de adelantamiento de operandos habilitada (Forwarding).

El programa realiza el intercambio de los contenidos de dos palabras en memoria (etiquetadas A y B). A continuación, analizaremos las instrucciones y los posibles atascos que se producen:

ld r1, A(r0) (load de la palabra en la dirección A): Esta instrucción carga el contenido de la palabra en la dirección A en el registro r1. No hay atascos en esta etapa.

ld r2, B(r0) (load de la palabra en la dirección B): Esta instrucción carga el contenido de la palabra en la dirección B en el registro r2. No hay atascos en esta etapa.

sd r2, A(r0) (store de r2 en la dirección A): Esta instrucción almacena el contenido del registro r2 en la dirección A. Sin embargo, hay un atasco estructural en esta etapa debido a que la instrucción ld r1, A(r0) todavía no ha completado su etapa de escritura en el registro r1, y la instrucción sd r2, A(r0) intenta acceder al mismo registro r1 para leer el valor que se va a almacenar en A. Esto causa un atasco en el cauce y se detiene la ejecución hasta que se complete la instrucción anterior.

sd r1, B(r0) (store de r1 en la dirección B): Esta instrucción almacena el contenido del registro r1 en la dirección B. No hay atascos en esta etapa.

En resumen, la instrucción sd r2, A(r0) es la que genera el atasco en el cauce debido a una dependencia de datos. El atasco que aparece es un atasco estructural, ya que la etapa de escritura del registro r1 está ocupada por la instrucción anterior ld r1, A(r0) cuando se intenta acceder a ese registro en sd r2, A(r0).

El promedio de Ciclos Por Instrucción (CPI) en la ejecución de este programa bajo esta configuración se calcula de la siguiente manera:

CPI = (número de ciclos totales) / (número de instrucciones ejecutadas)

En este caso, el programa tiene 4 instrucciones ejecutadas y 3 atascos estructurales. Por lo tanto, el número total de ciclos sería 4 + 3 = 7.

CPI = 7 ciclos / 4 instrucciones = 1.75 ciclos por instrucción

**b)** Ahora ejecutaremos el programa con la opción de adelantamiento de operandos (Forwarding) habilitada. A continuación, responderemos a las preguntas planteadas:

No se presenta ningún atasco en este caso porque el adelantamiento de operandos (Forwarding) permite que los datos necesarios para una instrucción estén disponibles antes de tiempo, evitando así los atascos causados por dependencias de datos. En particular, en este programa, se puede adelantar el valor de r1 desde la etapa de ejecución de la instrucción ld r1, A(r0) hacia la etapa de lectura de la instrucción sd r2, A(r0). De esta manera, el atasco estructural que ocurría anteriormente se resuelve y no hay interrupciones en la ejecución.

El color de los registros en la ventana Register durante la ejecución indica su estado actual. Los registros que están en verde significan que los datos son válidos y están disponibles para su uso en la etapa actual de ejecución. Esto se debe al adelantamiento de operandos (Forwarding), que permite que los datos se muevan directamente de la etapa de escritura a la etapa de lectura, evitando así la espera por los valores almacenados en registros.

El promedio de Ciclos Por Instrucción (CPI) en este caso se reduce significativamente debido al adelantamiento de operandos. Como no hay atascos y el programa tiene 4 instrucciones ejecutadas, el número total de ciclos sería 4. Por lo tanto, el CPI sería:

CPI = 4 ciclos / 4 instrucciones = 1 ciclo por instrucción

Comparando con el caso anterior sin adelantamiento de operandos, podemos ver que el uso del adelantamiento de operandos mejora el rendimiento del programa al reducir el CPI de 1.75 ciclos por instrucción a 1 ciclo por instrucción. Esto se debe a que el adelantamiento de operandos evita los atascos y permite que las instrucciones se ejecuten de manera más eficiente.
