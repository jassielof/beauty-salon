#import "../template/versatile-apa/lib.typ": *

#let detailed-use-case(
  name: [],
  actors: [],
  type: [],
  purpose: [],
  precondition: [],
  description: [],
  workflow: [],
  alt-workflow: [],
  postcondition: [],
  reference: [],
  diagramas: (
    use-case: [],
    ui: [],
    package: [],
    sequence: [],
    activity: [],
  ),
) = {
  heading(name, level: 4)
  list(
    [Actores: #actors],
    [Tipo: #type],
    [Propósito: #purpose],
    [Precondición: #precondition],
    [Descripción: #description],
  )

  figure(
    caption: [Curso básico: #name],
    workflow,
    kind: table,
  )

  [Curso alternativo:]
}

#let uc-level = (
  user-goal: [Meta de usuario],
  subfunction: [Subfunción],
)

#let fully-dressed-use-case(
  name: [],
  scope: [Sistema de Salones de Belleza],
  level: uc-level.user-goal,
  primary-actor: [],
  stakeholders-interests: [],
  preconditions: [],
  success-guarantee: [],
  main-success-scenario: [],
  extension: [],
  special-requirements: [],
  technology-and-data-variations: [],
  frequency-of-occurrence: [],
  miscellaneous: [],
) = {
  heading(name, level: 4)

  if (level != uc-level.user-goal) and (level != uc-level.subfunction) {
    panic("El alcance del caso de uso no es válido: ", level)
  }

  apa-figure(
    caption: [CU: #name],
    kind: table,
    table(
      columns: 2,
      align: (left, left),
      table.hline(),
      table.header([Aspecto], [Descripción]),
      table.hline(),
      [Alcance], scope,
      [Nivel], level,
      [Actor Principal], primary-actor,
      [Interesados e Intereses], stakeholders-interests,
      [Precondiciones], preconditions,
      [Garantía de Éxito], success-guarantee,
      [Escenario Principal de Éxito], main-success-scenario,
      [Extensiones], extension,
      [Requerimientos Especiales], special-requirements,
      [Variaciones de Tecnología y Datos], technology-and-data-variations,
      [Frecuencia de Ocurrencia], frequency-of-occurrence,
      [Misceláneos], miscellaneous,
      table.hline()
    ),
  )
}

= Modelado y Diagramas UML
== Casos de Uso
=== Actores
- Administrador de Peluquería.
- Secretaria de Peluquería.
- Peluquero o estilista (empleado).
- Cliente.
- Administrador de la aplicación o plataforma.

#let uc-actors = (
  admin: [Administrador de Peluquería],
  secretary: [Secretaria de Peluquería],
  hairdresser: [Peluquero o estilista (empleado)],
  client: [Cliente],
  platform-admin: [Administrador de la aplicación o plataforma],
)

=== Casos de Uso (Fully Dressed)
#fully-dressed-use-case(
  name: [Gestionar Peluquería/Salón],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar una nueva peluquería en el sistema],
  preconditions: [],
  main-success-scenario: [
    + Se ingresa el nombre de la peluquería/salón, número de teléfono y correo electrónico.
    + Se verifica que la peluquería/salón no exista en el sistema.
    + Se ingresa la red social.
    + Se busca la red social.
    + Se ingresa el horario de atención.
    + Se busca el horario de atención.
    + Se ingresa el servicio.
    + Se busca el servicio.
    + Se guarda la información.
    + Se guarda la información de la nueva peluquería.
  ],
  extension: [
    + En el paso 2: Si el correo electrónico ya está registrado en el sistema, se puede eliminar, modificar o salir del sistema.
    + En el paso 4: Si no existe la red social, se puede modificar, eliminar, consultar o salir del sistema.
    + En el paso 6: Si no existe el horario de atención, se puede consultar, modificar, eliminar o salir del sistema.
    + En el paso 8: Si no existe el servicio, se puede consultar, modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [La peluquería/salón de belleza queda registrada en el sistema y podrá administrar sus citas. Además, se enviará el código de acceso al correo electrónico del administrador del salón recientemente registrado.],
)

#fully-dressed-use-case(
  name: [Gestionar métodos de pago],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Registrar los métodos de pago que podrán ser utilizados dentro de la aplicación para pagar la franquicia y otros pagos],
  success-guarantee: [Los métodos de pago quedan registrados en la plataforma para que las peluquerías puedan pagar su franquicia y otros pagos variables.],
  main-success-scenario: [
    + Se ingresa el método de pago.
    + Se verifica que no exista el método de pago.
    + Guarda el tipo de pago.
    + Guarda el tipo de pago.
  ],
  extension: [
    + En el paso 2: Si ya existe el método de pago se puede consultar, modificar, eliminar o salir del sistema.
  ],
  preconditions: [],
)

#fully-dressed-use-case(
  name: [Realizar pago de franquicia],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Realizar el pago de la franquicia de la plataforma para poder tener acceso a la misma],
  preconditions: [La peluquería debe estar registrada en el sistema],
  main-success-scenario: [
    + Se ingresa el método de pago a través del cual se va a pagar.
    + Se verifica que el método de pago seleccionado.
    + Se ingresan los datos del pago ya sea de la tarjeta o el comprobante por qr.
    + Se guarda en el sistema.
    + Se guarda en el sistema.
  ],
  extension: [
    + En el paso 2: Si no existe el método de pago seleccionado se puede consultar, modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [La peluquería o salón registrada tendrá acceso al sistema y a las herramientas provistas por la plataforma para administrar su salón. Se enviará un código al correo registrado con el cual el administrador podrá acceder a la plataforma de su peluquería.],
)

