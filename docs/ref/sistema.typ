= Requisitos

== Formularios

=== Registro de Clientes

Los clientes que quieran realizar reservas de servicios a través de la
aplicación deberán registrarse en la plataforma con los datos: nombre,
apellidos, número de teléfono, dirección de correo electrónico. De la
misma manera se podrá actualizar la información que los clientes tengan
guardada en el sistema.

#block[
  #set enum(numbering: "1.", start: 1)
  + -- Registro de clientes
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header([Nombre], []),
      table.hline(),
      [Apellido paterno], [],
      [Apellido materno], [],
      [Teléfono], [],
      [Sexo], [],
      [Correo electrónico], [],
    )],
  kind: table,
)

=== Registro de Peluquerías/Salones

Las peluquerías o salones de belleza que deseen administrar sus citas a
través de la plataforma deberán registrarse con los datos: nombre del
salón, dirección, números de teléfono de contacto, correo electrónico,
horarios de atención, servicios que ofrecen y sus precios, empleados
(peluqueros, estilistas, maquilladores, etc.)

#block[
  #set enum(numbering: "1.", start: 2)
  + -- Registro de peluquerías y salones
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header([#strong[Nombre de la peluquería/salón];], []),
      table.hline(),
      [#strong[Dirección];], [],
      [#strong[Teléfonos de contacto];], [],
      [#strong[Correo electrónico];], [],
      [#strong[Redes sociales];], [],
      [#strong[Horarios de atención];], [],
      [#strong[Servicios];], [],
    )],
  kind: table,
)

=== Reservas

Los clientes registrados podrán agendar sus citas en la peluquería o
salón de belleza a través de la plataforma. Para ello, el cliente deberá
buscar la peluquería o salón de preferencia y deberá llenar la siguiente
información: el servicio solicitado, el empleado o estilista de
preferencia, fecha y hora de la cita elegida a través de un calendario
dinámico, información de pago (el cliente podrá tener la elección de
decidir pagar en efectivo al momento de estar en el local, o bien pagar
una vez el local confirme la finalización del servicio), notas sobre el
servicio deseado (en caso de que el cliente tenga algunas preferencias
sobre el cuidado de su cabello o etc.), poder subir imágenes de
referencia sobre como esperaría el acabado del servicio para su persona.

#block[
  #set enum(numbering: "1.", start: 3)
  + -- Reservas
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header([#strong[Fecha y hora de reserva];], []),
      table.hline(),
      [#strong[Servicio solicitado];], [],
      [#strong[Peluquero/estilista de preferencia];], [],
      [#strong[Imágenes de referencia];], [],
      [#strong[Notas sobre el servicio];], [],
      [#strong[Método de pago preferido];], [],
    )],
  kind: table,
)

=== Actualización de reservas/citas

El cliente podrá eliminar o actualizar su cita en caso de cambie de
opinión antes de la cita, en caso de que el cliente quiera actualizarla,
será llevado al formulario, caso que requiera eliminarla, será llevado a
una ventana de confirmación que notificará a la peluquería.

#block[
  #set enum(numbering: "1.", start: 4)
  + -- Actualización de reservas/citas
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header([#strong[Fecha y hora de reserva];], []),
      table.hline(),
      [#strong[Servicio solicitado];], [],
      [#strong[Peluquero/estilista de preferencia];], [],
      [#strong[Método de pago de preferencia];], [],
      [#strong[Notas sobre el servicio];], [],
      [#strong[Imágenes de referencia];], [],
    )],
  kind: table,
)

=== Registro de empleado de peluquería/salón

Los empleados de la peluquería o salones de belleza que atenderán dentro
de los salones de belleza también deberán registrarse en la aplicación
al salón de belleza o peluquería a la que pertenecen para que de esta
forma los clientes puedan elegir con que profesional llevarán a cabo sus
servicios y además puedan ver su horario de disponibilidad. Deberán
llenar los datos: nombre, apellidos, teléfono, email, cargo, días
laborales y horarios.

#block[
  #set enum(numbering: "1.", start: 5)
  + -- Registro de empleado de peluquería/salón
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header([#strong[Nombre];], []),
      table.hline(),
      [#strong[Apellido paterno];], [],
      [#strong[Apellido materno];], [],
      [#strong[Teléfono];], [],
      [#strong[Correo electrónico];], [],
      [#strong[Servicios ofrecidos];], [],
      [#strong[Días disponibles];], [],
      [#strong[Horarios disponibles];], [],
    )],
  kind: table,
)

=== Gestión de Servicios y Precios

Los administradores de las peluquería o salones de belleza podrán
registrar los servicios que realizan para que puedan ser visibles a los
clientes. Se deberá ingresar la siguiente información: nombre del
servicio, descripción del servicio, precio del servicio, empleados que
realizan el servicio.

#block[
  #set enum(numbering: "1.", start: 6)
  + -- Gestión de servicios y precios
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header([#strong[Servicio];], []),
      table.hline(),
      [#strong[Descripción del servicio];], [],
      [#strong[Categoría];], [],
      [#strong[Precio o rango de precio];], [],
      [#strong[Duración estimada del servicio];], [],
    )],
  kind: table,
)

=== Calificación y Reseñas

Los clientes, terminado su servicio, serán recibidos con un formulario
que les pedirá una calificación y un comentario o reseña acerca del
servicio obtenido, el nombre del salón o servicio no será necesario que
se registre en el formulario, debido que se detectará automáticamente
luego de que el cliente haya obtenido y pagado por su servicio.

#block[
  #set enum(numbering: "1.", start: 7)
  + -- Calificación y reseñas
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header([#strong[Calificación];], []),
      table.hline(),
      [#strong[Comentario/Reseña];], [],
    )],
  kind: table,
)

== Reportes

=== Notificación de recordatorios

Se deberá notificar al cliente cuando una se acerque la fecha de una
cita con el fin de hacerle recuerdo. Dicha notificación le llegará a su
correo o a través de la plataforma. La notificación contendrá: Nombre de
la peluquería o salón, servicio reservado, empleado seleccionado y la
fecha de la cita.

#block[
  #set enum(numbering: "1.", start: 8)
  + -- Reporte: Notificación de recordatorios
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header([#strong[Nombre de la peluquería/salón];], []),
      table.hline(),
      [#strong[Servicio de preferencia];], [],
      [#strong[Empleado seleccionado];], [],
      [#strong[Fecha de la cita];], [],
      [#strong[Notas de la cita];], [],
      [#strong[Imágenes de referencia];], [],
    )],
  kind: table,
)

=== Agendas diarias

Se deberá elaborar un reporte o agenda diaria en el que los salones
podrán ver las citas que se han agendado para ese día, se podrá ver la
siguiente información: Nombre del cliente, servicio seleccionado,
horario seleccionado, empleado seleccionado y preferencia de pago.

#block[
  #set enum(numbering: "1.", start: 9)
  + -- Reporte: Agendas diarias
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header([#strong[Nombre del cliente];], []),
      table.hline(),
      [#strong[Servicio seleccionado];], [],
      [#strong[Horario seleccionado];], [],
      [#strong[Empleado de preferencia];], [],
      [#strong[Método de pago];], [],
    )],
  kind: table,
)

= Parámetros del Sistema

== Procesos, Entradas y Salidas

#figure(
  align(center)[#table(
      columns: (33.33%, 33.33%, 33.34%),
      align: (auto, auto, auto),
      table.header([#strong[Entrada];], [#strong[Proceso];], [#strong[Salida];]),
      table.hline(),
      [Horario], [Gestionar Horario], [Horario],
      [Horario, salón de belleza], [Gestionar salón de belleza], [Salón de
        belleza],
      [Salón de belleza], [Verificar salón de belleza], [Salón de belleza
        verificado],
      [Horario empleado], [Gestionar horario empleado], [Horario de
        empleado],
      [Especialidad], [Gestionar especialidad], [Especialidad],
      [Horario empleado, especialidad, empleado, salón verificado,
        persona], [Gestionar empleados], [Empleados],
      [Categoría], [Gestionar Categorías], [Categorías],
      [Servicio, categoría, salón verificado], [Gestionar
        Servicios], [Servicio],
      [Servicio, salón verificado], [Gestionar Promociones y
        ofertas], [Promociones],
      [Sucursal, salón verificado], [Gestionar Sucursales], [Sucursal],
      [Persona], [Gestionar Personas], [Personas],
      [Género], [Gestionar género], [Género],
      [Cliente, persona, género], [Gestionar cliente], [Cliente],
      [Cliente], [Verificar cliente], [Cliente verificado],
      [Cliente verificado, salón verificado], [Gestionar clientes
        fieles], [Cliente fiel],
      [Método de pago], [Gestionar métodos de pago], [Método de pago],
      [Estado de cita], [Gestionar estados de cita], [Estado de cita],
      [Cliente verificado, sucursal, salón verificado, cliente fiel,
        empleado, servicio, promoción, cita, método de pago, estado de
        cita], [Gestionar citas], [Cita],
      [Servicio, cita], [Gestionar reseñas], [reseña],
      [Cita], [Anular cita], [Cita],
      [Cita], [Enviar notificaciones de recordatorio], [Notificaciones de
        recordatorio],
      [Cita], [Elaborar agenda diaria], [Agenda diaria],
      [Cita], [Elaborar reporte mensual de citas reservadas], [Reporte
        mensual de citas reservadas],
    )],
  kind: table,
)

== Relaciones entre procesos

+ Gestionar horarios 🡪 Gestionar salones de belleza: horarios, salón de
  belleza.

+ Gestionar salón de belleza 🡪 Verificar Salón de belleza: salón de
  belleza

+ Gestionar horario de empleado 🡪 Gestionar empleado: horario empleado,
  salón verificado, especialidad, empleado, persona.

+ Gestionar especialidad 🡪 Gestionar empleado: especialidad, salón
  verificado, horario empleado, empleado, persona.

+ Gestionar personas 🡪 Gestionar empleado: persona, horario empleado,
  especialidad, salón verificado, empleado

+ Gestionar categorías 🡪 Gestionar servicios: categoría, salón
  verificado, servicio.

+ Gestionar servicio 🡪 Gestionar promociones y ofertas: servicio

+ Verificar salón de belleza 🡪 Gestionar empleados: salón verificado,
  especialidad, horario empleado, empleado.

+ Verificar salón de belleza 🡪 Gestionar servicios: salón verificado,
  especialidad, horario empleado, empleado.

+ Gestionar Géneros 🡪 Gestionar clientes: género, personas, clientes.

+ Gestionar personas 🡪 Gestionar clientes: personas, género, clientes.

+ Gestionar cliente 🡪 Verificar cliente: cliente.

+ Verificar cliente 🡪 Gestionar cliente fiel: cliente verificado, salón
  verificado.

+ Verificar salón de belleza 🡪 Gestionar cliente fiel: salón verificado,
  cliente verificado.

+ Verificar salón de belleza 🡪 Gestionar Sucursales: salón verificado,
  sucursal.

+ Verificar cliente 🡪 Gestionar citas: cliente verificado, sucursal,
  cliente fiel, salón verificado, empleado, servicio, promociones,
  método de pago, estado de cita, cita.

+ Gestionar sucursal 🡪 Gestionar citas: sucursal, salón verificado,
  cliente verificado, cliente fiel, empleado, servicio, promoción,
  método de pago, estado de cita, cita.

+ Gestionar cliente fiel 🡪 Gestionar citas: cliente fiel, cliente
  verificado, sucursal, salón verificado, empleado, servicio, promoción,
  método de pago, estado de cita, cita.

+ Verificar salón de belleza 🡪 Gestionar citas: salón verificado,
  sucursal, cliente verificado, cliente fiel, empleado, servicio,
  promoción, método de pago, estado de cita, cita.

+ Gestionar empleados 🡪 Gestionar citas: empleado, servicio, salón
  verificado, sucursal, cliente fiel, cliente verificado, promoción,
  método de pago, estado de cita, cita.

+ Gestionar Servicios 🡪 Gestionar citas: servicio, empleado, salón
  verificado, sucursal, cliente fiel, cliente verificado, promoción,
  método de pago, estado de cita, cita.

+ Gestiona promociones 🡪 Gestionar citas: promociones, servicios,
  empleados, salón verificado, sucursal, cliente fiel, cliente
  verificado, método de pago, estado de cita, cita.

+ Anular cita 🡪 Gestionar cita: cita, promoción, servicio, empleado,
  saló verificado, sucursal, cliente fiel, cliente verificado, método de
  pago, estado de cita.

+ Gestionar método de pago 🡪 Gestionar cita: método de pago, promoción,
  servicio, empleado, salón verificado, sucursal, cliente verificado,
  cliente fiel, estado de cita, cita.

+ Gestionar estado de cita 🡪 Gestionar cita: estado de cita, cita,
  método de pago, promoción, empleado, servicio, salón verificado,
  sucursal, cliente verificado, cliente fiel.

+ Gestionar servicios 🡪 Gestionar reseñas: servicio, cita.

+ Gestionar Cita 🡪 Gestionar reseñas: cita, servicio.

+ Gestionar citas 🡪 Anular cita: cita.

+ Gestiona citas 🡪 Enviar notificaciones: cita.

+ Gestionar citas 🡪 Elaborar agenda diaria: cita.

+ Gestionar citas 🡪 Elaborar reporte de citas reservadas: cita

== Ambiente

El ambiente del sistema de gestión de reservas para salones de belleza y
peluquerías opera en un ambiente complejo y dinámico, interactuando con
varios componentes externos e internos.

=== Componentes externos

Entre los componentes externos tenemos:

- Clientes: El público general que busca servicios de belleza.
  Interactúan con el sistema a través de la interfaz web o móvil para
  buscar salones, reservar citas, ver historiales y dar
  retroalimentación.

- Salones de Belleza: Negocios independientes que ofrecen servicios de
  belleza. Utilizan el sistema para gestionar su presencia en línea,
  horarios, servicios y reservas.

- Estilistas/Empleados: Profesionales que trabajan en los salones.
  Acceden al sistema para ver sus agendas, gestionar sus horarios y
  recibir notificaciones.

- Pasarelas de Pago: Servicios de terceros que procesan transacciones
  cuando los clientes pagan a través de la app.

- Servicios de Geolocalización: APIs que ayudan a los clientes a
  encontrar salones cercanos.

- Proveedores de Notificaciones: Servicios que envían SMS o
  notificaciones push para recordatorios.

=== Componentes internos

- Base de Datos: Almacena toda la información crítica (usuarios,
  salones, servicios, reservas).

- Servidor Web: Aloja la aplicación y maneja las solicitudes de los
  usuarios.

- Sistema de Autenticación: Gestiona el registro, inicio de sesión y
  permisos.

- Motor de Reservas: Algoritmo que maneja la disponibilidad, conflictos
  y confirmaciones.

- Sistema de Calificaciones: Procesa y muestra las reseñas y
  calificaciones de los usuarios.

- Módulo de Análisis: Genera informes y métricas para los salones.

- Interfaz de Usuario: Componentes front-end que los usuarios
  interactúan.

=== Características del ambiente

- Alta Variabilidad: Los servicios, precios y disponibilidades cambian
  frecuentemente.

- Tiempo Real: La información de disponibilidad debe actualizarse
  instantáneamente.

- Picos de Demanda: Mayor actividad en fines de semana o antes de
  eventos.

- Multilingüe: Puede necesitar soportar varios idiomas según la región.

- Multiplataforma: Debe funcionar en web y móvil.

- Alta Seguridad: Maneja datos personales y financieros.

== Retroalimentación

Por parte de la retroalimentación del sistema, este está diseñado para
ser altamente adaptivo y receptivo, usando diversos mecanismos de
retroalimentación que nos permitirán:

- Mejorar continuamente la experiencia del usuario

- Ayudar a los salones a optimizar sus servicios

- Adaptarnos a las tendencias del mercado

- Mantener alta calidad y rendimiento contra el mercado

=== Retroalimentación directa del cliente

- Calificaciones de Servicios: Los clientes puntúan de 1 a 5 estrellas.

- Reseñas Escritas: Comentarios detallados sobre su experiencia.

- Encuestas Post-Servicio: Cuestionarios cortos enviados después de cada
  cita.

=== Retroalimentación indirecta del cliente

- Análisis de Reservas: Identifica servicios populares o con baja
  demanda.

- Patrones de Uso: Detecta preferencias de horarios o días.

- Tasa de Cancelaciones: Alerta sobre posibles problemas con ciertos
  salones o servicios.

- Tasa de Retorno: Muestra la lealtad del cliente a salones específicos.

=== Retroalimentación del salón

- Reportes de Rendimiento: Resumen de reservas, ingresos y
  calificaciones.

- Alertas de Capacidad: Notifica cuando un servicio está sobre o
  subutilizado.

- Sugerencias de Precios: Basadas en la demanda y precios de la
  competencia.

- Feedback de Empleados: Los estilistas pueden reportar problemas o
  sugerir mejoras.

=== Retroalimentación del sistema

- Métricas de Rendimiento: Tiempos de carga, tasas de error.

- Monitoreo de Recursos: Uso de CPU, memoria, base de datos.

- Logs de Errores: Identifica y reporta fallos para su corrección.

- A/B Testing: Prueba diferentes diseños de UI para ver cuál funciona
  mejor.

=== Retroalimentación de la comunidad

- Foros y Grupos: Espacios donde usuarios discuten el sistema.

- Redes Sociales: Monitorea menciones y sentimientos.

- Canal de Sugerencias: Usuarios proponen nuevas funciones.

=== Bucles de retroalimentación

- Cliente → Sistema → Salón: Las reseñas afectan el ranking de los
  salones.

- Salón → Sistema → Cliente: Cambios en servicios actualizan las
  opciones del cliente.

- Sistema → Desarrolladores: Errores y rendimiento guían
  actualizaciones.

- Comunidad → Sistema: Sugerencias influyen en el roadmap.

== Descripción y Tipo de Sistema

Por parte del tipo de sistema identificado, se clasifica primariamente
como un sistema de información transacciona (TPS), peor también
incorpora elementos de algunos otros sistemas.

=== Sistema de información transaccional (TPS)

El TPS recopila, almacena, modifica y recupera las transacciones diarias
de una organización

En nuestro sistema:

- Se procesarán transacciones de reservas (CRUD)

- Se registrarán servicios realizados

- Se manejarán transacciones de pago

- Se actualizará en tiempo real la disponibilidad de los salones

La función principal del sistema es gestionar el flujo constante de
reservas y servicios, que son las transacciones fundamentales en el
negocio de la belleza.

=== Sistema de información estratégica (SIS)

Este se comporta como el tipo secundario, que ayuda a la alta gerencia a
tomar decisiones que afectan la dirección futura de la organización

- Se proporciona un análisis de tendencias de servicios

- Se ofrece insights sobre la satisfacción del cliente

- Se ayuda a los salones a decidir sobre nuevos servicios o precios

Si bien no es su función principal, el sistema proporciona datos
estratégicos que los dueños de salones puedan usar para el crecimiento a
largo plazo

=== Sistema de procesamiento de eventos complejos (CEP)

Los CEP identifican eventos significativos resultantes de las
combinaciones de muchos eventos más simples.

- Se detectan patrones en las reservas

- Se identifican correlaciones

- Se alerta sobre anomalías

Si bien no es CEP puro, se tiene componentes que analizan patrones
complejos en tiempo real para la optimización de la experiencia.

=== Sistema de recomendación

Para la sugerencia de ítems a usuarios basándose en sus preferencias y
comportamientos

- Se recomienda servicios basados en el historial

- Se sugiere salones según preferencias y ubicaciones

- Se proporciona paquetes basados en combinaciones populares

Esta función mejora la experiencia del usuario y aumenta las ventas
cruzadas

=== Sistema en tiempo real como característica

Ayuda a la respuesta de entradas inmediatas con restricciones de tiempo

- Se actualiza la disponibilidad instantáneamente

- Se envía confirmaciones y recordatorios en momentos precisos

- Se ajusta la agenda en tiempo real con cambios

En el mundo de las citas, la precisión temporal es crítica para evitar
dobles reservas o clientes perdidos

= Modelado UML y Diagramas

== Casos de Uso

=== Actores

- Administrador de Peluquería.

- Secretaria de Peluquería.

- Peluquero o estilista (empleado).

- Cliente.

- Administrador de la aplicación o plataforma.

=== Casos de Uso a Detalle

+ #strong[Gestionar Peluquería/Salón]

#quote(block: true)[
  #strong[Actores:] Administrador de peluquería/salón de belleza

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar una nueva peluquería en el sistema

  #strong[Precondición:] N/A

  #strong[Descripción:] El administrador de la peluquería deberá ingresar
  la información básica de su peluquería en el sistema como: nombre de la
  peluquería, dirección, número de teléfono, correo electrónico, redes
  sociales, horarios de atención y servicios para que quede registrada en
  la plataforma.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (51.24%, 48.76%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del Actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ Se ingresa el nombre de la peluquería/salón, número de teléfono y
          correo electrónico

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica que la peluquería no exista en el sistema, con el
            correo.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + Se ingresa la red social
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se buscar la red social
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 5)
          + Se ingresa el horario de atención.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 6)
          + Se busca el horario de atención.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 7)
          + Se ingresa el servicio.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 8)
          + Se busca el servicio.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 9)
          + Se guarda la información.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 10)
          + Se guarda la información de la nueva peluquería.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso Alternativo:]
]

- #strong[En el paso 2:] Si el correo electrónico ya está registrado en
  el sistema, se puede eliminar, modificar o salir del sistema.

- #strong[En el paso 4:] Si no existe la red social, se puede modificar,
  eliminar, consultar o salir del sistema.

- #strong[En el paso 6:] Si no existe el horario de atención, se puede
  consultar, modificar, eliminar o salir del sistema.

- #strong[En el paso 8:] Si no existe el servicio, se puede consultar,
  modificar, eliminar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] La peluquería/salón de belleza queda registrada
  en el sistema y podrá administrar sus citas. Además, se enviará el
  código de acceso al correo electrónico del administrador del salón
  recientemente registrado.


  #image("media/image25.png")


  #strong[Referencia:]
  párrafo 2.


  #image("media/image26.png")


  #image("media/image27.png")




  #image("media/image28.png")


  #image("media/image29.png")


]

#block[
  #set enum(numbering: "1.", start: 2)
  + #strong[Gestionar métodos de pago]
]

#quote(block: true)[
  #strong[Actor:] Administrador de Plataforma

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar los métodos de pago que podrán ser
  utilizados dentro de la aplicación para pagar la franquicia y otros
  pagos.

  #strong[Resumen:] El administrador de la plataforma ingresa los métodos
  de pago que podrán ser utilizados en la aplicación

  #strong[Precondición:] N/A

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ Se ingresa el método de pago.

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica que no exista el método de pago.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + Guarda el tipo de pago
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Guarda el tipo de pago
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si ya existe el método de pago se puede
  consultar, modificar, eliminar o salir del sistema.

#quote(block: true)[

  #image("media/image30.png")


  #strong[Postcondición:]
  Los métodos de pago quedan registrados en la plataforma para que las
  peluquerías puedan pagar su franquicia y otros pagos variables.


  #image("media/image31.png")


  #image("media/image32.png")




  #image("media/image33.png")




  #image("media/image34.png")


]

#block[
  #set enum(numbering: "1.", start: 3)
  + #strong[Realizar pago de franquicia]
]

#quote(block: true)[
  #strong[Actor:] Administrador de Peluquería

  #strong[Tipo:] Primario

  #strong[Propósito:] Realizar el pago de la franquicia de la plataforma
  para poder tener acceso a la misma.

  #strong[Resumen:] El administrador realiza el pago de la franquicia de
  la plataforma llenando la siguiente información: método de pago (Pago
  por qr o tarjeta de débito o crédito).

  #strong[Precondición:] La peluquería debe estar registrada en el
  sistema.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [#strong[Paso 1.] Se ingresa el método de pago a través del cual se
        va a pagar.], [#strong[Paso 2.] Se verifica que el método de pago
        seleccionado.],
      [#strong[Paso 3.] Se ingresan los datos del pago ya sea de la
        tarjeta o el comprobante por qr.], [],
      [#strong[Paso 4.] Se guarda en el sistema.], [#strong[Paso 5.] Se
        guarda en el sistema.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no existe el método de pago seleccionado se
  puede consultar, modificar, eliminar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] La peluquería o salón registrada tendrá acceso
  al sistema y a las herramientas provistas por la plataforma para
  administrar su salón. Se enviará un código al correo registrado con el
  cual el administrador podrá

  #image("media/image35.png")

  acceder
  a la plataforma de su peluquería.
]


#image("media/image36.png")



#quote(block: true)[

  #image("media/image37.png")


  #image("media/image38.png")


]


#image("media/image39.png")



#block[
  #set enum(numbering: "1.", start: 4)
  + #strong[Gestionar Horarios de atención]
]

#quote(block: true)[
  #strong[Actor:] Administrador de Peluquería

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar los horarios en los cuales una peluquería
  está ofreciendo sus servicios.

  #strong[Resumen:] El administrador establece los horarios de atención de
  la peluquería para cada día de la semana.

  #strong[Precondición:] La peluquería debe estar registrada en el
  sistema.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [#block[
          #set enum(numbering: "1.", start: 5)
          + El administrador ingresa el código de su peluquería
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 6)
          + Se verifica que la peluquería exista.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 7)
          + El administrador ingresa los horarios de atención según sea
            necesario.
        ]

      ], [],
      [#block[
          #set enum(numbering: "1.", start: 8)
          + Guarda el horario de atención
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 9)
          + Se guarda el horario de atención.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no existe la peluquería, se puede editar,
  modificar, eliminar o salir del sistema.

#quote(block: true)[

  #image("media/image40.png")


  #strong[Postcondición:]
  Los nuevos horarios de atención quedan guardados en el sistema.


  #image("media/image41.png")




  #image("media/image42.png")




  #image("media/image43.png")




  #image("media/image44.png")


]

#block[
  #set enum(numbering: "1.", start: 5)
  + #strong[Gestionar Redes Sociales]
]

#quote(block: true)[
  #strong[Actores:] Administrador de peluquería (iniciador)

  #strong[Tipo:] Secundario

  #strong[Propósito:] Registrar las redes sociales con las que cuenta un
  salón de belleza.

  #strong[Precondición:] La peluquería o salón debe estar registrada en la
  plataforma.

  #strong[Descripción:] El administrador de la peluquería deberá ingresar
  la información de sus redes sociales a registrar en el sistema como:
  ingresando el link o URL de la red social.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (49.95%, 50.05%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [1. El actor ingresa el código del salón de belleza], [2. Verifica
        que el salón de belleza exista en el sistema.],
      [3. Ingresa el enlace o URL de su red social.], [4. Se verifica que
        la red social no este registrada en el sistema.],
      [5. Se guarda], [6. Se guarda en el sistema],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no se encuentra el salón, es decir el mail
  registrado, se puede modificar, eliminar o salir del sistema.

- #strong[En el paso 4:] Si la red social ya se encuentra registrada en
  el sistema, se puede eliminar, modificar o salir del sistema.

#strong[Postcondición:] La red social del salón queda registrada en el
sistema.

#quote(block: true)[

  #image("media/image45.png")


  #image("media/image46.png")




  #image("media/image47.png")


]


#image("media/image48.png")




#image("media/image49.png")



#block[
  #set enum(numbering: "1.", start: 6)
  + #strong[Gestionar Sucursales]
]

#quote(block: true)[
  #strong[Actores:] Administrador de peluquería (iniciador)

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar las sucursales con las que cuenta un salón
  de belleza.

  #strong[Precondición:] La peluquería o salón debe estar registrada en la
  plataforma.

  #strong[Descripción:] El administrador de la peluquería deberá ingresar
  la información de la sucursal a registrar en el sistema como: dirección
  y número de teléfono,

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50.33%, 49.67%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [1. El actor ingresa el código del salón de belleza], [2. Verifica
        que el salón de belleza exista en el sistema.],
      [3. Ingresa la información de la sucursal en el sistema como su
          dirección y número de teléfono.], [4. Se verifica que la sucursal no
        este registrada en el sistema.],
      [5. Se guarda], [6. Se guarda en el sistema],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no se encuentra el salón, es decir el mail
  registrado, se puede modificar, eliminar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] La sucursal del salón de belleza queda
  registrada en el sistema.
]


#image("media/image50.png")




#image("media/image51.png")


#image("media/image52.png")




#image("media/image53.png")


#image("media/image54.png")



#block[
  #set enum(numbering: "1.", start: 7)
  + #strong[Actualizar Peluquería/Salón]
]

#quote(block: true)[
  #strong[Actores:] Administrador de peluquería (iniciador)

  #strong[Tipo:] Primario

  #strong[Propósito:] Actualizar la información de la peluquería.

  #strong[Precondición:] La peluquería salón debe estar registrada en la
  plataforma y tener acceso a ella.

  #strong[Descripción:] El administrador de la peluquería deberá ingresar
  la nueva información de su peluquería en el sistema como: nombre de la
  peluquería, dirección, número de teléfono, correo electrónico, redes
  sociales, horarios de atención y servicios.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del Actor];],
        [#strong[Acciones del
            Sistema];],
      ),
      table.hline(),
      [+ Se ingresa el nombre de la peluquería/salón, número de teléfono,
          correo electrónico,

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica con el mail que el salón este registrado en el
            sistema.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + Se ingresan las redes sociales
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se buscan las redes sociales
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 5)
          + Se ingresan los horarios de atención
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 6)
          + Se buscan los horarios de atención
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 7)
          + Se insertan los servicios
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 8)
          + Se buscan los servicios.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 9)
          + Se guarda la información actualizada.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 10)
          + Se guardan los datos la peluquería/salón.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no se encuentra la peluquería, es decir el
  mail registrado, se puede modificar, eliminar o salir del sistema.

