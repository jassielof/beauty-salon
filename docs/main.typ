#import "template/versatile-apa/lib.typ": *

#show: versatile-apa.with(
  title: [Sistema de Centros de Belleza],
  custom-authors: [Jassiel Ovando Franco],
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
- Hacer un levantamiento de requerimientos a través de encuestas
  realizadas a peluquerías y salones de belleza para desarrollar la
  plataforma de gestión de reservas.
- Analizar los requisitos para desarrollar una plataforma de gestión de reservas y agendas en peluquerías y salones de belleza
- Diseñar una solución que permita satisfacer los requisitos para la
  plataforma de gestión.
- Realizar un primer prototipo de la plataforma de gestión manejo de
  reservas y agendas de citas.

= Organigrama

#image("media/image1.png")

= Manual de Funciones

== Administrador de Peluquería

=== Gestión de Información
- Mantener actualizados los datos del salón, incluyendo dirección,
  contacto y horarios de operación.
- Supervisar y actualizar los perfiles de los empleados, asegurando que
  sus habilidades y servicios sean los correctos para llevar acabo los
  servicios

=== Supervisión y Coordinación
- Supervisar el desempeño de los empleados y proveer retroalimentación.
- Coordinar con los peluqueros para organizar capacitaciones y
  desarrollo profesional.

=== Gestión de Servicios
- Definir y actualizar los servicios ofrecidos, incluyendo descripciones
  y precios.
- Establecer promociones y paquetes de servicios.

=== Relación con Clientes
- Resolver quejas y problemas de los clientes de manera eficiente.
- Asegurar que los clientes reciban un servicio de alta calidad.

== Secretaria de Peluquería

=== Gestión de Reservas
- Administrar las citas de los clientes a través de un libro de reservas
  o una agenda manual, asegurando que se asignen correctamente.
- Confirmar las reservas y enviar recordatorios a los clientes, ya sea
  por teléfono o WhatsApp.

=== Atención al Cliente
- Proveer información a los clientes sobre servicios, precios y
  disponibilidad.
- Responder a consultas y resolver dudas de los clientes.

=== Mantenimiento de la Agenda
- Actualizar la disponibilidad de los peluqueros y servicios.
- Ajustar la agenda según las solicitudes y cambios de última hora.

=== Gestión Administrativa
- Mantener registros precisos de las transacciones y pagos.
- Coordinar con el administrador para asegurar que los recursos estén
  disponibles cuando se necesiten.

== Peluquero/Estilista (Empleado)

=== Provisión de Servicios
- Realizar los servicios de belleza según las reservas realizadas por
  los clientes.
- Asegurarse de cumplir con los estándares de calidad del salón.

=== Gestión de Citas Propias
- Administrar su propia agenda de citas y hacer ajustes según su
  disponibilidad.
- Informar a la secretaria sobre cualquier cambio en su horario.

=== Atención al Cliente
- Proveer un excelente servicio al cliente, asegurando su satisfacción.
- Escuchar y responder a las necesidades y preferencias de los clientes.

== Cliente

=== Reserva y Gestión de Citas
- Realizar reservas a través del teléfono o WhatsApp.
- Consultar disponibilidad de servicios y empleados.

=== Recepción de Notificaciones
- Recibir confirmaciones y recordatorios de sus citas a través de un
  mensaje.
- Obtener notificaciones sobre promociones y ofertas especiales a través
  de un mensaje.

=== Feedback y Calificaciones
- Proveer retroalimentación sobre los servicios recibidos.
- Calificar a los empleados y los servicios para ayudar a mejorar la
  calidad del salón

= Resultado Encuestas

#image("media/image2.png")

== Encuesta a peluquerías


#image("media/image3.png")


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

Las peluquerías y salones (de belleza), enfrentan un problema a medida
que la popularidad de estas crece. Manejar eficientemente la gran
cantidad de gente que va en busca de sus servicios se vuelve un reto.

Ante esta situación, los dueños de las peluquerías y los propios
peluqueros han expresado la necesidad de contar con una solución
tecnológica que les permita gestionar de manera organizada y conveniente
las reservas de sus clientes. Por otro lado, los clientes también han
manifestado su interés en poder encontrar los servicios que mejor se
adaptan a sus necesidades y poder realizar reservas de manera sencilla y
accesible, evitando largas esperas y contratiempos.

Por este motivo, se ha realizado un estudio de mercado que involucra
encuestas y entrevistas a través de las cuales se pudo extraer los
requisitos que los dueños de las peluquerías, peluqueros y clientes de
las peluquerías consideran necesarios para el desarrollo de la
aplicación.

== Encuestas a peluquerías y gráficas