#fully-dressed-use-case(
  name: [Gestionar Horarios de atención],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar los horarios en los cuales una peluquería está ofreciendo sus servicios],
  preconditions: [La peluquería debe estar registrada en el sistema],
  main-success-scenario: [
    + El administrador ingresa el código de su peluquería.
    + Se verifica que la peluquería exista.
    + El administrador ingresa los horarios de atención según sea necesario.
    + Se guarda el horario de atención.
  ],
  extension: [
    + En el paso 2: Si no existe la peluquería, se puede editar, modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [Los nuevos horarios de atención quedan guardados en el sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar Redes Sociales],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar las redes sociales con las que cuenta un salón de belleza],
  preconditions: [La peluquería o salón debe estar registrada en la plataforma],
  main-success-scenario: [
    + El actor ingresa el código del salón de belleza.
    + Se verifica que el salón de belleza exista en el sistema.
    + Ingresa el enlace o URL de su red social.
    + Se verifica que la red social no este registrada en el sistema.
    + Se guarda.
  ],
  extension: [
    + En el paso 2: Si no se encuentra el salón, es decir el mail registrado, se puede modificar, eliminar o salir del sistema.
    + En el paso 4: Si la red social ya se encuentra registrada en el sistema, se puede eliminar, modificar o salir del sistema.
  ],
  success-guarantee: [La red social del salón queda registrada en el sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar Sucursales],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar las sucursales con las que cuenta un salón de belleza],
  preconditions: [La peluquería o salón debe estar registrada en la plataforma],
  main-success-scenario: [
    + El actor ingresa el código del salón de belleza.
    + Se verifica que el salón de belleza exista en el sistema.
    + Ingresa la información de la sucursal en el sistema como su dirección y número de teléfono.
    + Se verifica que la sucursal no este registrada en el sistema.
    + Se guarda.
  ],
  extension: [
    + En el paso 2: Si no se encuentra el salón, es decir el mail registrado, se puede modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [La sucursal del salón de belleza queda registrada en el sistema.],
)

#fully-dressed-use-case(
  name: [Actualizar Peluquería/Salón],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Actualizar la información de la peluquería],
  preconditions: [La peluquería salón debe estar registrada en la plataforma y tener acceso a ella],
  main-success-scenario: [
    + Se ingresa el nombre de la peluquería/salón, número de teléfono, correo electrónico.
    + Se verifica con el mail que el salón este registrado en el sistema.
    + Se ingresan las redes sociales.
    + Se buscan las redes sociales.
    + Se ingresan los horarios de atención.
    + Se buscan los horarios de atención.
    + Se insertan los servicios.
    + Se buscan los servicios.
    + Se guarda la información actualizada.
    + Se guardan los datos la peluquería/salón.
  ],
  extension: [
    + En el paso 2: Si no se encuentra la peluquería, es decir el mail registrado, se puede modificar, eliminar o salir del sistema.
    + En el paso 4: Si no existe la red social, se puede modificar, eliminar, consultar o salir del sistema.
    + En el paso 6: Si no existe el horario de atención, se puede consultar, modificar, eliminar o salir del sistema.
    + En el paso 8: Si no existe el servicio, se puede consultar, modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [La nueva información de la peluquería/salón se actualiza.],
)

