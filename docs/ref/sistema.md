# Modelado UML y Diagramas

## Casos de Uso

### Actores

- Administrador de Peluquería.

- Secretaria de Peluquería.

- Peluquero o estilista (empleado).

- Cliente.

- Administrador de la aplicación o plataforma.

### Casos de Uso a Detalle

1. **Gestionar Peluquería/Salón**

> **Actores:** Administrador de peluquería/salón de belleza
>
> **Tipo:** Primario
>
> **Propósito:** Registrar una nueva peluquería en el sistema
>
> **Precondición:** N/A
>
> **Descripción:** El administrador de la peluquería deberá ingresar la
> información básica de su peluquería en el sistema como: nombre de la
> peluquería, dirección, número de teléfono, correo electrónico, redes
> sociales, horarios de atención y servicios para que quede registrada
> en la plataforma.
>
> **Basic Course:**

| **Actor Actions**                                                | **System Actions**                                                     |
| ---------------------------------------------------------------- | ---------------------------------------------------------------------- |
| 1. Enter the name of the salon, phone number, and email address. | 2. Verify that the salon does not exist in the system using the email. |
| 3. Enter the social media information.                           | 4. Search for the social media information.                            |
| 5. Enter the business hours.                                     | 6. Search for the business hours.                                      |
| 7. Enter the service information.                                | 8. Search for the service information.                                 |
| 9. Save the information.                                         | 10. Save the new salon information.                                    |

> **Curso Alternativo:**

- **En el paso 2:** Si el correo electrónico ya está registrado en el
    sistema, se puede eliminar, modificar o salir del sistema.

- **En el paso 4:** Si no existe la red social, se puede modificar,
    eliminar, consultar o salir del sistema.

- **En el paso 6:** Si no existe el horario de atención, se puede
    consultar, modificar, eliminar o salir del sistema.

- **En el paso 8:** Si no existe el servicio, se puede consultar,
    modificar, eliminar o salir del sistema.

> **Postcondición:** La peluquería/salón de belleza queda registrada en
> el sistema y podrá administrar sus citas. Además, se enviará el código
> de acceso al correo electrónico del administrador del salón
> recientemente registrado.
>
> ![](media/image25.png){width="5.853472222222222in"
> height="4.052083333333333in"}**Referencia:** párrafo 2.
>
> ![](media/image26.png){width="5.594444444444444in"
> height="3.1166666666666667in"}![](media/image27.png){width="6.268055555555556in"
> height="2.88125in"}
>
> ![](media/image28.png){width="5.791666666666667in"
> height="3.25625in"}![](media/image29.png){width="5.614583333333333in"
> height="2.8715277777777777in"}

2. **Gestionar métodos de pago**

> **Actor:** Administrador de Plataforma
>
> **Tipo:** Primario
>
> **Propósito:** Registrar los métodos de pago que podrán ser utilizados
> dentro de la aplicación para pagar la franquicia y otros pagos.
>
> **Resumen:** El administrador de la plataforma ingresa los métodos de
> pago que podrán ser utilizados en la aplicación
>
> **Precondición:** N/A
>
> **Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del actor**            | **Acciones del sistema**          |
+===================================+===================================+
| 1.  Se ingresa el método de pago. | 2.  Se verifica que no exista el  |
|                                   |     método de pago.               |
+-----------------------------------+-----------------------------------+
| 3.  Guarda el tipo de pago        | 4.  Guarda el tipo de pago        |
+-----------------------------------+-----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** Si ya existe el método de pago se puede consultar,
    modificar, eliminar o salir del sistema.

> ![](media/image30.png){width="4.9840277777777775in"
> height="3.841666666666667in"}**Postcondición:** Los métodos de pago
> quedan registrados en la plataforma para que las peluquerías puedan
> pagar su franquicia y otros pagos variables.
>
> ![](media/image31.png){width="4.308333333333334in"
> height="3.171823053368329in"}![](media/image32.png){width="5.275in"
> height="2.2015201224846894in"}
>
> ![](media/image33.png){width="4.841666666666667in"
> height="3.4239260717410325in"}
>
> ![](media/image34.png){width="5.341666666666667in"
> height="1.0527777777777778in"}

3. **Realizar pago de franquicia**

> **Actor:** Administrador de Peluquería
>
> **Tipo:** Primario
>
> **Propósito:** Realizar el pago de la franquicia de la plataforma para
> poder tener acceso a la misma.
>
> **Resumen:** El administrador realiza el pago de la franquicia de la
> plataforma llenando la siguiente información: método de pago (Pago por
> qr o tarjeta de débito o crédito).
>
> **Precondición:** La peluquería debe estar registrada en el sistema.
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones del actor**              **Acciones del sistema**
  ----------------------------------- -----------------------------------
  **Paso 1.** Se ingresa el método de **Paso 2.** Se verifica que el
  pago a través del cual se va a      método de pago seleccionado.
  pagar.

  **Paso 3.** Se ingresan los datos
  del pago ya sea de la tarjeta o el
  comprobante por qr.

**Paso 4.** Se guarda en el         **Paso 5.** Se guarda en el
  sistema.                            sistema
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** Si no existe el método de pago seleccionado se
    puede consultar, modificar, eliminar o salir del sistema.

> **Postcondición:** La peluquería o salón registrada tendrá acceso al
> sistema y a las herramientas provistas por la plataforma para
> administrar su salón. Se enviará un código al correo registrado con el
> cual el administrador podrá
> ![](media/image35.png){width="4.733333333333333in"
> height="3.620138888888889in"}acceder a la plataforma de su peluquería.

![](media/image36.png){width="4.8in" height="2.752083333333333in"}

> ![](media/image37.png){width="4.7652405949256345in"
> height="2.615972222222222in"}![](media/image38.png){width="3.8333333333333335in"
> height="2.825in"}

![](media/image39.png){width="4.829166666666667in"
height="1.7965277777777777in"}

4. **Gestionar Horarios de atención**

> **Actor:** Administrador de Peluquería
>
> **Tipo:** Primario
>
> **Propósito:** Registrar los horarios en los cuales una peluquería
> está ofreciendo sus servicios.
>
> **Resumen:** El administrador establece los horarios de atención de la
> peluquería para cada día de la semana.
>
> **Precondición:** La peluquería debe estar registrada en el sistema.
>
> **Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del actor**            | **Acciones del sistema**          |
+===================================+===================================+
| 5.  El administrador ingresa el   | 6.  Se verifica que la peluquería |
|     código de su peluquería       |     exista.                       |
+-----------------------------------+-----------------------------------+
| 7.  El administrador ingresa los  |                                   |
|     horarios de atención según    |                                   |
|     sea necesario.                |                                   |
+-----------------------------------+-----------------------------------+
| 8.  Guarda el horario de atención | 9.  Se guarda el horario de       |
|                                   |     atención.                     |
+-----------------------------------+-----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** Si no existe la peluquería, se puede editar,
    modificar, eliminar o salir del sistema.

> ![](media/image40.png){width="5.197916666666667in"
> height="3.045138888888889in"}**Postcondición:** Los nuevos horarios de
> atención quedan guardados en el sistema.
>
> ![](media/image41.png){width="5.48125in"
> height="3.1958333333333333in"}
>
> ![](media/image42.png){width="4.635416666666667in"
> height="3.3986111111111112in"}
>
> ![](media/image43.png){width="5.104166666666667in"
> height="3.573934820647419in"}
>
> ![](media/image44.png){width="6.268055555555556in"
> height="3.066666666666667in"}

