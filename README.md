### Preguntas Ejercicio 1
## Sobre implementar funcionalidad
Cuando implementamos inicialmente nuestro hábitat, superamos los tres de manera efectiva a la primera vez. Lo que hicimos fue crear los objetos necesarios para el test (como el hábitat, las avispas, etc.), definir colaboradores internos del hábitat necesarios (como cantidadHuevosAvispas) y definir los métodos necesarios para pasar los tests (como intentarReproducirse en las avispas).
A medida que íbamos avanzando por test, fuimos modificando estos elementos para que cumplan tanto el nuevo test como el test anterior.
Creemos que implementar la funcionalidad de esta forma fue mas ordenado y consistente con los que se nos pedía, ya que no tiene sentido pasar una futura prueba y romper lo que veníamos haciendo.
## Sobre código repetido
Nos quedo código repetido en el método intentarReproducirse para las avispas Ornella y Oriana. Lo que podría solucionarlo es definir a una de ellas como hija de la otra.
En nuestra resolución el responsable de ver si hay recursos suficientes son las avispas, porque son ellas las que se reproducen y las que necesitan de esos recursos, y ademas estamos modelando su comportamiento. 
Creemos que no tiene sentido que sea el hábitat el responsable de ver los recursos para las avispas ya que no tendría sentido modelar avispas como objetos aparte.
Nosotros preferimos que sean las avispas las responsables.
## Sobre código repetido 2
Como mencionamos en el apartado anterior, tranquilamente una avispa podría ser el prototipo y otra ser su hijo, de esa manera nos ahorramos implementar un mensaje más.
En nuestra implementación resolvimos guardar los huevos en un solo diccionario, ya que nos permitía tener a mano las firmas genéticas. Indexabamos por cada firma genética como clave.
Creemos que nuestra manera es la mas simple y sencilla que podemos encontrar. 
Cada objeto representa un actor del ejercicio y creemos que no pueden ser menos ,y cada mensaje implementado no se superpone a otros mensajes. 
Tal vez se podría implementar, como colaborador interno del hábitat, tres contadores para llevar la cuenta de los huevos de cada avispa, pero esto no nos parecía mas sencillo que utilizar un diccionario.