#fully-dressed-use-case(
  name: [Gestionar Categorías],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Registrar las categorías para que los servicios puedan ser categorizados adecuadamente],
  preconditions: [],
  main-success-scenario: [
    + Se ingresa el nombre de la categoría.
    + Se verifica que la categoría no exista.
    + Se guarda.
  ],
  extension: [
    + En el paso 2: Si la categoría ya está registrada en el sistema, se puede eliminar, modificar o salir del sistema.
  ],
  success-guarantee: [La categoría queda registrada en el sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar Servicios],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar un servicio],
  preconditions: [La peluquería o salón debe estar registrada en el sistema y tener acceso al mismo],
  main-success-scenario: [
    + Se ingresa la categoría a la que pertenecerá el servicio.
    + Se verifica que la categoría exista.
    + Se ingresa el nombre del servicio, descripción, precio del servicio y duración estimada.
    + Se verifica que no exista el servicio con ese nombre.
    + Se guarda la información del servicio.
  ],
  extension: [
    + En el paso 2: Si no existe la peluquería/salón, se puede eliminar, modificar o salir del sistema.
    + En el paso 4: Si el servicio ya existe, se puede eliminar, modificar o salir del sistema.
  ],
  success-guarantee: [El servicio queda registrado en la plataforma del salón.],
)

#fully-dressed-use-case(
  name: [Gestionar Promociones y Ofertas],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Registrar los tipos de promociones que se podrán ofrecer],
  preconditions: [],
  main-success-scenario: [
    + Se ingresa el nombre de la promoción.
    + Se verifica que no exista la promoción.
    + Se guarda.
  ],
  extension: [
    + En el paso 2: Si la promoción ya existe en el sistema, se puede eliminar, modificar o salir del sistema.
  ],
  success-guarantee: [La promoción queda registrada para que pueda ser utilizada en la aplicación.],
)

#fully-dressed-use-case(
  name: [Gestionar Promoción u Oferta],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Gestionar promociones y ofertas en los servicios ofrecidos],
  preconditions: [El establecimiento, y el servicio deben estar registrados],
  main-success-scenario: [
    + Se ingresa el código del salón.
    + Se verifica que exista el salón.
    + Se ingresa el código del servicio que tendrá la promoción.
    + Se verifica que el servicio exista.
    + Se ingresa la promoción que tendrá.
    + Se guarda.
  ],
  extension: [
    + En el paso 2: Si no existe el salón se puede eliminar, modificar o salir del sistema.
    + En el paso 4: Si no existe el servicio se puede eliminar, modificar o salir del sistema.
  ],
  success-guarantee: [Las promociones y ofertas en los servicios ofrecidos se guardan correctamente en el sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar usuarios],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Gestionar los usuarios de todo tipo del salón],
  preconditions: [El salón debe estar registrado y además debe tener acceso al sistema],
  main-success-scenario: [
    + Se ingresa el empleado.
    + Se busca al empleado.
    + Se ingresa el rol.
    + Se busca el rol.
    + Se gurda la información del usuario.
  ],
  extension: [],
  success-guarantee: [El salón de belleza debe estar registrado y debe tener acceso al sistema.],
)