5. **Gestionar Redes Sociales**

> **Actores:** Administrador de peluquería (iniciador)
>
> **Tipo:** Secundario
>
> **Propósito:** Registrar las redes sociales con las que cuenta un
> salón de belleza.
>
> **Precondición:** La peluquería o salón debe estar registrada en la
> plataforma.
>
> **Descripción:** El administrador de la peluquería deberá ingresar la
> información de sus redes sociales a registrar en el sistema como:
> ingresando el link o URL de la red social.
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones del actor**              **Acciones del sistema**
  ----------------------------------- -----------------------------------
  1\. El actor ingresa el código del  2\. Verifica que el salón de
  salón de belleza                    belleza exista en el sistema.

  3\. Ingresa el enlace o URL de su   4\. Se verifica que la red social
  red social.                         no este registrada en el sistema.

5\. Se guarda                       6\. Se guarda en el sistema
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** Si no se encuentra el salón, es decir el mail
    registrado, se puede modificar, eliminar o salir del sistema.

- **En el paso 4:** Si la red social ya se encuentra registrada en el
    sistema, se puede eliminar, modificar o salir del sistema.

**Postcondición:** La red social del salón queda registrada en el
sistema.

> ![PlantUML diagram](media/image45.png){width="5.854166666666667in"
> height="2.8125in"}![A screenshot of a web page Description
> automatically
> generated](media/image46.png){width="4.667318460192476in"
> height="4.177666229221347in"}
>
> ![PlantUML diagram](media/image47.png){width="2.7916666666666665in"
> height="3.3333333333333335in"}

![PlantUML diagram](media/image48.png){width="6.268055555555556in"
height="4.225694444444445in"}

![A diagram with text and arrows Description automatically generated
with medium confidence](media/image49.png){width="6.268055555555556in"
height="1.6548611111111111in"}

6. **Gestionar Sucursales**

> **Actores:** Administrador de peluquería (iniciador)
>
> **Tipo:** Primario
>
> **Propósito:** Registrar las sucursales con las que cuenta un salón de
> belleza.
>
> **Precondición:** La peluquería o salón debe estar registrada en la
> plataforma.
>
> **Descripción:** El administrador de la peluquería deberá ingresar la
> información de la sucursal a registrar en el sistema como: dirección y
> número de teléfono,
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones del actor**              **Acciones del sistema**
  ----------------------------------- -----------------------------------
  1\. El actor ingresa el código del  2\. Verifica que el salón de
  salón de belleza                    belleza exista en el sistema.

  3\. Ingresa la información de la    4\. Se verifica que la sucursal no
  sucursal en el sistema como su      este registrada en el sistema.
  dirección y número de teléfono.

5\. Se guarda                       6\. Se guarda en el sistema
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** Si no se encuentra el salón, es decir el mail
    registrado, se puede modificar, eliminar o salir del sistema.

> **Postcondición:** La sucursal del salón de belleza queda registrada
> en el sistema.

![A diagram of a diagram Description automatically
generated](media/image50.png){width="6.268055555555556in"
height="3.85in"}

![](media/image51.png){width="2.25in"
height="3.6354166666666665in"}![](media/image52.png){width="3.3756944444444446in"
height="4.6in"}

![A diagram of a computer flowchart Description automatically
generated](media/image53.png){width="5.0in"
height="3.8333333333333335in"}![](media/image54.png){width="5.466666666666667in"
height="2.033333333333333in"}

7. **Actualizar Peluquería/Salón**

> **Actores:** Administrador de peluquería (iniciador)
>
> **Tipo:** Primario
>
> **Propósito:** Actualizar la información de la peluquería.
>
> **Precondición:** La peluquería salón debe estar registrada en la
> plataforma y tener acceso a ella.
>
> **Descripción:** El administrador de la peluquería deberá ingresar la
> nueva información de su peluquería en el sistema como: nombre de la
> peluquería, dirección, número de teléfono, correo electrónico, redes
> sociales, horarios de atención y servicios.
>
> **Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del Actor**            | **Acciones del Sistema**          |
+===================================+===================================+
| 1.  Se ingresa el nombre de la    | 2.  Se verifica con el mail que   |
|     peluquería/salón, número de   |     el salón este registrado en   |
|     teléfono, correo electrónico, |     el sistema.                   |
+-----------------------------------+-----------------------------------+
| 3.  Se ingresan las redes         | 4.  Se buscan las redes sociales  |
|     sociales                      |                                   |
+-----------------------------------+-----------------------------------+
| 5.  Se ingresan los horarios de   | 6.  Se buscan los horarios de     |
|     atención                      |     atención                      |
+-----------------------------------+-----------------------------------+
| 7.  Se insertan los servicios     | 8.  Se buscan los servicios.      |
+-----------------------------------+-----------------------------------+
| 9.  Se guarda la información      | 10. Se guardan los datos la       |
|     actualizada.                  |     peluquería/salón.             |
+-----------------------------------+-----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** Si no se encuentra la peluquería, es decir el mail
    registrado, se puede modificar, eliminar o salir del sistema.

- **En el paso 4:** Si no existe la red social, se puede modificar,
    eliminar, consultar o salir del sistema.

- **En el paso 6:** Si no existe el horario de atención, se puede
    consultar, modificar, eliminar o salir del sistema.

- **En el paso 8:** Si no existe el servicio, se puede consultar,
    modificar, eliminar o salir del sistema.

> **Postcondición:** La nueva información de la peluquería/salón se
> actualiza.
>
> **Referencia:** Párrafo 2.
>
> ![](media/image55.png){width="4.3964468503937in"
> height="3.1566907261592303in"}
>
> ![](media/image56.png){width="6.020833333333333in"
> height="3.2465277777777777in"}
>
> ![](media/image57.png){width="6.268055555555556in"
> height="3.6555555555555554in"}![](media/image58.png){width="6.268055555555556in"
> height="2.911111111111111in"}
>
> ![](media/image59.png){width="3.5520833333333335in"
> height="2.354861111111111in"}

8. **Gestionar Categorías**

> **Actores:** Administrador de la plataforma
>
> **Tipos:** Secundario
>
> **Propósito:** Permitir registrar las categorías para que los
> servicios puedan ser categorizados adecuadamente.
>
> **Resumen:** El administrador de plataforma ingresa las categorías que
> utilizarán para clasificar sus servicios.
>
> **Precondición:** N/A
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones de actores**             **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. Se ingresa el nombre de la  Paso 2. Se verifica que la
  categoría                           categoría no exista.

Paso 3. Se guarda.                  Paso 4. Se guarda
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** Si la categoría ya está registrada en el sistema,
    se puede eliminar, modificar o salir del sistema.

> **Postcondición:** La categoría queda registrada en el sistema.
>
> ![](media/image60.png){width="3.343751093613298in"
> height="3.7077373140857395in"}![](media/image61.png){width="4.969443350831146in"
> height="4.552718722659668in"}
>
> ![](media/image62.png){width="2.1354166666666665in"
> height="3.2604166666666665in"}
>
> ![A diagram of a computer program Description automatically
> generated](media/image63.png){width="4.979166666666667in"
> height="4.21875in"}
>
> ![](media/image64.png){width="6.259722222222222in" height="2.0in"}

