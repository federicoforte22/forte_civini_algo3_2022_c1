#Segunda Parte

##Aporte de los mensajes de DD

En un double dispatch, el primer llamado aporta que clase de objeto es al que le queremos aplicar el mensaje, el segundo llamado aporta la función a realizar por el segundo objeto según la clase recibida en el llamado anterior.
Es decir, el primer mensaje llama a una función general del objeto que llama a una familia de funciones mas especifica del segundo objeto.

##Lógica de instanciado

La mejor forma de instanciar un objeto es mediante un mensaje de clase dentro de la misma clase del objeto a crear, porque de ese modo no rompemos el encapsulamiento de cada posible subclase.
Si ese objeto se crea de diferentes formas y desde diferentes lugares justamente utilizando el mensaje de clase resolvemos esa situación, ya que lo podremos instanciar mediante un único mensaje.

##Nombres de las categorías de métodos

Nuestro criterio para categorizar métodos responde a las funciones de los mensajes que vamos creando. Por ejemplo, si tenemos varios mensajes que muestran algo por pantalla, le ponemos "printing". Lo m,ismo si tenemos mensajes que sirven para testear cosas. Esto ayuda a tener todo organizado de mejor manera y poder encontrar los mensajes de manera rápida.

##Subclass Responsibility

Utilizamos ese mensaje en la superclase porque si en un futuro yo quiero crear una nueva subclase de esa superclase, ya vamos a tener una idea de que mensajes tengo que implementar para la nueva clase.

##No rompas

Esta mal romper el encapsulamiento porque el mismo protege al objeto de la clase y a sus colaboradores asociados por quien no tenga la autorización o deba acceder a ellos, lo cual previene comportamientos inesperados o efectos secundarios.