#fully-dressed-use-case(
  name: [Actualizar Servicio],
  primary-actor: uc-actors.secretary,
  stakeholders-interests: [Actualizar servicio ofrecido por el salón],
  preconditions: [El salón de belleza debe estar registrado y debe tener acceso al sistema],
  main-success-scenario: [
    + Se ingresa el servicio.
    + Se verifica que el servicio exista.
    + Se ingresa la categoría.
    + Se busca la categoría.
    + Se ingresa la descripción, precio del servicio y duración estimada.
    + Se verifica que el servicio exista dentro del sistema.
    + Se guarda la información del servicio.
  ],
  extension: [
    + En el paso 2: Si no existe el servicio, se puede consultar, eliminar, modificar o salir del sistema.
    + En el paso 4: Si la categoría ingresada no existe, se puede consultar, modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [La información del servicio queda actualizada en el sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar Géneros],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Registrar los géneros],
  preconditions: [],
  main-success-scenario: [
    + Se ingresa el nombre del género.
    + Se verifica que el género no exista dentro del sistema.
    + Se guardan los cambios.
  ],
  extension: [
    + En el paso 2: Si el género ya está registrado en el sistema, se puede eliminar, modificar o salir del sistema.
  ],
  success-guarantee: [Los géneros quedan registrados en el sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar Empleados],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar empleados en el salón],
  preconditions: [El salón de belleza debe estar registrado],
  main-success-scenario: [
    + El administrador ingresa el código del salón.
    + Se verifica que la sucursal exista.
    + El administrador ingresa los datos del empleado como nombre, apellidos, teléfono, email.
    + Se verifica que no haya otro empleado registrado con el mismo email.
    + Se guardan los cambios.
  ],
  extension: [
    + En el paso 2: Si no existe el salón se puede modificar, eliminar o salir del sistema.
    + En el paso 4: Si el email ingresado ya está registrado se puede eliminar, modificar o salir del sistema.
  ],
  success-guarantee: [Los cambios en los datos de los empleados quedan guardados en el sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar horarios de empleados],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar los horarios en los cuales el empleado trabajará en el salón],
  preconditions: [El salón y el empleado deben estar registrados en el sistema],
  main-success-scenario: [
    + Se ingresa el código del salón de belleza.
    + Se verifica que el salón exista.
    + Se ingresa el código del empleado.
    + Se verifica que el empleado exista en el sistema.
    + Se ingresa sus horarios de trabajo por cada día.
    + Se guarda.
  ],
  extension: [
    + En el paso 2: Si no existe el salón, se puede editar, modificar, eliminar o salir del sistema.
    + En el paso 4: Si no existe el empleado, se puede modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [Los horarios de atención de los empleados del salón quedan registrados en el sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar especialidad],
  primary-actor: uc-actors.hairdresser,
  stakeholders-interests: [Registrar la especialidad de cada empleado en el sistema],
  preconditions: [El empleado debe estar registrado en el sistema],
  main-success-scenario: [
    + Se ingresa el código del empleado.
    + Se verifica que el empleado exista.
    + Se ingresa la especialidad.
    + Se verifica que no se haya ingresado la especialidad anteriormente.
    + Se guarda.
  ],
  extension: [
    + En el paso 2: Si no existe el empleado, se puede editar, modificar, eliminar o salir del sistema.
    + En el paso 4: Si la especialidad ya ha sido registrada anteriormente se puede modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [La especialidad de los empleados queda registrada en el sistema.],
)

#fully-dressed-use-case(
  name: [Actualizar Empleados],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Actualizar los datos de un empleado de la peluquería],
  preconditions: [El empleado debe estar registrado en el sistema],
  main-success-scenario: [
    + El administrador ingresa el código del salón.
    + Se verifica que el salón exista.
    + El administrador ingresa el código de su empleado.
    + Se verifica que exista el empleado.
    + El administrador ingresa los datos a actualizar del empleado.
    + Se guardan los datos.
  ],
  extension: [
    + En el paso 2: Si no existe el salón se puede modificar, eliminar o salir del sistema.
    + En el paso 4: Si no existe el empleado se puede modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [Los datos del empleado seleccionado se actualizan en el sistema.],
)

#fully-dressed-use-case(
  name: [Eliminar Empleados],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Eliminar un empleado del sistema y de su peluquería],
  preconditions: [El empleado debe estar registrado en el sistema],
  main-success-scenario: [
    + El administrador ingresa el código del empleado que desea eliminar.
    + Se verifica que el empleado exista.
    + El administrador presiona el botón de eliminar empleado.
    + Se elimina el empleado.
  ],
  extension: [
    + En el paso 2: Si el empleado no existe se puede modificar o salir del sistema.
  ],
  success-guarantee: [El empleado seleccionado es eliminado del sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar Clientes],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Registrar clientes para que puedan tener acceso a la plataforma],
  preconditions: [El cliente debe poder ingresar a la plataforma],
  main-success-scenario: [
    + Se escribe el nombre, apellidos, teléfono, correo electrónico y sexo.
    + Se verifica que el correo electrónico no exista.
    + Se guarda la información del cliente.
  ],
  extension: [
    + En el paso 2: En el paso 2 si el correo electrónico ya está registrado, se puede eliminar, modificar o salir del sistema.
  ],
  success-guarantee: [El cliente queda registrado y puede acceder a la plataforma para realizar reservas.],
)