En base a la información recopilada de las encuestas, se encuentra que
las peluquerías y salones de belleza enfrentan un desafío a medida que
crece la demanda por sus servicios. Manejar eficientemente el gran
volumen de clientes que buscan estos servicios se ha vuelto un reto
crítico.

Ante esta situación, los dueños de peluquerías y estilistas han
expresado la necesidad de contar con una solución tecnológica que les
permita gestionar de manera organizada y conveniente las reservas de sus
clientes. Por otro lado, los clientes también manifiestan su interés en
poder encontrar los servicios que mejor se adaptan a sus necesidades y
poder realizar reservas de forma sencilla y accesible, evitando largas
esperas y contratiempos.

Para comprender mejor las necesidades y requerimientos, se realizó una
encuesta a diversos salones y peluquerías de la ciudad. A continuación,
se detallan los principales hallazgos.

=== Servicios ofrecidos

La mayoría de los establecimientos ofrece una variedad de servicios que
incluyen cortes de cabello para hombres y mujeres, peinados, tintes,
tratamientos capilares, alisados, ondulados, manicura, pedicura,
depilación, maquillaje y servicios especiales como paquetes para XV años
y bodas. Algunos también venden productos de belleza.

=== Precios promedio

Los precios promedio de los servicios más populares oscilan entre
100-200 BOB, aunque salones más especializados maneja precios más altos,
entre 300-500 BOB.

=== Manejo de citas

Actualmente, la mayoría de los salones maneja las citas de sus clientes
por orden de llegada, teléfono o simplemente WhatsApp, lo cual es
considerado poco eficiente por los encuestados.

=== Características deseadas en una aplicación

Las características más solicitadas para una aplicación de reservas
incluyen calendarios dinámicos, opciones de pago, recordatorios,
catálogos de servicios con descripción, valoraciones y reseñas de
clientes, sistema de puntos o recompensas, integración con redes
sociales, área de membresía par clientes frecuentes, chat con clientes y
notificaciones de ofertas y promociones.

=== Promoción de servicios

La mayoría de los establecimientos promueve sus servicios a través de
redes sociales, aunque algunos también usan publicidad impresa y el
boca-boca.

=== Interés en la nueva aplicación

La gran mayoría de los encuestados manifestó su interés en usar la nueva
la nueva aplicación como plataforma de marketing, publicidad y reservas.

=== Medición de satisfacción del cliente

Muchos de los establecimientos no miden actualmente la satisfacción de
sus clientes o lo hacen de manera informal, a través de
retroalimentación directa, reseñas en redes sociales o seguimiento de
clientes regulares.

=== Disposición a pagar por la aplicación

Mientras algunos establecimientos no estarían dispuestos a pagar una
cuota mensual por la aplicación, la mayoría estaría dispuesta a pagar
una cuota entre 70-150 BOB mensuales.

=== Cantidad de sucursales

La mayoría de los establecimientos encuestados cuenta con una sola
sucursal, aunque algunas peluquerías más grandes tienen hasta 10
sucursales.

== Encuestas a clientes y gráficas

=== Frecuencia de visitas

La mayoría visita las peluquerías o salones cada 2-3 semanas, una vez al
mes o cada 2-3 meses. Así como algunos visitan semanalmente y otros cada
6 meses o más.

=== Servicios solicitados

Los servicios más populares son cortes de cabello, tintes, tratamientos
capilares, manicura, pedicura, depilación y maquillaje. Los hombres
suelen solicitar principalmente cortes de cabello y arreglo de barba,
mientras que las mujeres solicitan una variedad más amplia de servicios.

=== Elección de establecimientos

Las principales formas son recomendaciones de amigos/familiares,
ubicación/cercanía y ser clientes frecuentes de un lugar. Otros factores
mencionados son publicidad, búsquedas en línea y que hagan un buen
trabajo por supuesto.

=== Uso de aplicaciones móviles

La mayoría no usa aplicaciones para reservar citas en peluquerías
actualmente, algunos clientes, especialmente los más jóvenes, si usan
aplicaciones similares.

=== Características deseadas en una aplicación

La más mencionada es el calendario o agenda en línea, opciones de pago
integradas, visualización de horarios, catálogo de servicios,
valoración/reseñas, ofertas/promociones y geolocalización de peluquerías
cercanas.

=== Preferencia de reserva

Muchos prefieren reservar por teléfono o no suelen reservar citas, otros
usan WhatsApp, mensajes de texto o reservan en persona.

=== Disposición a usar una nueva aplicación

La disposición de los clientes es alta, la mayoría quisiera usar una
nueva aplicación parar reservar citas

=== Pago a través de la aplicación

Aproximadamente la mitad estaría dispuesta a pagar las citas a través de
la aplicación, mientras que la otra mitad preferiría pagar de otra forma