9. **Gestionar Servicios**

> **Actores:** Administrador de peluquería (iniciador), secretaria de la
> peluquería.
>
> **Tipo:** Primario
>
> **Propósito:** Registrar un servicio.
>
> **Precondición:** La peluquería o salón debe estar registrada en el
> sistema y tener acceso al mismo.
>
> **Descripción:** La secretaria ingresará la información del servicio
> que ofrece la peluquería/salón: nombre del servicio, descripción,
> categoría, precio del servicio, duración estimada.
>
> **Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del Actor**            | **Acciones del Sistema**          |
+===================================+===================================+
| 1.  Se ingresa la categoría a la  | 2.  Se verifica que la categoría  |
|     que pertenecerá el servicio   |     exista.                       |
+-----------------------------------+-----------------------------------+
| 3.  Se ingresa el nombre del      | 4.  Se verifica que no exista el  |
|     servicio, descripción, precio |     servicio con ese nombre.      |
|     del servicio y duración       |                                   |
|     estimada                      |                                   |
+-----------------------------------+-----------------------------------+
| 5.  Se guarda la información del  | 6.  Se guarda la información del  |
|     servicio                      |     servicio.                     |
+-----------------------------------+-----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** Si la peluquería no existe, se puede eliminar,
    modificar o salir del sistema.

- **En el paso 4:** Si el servicio ya existe, se puede eliminar,
    modificar, consultar o salir del sistema.

> **Postcondición:** El servicio queda registrado en la plataforma del
> salón.
>
> ![](media/image65.png){width="5.006350612423447in"
> height="3.625in"}**Referencia:** Párrafo 6.
>
> ![](media/image66.png){width="5.036830708661418in" height="2.5625in"}
>
> ![](media/image67.png){width="5.51875in"
> height="2.611111111111111in"}![](media/image68.png){width="4.964583333333334in"
> height="3.28125in"}
>
> ![](media/image69.png){width="5.486111111111111in"
> height="2.047222222222222in"}

10. **Gestionar Promociones y Ofertas**

> **Actores**: Administrador de plataforma
>
> **Tipo**: Primario
>
> **Propósito**: Registrar los tipos de promociones que se podrán
> ofrecer
>
> **Resumen**: El administrador de plataforma establece los tipos de
> ofertas básicos que se podrán hacer en la aplicación.
>
> **Precondición**: N/A
>
> **Curso básico**

  -----------------------------------------------------------------------
  **Acciones de actores**             **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. Se ingresa el nombre de la  Paso 2. Se verifica que no exista
  promoción                           la promoción.

Paso 3. Se guarda                   Paso 4. Se guarda
  -----------------------------------------------------------------------

> **Curso alternativo**:

- **En el paso 2:** Si la promoción ya existe, se puede consultar,
    modificar, eliminar o salir del sistema.

> ![](media/image70.png){width="5.3340780839895015in"
> height="4.344355861767279in"}**Postcondición**: La promoción queda
> registrada para que pueda ser utilizada en la aplicación.

![](media/image71.png){width="5.427083333333333in"
height="2.7708333333333335in"}

![](media/image72.png){width="5.581944444444445in"
height="3.645138888888889in"}

![](media/image73.png){width="6.268055555555556in"
height="1.836111111111111in"}![](media/image74.png){width="4.958333333333333in"
height="3.7997779965004375in"}

11. **Gestionar Promoción u Oferta**

> **Actores:** Administrador del Salón
>
> **Tipos:** Secundario
>
> **Propósito:** Permitir la gestión de promociones y ofertas en los
> servicios ofrecidos
>
> **Resumen:** El administrador de Salón ingresa promociones y ofertas
> en los servicios ofrecidos
>
> **Precondición:** El establecimiento, y el servicio deben estar
> registrados.
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones de actores**             **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. Se ingresa el código del    Paso 2. Se verifica que exista el
  salón                               salón.

  Paso 3. Se ingresa el código del    Paso 4. Se verifica que el servicio
  servicio que tendrá la promoción    exista.

  Paso 5. Se ingresa la promoción que
  tendrá

Paso 6. Se guarda                   Paso 7. Se guarda
  -----------------------------------------------------------------------

> **Curso alternativo:**

i.  **En el paso 2:** Si no existe el salón se puede eliminar, modificar
    o salir del sistema.

ii. **En el paso 4:** Si no existe el servicio se puede eliminar,
    modificar o salir del sistema.

> **Postcondiciones:** Las promociones y ofertas en los servicios
> ofrecidos se guardan correctamente en el sistema.

![A diagram of a diagram Description automatically
generated](media/image75.png){width="5.0in" height="2.75in"}

![PlantUML diagram](media/image76.png){width="6.268055555555556in"
height="2.7534722222222223in"}![](media/image77.png){width="5.240277777777778in"
height="4.40625in"}

![A black and white screen Description automatically
generated](media/image78.png){width="6.296824146981628in"
height="2.05000656167979in"}![A diagram of a company Description
automatically generated](media/image79.png){width="5.0in"
height="5.791666666666667in"}

12. **Gestionar usuarios**

- **Actor:** Administrador de salón

- **Tipo:** Primario

- **Propósito:** Gestionar los usuarios de todo tipo del salón

- **Resumen:** El administrador gestiona los datos de todos los
    usuarios de todo tipo

- **Precondición:** El salón debe estar registrado y además debe tener
    acceso al sistema.

- ![](media/image80.png){width="4.90625in"
    height="3.042361111111111in"}**Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del Actor**            | **Acciones del Sistema**          |
+===================================+===================================+
| 1.  Se ingresa el empleado        | 2.  Se busca al empleado          |
+-----------------------------------+-----------------------------------+
| 3.  Se ingresa el rol             | 4.  Se busca el rol               |
+-----------------------------------+-----------------------------------+
| 5.  Se gurda la información del   | 6.  Se guarda la información del  |
|     usuario                       |     usuario y se relaciona        |
|                                   |     dependiendo del tipo de       |
|                                   |     usuario. Luego se manda el    |
|                                   |     código de acceso al correo    |
|                                   |     del usuario para su posterior |
|                                   |     acceso.                       |
+-----------------------------------+-----------------------------------+

![](media/image81.png){width="5.0in"
height="3.3375798337707785in"}![](media/image82.png){width="5.07234251968504in"
height="2.51875in"}![](media/image83.png){width="6.268055555555556in"
height="3.238888888888889in"}

![](media/image84.png){width="5.000915354330709in" height="2.875in"}

13. **Actualizar Servicio**

> **Actor:** Secretaria del salón, Adm. del salón(iniciador)
>
> **Tipo:** Primario
>
> **Propósito:** Actualizar servicio ofrecido por el salón.
>
> **Resumen:** Actualizar la información de un servicio que el salón
> está ofreciendo con los siguientes datos: nombre del servicio,
> descripción, categoría, precio del servicio, duración estimada.
>
> **Precondición:** El salón de belleza debe estar registrado y debe
> tener acceso al sistema.
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones del Actor**              **Acciones del Sistema**
  ----------------------------------- -----------------------------------
  **Paso 1.** Se ingresa el servicio  **Paso 2.** Se verifica que el
                                      servicio exista

  **Paso 3.** Se ingresa la           **Paso 4.** Se busca la categoría.
  categoría.

  **Paso 5.** Se ingresa la           **Paso 6.** Se verifica que el
  descripción, precio del servicio y  servicio exista dentro del sistema.
  duración estimada