#fully-dressed-use-case(
  name: [Gestionar Cliente fiel],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar los clientes que son fieles a su peluquería],
  preconditions: [El cliente y el salón deben estar registrados en el sistema],
  main-success-scenario: [
    + Se ingresa el código del salón de belleza.
    + Se verifica que el salón exista.
    + Se ingresa el código del cliente.
    + Se verifica que el cliente exista en el sistema.
    + Se cambia el estado del cliente a cliente fiel a esa peluquería en el sistema.
    + Se guarda.
  ],
  extension: [
    + En el paso 2: Si no existe el salón, se puede editar, modificar, eliminar o salir del sistema.
    + En el paso 4: Si no existe el cliente, se puede modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [El cliente queda registrado como cliente fiel al salón en el sistema.],
)

#fully-dressed-use-case(
  name: [Actualizar Clientes],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Modificar la información de un cliente de la plataforma],
  preconditions: [El cliente debe estar registrado en la plataforma],
  main-success-scenario: [
    + Se escribe el nombre, apellidos, teléfono, correo electrónico y sexo.
    + Se verifica que el correo electrónico exista en el sistema.
    + Se guarda la nueva información del cliente.
  ],
  extension: [
    + En el paso 2: En el paso 2 si el correo electrónico no está registrado, se puede eliminar, modificar o salir del sistema.
  ],
  success-guarantee: [La información del cliente queda actualizada.],
)

#fully-dressed-use-case(
  name: [Gestionar Roles],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Registrar los roles que habrá dentro de la plataforma],
  preconditions: [],
  main-success-scenario: [
    + Se ingresa el nuevo rol.
    + Se verifica que el rol no exista.
    + Se guarda.
  ],
  extension: [
    + En el paso 2: Si existe el rol, se puede modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [Los roles quedan registrados en el sistema.],
)

#fully-dressed-use-case(
  name: [Gestionar Reservas],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Realizar la reserva de un servicio de una peluquería],
  preconditions: [El cliente debe estar registrado en la plataforma],
  main-success-scenario: [
    + Se ingresa el nombre de la peluquería/salón.
    + Se verifica que la peluquería exista.
    + Se ingresa el nombre del servicio requerido.
    + Se verifica que el servicio exista.
    + Se ingresa el nombre del estilista.
    + Se verifica que el estilista exista.
    + Se ingresa la fecha de reserva, imágenes de referencia, detalles y preferencias de pago.
    + Se guarda la información de la cita.
  ],
  extension: [
    + En el paso 2: Si no existe la peluquería, se elimina, modifica, se consulta o se sale del sistema.
    + En el paso 4: Si no existe el servicio, se elimina, modifica, se consulta o se sale del sistema.
    + En el paso 6: Si no existe el estilista, se elimina, modifica, se consulta o se sale del sistema.
  ],
  success-guarantee: [La cita queda registrada.],
)

#fully-dressed-use-case(
  name: [Actualizar Cita],
  primary-actor: uc-actors.secretary,
  stakeholders-interests: [Permitir actualizar los detalles de una cita existente en el sistema],
  preconditions: [Tener acceso al sistema, existe al menos una cita registrada],
  main-success-scenario: [
    + La secretaria o el peluquero selecciona la opción “Actualizar Cita” en el sistema.
    + El sistema muestra una lista de citas programadas.
    + La secretaria o el peluquero selecciona la cita que desea actualizar.
    + El sistema muestra los detalles de la cita seleccionada.
    + La secretaria o el peluquero modifica los detalles de la cita: fecha, hora, tipo de servicio y estado.
    + Guarda la información en el sistema.
  ],
  extension: [
    + En el paso 2: Si no hay citas programadas se sale del sistema.
    + En el paso 4: Si la cita ya no está disponible para actualizar, el sistema muestra un mensaje indicando que la cita seleccionada ya no está disponible para actualizar y vuelve al paso 2.
    + En el paso 6: Si el sistema no puede actualizar la cita debido a un error, el sistema muestra un mensaje de error y la secretaria o el peluquero intenta actualizar la cita nuevamente.
  ],
  success-guarantee: [Los detalles de la cita seleccionada se actualizan.],
)