- #strong[En el paso 4:] Si no existe la red social, se puede modificar,
  eliminar, consultar o salir del sistema.

- #strong[En el paso 6:] Si no existe el horario de atención, se puede
  consultar, modificar, eliminar o salir del sistema.

- #strong[En el paso 8:] Si no existe el servicio, se puede consultar,
  modificar, eliminar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] La nueva información de la peluquería/salón se
  actualiza.

  #strong[Referencia:] Párrafo 2.


  #image("media/image55.png")




  #image("media/image56.png")




  #image("media/image57.png")


  #image("media/image58.png")




  #image("media/image59.png")


]

#block[
  #set enum(numbering: "1.", start: 8)
  + #strong[Gestionar Categorías]
]

#quote(block: true)[
  #strong[Actores:] Administrador de la plataforma

  #strong[Tipos:] Secundario

  #strong[Propósito:] Permitir registrar las categorías para que los
  servicios puedan ser categorizados adecuadamente.

  #strong[Resumen:] El administrador de plataforma ingresa las categorías
  que utilizarán para clasificar sus servicios.

  #strong[Precondición:] N/A

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50.18%, 49.82%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones de actores];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. Se ingresa el nombre de la categoría], [Paso 2. Se verifica
        que la categoría no exista.],
      [Paso 3. Se guarda.], [Paso 4. Se guarda.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si la categoría ya está registrada en el
  sistema, se puede eliminar, modificar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] La categoría queda registrada en el sistema.


  #image("media/image60.png")


  #image("media/image61.png")




  #image("media/image62.png")




  #image("media/image63.png")




  #image("media/image64.png")


]

