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

= Modelado y Diagramas UML
== Casos de Uso
=== Actores
- Administrador de Peluquería.

- Secretaria de Peluquería.

- Peluquero o estilista (empleado).

- Cliente.

- Administrador de la aplicación o plataforma.

=== Casos de Uso a Detalle
==== Gestionar Peluquería/Salón

=== Diagrama General

== Modelo de Dominio
== Modelo de Clases
== Diagrama de Paquetes
== Diagrama de Máquinas de Estado

