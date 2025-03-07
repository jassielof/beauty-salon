#import "template/versatile-apa/lib.typ": *

#show: versatile-apa.with(
  title: [Sistema de Centros de Belleza],
  custom-authors: [Jassiel Ovando Franco - Olver Rioja Valverde],
  custom-affiliations: [Facultad de Ingeniería, Universidad Privada de Santa Cruz de la Sierra],
  due-date: [Primer Semestre, 2025],
  course: [SI514 (A): Gestión de Sistemas],
  language: "es",
  region: "bo",
  paper-size: "a4",
  running-head: [Sistema de centro de belleza],
  instructor: [Mgs. Nancy Yudy Velásquez Suarez],
  implicit-introduction-heading: false,
)

// introducción
= Objetivos

== Objetivo General
Realizar el análisis y diseño de una plataforma que permita la gestión y el manejo de reservas y agendas en peluquerías y salones de belleza eficientemente.

== Objetivos Específicos
- Hacer un levantamiento de requerimientos a través de encuestas realizadas a peluquerías y salones de belleza para desarrollar la plataforma de gestión de reservas.
- Analizar los requisitos para desarrollar una plataforma de gestión de reservas y agendas en peluquerías y salones de belleza.
- Diseñar una solución que permita satisfacer los requisitos para la plataforma de gestión.
- Realizar un primer prototipo de la plataforma de gestión manejo de reservas y agendas de citas.

= Organigrama
#image("media/image1.png")

= Manual de Funciones
== Administrador de Peluquería
=== Gestión de Información
- Mantener actualizados los datos del salón, incluyendo dirección, contacto y horarios de operación.
- Supervisar y actualizar los perfiles de los empleados, asegurando que sus habilidades y servicios sean los correctos para llevar acabo los servicios.

=== Supervisión y Coordinación
- Supervisar el desempeño de los empleados y proveer retroalimentación.
- Coordinar con los peluqueros para organizar capacitaciones y desarrollo profesional.

=== Gestión de Servicios
- Definir y actualizar los servicios ofrecidos, incluyendo descripciones y precios.
- Establecer promociones y paquetes de servicios.

=== Relación con Clientes
- Resolver quejas y problemas de los clientes de manera eficiente.
- Asegurar que los clientes reciban un servicio de alta calidad.

== Secretaria de Peluquería
=== Gestión de Reservas
- Administrar las citas de los clientes a través de un libro de reservas o una agenda manual, asegurando que se asignen correctamente.
- Confirmar las reservas y enviar recordatorios a los clientes, ya sea por teléfono o WhatsApp.

=== Atención al Cliente
- Proveer información a los clientes sobre servicios, precios y disponibilidad.
- Responder a consultas y resolver dudas de los clientes.

=== Mantenimiento de la Agenda
- Actualizar la disponibilidad de los peluqueros y servicios.
- Ajustar la agenda según las solicitudes y cambios de última hora.

=== Gestión Administrativa
- Mantener registros precisos de las transacciones y pagos.
- Coordinar con el administrador para asegurar que los recursos estén disponibles cuando se necesiten.

== Peluquero/Estilista (Empleado)
=== Provisión de Servicios
- Realizar los servicios de belleza según las reservas realizadas por los clientes.
- Asegurarse de cumplir con los estándares de calidad del salón.

=== Gestión de Citas Propias
- Administrar su propia agenda de citas y hacer ajustes según su disponibilidad.
- Informar a la secretaria sobre cualquier cambio en su horario.

=== Atención al Cliente
- Proveer un excelente servicio al cliente, asegurando su satisfacción.
- Escuchar y responder a las necesidades y preferencias de los clientes.

== Cliente
=== Reserva y Gestión de Citas
- Realizar reservas a través del teléfono o WhatsApp.
- Consultar disponibilidad de servicios y empleados.

=== Recepción de Notificaciones
- Recibir confirmaciones y recordatorios de sus citas a través de un mensaje.
- Obtener notificaciones sobre promociones y ofertas especiales a través de un mensaje.

=== Feedback y Calificaciones
- Proveer retroalimentación sobre los servicios recibidos.
- Calificar a los empleados y los servicios para ayudar a mejorar la calidad del salón

= Resultado de Encuestas
== Encuesta a peluquerías
#image("media/image3.png")