#block[
  #set enum(numbering: "1.", start: 9)
  + #strong[Gestionar Servicios]
]

#quote(block: true)[
  #strong[Actores:] Administrador de peluquería (iniciador), secretaria de
  la peluquería.

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar un servicio.

  #strong[Precondición:] La peluquería o salón debe estar registrada en el
  sistema y tener acceso al mismo.

  #strong[Descripción:] La secretaria ingresará la información del
  servicio que ofrece la peluquería/salón: nombre del servicio,
  descripción, categoría, precio del servicio, duración estimada.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del Actor];],
        [#strong[Acciones del
            Sistema];],
      ),
      table.hline(),
      [+ Se ingresa la categoría a la que pertenecerá el servicio

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica que la categoría exista.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + Se ingresa el nombre del servicio, descripción, precio del
            servicio y duración estimada
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se verifica que no exista el servicio con ese nombre.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 5)
          + Se guarda la información del servicio
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 6)
          + Se guarda la información del servicio.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si la peluquería no existe, se puede eliminar,
  modificar o salir del sistema.

- #strong[En el paso 4:] Si el servicio ya existe, se puede eliminar,
  modificar, consultar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] El servicio queda registrado en la plataforma
  del salón.


  #image("media/image65.png")


  #strong[Referencia:]
  Párrafo 6.


  #image("media/image66.png")




  #image("media/image67.png")


  #image("media/image68.png")




  #image("media/image69.png")


]

