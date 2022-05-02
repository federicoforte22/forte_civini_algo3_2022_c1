## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

Lo que hicimos, fue crear una abstraccion para cronometrar el tiempo que tarde en hacer una operacion dada. Con esta abstraccion nos ahorramos codigo
repetido en ambos test, que estaban all mismo tiempo implementados de una manera no tan comoda. Y para poder volverlo mas 'comodo' usamos el mensaje
ya implementado 'millisecondsToRun'.


## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

Con las clases. podemos representar el concepto abtracto de un ente que esta en la realidad. Mientras que las instancias de esas clases son una representacion
mas concreta de ese concepto abstracto. Con estos 2 conceptos podemos representar los entes de la realidad en su totalidad. Por suspuesto, en Smalltalk ambos
son objetos.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

Nosotros inicialmente, no poseiamos la teoria del grupo que genereo el codigo inicial que se nos dio. Pero a partir de analizar los tests, clases, mensajes pudimos generar nustras propias abtracciones y crear nustra propia teoria que tenia el proposito de sacar codigo repetido. Obviamente tratamos de que la teoria inicial se mantega, pero eso segun Naur no es posible sin el asesoramiento continuo de los programadores originales.
Es por eso que la relacion que hay es, que al querer sacar codigo repetido, generamos nuestra propia teoria sobre el problema.