**Paso 7.** Se guarda la            **Paso 8.** Se guarda la
  información del servicio            información del servicio
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** Si no existe el servicio, se puede consultar,
    eliminar, modificar, o salir del sistema.

- **En el paso 4:** Si la categoría ingresada no existe, se puede
    consultar, modificar, eliminar o salir del sistema.

> ![](media/image85.png){width="4.875680227471566in"
> height="3.3025437445319334in"}**Postcondición:** La información del
> servicio queda actualizada en el sistema.
>
> ![](media/image86.png){width="5.84375in"
> height="2.7888888888888888in"}

![](media/image87.png){width="5.40625in"
height="2.5102580927384075in"}![](media/image88.png){width="4.375in"
height="2.8680555555555554in"}

![](media/image89.png){width="5.281987095363079in"
height="1.9794433508311462in"}

14. **Gestionar Géneros**

> **Actor:** Administrador de la aplicación
>
> **Tipo:** Primario
>
> **Propósito:** Registrar los géneros
>
> **Resumen:** El administrador de la aplicación registra el género en
> la aplicación.
>
> **Precondición:** N/A
>
> **Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del actor**            | **Acciones del sistema**          |
+===================================+===================================+
| 1.  Se ingresa el nombre del      | 2.  Se verifica que el género no  |
|     género.                       |     exista dentro del sistema.    |
+-----------------------------------+-----------------------------------+
| 3.  Se guardan los cambios.       | 4.  Se guardan los cambios en el  |
|                                   |     sistema.                      |
+-----------------------------------+-----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** Si el género ya está registrado en el sistema, se
    puede eliminar, modificar o salir del sistema.

> ![](media/image90.png){width="3.535416666666667in"
> height="2.8958333333333335in"}**Postcondición:** Los géneros quedan
> registrados en el sistema.
>
> ![PlantUML diagram](media/image91.png){width="2.1875in"
> height="3.1666666666666665in"}![](media/image92.png){width="3.310416666666667in"
> height="3.298611111111111in"}
>
> ![A diagram of a company Description automatically
> generated](media/image93.png){width="5.0in" height="4.125in"}
>
> ![](media/image94.png){width="6.260415573053368in" height="2.125in"}

15. **Gestionar Empleados**

> **Actor:** Administrador de Peluquería
>
> **Tipo:** Primario
>
> **Propósito:** Registrar empleados en el salón.
>
> **Resumen:** El administrador registra los datos de los empleados con
> los datos como nombre, apellido paterno, apellido materno, teléfono,
> género y email
>
> **Precondición:** El salón de belleza debe estar registrado.
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones del actor**              **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. El administrador ingresa el Paso 2. Se verifica que la sucursal
  código del salón                    exista.

  Paso 3. El administrador ingresa    Paso 4. Se verifica que no haya
  los datos del empleado como:        otro empleado registrado con el
  nombre, apellidos, teléfono, email  mismo email.

Paso 5. Se guardan los cambios.     Paso 7. Se guardan los cambios en
                                      el sistema
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** si no existe el salón se puede modificar, eliminar
    o salir del sistema.

- **En el paso 4:** Si el email ingresado ya está registrado se puede
    eliminar, modificar o salir del sistema.

> **Postcondición:** Los cambios en los datos de los empleados quedan
> guardados en el sistema.
>
> **Referencia:**
>
> ![](media/image95.png){width="5.477777777777778in"
> height="3.1666666666666665in"}
>
> ![](media/image96.png){width="3.7597222222222224in"
> height="2.703472222222222in"}![](media/image97.png){width="3.1708333333333334in"
> height="3.85in"}
>
> ![](media/image98.png){width="4.787037401574803in"
> height="2.8337182852143483in"}
>
> ![](media/image99.png){width="5.361704943132109in"
> height="2.054398512685914in"}

16. **Gestionar horarios de empleados**

> **Actor:** Administrador de Peluquería
>
> **Tipo:** Primario
>
> **Propósito:** Registrar los horarios en los cuales el empleado
> trabajará en el salón.
>
> **Resumen:** El administrador establece los horarios en los cuales un
> empleado estará ofreciendo sus servicios en el salón.
>
> **Precondición:** El salón y el empleado deben estar registrados en el
> sistema.
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones del actor**              **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. Se ingresa el código del    Paso 2. Se verifica que el salón
  salón de belleza.                   exista.

  Paso 3. Se ingresa el código del    Paso 4. Se verifica que el empleado
  empleado.                           exista en el sistema.

  Paso 5. Se ingresa sus horarios de
  trabajo por cada día.

Paso 6. Se guarda                   Paso 7. Se guarda
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** Si no existe el salón, se puede editar, modificar,
    eliminar o salir del sistema.

- **En el paso 4:** Si no existe el empleado, se puede modificar,
    eliminar o salir del sistema.

> ![](media/image100.png){width="4.557638888888889in"
> height="3.3583333333333334in"}**Postcondición:** Los horarios de
> atención de los empleados del salón quedan registrados en el sistema.
>
> ![](media/image101.png){width="5.333333333333333in"
> height="3.3833333333333333in"}
>
> ![](media/image102.png){width="4.770833333333333in"
> height="2.7215277777777778in"}
>
> ![](media/image103.png){width="4.635416666666667in"
> height="3.091666666666667in"}
> ![](media/image104.png){width="4.677083333333333in"
> height="2.726139545056868in"}

17. **Gestionar especialidad**

> **Actor:** Secretaria de salón, empleado
>
> **Tipo:** Primario
>
> **Propósito:** Registrar la especialidad de cada empleado en el
> sistema.
>
> **Resumen:** La secretaria del salón ingresa a la plataforma las
> especialidades de cada peluquero. El dato que se ingresa es la
> especialidad.
>
> **Precondición:** El empleado debe estar registrado en el sistema.
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones del actor**              **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. Se ingresa el código del    Paso 2. Se verifica que el empleado
  empleado                            exista.

  Paso 3. Se ingresa la especialidad. Paso 4. Se verifica que no se haya
                                      ingresado la especialidad
                                      anteriormente.

Paso 5. Se guarda                   Paso 6. Se guarda
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** Si no existe el empleado, se puede editar,
    modificar, eliminar o salir del sistema.

- **En el paso 4:** Si la especialidad ya ha sido registrada
    anteriormente se puede modificar, eliminar o salir del sistema.

> ![](media/image105.png){width="5.1875in"
> height="4.186253280839895in"}**Postcondición:** La especialidad de los
> empleados queda registrada en el sistema.

![](media/image106.png){width="6.260415573053368in"
height="3.1458333333333335in"}

![PlantUML diagram](media/image107.png){width="2.0388888888888888in"
height="2.6in"}

![](media/image108.png){width="5.894530839895013in"
height="3.1385192475940507in"}![A diagram of a company Description
automatically generated](media/image109.png){width="5.080555555555556in"
height="3.327777777777778in"}

