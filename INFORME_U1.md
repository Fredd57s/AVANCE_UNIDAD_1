**Proyecto: TechStore — Avance 1**

Se busca modelar un sistema operacional dentro del Negocio “TechStore” el cual trabajará con base de datos SQL y NoSQL de manera simultánea para proporcionar inteligencia de negocio.

**Justificación del Modelo Dual**

TechStore gestiona un modelo dual con requisitos distintos debido a la manera en que manejan los datos:

El tener que manejar una gran cantidad de productos con características muy variadas, se necesita de flexibilidad para poder almacenarlos de manera óptima y sin errores. Manejar una base de datos NoSQL como los es MongoDB brinda dicha flexibilidad necesaria, lo permite documentos anidados flexibles, escalabilidad horizontal y modificación de la estructura con la que se guardan los datos (lo que permiten campos fijos obligatorios como campos totalmente flexibles y tipos de datos configurables), además de facilitar agregar nuevas características sin afectar a las transacciones que usan base de datos SQL.

Por otro lado, al tener que realizar operaciones transaccionales, el negocio se ve con la necesidad de mantener un nivel de consistencia e integridad mucho más elevada, características que brindan la base de datos SQL con el uso de claves primarias y foráneas, restricciones, locking y rollback, entre otras, haciendo que, por ejemplo, un pago a través de una transacción sea mucho más seguro y optimizado.

**Análisis de Calidad de Datos — Problemas potenciales**

**Inconsistencia de correspondencia entre SKU en SQL (Detalle\_Ventas) y MongoDB (productos)**

Debtro de la tabla detalle\_ventas el campo sku\_producto puede referenciar SKUs que no existen en la colección de productos en MongoDB o que no estén correctamente ingresados. Esto puede tener un impacto negativo en el análisis de inteligencia del negocio al tener dentro de la tabla de ventas un producto y no poder ver sus detalles o que tal vez ni exista dicho producto dentro del sistema. Para poder evitar este problema se puede hacer varias implementaciones como las siguientes:

- Establecer un índice único den la colección “productos” para el campo “sku” (algo que ya se hizo en el preceso del proyecto al terminar la validación)
- Validad sku existentes si se insertan ventas
- Normalizar la forma de ingresar los SKUs 

**SKU Duplicados dentro de productos en la base de datos NoSQL o registros clientes duplicados en SQL** 

En MongoDB si no se agrega un índice único puede existir más de un documento con el mismo sku. En SQL, pueden existir clientes duplicados si no se controla su ingreso. Estos dos apartados pueden ser un gran problema al hacer el análisis de datos ya que pueden alterar el conteo de estadístico de, por ejemplo, total de clientes, o se pueden tener dos productos iguales con el mismo SKU pero con detalles distintos, haciendo que se pueda mostrar información errónea en los detalles del producto.

Para el SKU duplicado se puede agregar la creación de un índice único para dicho campo, y para evitar la duplicación de clientes se puede usar un campo de validación que no se deberá de poder volver a ingresar si ya se encuentra registrado, en este caso puede usarse el campo “email”, pero si es posible, se puede crear un campo de “cédula” la cual controle el ingreso de clientes duplicados.

**Campos mal formados, vacíos o fuera de rango**

Pueden existir fallos en validación que permiten insertar precios negativos, stock negativo, emails inválidos/inexistentes o fechas nulas e incorrectas. Esto afecta negativamente al proceso de análisis ya que, por ejemplo, si se busca ver las ventas realizadas en cierto periodo, y varias ventas se registraron con una fecha diferente al periodo seleccionado, no se estarían presentando datos reales.

Para solucionar esto es necesario agregar la validación de esquemas para poder controlar los tipos de datos ingresados. Otra acción que se podría tomar es crear un proceso o función que se encargue de revisar cada uno de los datos ingresados y buscar valores inválidos, nulos o malformados.
