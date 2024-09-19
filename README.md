# Yu-Gi-Oh! Monster App

Esta es una aplicación móvil desarrollada en **Flutter** para mostrar detalles de monstruos de Yu-Gi-Oh! utilizando la API [Ygoprodeck](https://ygoprodeck.com/). El objetivo principal de la aplicación es proporcionar información detallada de monstruos basados en arquetipos y excluir aquellos que se encuentren en la banlist. Este README describe la arquitectura utilizada, funcionalidades clave y características técnicas de la aplicación.

## Características principales

- **Consulta de arquetipos**: El usuario puede buscar diferentes arquetipos de monstruos de Yu-Gi-Oh!.
- **Detalle de monstruos**: Se muestran estadísticas, habilidades y descripciones de cada monstruo seleccionado.
- **Exclusión de cartas en banlist**: Se filtran automáticamente los monstruos que están prohibidos o limitados en la banlist.
- **Búsqueda interactiva**: Se implementa una funcionalidad de búsqueda para filtrar arquetipos de manera eficiente.
- **Diseño visual atractivo**: Cada monstruo se presenta con su diseño de carta e imagen.
  
## Arquitectura

La arquitectura de este proyecto sigue una estructura **MVVM (Model-View-ViewModel)**, manteniendo la separación de responsabilidades y facilitando la escalabilidad y mantenibilidad del código.

### Estructura del proyecto

- **models/**: Contiene las clases modelo que representan los datos recibidos desde la API, como `Monster` y `Archetype`.
- **services/**: Incluye las clases responsables de la comunicación con la API. Ejemplos: `ApiService` y `BanlistService`.
- **providers/**: Implementa el patrón **Provider** de Flutter para la gestión de estado de la UI. Aquí se incluye lógica de negocio y manejo de datos. Ejemplo: `MonsterProvider`, `ArchetypeProvider`.
- **screens/**: Contiene las pantallas de la aplicación. Ejemplos: `ArchetypeListScreen`, `MonsterDetailScreen`.
- **utils/**: Funciones utilitarias para operaciones comunes, como mostrar diálogos o manejar el scroll.

### Diagrama de la arquitectura

```plaintext
+----------------+      +----------------+      +----------------+
|                |      |                |      |                |
|    UI (View)   +----->+ ViewModel       +----->+  Services      |
|                |      | (Providers)     |      | (API Calls)    |
+----------------+      +----------------+      +----------------+
```
### Demo
Aquí hay una demostración animada de la aplicación:

![
Demo de la Aplicación
](
assets/demo.gif
)

## Descargar APK


Puedes descargar la última versión de la aplicación en formato APK desde el siguiente enlace:

[
Descargar APK
](
releases/tu-apk-file.apk
)

...

## Licencia


Este proyecto está bajo la licencia MIT - mira el archivo [
LICENSE
](
LICENSE
) para más detalles.