18. **Actualizar Empleados**

> **Actor:** Administrador de Peluquería
>
> **Tipo:** Secundario
>
> **Propósito:** Permitir la actualización de los datos de un empleado
> de la peluquería.
>
> **Resumen:** El administrador actualiza los datos de un empleado de la
> peluquería.
>
> **Precondición:** El empleado debe estar registrado en el sistema.
>
> **Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del actor**            | **Acciones del sistema**          |
+===================================+===================================+
| 1.  El administrador ingresa el   | 2.  Se verifica que el salón      |
|     código del salón              |     exista                        |
+-----------------------------------+-----------------------------------+
| 3.  El administrador ingresa el   | 4.  Se verifica que exista el     |
|     código de su empleado         |     empleado                      |
+-----------------------------------+-----------------------------------+
| 5.  El administrador ingresa los  |                                   |
|     datos a actualizar del        |                                   |
|     empleado.                     |                                   |
+-----------------------------------+-----------------------------------+
| 6.  Se guardan los datos          | 7.  Se guardan los datos.         |
+-----------------------------------+-----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** Si no existe el salón se puede modificar, eliminar
    o salir del sistema

- **En el paso 4:** Si no existe el empleado se puede modificar,
    eliminar o salir del sistema.

> **Postcondición:** Los datos del empleado seleccionado se actualizan
> en el sistema.
>
> ![](media/image110.png){width="4.764583333333333in"
> height="3.3229166666666665in"}**Referencia:**

![](media/image111.png){width="3.59375in" height="5.058333333333334in"}

![](media/image112.png){width="3.6875in" height="2.879166666666667in"}

![](media/image113.png){width="4.791666666666667in"
height="3.7601793525809275in"}

![](media/image114.png){width="5.158737970253719in"
height="2.1798611111111112in"}

19. **Eliminar Empleados**

> **Actor:** Administrador de Peluquería
>
> **Tipo:** Secundario
>
> **Propósito:** Permitir la eliminación de un empleado del sistema y de
> su peluquería.
>
> **Resumen:** El administrador elimina a un empleado de la peluquería
> del sistema.
>
> **Precondición:** El empleado debe estar registrado en el sistema.
>
> **Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del actor**            | **Acciones del sistema**          |
+===================================+===================================+
| 1.  El administrador ingresa el   | 2.  Se verifica que el empleado   |
|     código del empleado que desea |     exista.                       |
|     eliminar                      |                                   |
+-----------------------------------+-----------------------------------+
| 3.  El administrador presiona el  | 4.  Se elimina el empleado.       |
|     botón de eliminar empleado    |                                   |
+-----------------------------------+-----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** Si el empleado no existe se puede modificar o
    salir del sistema.

> **Postcondición:** El empleado seleccionado es eliminado del sistema.
>
> **Referencia:**
>
> ![](media/image115.png){width="4.010976596675415in"
> height="2.792055993000875in"}
>
> ![](media/image116.png){width="3.6368055555555556in"
> height="5.305555555555555in"}
>
> ![](media/image117.png){width="5.04166447944007in"
> height="2.262214566929134in"}
>
> ![](media/image118.png){width="5.340972222222222in"
> height="1.600634295713036in"}![](media/image119.png){width="4.395833333333333in"
> height="3.748611111111111in"}

20. **Gestionar Clientes**

> **Actor:** Cliente
>
> **Tipo:** Primario
>
> **Propósito:** Registrar clientes para que puedan tener acceso a la
> plataforma
>
> **Resumen:** El cliente ingresa a la plataforma e ingresa sus datos
> personales: nombre, apellidos, teléfono, correo electrónico, sexo.
>
> **Precondición:** El cliente debe poder ingresar a la plataforma.
>
> **Curso básico:**

+-----------------------------------+----------------------------------+
| **Acciones del actor**            | **Acciones del sistema**         |
+===================================+==================================+
| 1.  Se escribe el nombre,         | 2.  Se verifica que el correo    |
|     apellidos, teléfono, correo   |     electrónico no exista.       |
|     electrónico y sexo            |                                  |
+-----------------------------------+----------------------------------+
| 3.  Se guarda la información del  | 4.  Se guarda el nuevo usuario   |
|     cliente.                      |     cliente.                     |
+-----------------------------------+----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** En el paso 2 si el correo electrónico ya está
    registrado, se puede eliminar, modificar o salir del sistema.

> **Postcondición:** El cliente queda registrado y puede acceder a la
> plataforma para realizar reservas.
>
> **Referencia:** Párrafo 1.
>
> ![](media/image120.png){width="4.886099081364829in"
> height="3.9172134733158357in"}
>
> ![](media/image121.png){width="4.524333989501312in"
> height="3.6877384076990376in"}
>
> ![](media/image122.png){width="4.8118208661417325in"
> height="1.7512554680664918in"}
>
> ![](media/image123.png){width="4.125in" height="3.911797900262467in"}
>
> ![](media/image124.png){width="5.027438757655293in"
> height="1.018186789151356in"}

21. **Gestionar Cliente fiel**

> **Actor:** Secretaria del salón, Administrador de Peluquería
> (iniciador)
>
> **Tipo:** Primario
>
> **Propósito:** Registrar los clientes que son fieles a su peluquería.
>
> **Resumen:** El administrador le pide a la secretaria que registre a
> un cliente de la plataforma como un cliente fiel de la peluquería.
>
> **Precondición:** El cliente y el salón deben estar registrados en el
> sistema.
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones del actor**              **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. Se ingresa el código del    Paso 2. Se verifica que el salón
  salón de belleza.                   exista.

  Paso 3. Se ingresa el código del    Paso 4. Se verifica que el cliente
  cliente.                            exista en el sistema.

  Paso 5. Se cambia el estado del
  cliente a cliente fiel a esa
  peluquería en el sistema

Paso 6. Se guarda                   Paso 7. Se guarda
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** Si no existe el salón, se puede editar, modificar,
    eliminar o salir del sistema.

- **En el paso 4:** Si no existe el cliente, se puede modificar,
    eliminar o salir del sistema.

> **Postcondición:** El cliente queda registrado como cliente fiel al
> salón en el sistema.
>
> ![](media/image125.png){width="3.6770833333333335in"
> height="3.1284722222222223in"}
>
> ![](media/image126.png){width="5.104166666666667in"
> height="3.0107010061242345in"}![](media/image127.png){width="5.25in"
> height="2.409207130358705in"}

![](media/image128.png){width="5.03125in" height="3.104861111111111in"}

![](media/image129.png){width="4.90248031496063in"
height="2.1041666666666665in"}

22. **Actualizar Clientes**

> **Actor:** Cliente
>
> **Tipo:** Primario
>
> **Propósito:** Modificar la información de un cliente de la plataforma
>
> **Resumen:** El cliente ingresa sus nuevos datos a la plataforma:
> nombre, apellidos, teléfono, correo electrónico, sexo.
>
> **Precondición:** El cliente debe estar registrado en la plataforma.
>
> **Curso básico:**