#image("media/image2.png")

#image("media/image4.png")

#image("media/image5.png")

#image("media/image6.png")

#image("media/image7.png")

#image("media/image8.png")

#image("media/image9.png")

#image("media/image10.png")

#image("media/image11.png")

#image("media/image12.png")

#image("media/image13.png")

#image("media/image14.png")

== Encuesta a Clientes
#image("media/image15.png")

#image("media/image16.png")

#image("media/image17.png")

#image("media/image18.png")

#image("media/image19.png")

#image("media/image20.png")

#image("media/image21.png")

#image("media/image22.png")

#image("media/image23.png")

#image("media/image24.png")

= Estudio de Mercado
Las peluquerías y salones (de belleza), enfrentan un problema a medida que la popularidad de estas crece. Manejar eficientemente la gran cantidad de gente que va en busca de sus servicios se vuelve un reto.

Ante esta situación, los dueños de las peluquerías y los propios peluqueros han expresado la necesidad de contar con una solución tecnológica que les permita gestionar de manera organizada y conveniente las reservas de sus clientes. Por otro lado, los clientes también han manifestado su interés en poder encontrar los servicios que mejor se adaptan a sus necesidades y poder realizar reservas de manera sencilla y accesible, evitando largas esperas y contratiempos.

Por este motivo, se ha realizado un estudio de mercado que involucra encuestas y entrevistas a través de las cuales se pudo extraer los requisitos que los dueños de las peluquerías, peluqueros y clientes de las peluquerías consideran necesarios para el desarrollo de la aplicación.

== Encuestas a peluquerías y gráficas
En base a la información recopilada de las encuestas, se encuentra que las peluquerías y salones de belleza enfrentan un desafío a medida que crece la demanda por sus servicios. Manejar eficientemente el gran volumen de clientes que buscan estos servicios se ha vuelto un reto crítico.

Ante esta situación, los dueños de peluquerías y estilistas han expresado la necesidad de contar con una solución tecnológica que les permita gestionar de manera organizada y conveniente las reservas de sus clientes. Por otro lado, los clientes también manifiestan su interés en poder encontrar los servicios que mejor se adaptan a sus necesidades y poder realizar reservas de forma sencilla y accesible, evitando largas esperas y contratiempos.

Para comprender mejor las necesidades y requerimientos, se realizó una encuesta a diversos salones y peluquerías de la ciudad. A continuación, se detallan los principales hallazgos.

=== Servicios ofrecidos
La mayoría de los establecimientos ofrece una variedad de servicios que incluyen cortes de cabello para hombres y mujeres, peinados, tintes, tratamientos capilares, alisados, ondulados, manicura, pedicura, depilación, maquillaje y servicios especiales como paquetes para XV años y bodas. Algunos también venden productos de belleza.

=== Precios promedio
Los precios promedio de los servicios más populares oscilan entre 100-200 BOB, aunque salones más especializados maneja precios más altos, entre 300-500 BOB.

=== Manejo de citas
Actualmente, la mayoría de los salones maneja las citas de sus clientes por orden de llegada, teléfono o simplemente WhatsApp, lo cual es considerado poco eficiente por los encuestados.

=== Características deseadas en una aplicación
Las características más solicitadas para una aplicación de reservas incluyen calendarios dinámicos, opciones de pago, recordatorios, catálogos de servicios con descripción, valoraciones y reseñas de clientes, sistema de puntos o recompensas, integración con redes sociales, área de membresía par clientes frecuentes, chat con clientes y notificaciones de ofertas y promociones.

=== Promoción de servicios
La mayoría de los establecimientos promueve sus servicios a través de redes sociales, aunque algunos también usan publicidad impresa y el boca-boca.

=== Interés en la nueva aplicación
La gran mayoría de los encuestados manifestó su interés en usar la nueva aplicación como plataforma de marketing, publicidad y reservas.

=== Medición de satisfacción del cliente
Muchos de los establecimientos no miden actualmente la satisfacción de sus clientes o lo hacen de manera informal, a través de retroalimentación directa, reseñas en redes sociales o seguimiento de clientes regulares.

=== Disposición a pagar por la aplicación
Mientras algunos establecimientos no estarían dispuestos a pagar una cuota mensual por la aplicación, la mayoría estaría dispuesta a pagar una cuota entre 70-150 BOB mensuales.

