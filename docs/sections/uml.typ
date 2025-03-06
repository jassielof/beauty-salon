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
    + Ingresar nombre, número de teléfono y correo electrónico del salón.
    + Verificar que el salón no exista en el sistema.
    + Agregar enlaces de redes sociales del salón.
    + Ingresar horario de atención.
    + Seleccionar servicios ofrecidos.
    + Guardar información del salón.
  ],
  extension: [
    + Si el correo ya está registrado (paso 2), el usuario puede actualizar los datos o salir.
    + Si faltan datos obligatorios (cualquier paso), el sistema muestra un mensaje de error.
  ],
  success-guarantee: [El salón queda registrado y puede administrar citas.],
  special-requirements: [Conexión a internet, acceso al sistema],
  technology-and-data-variations: [Puede usarse en web o app móvil],
  frequency-of-occurrence: [Una vez por nuevo salón],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar métodos de pago],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Definir formas de pago aceptadas en la plataforma],
  preconditions: [],
  main-success-scenario: [
    + Ingresar nombre del método de pago (ej: Tarjeta, QR).
    + Verificar que no exista en la base de datos.
    + Guardar el método de pago.
  ],
  extension: [
    + Si el método ya existe (paso 2), el administrador puede modificarlo o eliminarlo.
  ],
  success-guarantee: [El método de pago queda disponible para todos los salones.],
  special-requirements: [Acceso administrativo al sistema],
  technology-and-data-variations: [Integración con pasarelas de pago],
  frequency-of-occurrence: [Bajo (solo cuando se agregan nuevos métodos)],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Realizar pago de franquicia],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Pagar cuota de acceso a la plataforma],
  preconditions: [El salón debe estar registrado],
  main-success-scenario: [
    + Seleccionar método de pago.
    + Ingresar datos de pago (número de tarjeta o código QR).
    + Confirmar pago.
    + Recibir comprobante por correo.
  ],
  extension: [
    + Si el pago falla, el sistema muestra opciones de ayuda.
  ],
  success-guarantee: [El salón obtiene acceso completo a la plataforma.],
  special-requirements: [Conexión segura, datos bancarios válidos],
  technology-and-data-variations: [Integración con bancos],
  frequency-of-occurrence: [Mensual o anual],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Horarios de atención],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Actualizar horarios de servicios],
  preconditions: [El salón debe estar registrado],
  main-success-scenario: [
    + Ingresar código del salón.
    + Verificar existencia del salón.
    + Agregar nuevos horarios o modificar existentes.
    + Guardar cambios.
  ],
  extension: [
    + Si el código es incorrecto (paso 2), el sistema sugiere salones similares.
  ],
  success-guarantee: [Los horarios se actualizan automáticamente en todas las plataformas.],
  special-requirements: [Formato de hora válido],
  technology-and-data-variations: [Sincronización en tiempo real],
  frequency-of-occurrence: [Semanal o cuando cambian horarios],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Redes Sociales],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Enlazar perfiles sociales del salón],
  preconditions: [El salón debe estar registrado],
  main-success-scenario: [
    + Ingresar código del salón.
    + Verificar existencia.
    + Agregar URL de redes sociales (ej: Instagram, Facebook).
    + Guardar enlaces.
  ],
  extension: [
    + Si la URL es inválida, el sistema muestra un mensaje de error.
  ],
  success-guarantee: [Los enlaces aparecen en el perfil del salón.],
  special-requirements: [URL válidas],
  technology-and-data-variations: [Validación automática de URLs],
  frequency-of-occurrence: [Cuando se crean nuevas redes sociales],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Sucursales],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar ubicaciones adicionales],
  preconditions: [El salón debe estar registrado],
  main-success-scenario: [
    + Ingresar código del salón principal.
    + Verificar existencia.
    + Agregar dirección, teléfono y horario de la sucursal.
    + Guardar información.
  ],
  extension: [
    + Si la dirección ya existe, el sistema sugiere sucursales similares.
  ],
  success-guarantee: [La sucursal aparece en el directorio del salón.],
  special-requirements: [Formato de dirección válido],
  technology-and-data-variations: [Integración con mapas],
  frequency-of-occurrence: [Cuando abre una nueva sucursal],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Actualizar Peluquería/Salón],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Modificar información del salón],
  preconditions: [El salón debe estar registrado],
  main-success-scenario: [
    + Ingresar nuevos datos (nombre, teléfono, correo).
    + Verificar cambios.
    + Guardar actualización.
  ],
  extension: [
    + Si el correo nuevo ya existe, el sistema pide confirmación.
  ],
  success-guarantee: [Todos los cambios se reflejan inmediatamente.],
  special-requirements: [Permisos de administrador],
  technology-and-data-variations: [Historial de cambios],
  frequency-of-occurrence: [Cuando hay cambios en el negocio],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Categorías],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Crear clasificaciones de servicios],
  preconditions: [],
  main-success-scenario: [
    + Ingresar nombre de la categoría (ej: Corte, Tintura).
    + Verificar originalidad.
    + Guardar en la base de datos.
  ],
  extension: [
    + Si la categoría existe, el sistema sugiere variaciones.
  ],
  success-guarantee: [La categoría aparece en todos los filtros de búsqueda.],
  special-requirements: [Acceso administrativo],
  technology-and-data-variations: [Traducción a múltiples idiomas],
  frequency-of-occurrence: [Cuando se crean nuevos tipos de servicios],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Servicios],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Agregar nuevos servicios al salón],
  preconditions: [El salón debe estar registrado],
  main-success-scenario: [
    + Seleccionar categoría del servicio.
    + Ingresar nombre, descripción y precio.
    + Agregar tiempo estimado de duración.
    + Guardar servicio.
  ],
  extension: [
    + Si la categoría no existe, el sistema sugiere crear una nueva.
  ],
  success-guarantee: [El servicio aparece en el menú del salón.],
  special-requirements: [Formato de precio válido],
  technology-and-data-variations: [Fotos y videos del servicio],
  frequency-of-occurrence: [Cuando se lanzan nuevos servicios],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Promociones y Ofertas],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Crear tipos de descuentos disponibles],
  preconditions: [],
  main-success-scenario: [
    + Ingresar nombre de la promoción (ej: 2x1, Descuento 50%).
    + Verificar originalidad.
    + Guardar en la plataforma.
  ],
  extension: [
    + Si el nombre coincide con una promoción existente, el sistema pide confirmación.
  ],
  success-guarantee: [La promoción queda disponible para todos los salones.],
  special-requirements: [Formato de nombre claro],
  technology-and-data-variations: [validación de fechas],
  frequency-of-occurrence: [Al inicio de campañas promocionales],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Promoción u Oferta],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Aplicar promociones a servicios específicos],
  preconditions: [El salón y el servicio deben estar registrados],
  main-success-scenario: [
    + Seleccionar servicio.
    + Elegir tipo de promoción.
    + Establecer fechas de vigencia.
    + Guardar configuración.
  ],
  extension: [
    + Si el servicio ya tiene promoción activa, el sistema sugiere alternativas.
  ],
  success-guarantee: [Los clientes ven la promoción en el catálogo.],
  special-requirements: [Fechas válidas],
  technology-and-data-variations: [Contadores de usos],
  frequency-of-occurrence: [Durante campañas especiales],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar usuarios],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar empleados y asignar roles],
  preconditions: [El salón debe estar registrado],
  main-success-scenario: [
    + Ingresar datos del empleado (nombre, email, teléfono).
    + Asignar rol (peluquero, secretaria, administrador).
    + Guardar usuario.
  ],
  extension: [
    + Si el email ya existe, el sistema sugiere recuperar cuenta.
  ],
  success-guarantee: [El empleado puede ingresar con sus credenciales.],
  special-requirements: [Formato de email válido],
  technology-and-data-variations: [Autenticación por SMS o email],
  frequency-of-occurrence: [Al contratar nuevos empleados],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Actualizar Servicio],
  primary-actor: uc-actors.secretary,
  stakeholders-interests: [Modificar información de servicios],
  preconditions: [El salón debe estar registrado],
  main-success-scenario: [
    + Seleccionar servicio a actualizar.
    + Modificar descripción, precio o duración.
    + Guardar cambios.
  ],
  extension: [
    + Si el precio nuevo es mayor al anterior, el sistema pide confirmación.
  ],
  success-guarantee: [Los clientes ven la información actualizada.],
  special-requirements: [Permisos de edición],
  technology-and-data-variations: [Historial de cambios],
  frequency-of-occurrence: [Cuando hay cambios en los servicios],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Géneros],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Registrar opciones de género para clientes],
  preconditions: [],
  main-success-scenario: [
    + Ingresar nombre del género (ej: Masculino, Femenino, No binario).
    + Verificar originalidad.
    + Guardar en la base de datos.
  ],
  extension: [
    + Si el género existe, el sistema sugiere alternativas.
  ],
  success-guarantee: [Las opciones aparecen en los formularios de registro.],
  special-requirements: [Acceso administrativo],
  technology-and-data-variations: [Soporte para identidades no binarias],
  frequency-of-occurrence: [Cuando se actualizan políticas de inclusión],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Empleados],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Registrar información laboral de empleados],
  preconditions: [El salón debe estar registrado],
  main-success-scenario: [
    + Ingresar datos personales del empleado.
    + Asignar especialidad y horario.
    + Guardar información.
  ],
  extension: [
    + Si el email ya existe, el sistema sugiere recuperar cuenta.
  ],
  success-guarantee: [El empleado aparece en el directorio del salón.],
  special-requirements: [Formato de fecha válido para contratación],
  technology-and-data-variations: [Fotos de perfil],
  frequency-of-occurrence: [Al contratar nuevos empleados],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar horarios de empleados],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Configurar disponibilidad laboral],
  preconditions: [El empleado debe estar registrado],
  main-success-scenario: [
    + Seleccionar empleado.
    + Establecer horarios por días de la semana.
    - Guardar configuración.
  ],
  extension: [
    + Si hay conflictos con otros horarios, el sistema sugiere soluciones.
  ],
  success-guarantee: [Los clientes ven los horarios disponibles al reservar.],
  special-requirements: [Formato de hora válido],
  technology-and-data-variations: [Sincronización con calendarios],
  frequency-of-occurrence: [Cuando cambian los horarios laborales],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar especialidad],
  primary-actor: uc-actors.hairdresser,
  stakeholders-interests: [Registrar habilidades profesionales],
  preconditions: [El empleado debe estar registrado],
  main-success-scenario: [
    + Ingresar descripción de la especialidad.
    + Subir ejemplos de trabajo (fotos o videos).
    + Guardar información.
  ],
  extension: [
    + Si la especialidad ya existe, el sistema sugiere alternativas.
  ],
  success-guarantee: [Los clientes pueden filtrar por esta especialidad.],
  special-requirements: [Formato de archivo válido],
  technology-and-data-variations: [Galería multimedia],
  frequency-of-occurrence: [Al actualizar portafolio],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Actualizar Empleados],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Modificar información de empleados],
  preconditions: [El empleado debe estar registrado],
  main-success-scenario: [
    + Seleccionar empleado.
    + Modificar datos (teléfono, email, especialidad).
    + Guardar cambios.
  ],
  extension: [
    + Si el nuevo email ya existe, el sistema pide confirmación.
  ],
  success-guarantee: [La información se actualiza en todos los sistemas.],
  special-requirements: [Permisos de administrador],
  technology-and-data-variations: [Notificaciones automáticas al empleado],
  frequency-of-occurrence: [Cuando hay cambios en el empleado],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Eliminar Empleados],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Dar de baja empleados del sistema],
  preconditions: [El empleado debe estar registrado],
  main-success-scenario: [
    + Seleccionar empleado.
    + Confirmar eliminación.
    + El sistema archiva el registro.
  ],
  extension: [
    + Si el empleado tiene citas pendientes, el sistema pide reasignarlas.
  ],
  success-guarantee: [El empleado no aparece más en el directorio.],
  special-requirements: [Permisos de administrador],
  technology-and-data-variations: [Respaldo automático de datos],
  frequency-of-occurrence: [Al dar de baja empleados],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Clientes],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Registrarse en la plataforma],
  preconditions: [],
  main-success-scenario: [
    + Ingresar datos personales (nombre, email, teléfono).
    + Elegir género de preferencia.
    + Crear contraseña.
    + Guardar cuenta.
  ],
  extension: [
    + Si el email ya existe, el sistema sugiere recuperar cuenta.
  ],
  success-guarantee: [El cliente puede reservar servicios.],
  special-requirements: [Formato de email válido],
  technology-and-data-variations: [Autenticación por redes sociales],
  frequency-of-occurrence: [Al registrarse nuevos clientes],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Cliente fiel],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Reconocer clientes frecuentes],
  preconditions: [El cliente y el salón deben estar registrados],
  main-success-scenario: [
    + Seleccionar cliente.
    + Activar opción "Cliente Fiel".
    + Guardar configuración.
  ],
  extension: [
    + Si el cliente ya es fiel, el sistema muestra su historial.
  ],
  success-guarantee: [El cliente recibe beneficios especiales.],
  special-requirements: [Políticas de fidelidad definidas],
  technology-and-data-variations: [Notificaciones automáticas al cliente],
  frequency-of-occurrence: [Cuando el cliente alcanza un umbral de visitas],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Actualizar Clientes],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Modificar información personal],
  preconditions: [El cliente debe estar registrado],
  main-success-scenario: [
    + Editar datos (teléfono, email, preferencias).
    + Guardar cambios.
  ],
  extension: [
    + Si el nuevo email ya existe, el sistema pide confirmación.
  ],
  success-guarantee: [La información se actualiza en todos los sistemas.],
  special-requirements: [Autenticación previa],
  technology-and-data-variations: [Validación de cambios por SMS],
  frequency-of-occurrence: [Cuando hay cambios personales],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Roles],
  primary-actor: uc-actors.platform-admin,
  stakeholders-interests: [Crear nuevos roles de usuario],
  preconditions: [],
  main-success-scenario: [
    + Ingresar nombre del rol (ej: Administrador, Peluquero).
    + Definir permisos asociados.
    + Guardar rol.
  ],
  extension: [
    + Si el rol ya existe, el sistema sugiere alternativas.
  ],
  success-guarantee: [El rol queda disponible para asignación.],
  special-requirements: [Acceso administrativo],
  technology-and-data-variations: [Plantillas de permisos],
  frequency-of-occurrence: [Al crear nuevos tipos de usuario],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Gestionar Reservas],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Reservar servicios en línea],
  preconditions: [El cliente debe estar registrado],
  main-success-scenario: [
    + Seleccionar salón y servicio.
    + Elegir fecha y hora disponible.
    + Confirmar reserva.
    + Recibir comprobante por email.
  ],
  extension: [
    + Si no hay horarios disponibles, el sistema sugiere alternativas.
  ],
  success-guarantee: [La cita aparece en el calendario del cliente y el salón.],
  special-requirements: [Conexión a internet],
  technology-and-data-variations: [Integración con calendarios externos],
  frequency-of-occurrence: [Cada vez que un cliente reserva],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Actualizar Cita],
  primary-actor: uc-actors.secretary,
  stakeholders-interests: [Modificar citas existentes],
  preconditions: [Tener acceso al sistema],
  main-success-scenario: [
    + Seleccionar cita.
    + Modificar fecha, hora o servicio.
    + Guardar cambios.
  ],
  extension: [
    + Si la nueva fecha está ocupada, el sistema sugiere alternativas.
  ],
  success-guarantee: [Los cambios se notifican al cliente automáticamente.],
  special-requirements: [Permisos de edición],
  technology-and-data-variations: [Notificaciones push],
  frequency-of-occurrence: [Cuando hay cambios en las citas],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Anular Cita],
  primary-actor: uc-actors.secretary,
  stakeholders-interests: [Cancelar citas programadas],
  preconditions: [La cita debe existir],
  main-success-scenario: [
    + Seleccionar cita.
    + Confirmar anulación.
    + El sistema libera la hora.
  ],
  extension: [
    + Si la cita ya fue atendida, el sistema muestra un mensaje de error.
  ],
  success-guarantee: [La cita se elimina de ambos calendarios.],
  special-requirements: [Justificación para anulación],
  technology-and-data-variations: [Políticas de cancelación],
  frequency-of-occurrence: [Cuando se cancelan citas],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Elaborar Reportes de citas mensuales],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Generar estadísticas de citas],
  preconditions: [Existen citas registradas],
  main-success-scenario: [
    + Seleccionar mes.
    + El sistema genera un reporte con:
      - Número de citas
      - Ingresos totales
      - Servicios más solicitados
  ],
  extension: [
    + Si no hay citas en el mes, el sistema sugiere otros periodos.
  ],
  success-guarantee: [El reporte se puede exportar a Excel o PDF.],
  special-requirements: [Formato de fecha válido],
  technology-and-data-variations: [Gráficos interactivos],
  frequency-of-occurrence: [Mensual],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Generar Agenda Diaria],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Ver citas del día],
  preconditions: [Existen citas registradas],
  main-success-scenario: [
    + Seleccionar fecha.
    + El sistema muestra:
      - Citas programadas
      - Horarios libres
      - Empleados disponibles
  ],
  extension: [
    + Si no hay citas, el sistema sugiere promociones.
  ],
  success-guarantee: [La agenda se actualiza automáticamente.],
  special-requirements: [Formato de fecha válido],
  technology-and-data-variations: [Vista calendario],
  frequency-of-occurrence: [Diario],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Generar Historial de citas de los clientes],
  primary-actor: uc-actors.admin,
  stakeholders-interests: [Ver historial de servicios de un cliente],
  preconditions: [Existen citas registradas],
  main-success-scenario: [
    + Seleccionar cliente.
    + El sistema muestra:
      - Todas las citas anteriores
      - Servicios más frecuentes
      - Última valoración
  ],
  extension: [
    + Si no hay historial, el sistema sugiere crear una cita.
  ],
  success-guarantee: [El historial se actualiza con cada nueva cita.],
  special-requirements: [Permisos de privacidad],
  technology-and-data-variations: [Exportación de datos],
  frequency-of-occurrence: [Al revisar información de clientes],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Realizar Reseña de servicio],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Calificar servicios recibidos],
  preconditions: [El cliente recibió el servicio],
  main-success-scenario: [
    + Calificar del 1 al 5 estrellas.
    + Escribir comentarios.
    + Publicar reseña.
  ],
  extension: [
    + Si el cliente no desea dejar comentario, solo califica.
  ],
  success-guarantee: [La reseña aparece en el perfil del salón.],
  special-requirements: [Autenticación del cliente],
  technology-and-data-variations: [Fotos de reseñas],
  frequency-of-occurrence: [Después de cada cita],
  miscellaneous: [],
)

#fully-dressed-use-case(
  name: [Realizar Pagos en línea],
  primary-actor: uc-actors.client,
  stakeholders-interests: [Pagar servicios directamente en la plataforma],
  preconditions: [Existe una cita confirmada],
  main-success-scenario: [
    + Seleccionar cita.
    + Elegir método de pago.
    + Ingresar datos de pago.
    + Confirmar transacción.
  ],
  extension: [
    + Si el pago falla, el sistema sugiere alternativas.
  ],
  success-guarantee: [El cliente recibe un comprobante por email.],
  special-requirements: [Conexión segura],
  technology-and-data-variations: [Criptografía de datos],
  frequency-of-occurrence: [Al momento de pagar],
  miscellaneous: [],
)

== Modelo de Dominio
#image("../diagrams/domain.svg")

== Modelo de Clases
#image("../diagrams/class.svg")

== Diagrama de Paquetes
#image("../diagrams/package.svg")

== Diagrama de Máquinas de Estado