+-----------------------------------+----------------------------------+
| **Acciones del actor**            | **Acciones del sistema**         |
+===================================+==================================+
| 1.  Se escribe el nombre,         | 2.  Se verifica que el correo    |
|     apellidos, teléfono, correo   |     electrónico exista en el     |
|     electrónico y sexo            |     sistema.                     |
+-----------------------------------+----------------------------------+
| 3.  Se guarda la nueva            | 4.  Se guarda los cambios        |
|     información del cliente.      |                                  |
+-----------------------------------+----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** En el paso 2 si el correo electrónico no está
    registrado, se puede eliminar, modificar o salir del sistema.

> **Postcondición:** La información del cliente queda actualizada.
>
> **Referencia:** Párrafo 1.
>
> ![](media/image130.png){width="4.573555336832896in"
> height="4.208920603674541in"}
>
> ![](media/image131.png){width="4.820143263342082in"
> height="3.9197703412073492in"}
>
> ![](media/image132.png){width="4.854166666666667in"
> height="1.91542760279965in"}
>
> ![](media/image133.png){width="4.148244750656168in"
> height="3.925655074365704in"}
>
> ![](media/image134.png){width="5.196434820647419in"
> height="1.275216535433071in"}

23. **Gestionar Roles**

> **Actor:** Administrador de la plataforma
>
> **Tipo:** Primario
>
> **Propósito:** Registrar los roles que habrá dentro de la plataforma.
>
> **Resumen:** El administrador de la plataforma ingresa el nombre del
> rol en el sistema para que quede registrado.
>
> **Precondición:** N/A
>
> **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones del actor**              **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. Se ingresa el nuevo rol     Paso 2. Se verifica que el rol no
                                      exista.

Paso 3. Se guarda                   Paso 4. Se guarda
  -----------------------------------------------------------------------

> **Curso alternativo:**

- **En el paso 2:** Si existe el rol, se puede modificar, eliminar o
    salir del sistema.

> ![](media/image135.png){width="4.001791338582677in"
> height="3.1458333333333335in"}**Postcondición:** Los roles quedan
> registrados en el sistema.
>
> ![](media/image136.png){width="5.11861220472441in" height="1.78125in"}
>
> ![](media/image137.png){width="5.0in"
> height="0.9770833333333333in"}![](media/image138.png){width="4.173611111111111in"
> height="3.5506944444444444in"}![](media/image139.png){width="6.268055555555556in"
> height="1.9166666666666667in"}

24. **Gestionar Reservas**

> **Actores:** Cliente
>
> **Tipo:** Primario
>
> **Propósito:** Realizar la reserva de un servicio de una peluquería.
>
> **Precondición:** El cliente debe estar registrado en la plataforma.
>
> **Descripción:** El cliente agenda o reserva el servicio deseado con
> la siguiente información: nombre de la peluquería, nombre del
> servicio, nombre del estilista, fecha de reserva, imágenes de
> referencia, detalles, preferencias de pago.
>
> **Curso básico:**

+-----------------------------------+----------------------------------+
| **Acciones del Actor**            | **Acciones del sistema**         |
+===================================+==================================+
| 1.  Se ingresa el nombre de la    | 2.  Se verifica que la           |
|     peluquería/salón              |     peluquería exista            |
+-----------------------------------+----------------------------------+
| 3.  Se ingresa el nombre del      | 4.  Se verifica que el servicio  |
|     servicio requerido            |     exista.                      |
+-----------------------------------+----------------------------------+
| 5.  Se ingresa el nombre del      | 6.  Se verifica que el estilista |
|     estilista                     |     exista.                      |
+-----------------------------------+----------------------------------+
| 7.  Se ingresa la fecha de        |                                  |
|     reserva, imágenes de          |                                  |
|     referencia, detalles y        |                                  |
|     preferencias de pago.         |                                  |
+-----------------------------------+----------------------------------+
| 8.  Se guarda la información de   | 9.  Se guarda la información de  |
|     la cita.                      |     la cita.                     |
+-----------------------------------+----------------------------------+

> **Curso alternativo:**

- **En el paso 2:** Si no existe la peluquería, se elimina, modifica,
    se consulta o se sale del sistema.

- **En el paso 4:** Si no existe el servicio, se elimina, modifica, se
    consulta o se sale del sistema.

- **En el paso 6:** Si no existe el estilista, se elimina, modifica,
    se consulta o se sale del sistema.

> **Postcondición:** La cita queda registrada.
>
> ![](media/image140.png){width="4.979166666666667in"
> height="3.485417760279965in"}**Referencia:** Párrafo 2.
>
> ![](media/image141.png){width="4.56923665791776in"
> height="3.1416666666666666in"}
>
> ![](media/image142.png){width="5.219750656167979in"
> height="3.3651367016622924in"}
>
> ![](media/image143.png){width="5.24846675415573in"
> height="2.024724409448819in"}
>
> ![](media/image144.png){width="4.738384733158355in"
> height="2.6705249343832023in"}

25. **Actualizar Cita**

> **Actor:** secretaria de Peluquería, Peluquero o estilista (iniciador)
>
> **Tipo:** Primario
>
> **Propósito:** Permitir actualizar los detalles de una cita existente
> en el sistema.
>
> **Resumen:** La secretaria, el peluquero actualizan la información de
> una cita en el sistema.
>
> **Precondición:** Tener acceso al sistema, existe al menos una cita
> registrada.
>
> **Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del actor**            | **Acciones del sistema**          |
+===================================+===================================+
| 1.  La secretaria o el peluquero  | 2.  El sistema muestra una lista  |
|     selecciona la opción          |     de citas programadas.         |
|     \"Actualizar Cita\" en el     |                                   |
|     sistema.                      |                                   |
+-----------------------------------+-----------------------------------+
| 3.  La secretaria o el peluquero  | 4.  El sistema muestra los        |
|     selecciona la cita que desea  |     detalles de la cita           |
|     actualizar.                   |     seleccionada.                 |
+-----------------------------------+-----------------------------------+
| 5.  La secretaria o el peluquero  |                                   |
|     modifica los detalles de la   |                                   |
|     cita: fecha, hora, tipo de    |                                   |
|     servicio y estado.            |                                   |
+-----------------------------------+-----------------------------------+
| 6.  Guarda la información en el   | 7.  El sistema actualiza la       |
|     sistema                       |     información de la cita en la  |
|                                   |     base de datos.                |
+-----------------------------------+-----------------------------------+

> **Curso alternativo:**
>
> **Paso 2:**

- Si no hay citas programadas se sale del sistema.

> **Paso 4:** Si la cita ya no está disponible para actualizar:

- El sistema muestra un mensaje indicando que la cita seleccionada ya
    no está disponible para actualizar.

- Vuelve al paso 2.

> **Paso 7:** El sistema no puede actualizar la cita debido a un error:

- El sistema muestra un mensaje de error.

- La secretaria o el peluquero intenta actualizar la cita nuevamente.

> **Postcondición:** Los detalles de la cita seleccionada se actualizan.
>
> **Referencia:**
>
> ![](media/image145.png){width="5.014583333333333in"
> height="3.2708333333333335in"}
>
> ![](media/image146.png){width="5.427083333333333in"
> height="3.6479166666666667in"}
>
> ![](media/image147.png){width="3.979722222222222in"
> height="3.5734153543307086in"}![](media/image148.png){width="4.260416666666667in"
> height="3.15in"}
>
> ![](media/image149.png){width="4.386111111111111in"
> height="2.015972222222222in"}