=== Cantidad de sucursales
La mayoría de los establecimientos encuestados cuenta con una sola sucursal, aunque algunas peluquerías más grandes tienen hasta 10 sucursales.

== Encuestas a clientes y gráficas
=== Frecuencia de visitas
La mayoría visita las peluquerías o salones cada 2-3 semanas, una vez al mes o cada 2-3 meses. Así como algunos visitan semanalmente y otros cada 6 meses o más.

=== Servicios solicitados
Los servicios más populares son cortes de cabello, tintes, tratamientos capilares, manicura, pedicura, depilación y maquillaje. Los hombres suelen solicitar principalmente cortes de cabello y arreglo de barba, mientras que las mujeres solicitan una variedad más amplia de servicios.

=== Elección de establecimientos
Las principales formas son recomendaciones de amigos/familiares, ubicación/cercanía y ser clientes frecuentes de un lugar. Otros factores mencionados son publicidad, búsquedas en línea y que hagan un buen trabajo por supuesto.

=== Uso de aplicaciones móviles
La mayoría no usa aplicaciones para reservar citas en peluquerías actualmente, algunos clientes, especialmente los más jóvenes, si usan aplicaciones similares.

=== Características deseadas en una aplicación
La más mencionada es el calendario o agenda en línea, opciones de pago integradas, visualización de horarios, catálogo de servicios, valoración/reseñas, ofertas/promociones y geolocalización de peluquerías cercanas.

=== Preferencia de reserva
Muchos prefieren reservar por teléfono o no suelen reservar citas, otros usan WhatsApp, mensajes de texto o reservan en persona.

=== Disposición a usar una nueva aplicación
La disposición de los clientes es alta, la mayoría quisiera usar una nueva aplicación parar reservar citas

=== Pago a través de la aplicación
Aproximadamente la mitad estaría dispuesta a pagar las citas a través de la aplicación, mientras que la otra mitad preferiría pagar de otra forma

= Requisitos
== Formularios
=== Registro de Clientes
Los clientes que quieran realizar reservas de servicios a través de la
aplicación deberán registrarse en la plataforma con los datos: nombre,
apellidos, número de teléfono, dirección de correo electrónico. De la
misma manera se podrá actualizar la información que los clientes tengan
guardada en el sistema.

#figure(
  table(
    columns: (50%, 50%),
    align: (left, auto),
    table.header([Nombre], []),
    table.hline(),
    [Apellido paterno], [],
    [Apellido materno], [],
    [Teléfono], [],
    [Sexo], [],
    [Correo electrónico], [],
  ),
  kind: table,
)

=== Registro de Peluquerías/Salones

Las peluquerías o salones de belleza que deseen administrar sus citas a
través de la plataforma deberán registrarse con los datos: nombre del
salón, dirección, números de teléfono de contacto, correo electrónico,
horarios de atención, servicios que ofrecen y sus precios, empleados
(peluqueros, estilistas, maquilladores, etc.)


#figure(
  table(
    columns: (50%, 50%),
    align: (left, auto),
    table.header([*Nombre de la peluquería/salón*], []),
    table.hline(),
    [*Dirección*], [],
    [*Teléfonos de contacto*], [],
    [*Correo electrónico*], [],
    [*Redes sociales*], [],
    [*Horarios de atención*], [],
    [*Servicios*], [],
  ),
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


#figure(
  table(
    columns: (50%, 50%),
    align: (left, auto),
    table.header([*Fecha y hora de reserva*], []),
    table.hline(),
    [*Servicio solicitado*], [],
    [*Peluquero/estilista de preferencia*], [],
    [*Imágenes de referencia*], [],
    [*Notas sobre el servicio*], [],
    [*Método de pago preferido*], [],
  ),
  kind: table,
)

=== Actualización de reservas/citas

El cliente podrá eliminar o actualizar su cita en caso de cambie de
opinión antes de la cita, en caso de que el cliente quiera actualizarla,
será llevado al formulario, caso que requiera eliminarla, será llevado a
una ventana de confirmación que notificará a la peluquería.


#figure(
  table(
    columns: (50%, 50%),
    align: (left, auto),
    table.header([*Fecha y hora de reserva*], []),
    table.hline(),
    [*Servicio solicitado*], [],
    [*Peluquero/estilista de preferencia*], [],
    [*Método de pago de preferencia*], [],
    [*Notas sobre el servicio*], [],
    [*Imágenes de referencia*], [],
  ),
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