#block[
  #set enum(numbering: "1.", start: 10)
  + #strong[Gestionar Promociones y Ofertas]
]

#quote(block: true)[
  #strong[Actores];: Administrador de plataforma

  #strong[Tipo];: Primario

  #strong[Propósito];: Registrar los tipos de promociones que se podrán
  ofrecer

  #strong[Resumen];: El administrador de plataforma establece los tipos de
  ofertas básicos que se podrán hacer en la aplicación.

  #strong[Precondición];: N/A

  #strong[Curso básico]
]

#figure(
  align(center)[#table(
      columns: (50.18%, 49.82%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones de actores];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. Se ingresa el nombre de la promoción], [Paso 2. Se verifica
        que no exista la promoción.],
      [Paso 3. Se guarda], [Paso 4. Se guarda.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo];:
]

- #strong[En el paso 2:] Si la promoción ya existe, se puede consultar,
  modificar, eliminar o salir del sistema.

#quote(block: true)[

  #image("media/image70.png")


  #strong[Postcondición];:
  La promoción queda registrada para que pueda ser utilizada en la
  aplicación.
]


#image("media/image71.png")




#image("media/image72.png")




#image("media/image73.png")


#image("media/image74.png")



#block[
  #set enum(numbering: "1.", start: 11)
  + #strong[Gestionar Promoción u Oferta]
]