#fully-dressed-use-case(
  name: [Anular Cita],
  primary-actor: uc-actors.secretary,
  stakeholders-interests: [Permitir la anulación de una cita previamente agendada],
  preconditions: [La cita debe existir],
  main-success-scenario: [
    + La secretaria o el cliente selecciona la opción “Anular Cita” en el sistema.
    + El sistema muestra una lista de citas agendadas.
    + La secretaria o el cliente selecciona la cita que desea anular.
    + Busca la cita.
    + Se confirma la anulación.
    + El sistema elimina la cita del sistema.
  ],
  extension: [
    + En el paso 2: Si no hay citas agendadas se sale del sistema.
    + En el paso 4: Si no se encuentra la cita, se puede modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [La cita queda eliminada.],
)

#fully-dressed-use-case(
  name: [Elaborar Reportes de citas mensuales],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Generar reportes mensuales de citas],
  preconditions: [Existen citas programadas en el sistema],
  main-success-scenario: [
    + Ingresa la fecha de la cual quiere obtener el reporte.
    + El sistema busca las citas, estilistas, servicios y la información necesaria y elabora un reporte.
    + Se muestra el reporte.
  ],
  extension: [
    + En el paso 2: Si no hay citas programadas para la fecha seleccionada, el sistema muestra un mensaje indicando que no hay citas para ese periodo.
  ],
  success-guarantee: [El reporte de citas mensuales se genera correctamente.],
)

#fully-dressed-use-case(
  name: [Generar Agenda Diaria],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Generar una agenda diaria con las citas programadas],
  preconditions: [Tener acceso al sistema y que existan citas programadas para el salón],
  main-success-scenario: [
    + El administrador o la secretaría selecciona la opción “Generar agenda diaria” en el sistema.
    + El sistema muestra un calendario con las fechas disponibles.
    + El administrador o la secretaria selecciona la fecha para la cual desea generar la agenda.
    + El sistema muestra la agenda diaria con las citas programadas para esa fecha.
  ],
  extension: [
    + Si en el paso 3 no hay citas programadas para la fecha seleccionada, el sistema muestra un mensaje indicando que no hay citas para esa fecha y se puede modificar o salir del sistema.
  ],
  success-guarantee: [La agenda diaria con las citas programadas se genera correctamente.],
)

#fully-dressed-use-case(
  name: [Generar Historial de citas de los clientes],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Visualizar el historial de citas de los clientes con el salón de belleza],
  preconditions: [Existen clientes registrados, citas programadas en el sistema y se debe tener acceso al sistema],
  main-success-scenario: [
    + El administrador selecciona la opción “Generar historial de citas en el sistema”.
    + El sistema muestra una lista de clientes registrados que han reservado una cita con su salón de belleza.
    + El administrador selecciona el cliente del cual desea ver el historial.
    + El sistema muestra el historial de citas del cliente seleccionado.
  ],
  extension: [
    + Si no hay clientes registrados, el sistema muestra un mensaje indicando que no hay clientes registrados.
  ],
  success-guarantee: [El historial de citas del cliente seleccionado se genera correctamente.],
)

#fully-dressed-use-case(
  name: [Realizar Reseña de servicio],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Permitir que los clientes realicen reseñas sobre los servicios recibidos],
  preconditions: [El cliente recibió un servicio y debe tener acceso al sistema],
  main-success-scenario: [
    + Después de recibir el servicio, el sistema solicita al cliente realizar una reseña.
    + El cliente ingresa su calificación y comentarios sobre el servicio recibido.
    + El sistema guarda la reseña del cliente.
  ],
  extension: [
    + En el paso 3: Si el cliente no desea dejar una reseña puede salir del sistema.
  ],
  success-guarantee: [La reseña del cliente sobre el servicio recibido se guarda correctamente en el sistema.],
)

#fully-dressed-use-case(
  name: [Realizar Pagos en línea],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Permitir que los clientes realicen pagos en línea por los servicios recibidos],
  preconditions: [El establecimiento ofrece servicios],
  main-success-scenario: [
    + Se ingresa el servicio que se va a pagar.
    + Se verifica que la cita y el servicio existan.
    + El cliente elige el método de pago.
    + Se guarda el pago.
  ],
  extension: [
    + En el paso 2: Si no exista la cita o no exista el servicio se puede modificar, eliminar o salir del sistema.
  ],
  success-guarantee: [El pago queda registrado en el sistema.],
)

== Modelo de Dominio
#image("../diagrams/domain.svg")

== Modelo de Clases
#image("../diagrams/class.svg")

== Diagrama de Paquetes
#image("../diagrams/package.svg")

== Diagrama de Máquinas de Estado