26. **Anular Cita**

> **Actor:** secretaria de Peluquería, peluquero o cliente.
>
> **Tipo:** Secundario
>
> **Propósito:** Permitir la anulación de una cita previamente agendada.
>
> **Resumen:** La secretaria anulan una cita existente en el sistema.
>
> **Precondición:** La cita debe existir
>
> **Curso básico:**

+-----------------------------------+-----------------------------------+
| **Acciones del actor**            | **Acciones del sistema**          |
+===================================+===================================+
| 1.  La secretaria o el cliente    | 2.  El sistema muestra una lista  |
|     selecciona la opción \"Anular |     de citas agendadas.           |
|     Cita\" en el sistema          |                                   |
+-----------------------------------+-----------------------------------+
| 3.  La secretaria o el cliente    | 4.  Busca la cita                 |
|     selecciona la cita que desea  |                                   |
|     anular.                       |                                   |
+-----------------------------------+-----------------------------------+
| 5.  Se confirma la anulación      | 6.  El sistema elimina la cita    |
|                                   |     del sistema.                  |
+-----------------------------------+-----------------------------------+
|                                   |                                   |
+-----------------------------------+-----------------------------------+

> **Curso alternativo:**
>
> **Paso 2:**

- Si no hay citas agendadas se sale del sistema.

> **Paso 4:**

- Si no se encuentra la cita, se puede modificar, eliminar o salir del
    sistema.

> **Postcondición:** La cita queda eliminada
>
> ![](media/image150.png){width="4.1875in" height="5.253472222222222in"}
> ![](media/image151.png){width="4.233333333333333in"
> height="2.3645833333333335in"}

![](media/image152.png){width="4.791666666666667in"
height="1.9435290901137359in"}

> ![](media/image153.png){width="4.520833333333333in"
> height="3.736111111111111in"}
>
> ![](media/image154.png){width="6.088693132108486in"
> height="1.8166240157480316in"}

27. **Elaborar Reportes de citas mensuales**

    - **Actores:** Administrador de salón (iniciador), secretaría

    - **Tipos:** Primario

    - **Propósito:** Permitir la generación de reportes mensuales de
        citas

    - **Resumen:** El administrador o la secretaria generan un reporte
        con las citas programadas durante un mes especifico.

    - **Precondición:** Existen citas programadas en el sistema

    - **Curso básico:**

| **Actor Actions**                                              | **System Actions**                                                                                                    |
| -------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| Step 1. Enter the date for which you want to obtain the report | Step 2. The system searches for appointments, stylists, services, and the necessary information to generate a report. |
|                                                                | Step 3: The report is displayed.                                                                                      |

- **Alternative Course:**

    i. **Step 2:** If there are no appointments scheduled for the selected date, the system displays a message indicating that there are no appointments for that period.

- **Postcondiciones:** El reporte de citas mensuales se genera
    correctamente

![A diagram of a person\'s secret Description automatically
generated](media/image155.png){width="3.625in" height="2.5625in"}

![](media/image156.png){width="5.656944444444444in"
height="4.583333333333333in"}

![A screenshot of a computer Description automatically
generated](media/image157.png){width="5.0in"
height="1.3854166666666667in"}

![A black and white screen Description automatically
generated](media/image158.png){width="6.253438320209974in"
height="1.539925634295713in"}![](media/image159.png){width="5.447915573053368in"
height="3.90625in"}

28. **Generar Agenda Diaria**

    - **Actores:** Administrador de peluquería (iniciador), secretaría
        de peluquería

    - **Tipos:** Primario

    - **Propósito:** Permitir la generación de una agenda diaria con
        las citas programadas

    - **Resumen:** El administrador o la secretaría generan una agenda
        diaria con las citas programadas para ese día

    - **Precondición:** tener acceso al sistema y que existan citas
        programadas para el salón

    - **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones de actores**             **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. El administrador o la       Paso 2. El sistema muestra un
  secretaría selecciona la opción     calendario con las fechas
  "Generar agenda diaria" en el       disponibles
  sistema

Paso 3. El administrador o la       Paso 4. El sistema muestra la
  secretaria selecciona la fecha para agenda diaria con las citas
  la cual desea generar la agenda     programadas para esa fecha
  -----------------------------------------------------------------------

- **Curso alternativo:** Si en el paso 3 no hay citas programadas para
    la fecha seleccionada, el sistema muestra un mensaje indicando que
    no hay citas para esa fecha y se puede modificar o salir del
    sistema.

- **Postcondiciones:** La agenda diaria con las citas programadas se
    genera correctamente

![A diagram of a general agenda Description automatically
generated](media/image160.png){width="3.6041666666666665in"
height="1.3229166666666667in"}

![](media/image161.png){width="3.7296872265966754in"
height="3.3546347331583553in"}

![](media/image162.png){width="4.260416666666667in" height="1.78125in"}

![A diagram of a diagram Description automatically
generated](media/image163.png){width="5.0in"
height="2.3854166666666665in"}

![A black and white screen Description automatically
generated](media/image164.png){width="5.98614501312336in"
height="1.5080107174103237in"}

29. **Generar Historial de citas de los clientes**

    - **Actores:** Administrador de la peluquería/salón (iniciador) o
        secretaría

    - **Tipos:** Secundario

    - **Propósito:** Permitir la visualización del historial de citas
        de los clientes con el salón de belleza.

    - **Resumen:** El administrador genera un reporte con el historial
        de citas de los clientes.

    - **Precondición:** existen clientes registrados, citas
        programadas en el sistema y se debe tener acceso al sistema.

    - **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones de actores**             **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. El administrador selecciona Paso 2. El sistema muestra una
  la opción "Generar historial de     lista de clientes registrados que
  citas en el sistema"                han reservado una cita con su salón
                                      de belleza.

Paso 3. El administrador selecciona Paso 4. El sistema muestra el
  el cliente del cual desea ver el    historial de citas del cliente
  historial                           seleccionado
  -----------------------------------------------------------------------

- **Curso alternativo:** Si no hay clientes registrados, el sistema
    muestra un mensaje indicando que no hay clientes registrados.

- **Postcondiciones:** El historial de citas del cliente seleccionado
    se genera correctamente

![](media/image165.png){width="3.9166666666666665in"
height="2.6145833333333335in"}

![A screenshot of a computer Description automatically
generated](media/image166.png){width="4.806791338582677in"
height="1.0314709098862642in"}![](media/image167.png){width="4.865262467191601in"
height="4.281847112860892in"}

![A diagram of a company Description automatically
generated](media/image168.png){width="6.650919728783902in"
height="3.581796806649169in"}

![A screenshot of a computer screen Description automatically
generated](media/image169.png){width="6.665149825021873in"
height="2.0754133858267716in"}

30. **Realizar Reseña de servicio**

    - **Actores:** Cliente

    - **Tipos:** Secundario

    - **Propósito:** Permitir que los clientes realicen reseñas sobre
        los servicios recibidos

    - **Resumen:** El cliente realiza una reseña sobre el servicio
        recibido en el establecimiento

    - **Precondición:** El cliente recibió un servicio y debe tener
        acceso al sistema.

    - **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones de actores**             **Acciones del sistema**
  ----------------------------------- -----------------------------------
                                      Paso 1. Después de recibir el
                                      servicio, el sistema solicita al
                                      cliente realizar una reseña