#quote(block: true)[
  #strong[Actores:] Administrador del Salón

  #strong[Tipos:] Secundario

  #strong[Propósito:] Permitir la gestión de promociones y ofertas en los
  servicios ofrecidos

  #strong[Resumen:] El administrador de Salón ingresa promociones y
  ofertas en los servicios ofrecidos

  #strong[Precondición:] El establecimiento, y el servicio deben estar
  registrados.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50.18%, 49.82%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones de actores];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. Se ingresa el código del salón], [Paso 2. Se verifica que
        exista el salón.],
      [Paso 3. Se ingresa el código del servicio que tendrá la
        promoción], [Paso 4. Se verifica que el servicio exista.],
      [Paso 5. Se ingresa la promoción que tendrá], [],
      [Paso 6. Se guarda], [Paso 7. Se guarda.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

#block[
  #set enum(numbering: "i.", start: 1)
  + #strong[En el paso 2:] Si no existe el salón se puede eliminar,
    modificar o salir del sistema.

  + #strong[En el paso 4:] Si no existe el servicio se puede eliminar,
    modificar o salir del sistema.
]

#quote(block: true)[
  #strong[Postcondiciones:] Las promociones y ofertas en los servicios
  ofrecidos se guardan correctamente en el sistema.
]


#image("media/image75.png")




#image("media/image76.png")


#image("media/image77.png")




#image("media/image78.png")


#image("media/image79.png")



#block[
  #set enum(numbering: "1.", start: 12)
  + #strong[Gestionar usuarios]
]

- #strong[Actor:] Administrador de salón

- #strong[Tipo:] Primario

- #strong[Propósito:] Gestionar los usuarios de todo tipo del salón

- #strong[Resumen:] El administrador gestiona los datos de todos los
  usuarios de todo tipo

- #strong[Precondición:] El salón debe estar registrado y además debe
  tener acceso al sistema.

-
#image("media/image80.png")


#strong[Curso
  básico:]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del Actor];],
        [#strong[Acciones del
            Sistema];],
      ),
      table.hline(),
      [+ Se ingresa el empleado

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se busca al empleado
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + Se ingresa el rol
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se busca el rol
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 5)
          + Se gurda la información del usuario
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 6)
          + Se guarda la información del usuario y se relaciona dependiendo
            del tipo de usuario. Luego se manda el código de acceso al correo
            del usuario para su posterior acceso.
        ]

      ],
    )],
  kind: table,
)


#image("media/image81.png")


#image("media/image82.png")


#image("media/image83.png")




#image("media/image84.png")



#block[
  #set enum(numbering: "1.", start: 13)
  + #strong[Actualizar Servicio]
]

#quote(block: true)[
  #strong[Actor:] Secretaria del salón, Adm. del salón(iniciador)

  #strong[Tipo:] Primario

  #strong[Propósito:] Actualizar servicio ofrecido por el salón.

  #strong[Resumen:] Actualizar la información de un servicio que el salón
  está ofreciendo con los siguientes datos: nombre del servicio,
  descripción, categoría, precio del servicio, duración estimada.

  #strong[Precondición:] El salón de belleza debe estar registrado y debe
  tener acceso al sistema.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del Actor];],
        [#strong[Acciones del
            Sistema];],
      ),
      table.hline(),
      [#strong[Paso 1.] Se ingresa el servicio], [#strong[Paso 2.] Se
        verifica que el servicio exista],
      [#strong[Paso 3.] Se ingresa la categoría.], [#strong[Paso 4.] Se
        busca la categoría.],
      [#strong[Paso 5.] Se ingresa la descripción, precio del servicio y
        duración estimada], [#strong[Paso 6.] Se verifica que el servicio
        exista dentro del sistema.],
      [#strong[Paso 7.] Se guarda la información del
        servicio], [#strong[Paso 8.] Se guarda la información del
        servicio.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no existe el servicio, se puede consultar,
  eliminar, modificar, o salir del sistema.

- #strong[En el paso 4:] Si la categoría ingresada no existe, se puede
  consultar, modificar, eliminar o salir del sistema.

#quote(block: true)[

  #image("media/image85.png")


  #strong[Postcondición:]
  La información del servicio queda actualizada en el sistema.


  #image("media/image86.png")


]


#image("media/image87.png")


#image("media/image88.png")




#image("media/image89.png")



#block[
  #set enum(numbering: "1.", start: 14)
  + #strong[Gestionar Géneros]
]

#quote(block: true)[
  #strong[Actor:] Administrador de la aplicación

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar los géneros

  #strong[Resumen:] El administrador de la aplicación registra el género
  en la aplicación.

  #strong[Precondición:] N/A

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ Se ingresa el nombre del género.

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica que el género no exista dentro del sistema.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + Se guardan los cambios.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se guardan los cambios en el sistema.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si el género ya está registrado en el sistema,
  se puede eliminar, modificar o salir del sistema.

#quote(block: true)[

  #image("media/image90.png")


  #strong[Postcondición:]
  Los géneros quedan registrados en el sistema.


  #image("media/image91.png")


  #image("media/image92.png")




  #image("media/image93.png")




  #image("media/image94.png")


]

#block[
  #set enum(numbering: "1.", start: 15)
  + #strong[Gestionar Empleados]
]

#quote(block: true)[
  #strong[Actor:] Administrador de Peluquería

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar empleados en el salón.

  #strong[Resumen:] El administrador registra los datos de los empleados
  con los datos como nombre, apellido paterno, apellido materno, teléfono,
  género y email

  #strong[Precondición:] El salón de belleza debe estar registrado.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. El administrador ingresa el código del salón], [Paso 2. Se
        verifica que la sucursal exista.],
      [Paso 3. El administrador ingresa los datos del empleado como:
        nombre, apellidos, teléfono, email], [Paso 4. Se verifica que no
        haya otro empleado registrado con el mismo email.],
      [Paso 5. Se guardan los cambios.], [Paso 7. Se guardan los cambios
        en el sistema.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] si no existe el salón se puede modificar,
  eliminar o salir del sistema.