#figure(
  table(
    columns: (50%, 50%),
    align: (left, auto),
    table.header([*Nombre*], []),
    table.hline(),
    [*Apellido paterno*], [],
    [*Apellido materno*], [],
    [*Teléfono*], [],
    [*Correo electrónico*], [],
    [*Servicios ofrecidos*], [],
    [*Días disponibles*], [],
    [*Horarios disponibles*], [],
  ),
  kind: table,
)

=== Gestión de Servicios y Precios

Los administradores de las peluquería o salones de belleza podrán
registrar los servicios que realizan para que puedan ser visibles a los
clientes. Se deberá ingresar la siguiente información: nombre del
servicio, descripción del servicio, precio del servicio, empleados que
realizan el servicio.


#figure(
  table(
    columns: (50%, 50%),
    align: (left, auto),
    table.header([*Servicio*], []),
    table.hline(),
    [*Descripción del servicio*], [],
    [*Categoría*], [],
    [*Precio o rango de precio*], [],
    [*Duración estimada del servicio*], [],
  ),
  kind: table,
)

=== Calificación y Reseñas

Los clientes, terminado su servicio, serán recibidos con un formulario
que les pedirá una calificación y un comentario o reseña acerca del
servicio obtenido, el nombre del salón o servicio no será necesario que
se registre en el formulario, debido que se detectará automáticamente
luego de que el cliente haya obtenido y pagado por su servicio.


#figure(
  table(
    columns: (50%, 50%),
    align: (left, auto),
    table.header([*Calificación*], []),
    table.hline(),
    [*Comentario/Reseña*], [],
  ),
  kind: table,
)

== Reportes

=== Notificación de recordatorios

Se deberá notificar al cliente cuando una se acerque la fecha de una
cita con el fin de hacerle recuerdo. Dicha notificación le llegará a su
correo o a través de la plataforma. La notificación contendrá: Nombre de
la peluquería o salón, servicio reservado, empleado seleccionado y la
fecha de la cita.


#figure(
  table(
    columns: (50%, 50%),
    align: (left, auto),
    table.header([*Nombre de la peluquería/salón*], []),
    table.hline(),
    [*Servicio de preferencia*], [],
    [*Empleado seleccionado*], [],
    [*Fecha de la cita*], [],
    [*Notas de la cita*], [],
    [*Imágenes de referencia*], [],
  ),
  kind: table,
)

=== Agendas diarias

Se deberá elaborar un reporte o agenda diaria en el que los salones
podrán ver las citas que se han agendado para ese día, se podrá ver la
siguiente información: Nombre del cliente, servicio seleccionado,
horario seleccionado, empleado seleccionado y preferencia de pago.

#figure(
  table(
    columns: (50%, 50%),
    align: (left, auto),
    table.header([*Nombre del cliente*], []),
    table.hline(),
    [*Servicio seleccionado*], [],
    [*Horario seleccionado*], [],
    [*Empleado de preferencia*], [],
    [*Método de pago*], [],
  ),
  kind: table,
)

= Parámetros del Sistema
== Procesos, Entradas y Salidas
#figure(
  table(
    columns: (33.33%, 33.33%, 33.3%),
    align: (auto, auto, auto),
    table.header([*Entrada*], [*Proceso*], [*Salida*]),
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
  ),
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
- A/B Testing: Prueba diferentes diseños de UI para ver cuál funciona mejor.

=== Retroalimentación de la comunidad

- Foros y Grupos: Espacios donde usuarios discuten el sistema.
- Redes Sociales: Monitorea menciones y sentimientos.
- Canal de Sugerencias: Usuarios proponen nuevas funciones.

=== Bucles de retroalimentación

- Cliente → Sistema → Salón: Las reseñas afectan el ranking de los salones.
- Salón → Sistema → Cliente: Cambios en servicios actualizan las opciones del cliente.
- Sistema → Desarrolladores: Errores y rendimiento guían actualizaciones.
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

#include "sections/uml.typ"

#appendix()[
  = Prototipo de Sistemas de Información
  Enlace: https://si414-45d0a5.gitlab.io/
]