Paso 3. El cliente ingresa su       Paso 4. El sistema guarda la reseña
  calificación y comentarios sobre el del cliente
  servicio recibido
  -----------------------------------------------------------------------

- **Curso alternativo:**

    i.  **En el paso 3:** si el cliente no desea dejar una reseña puede
        salir del sistema.

- **Postcondiciones:** La reseña del cliente sobre el servicio
    recibido se guarda correctamente en el sistema

![](media/image170.png){width="5.677084426946632in"
height="1.3229166666666667in"}

![](media/image171.png){width="5.219479440069991in"
height="4.479792213473316in"}

![A screenshot of a computer Description automatically
generated](media/image172.png){width="6.268055555555556in"
height="1.7375in"}

![A black and white rectangles with text Description automatically
generated](media/image173.png){width="6.268055555555556in"
height="1.429861111111111in"}![A diagram of a service Description
automatically generated](media/image174.png){width="6.268055555555556in"
height="4.384027777777778in"}

31. **Realizar Pagos en línea**

    - **Actores:** Cliente

    - **Tipos:** Primario

    - **Propósito:** Permitir que los clientes realicen pagos en línea
        por los servicios recibidos

    - **Resumen:** El cliente realiza el pago de la reserva a través
        de la aplicación

    - **Precondición:** El establecimiento ofrece servicios

    - **Curso básico:**

  -----------------------------------------------------------------------
  **Acciones de actores**             **Acciones del sistema**
  ----------------------------------- -----------------------------------
  Paso 1. Se ingresa el servicio que  Paso 2. Se verifica que la cita y
  se va a pagar                       el servicio existan.

  Paso 3. El cliente elige el método
  de pago

Paso 4. Se guarda el pago           Paso 5. Se guarda el pago
  -----------------------------------------------------------------------

- **Curso alternativo:**

    i.  Paso 2: Si no exista la cita o no exista el servicio se puede
        modificar, eliminar o salir del sistema.

- **Postcondiciones:** El pago queda registrado en el sistema.

![A diagram of a person with text Description automatically
generated](media/image175.png){width="3.9270833333333335in"
height="3.4479166666666665in"}

![](media/image176.png){width="5.344494750656168in"
height="4.458955599300087in"}

![A screenshot of a computer Description automatically
generated](media/image177.png){width="5.0in"
height="1.4479166666666667in"}

![A diagram of a company Description automatically
generated](media/image178.png){width="5.0in"
height="4.833333333333333in"}

![A black screen with white text Description automatically
generated](media/image179.png){width="6.458737970253718in"
height="2.0632075678040245in"}

![](media/image180.png){width="6.268055555555556in"
height="5.039583333333334in"}**Diagrama de Casos de Uso General del
Sistema**

## Modelo de Dominio \[del problema\]

[https://app.diagrams.net/#G1_dgE4EIgIO99QSPdAowJQgMlHrv9Be5n#%7B\"pageId\"%3A\"sK8s15_ZS7A4A-4CJ5jf\"%7D](https://app.diagrams.net/#G1_dgE4EIgIO99QSPdAowJQgMlHrv9Be5n#%7B"pageId"%3A"sK8s15_ZS7A4A-4CJ5jf"%7D)

![](media/image182.svg){width="6.268055555555556in"
height="3.463888888888889in"}

##

##

##

##

##

##

##

##

## Modelo de Clases \[de la solución\]

[https://app.diagrams.net/#G1_dgE4EIgIO99QSPdAowJQgMlHrv9Be5n#%7B\"pageId\"%3A\"B6juhMaYEk2xNm83owGG\"%7D](https://app.diagrams.net/#G1_dgE4EIgIO99QSPdAowJQgMlHrv9Be5n#%7B"pageId"%3A"B6juhMaYEk2xNm83owGG"%7D)

![](media/image184.svg){width="6.268055555555556in"
height="3.410416666666667in"}

## Paquetes

<https://drive.google.com/file/d/1yMp0I3xapmzCbnpTacgckW5jqX6cfN4k/view?usp=sharing>

### ![](media/image185.png){width="5.895833333333333in" height="2.9596741032370955in"}Paquetes de Análisis

![](media/image186.png){width="5.833333333333333in"
height="2.5185575240594926in"}

![](media/image187.png){width="5.904166666666667in"
height="4.635416666666667in"}

[]{#_Toc168952243 .anchor}

![](media/image188.png){width="5.8597222222222225in"
height="4.940972222222222in"}![](media/image189.png){width="6.406944444444444in"
height="3.8645833333333335in"}

![](media/image190.png){width="6.268055555555556in"
height="4.034722222222222in"}

### Paquetes de Diseño del Dominio

![](media/image191.png){width="4.091666666666667in"
height="3.209722222222222in"}

![](media/image192.png){width="4.29375in" height="3.5833333333333335in"}

![](media/image193.png){width="5.098954505686789in"
height="2.3240748031496063in"}

![](media/image194.png){width="4.861111111111111in"
height="3.196527777777778in"}

![](media/image195.png){width="5.373223972003499in"
height="3.0264588801399825in"}

### ![](media/image196.png){width="5.453166010498688in" height="5.4in"}![](media/image197.png){width="6.268055555555556in" height="3.0166666666666666in"}Paquetes de Diseño de Clases

![](media/image198.png){width="5.444444444444445in"
height="3.5902777777777777in"}![](media/image199.png){width="4.991666666666666in"
height="3.5506944444444444in"}

![](media/image200.png){width="5.685184820647419in"
height="2.3720811461067366in"}

[]{#_Toc168952245
.anchor}![](media/image201.png){width="5.972222222222222in"
height="2.6956386701662294in"}![](media/image202.png){width="5.675926290463692in"
height="3.8346773840769903in"}

## Diagramas de Maquinas de Estado

### Diagrama de Actividad de todo el sistema

![](media/image204.svg){width="6.268055555555556in"
height="8.840972222222222in"}

[https://lucid.app/lucidchart/5102ecf7-90be-4201-a0f8-7d107c05088b/edit?viewport_loc=-476%2C-255%2C4043%2C1897%2C0_0&invitationId=inv_31c4a241-9c2f-4f86-b832-5affd74d89d7](https://lucid.app/lucidchart/5102ecf7-90be-4201-a0f8-7d107c05088b/edit?viewport_loc=-476%2C-255%2C4043%2C1897%2C0_0&invitationId=inv_31c4a241-9c2f-4f86-b832-5affd74d89d7)

### ![A diagram of a company Description automatically generated](media/image205.png){width="4.022916666666666in" height="6.843055555555556in"}Diagrama de estado de casos de uso

![A diagram of a diagram Description automatically
generated](media/image206.png){width="4.291666666666667in"
height="5.59375in"}![A diagram of a salon Description automatically
generated](media/image207.png){width="4.520833333333333in"
height="5.760416666666667in"}

# Diagrama de estados de un objeto

![A diagram of a company Description automatically
generated](media/image208.png){width="3.8531102362204726in"
height="8.58721128608924in"}

## Prototipo

**Link: <https://jassielof.github.io/SI414-mockup/>**