- #strong[En el paso 4:] Si el email ingresado ya está registrado se
  puede eliminar, modificar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] Los cambios en los datos de los empleados quedan
  guardados en el sistema.

  #strong[Referencia:]


  #image("media/image95.png")




  #image("media/image96.png")


  #image("media/image97.png")




  #image("media/image98.png")




  #image("media/image99.png")


]

#block[
  #set enum(numbering: "1.", start: 16)
  + #strong[Gestionar horarios de empleados]
]

#quote(block: true)[
  #strong[Actor:] Administrador de Peluquería

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar los horarios en los cuales el empleado
  trabajará en el salón.

  #strong[Resumen:] El administrador establece los horarios en los cuales
  un empleado estará ofreciendo sus servicios en el salón.

  #strong[Precondición:] El salón y el empleado deben estar registrados en
  el sistema.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. Se ingresa el código del salón de belleza.], [Paso 2. Se
        verifica que el salón exista.],
      [Paso 3. Se ingresa el código del empleado.], [Paso 4. Se verifica
        que el empleado exista en el sistema.],
      [Paso 5. Se ingresa sus horarios de trabajo por cada día.], [],
      [Paso 6. Se guarda], [Paso 7. Se guarda.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no existe el salón, se puede editar,
  modificar, eliminar o salir del sistema.

- #strong[En el paso 4:] Si no existe el empleado, se puede modificar,
  eliminar o salir del sistema.

#quote(block: true)[

  #image("media/image100.png")


  #strong[Postcondición:]
  Los horarios de atención de los empleados del salón quedan registrados
  en el sistema.


  #image("media/image101.png")




  #image("media/image102.png")




  #image("media/image103.png")



  #image("media/image104.png")


]

#block[
  #set enum(numbering: "1.", start: 17)
  + #strong[Gestionar especialidad]
]

#quote(block: true)[
  #strong[Actor:] Secretaria de salón, empleado

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar la especialidad de cada empleado en el
  sistema.

  #strong[Resumen:] La secretaria del salón ingresa a la plataforma las
  especialidades de cada peluquero. El dato que se ingresa es la
  especialidad.

  #strong[Precondición:] El empleado debe estar registrado en el sistema.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. Se ingresa el código del empleado], [Paso 2. Se verifica
        que el empleado exista.],
      [Paso 3. Se ingresa la especialidad.], [Paso 4. Se verifica que no
        se haya ingresado la especialidad anteriormente.],
      [Paso 5. Se guarda], [Paso 6. Se guarda.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no existe el empleado, se puede editar,
  modificar, eliminar o salir del sistema.

- #strong[En el paso 4:] Si la especialidad ya ha sido registrada
  anteriormente se puede modificar, eliminar o salir del sistema.

#quote(block: true)[

  #image("media/image105.png")


  #strong[Postcondición:]
  La especialidad de los empleados queda registrada en el sistema.
]


#image("media/image106.png")




#image("media/image107.png")




#image("media/image108.png")


#image("media/image109.png")



#block[
  #set enum(numbering: "1.", start: 18)
  + #strong[Actualizar Empleados]
]

#quote(block: true)[
  #strong[Actor:] Administrador de Peluquería

  #strong[Tipo:] Secundario

  #strong[Propósito:] Permitir la actualización de los datos de un
  empleado de la peluquería.

  #strong[Resumen:] El administrador actualiza los datos de un empleado de
  la peluquería.

  #strong[Precondición:] El empleado debe estar registrado en el sistema.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ El administrador ingresa el código del salón

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica que el salón exista
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + El administrador ingresa el código de su empleado
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se verifica que exista el empleado
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 5)
          + El administrador ingresa los datos a actualizar del empleado.
        ]

      ], [],
      [#block[
          #set enum(numbering: "1.", start: 6)
          + Se guardan los datos
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 7)
          + Se guardan los datos.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no existe el salón se puede modificar,
  eliminar o salir del sistema

- #strong[En el paso 4:] Si no existe el empleado se puede modificar,
  eliminar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] Los datos del empleado seleccionado se
  actualizan en el sistema.


  #image("media/image110.png")


  #strong[Referencia:]
]


#image("media/image111.png")




#image("media/image112.png")




#image("media/image113.png")




#image("media/image114.png")



#block[
  #set enum(numbering: "1.", start: 19)
  + #strong[Eliminar Empleados]
]

#quote(block: true)[
  #strong[Actor:] Administrador de Peluquería

  #strong[Tipo:] Secundario

  #strong[Propósito:] Permitir la eliminación de un empleado del sistema y
  de su peluquería.

  #strong[Resumen:] El administrador elimina a un empleado de la
  peluquería del sistema.

  #strong[Precondición:] El empleado debe estar registrado en el sistema.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ El administrador ingresa el código del empleado que desea
          eliminar

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica que el empleado exista.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + El administrador presiona el botón de eliminar empleado
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se elimina el empleado.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si el empleado no existe se puede modificar o
  salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] El empleado seleccionado es eliminado del
  sistema.

  #strong[Referencia:]


  #image("media/image115.png")




  #image("media/image116.png")




  #image("media/image117.png")




  #image("media/image118.png")


  #image("media/image119.png")


]

#block[
  #set enum(numbering: "1.", start: 20)
  + #strong[Gestionar Clientes]
]

#quote(block: true)[
  #strong[Actor:] Cliente

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar clientes para que puedan tener acceso a la
  plataforma

  #strong[Resumen:] El cliente ingresa a la plataforma e ingresa sus datos
  personales: nombre, apellidos, teléfono, correo electrónico, sexo.

  #strong[Precondición:] El cliente debe poder ingresar a la plataforma.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50.21%, 49.79%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ Se escribe el nombre, apellidos, teléfono, correo electrónico y
          sexo

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica que el correo electrónico no exista.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + Se guarda la información del cliente.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se guarda el nuevo usuario cliente.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] En el paso 2 si el correo electrónico ya está
  registrado, se puede eliminar, modificar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] El cliente queda registrado y puede acceder a la
  plataforma para realizar reservas.

  #strong[Referencia:] Párrafo 1.


  #image("media/image120.png")




  #image("media/image121.png")




  #image("media/image122.png")




  #image("media/image123.png")




  #image("media/image124.png")


]

#block[
  #set enum(numbering: "1.", start: 21)
  + #strong[Gestionar Cliente fiel]
]

#quote(block: true)[
  #strong[Actor:] Secretaria del salón, Administrador de Peluquería
  (iniciador)

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar los clientes que son fieles a su
  peluquería.

  #strong[Resumen:] El administrador le pide a la secretaria que registre
  a un cliente de la plataforma como un cliente fiel de la peluquería.

  #strong[Precondición:] El cliente y el salón deben estar registrados en
  el sistema.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. Se ingresa el código del salón de belleza.], [Paso 2. Se
        verifica que el salón exista.],
      [Paso 3. Se ingresa el código del cliente.], [Paso 4. Se verifica
        que el cliente exista en el sistema.],
      [Paso 5. Se cambia el estado del cliente a cliente fiel a esa
        peluquería en el sistema], [],
      [Paso 6. Se guarda], [Paso 7. Se guarda.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no existe el salón, se puede editar,
  modificar, eliminar o salir del sistema.

- #strong[En el paso 4:] Si no existe el cliente, se puede modificar,
  eliminar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] El cliente queda registrado como cliente fiel al
  salón en el sistema.


  #image("media/image125.png")




  #image("media/image126.png")


  #image("media/image127.png")


]


#image("media/image128.png")




#image("media/image129.png")



#block[
  #set enum(numbering: "1.", start: 22)
  + #strong[Actualizar Clientes]
]

#quote(block: true)[
  #strong[Actor:] Cliente

  #strong[Tipo:] Primario

  #strong[Propósito:] Modificar la información de un cliente de la
  plataforma

  #strong[Resumen:] El cliente ingresa sus nuevos datos a la plataforma:
  nombre, apellidos, teléfono, correo electrónico, sexo.

  #strong[Precondición:] El cliente debe estar registrado en la
  plataforma.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50.21%, 49.79%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ Se escribe el nombre, apellidos, teléfono, correo electrónico y
          sexo

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica que el correo electrónico exista en el sistema.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + Se guarda la nueva información del cliente.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se guarda los cambios
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] En el paso 2 si el correo electrónico no está
  registrado, se puede eliminar, modificar o salir del sistema.

#quote(block: true)[
  #strong[Postcondición:] La información del cliente queda actualizada.

  #strong[Referencia:] Párrafo 1.


  #image("media/image130.png")




  #image("media/image131.png")




  #image("media/image132.png")




  #image("media/image133.png")




  #image("media/image134.png")


]

#block[
  #set enum(numbering: "1.", start: 23)
  + #strong[Gestionar Roles]
]

#quote(block: true)[
  #strong[Actor:] Administrador de la plataforma

  #strong[Tipo:] Primario

  #strong[Propósito:] Registrar los roles que habrá dentro de la
  plataforma.

  #strong[Resumen:] El administrador de la plataforma ingresa el nombre
  del rol en el sistema para que quede registrado.

  #strong[Precondición:] N/A

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. Se ingresa el nuevo rol], [Paso 2. Se verifica que el rol
        no exista.],
      [Paso 3. Se guarda], [Paso 4. Se guarda.],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si existe el rol, se puede modificar, eliminar
  o salir del sistema.

#quote(block: true)[

  #image("media/image135.png")


  #strong[Postcondición:]
  Los roles quedan registrados en el sistema.


  #image("media/image136.png")




  #image("media/image137.png")


  #image("media/image138.png")


  #image("media/image139.png")


]

#block[
  #set enum(numbering: "1.", start: 24)
  + #strong[Gestionar Reservas]
]

#quote(block: true)[
  #strong[Actores:] Cliente

  #strong[Tipo:] Primario

  #strong[Propósito:] Realizar la reserva de un servicio de una
  peluquería.

  #strong[Precondición:] El cliente debe estar registrado en la
  plataforma.

  #strong[Descripción:] El cliente agenda o reserva el servicio deseado
  con la siguiente información: nombre de la peluquería, nombre del
  servicio, nombre del estilista, fecha de reserva, imágenes de
  referencia, detalles, preferencias de pago.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50.9%, 49.1%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del Actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ Se ingresa el nombre de la peluquería/salón

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + Se verifica que la peluquería exista
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + Se ingresa el nombre del servicio requerido
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Se verifica que el servicio exista.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 5)
          + Se ingresa el nombre del estilista
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 6)
          + Se verifica que el estilista exista.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 7)
          + Se ingresa la fecha de reserva, imágenes de referencia, detalles y
            preferencias de pago.
        ]

      ], [],
      [#block[
          #set enum(numbering: "1.", start: 8)
          + Se guarda la información de la cita.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 9)
          + Se guarda la información de la cita.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]
]

- #strong[En el paso 2:] Si no existe la peluquería, se elimina,
  modifica, se consulta o se sale del sistema.

- #strong[En el paso 4:] Si no existe el servicio, se elimina, modifica,
  se consulta o se sale del sistema.

- #strong[En el paso 6:] Si no existe el estilista, se elimina,
  modifica, se consulta o se sale del sistema.

#quote(block: true)[
  #strong[Postcondición:] La cita queda registrada.


  #image("media/image140.png")


  #strong[Referencia:]
  Párrafo 2.


  #image("media/image141.png")




  #image("media/image142.png")




  #image("media/image143.png")




  #image("media/image144.png")


]

#block[
  #set enum(numbering: "1.", start: 25)
  + #strong[Actualizar Cita]
]

#quote(block: true)[
  #strong[Actor:] secretaria de Peluquería, Peluquero o estilista
  (iniciador)

  #strong[Tipo:] Primario

  #strong[Propósito:] Permitir actualizar los detalles de una cita
  existente en el sistema.

  #strong[Resumen:] La secretaria, el peluquero actualizan la información
  de una cita en el sistema.

  #strong[Precondición:] Tener acceso al sistema, existe al menos una cita
  registrada.

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ La secretaria o el peluquero selecciona la opción \"Actualizar
          Cita\" en el sistema.

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + El sistema muestra una lista de citas programadas.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + La secretaria o el peluquero selecciona la cita que desea
            actualizar.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + El sistema muestra los detalles de la cita seleccionada.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 5)
          + La secretaria o el peluquero modifica los detalles de la cita:
            fecha, hora, tipo de servicio y estado.
        ]

      ], [],
      [#block[
          #set enum(numbering: "1.", start: 6)
          + Guarda la información en el sistema
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 7)
          + El sistema actualiza la información de la cita en la base de
            datos.
        ]

      ],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]

  #strong[Paso 2:]
]

- Si no hay citas programadas se sale del sistema.

#quote(block: true)[
  #strong[Paso 4:] Si la cita ya no está disponible para actualizar:
]

- El sistema muestra un mensaje indicando que la cita seleccionada ya no
  está disponible para actualizar.

- Vuelve al paso 2.

#quote(block: true)[
  #strong[Paso 7:] El sistema no puede actualizar la cita debido a un
  error:
]

- El sistema muestra un mensaje de error.

- La secretaria o el peluquero intenta actualizar la cita nuevamente.

#quote(block: true)[
  #strong[Postcondición:] Los detalles de la cita seleccionada se
  actualizan.

  #strong[Referencia:]


  #image("media/image145.png")




  #image("media/image146.png")




  #image("media/image147.png")


  #image("media/image148.png")




  #image("media/image149.png")


]

#block[
  #set enum(numbering: "1.", start: 26)
  + #strong[Anular Cita]
]

#quote(block: true)[
  #strong[Actor:] secretaria de Peluquería, peluquero o cliente.

  #strong[Tipo:] Secundario

  #strong[Propósito:] Permitir la anulación de una cita previamente
  agendada.

  #strong[Resumen:] La secretaria anulan una cita existente en el sistema.

  #strong[Precondición:] La cita debe existir

  #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones del actor];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [+ La secretaria o el cliente selecciona la opción \"Anular Cita\"
          en el sistema

      ], [#block[
          #set enum(numbering: "1.", start: 2)
          + El sistema muestra una lista de citas agendadas.
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 3)
          + La secretaria o el cliente selecciona la cita que desea anular.
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 4)
          + Busca la cita
        ]

      ],
      [#block[
          #set enum(numbering: "1.", start: 5)
          + Se confirma la anulación
        ]

      ], [#block[
          #set enum(numbering: "1.", start: 6)
          + El sistema elimina la cita del sistema.
        ]

      ],
      [], [],
    )],
  kind: table,
)

#quote(block: true)[
  #strong[Curso alternativo:]

  #strong[Paso 2:]
]

- Si no hay citas agendadas se sale del sistema.

#quote(block: true)[
  #strong[Paso 4:]
]

- Si no se encuentra la cita, se puede modificar, eliminar o salir del
  sistema.

#quote(block: true)[
  #strong[Postcondición:] La cita queda eliminada


  #image("media/image150.png")



  #image("media/image151.png")


]


#image("media/image152.png")



#quote(block: true)[

  #image("media/image153.png")




  #image("media/image154.png")


]

#block[
  #set enum(numbering: "1.", start: 27)
  + #strong[Elaborar Reportes de citas mensuales]

    - #strong[Actores:] Administrador de salón (iniciador), secretaría

    - #strong[Tipos:] Primario

    - #strong[Propósito:] Permitir la generación de reportes mensuales de
      citas

    - #strong[Resumen:] El administrador o la secretaria generan un
      reporte con las citas programadas durante un mes especifico.

    - #strong[Precondición:] Existen citas programadas en el sistema

    - #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (49.62%, 50.38%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones de actores];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. Ingresa la fecha de la cual quiere obtener el
        reporte], [Paso 2. El sistema busca las citas, estilistas, servicios
        y la información necesaria y elabora un reporte],
      [], [Paso 3: Se muestra el reporte.],
    )],
  kind: table,
)

- #strong[Curso alternativo:]

  #block[
    #set enum(numbering: "i.", start: 1)
    + #strong[Paso 2:] Si no hay citas programadas para la fecha
      seleccionada, el sistema muestra un mensaje indicando que no hay
      citas para ese periodo
  ]

- #strong[Postcondiciones:] El reporte de citas mensuales se genera
  correctamente


#image("media/image155.png")




#image("media/image156.png")




#image("media/image157.png")




#image("media/image158.png")


#image("media/image159.png")



#block[
  #set enum(numbering: "1.", start: 28)
  + #strong[Generar Agenda Diaria]

    - #strong[Actores:] Administrador de peluquería (iniciador),
      secretaría de peluquería

    - #strong[Tipos:] Primario

    - #strong[Propósito:] Permitir la generación de una agenda diaria con
      las citas programadas

    - #strong[Resumen:] El administrador o la secretaría generan una
      agenda diaria con las citas programadas para ese día

    - #strong[Precondición:] tener acceso al sistema y que existan citas
      programadas para el salón

    - #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50.15%, 49.85%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones de actores];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. El administrador o la secretaría selecciona la opción
        “Generar agenda diaria” en el sistema], [Paso 2. El sistema muestra
        un calendario con las fechas disponibles],
      [Paso 3. El administrador o la secretaria selecciona la fecha para
        la cual desea generar la agenda], [Paso 4. El sistema muestra la
        agenda diaria con las citas programadas para esa fecha],
    )],
  kind: table,
)

- #strong[Curso alternativo:] Si en el paso 3 no hay citas programadas
  para la fecha seleccionada, el sistema muestra un mensaje indicando
  que no hay citas para esa fecha y se puede modificar o salir del
  sistema.

- #strong[Postcondiciones:] La agenda diaria con las citas programadas
  se genera correctamente


#image("media/image160.png")




#image("media/image161.png")




#image("media/image162.png")




#image("media/image163.png")




#image("media/image164.png")



#block[
  #set enum(numbering: "1.", start: 29)
  + #strong[Generar Historial de citas de los clientes]

    - #strong[Actores:] Administrador de la peluquería/salón (iniciador) o
      secretaría

    - #strong[Tipos:] Secundario

    - #strong[Propósito:] Permitir la visualización del historial de citas
      de los clientes con el salón de belleza.

    - #strong[Resumen:] El administrador genera un reporte con el
      historial de citas de los clientes.

    - #strong[Precondición:] existen clientes registrados, citas
      programadas en el sistema y se debe tener acceso al sistema.

    - #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50.15%, 49.85%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones de actores];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. El administrador selecciona la opción “Generar historial de
        citas en el sistema”], [Paso 2. El sistema muestra una lista de
        clientes registrados que han reservado una cita con su salón de
        belleza.],
      [Paso 3. El administrador selecciona el cliente del cual desea ver
        el historial], [Paso 4. El sistema muestra el historial de citas del
        cliente seleccionado],
    )],
  kind: table,
)

- #strong[Curso alternativo:] Si no hay clientes registrados, el sistema
  muestra un mensaje indicando que no hay clientes registrados.

- #strong[Postcondiciones:] El historial de citas del cliente
  seleccionado se genera correctamente


#image("media/image165.png")




#image("media/image166.png")


#image("media/image167.png")




#image("media/image168.png")




#image("media/image169.png")



#block[
  #set enum(numbering: "1.", start: 30)
  + #strong[Realizar Reseña de servicio]

    - #strong[Actores:] Cliente

    - #strong[Tipos:] Secundario

    - #strong[Propósito:] Permitir que los clientes realicen reseñas sobre
      los servicios recibidos

    - #strong[Resumen:] El cliente realiza una reseña sobre el servicio
      recibido en el establecimiento

    - #strong[Precondición:] El cliente recibió un servicio y debe tener
      acceso al sistema.

    - #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50.38%, 49.62%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones de actores];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [], [Paso 1. Después de recibir el servicio, el sistema solicita al
        cliente realizar una reseña],
      [Paso 3. El cliente ingresa su calificación y comentarios sobre el
        servicio recibido], [Paso 4. El sistema guarda la reseña del
        cliente],
    )],
  kind: table,
)

- #strong[Curso alternativo:]

  #block[
    #set enum(numbering: "i.", start: 1)
    + #strong[En el paso 3:] si el cliente no desea dejar una reseña puede
      salir del sistema.
  ]

- #strong[Postcondiciones:] La reseña del cliente sobre el servicio
  recibido se guarda correctamente en el sistema


#image("media/image170.png")




#image("media/image171.png")




#image("media/image172.png")




#image("media/image173.png")


#image("media/image174.png")



#block[
  #set enum(numbering: "1.", start: 31)
  + #strong[Realizar Pagos en línea]

    - #strong[Actores:] Cliente

    - #strong[Tipos:] Primario

    - #strong[Propósito:] Permitir que los clientes realicen pagos en
      línea por los servicios recibidos

    - #strong[Resumen:] El cliente realiza el pago de la reserva a través
      de la aplicación

    - #strong[Precondición:] El establecimiento ofrece servicios

    - #strong[Curso básico:]
]

#figure(
  align(center)[#table(
      columns: (50%, 50%),
      align: (auto, auto),
      table.header(
        [#strong[Acciones de actores];],
        [#strong[Acciones del
            sistema];],
      ),
      table.hline(),
      [Paso 1. Se ingresa el servicio que se va a pagar], [Paso 2. Se
        verifica que la cita y el servicio existan.],
      [Paso 3. El cliente elige el método de pago], [],
      [Paso 4. Se guarda el pago], [Paso 5. Se guarda el pago.],
    )],
  kind: table,
)

- #strong[Curso alternativo:]

  #block[
    #set enum(numbering: "i.", start: 1)
    + Paso 2: Si no exista la cita o no exista el servicio se puede
      modificar, eliminar o salir del sistema.
  ]

- #strong[Postcondiciones:] El pago queda registrado en el sistema.


#image("media/image175.png")




#image("media/image176.png")




#image("media/image177.png")




#image("media/image178.png")




#image("media/image179.png")




#image("media/image180.png")


#strong[Diagrama
  de Casos de Uso General del Sistema]

== Modelo de Dominio \[del problema\]

#link("https://app.diagrams.net/#G1_dgE4EIgIO99QSPdAowJQgMlHrv9Be5n#%7B\"pageId\"%3A\"sK8s15_ZS7A4A-4CJ5jf\"%7D")


#image("media/image182.svg")



==

==

==

==

==

==

==

==

== Modelo de Clases \[de la solución\]

#link("https://app.diagrams.net/#G1_dgE4EIgIO99QSPdAowJQgMlHrv9Be5n#%7B\"pageId\"%3A\"B6juhMaYEk2xNm83owGG\"%7D")


#image("media/image184.svg")



== Paquetes

#link("https://drive.google.com/file/d/1yMp0I3xapmzCbnpTacgckW5jqX6cfN4k/view?usp=sharing")


#image("media/image185.png")

Paquetes de Análisis


#image("media/image186.png")




#image("media/image187.png")






#image("media/image188.png")


#image("media/image189.png")




#image("media/image190.png")



=== Paquetes de Diseño del Dominio


#image("media/image191.png")




#image("media/image192.png")




#image("media/image193.png")




#image("media/image194.png")




#image("media/image195.png")




#image("media/image196.png")


#image("media/image197.png")

Paquetes de Diseño de Clases


#image("media/image198.png")


#image("media/image199.png")




#image("media/image200.png")




#image("media/image201.png")


#image("media/image202.png")



== Diagramas de Maquinas de Estado

=== Diagrama de Actividad de todo el sistema


#image("media/image204.svg")



#link("https://lucid.app/lucidchart/5102ecf7-90be-4201-a0f8-7d107c05088b/edit?viewport_loc=-476%2C-255%2C4043%2C1897%2C0_0&invitationId=inv_31c4a241-9c2f-4f86-b832-5affd74d89d7")[https:\/\/lucid.app/lucidchart/5102ecf7-90be-4201-a0f8-7d107c05088b/edit?viewport\_loc=-476%2C-255%2C4043%2C1897%2C0\_0&invitationId=inv\_31c4a241-9c2f-4f86-b832-5affd74d89d7]


#image("media/image205.png")

Diagrama de estado de casos de uso


#image("media/image206.png")


#image("media/image207.png")



= Diagrama de estados de un objeto


#image("media/image208.png")



== Prototipo

#strong[Link: #link("https://jassielof.github.io/SI414-mockup/");]
