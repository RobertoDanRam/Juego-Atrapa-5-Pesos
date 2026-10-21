# Manipulación de UI en iOS (Swift - ACT2)

Este proyecto es una aplicación básica para iOS desarrollada en Swift utilizando Xcode. Su objetivo principal es demostrar la interacción y manipulación dinámica de elementos de la interfaz de usuario (UI) utilizando el framework `UIKit`. Mediante el uso de conexiones de Storyboard, la aplicación responde a eventos del usuario para modificar propiedades visuales en tiempo real.

**Autor:** Roberto Daniel Ramos Flores

## Características Principales

*   **Actualización de Texto Dinámica:** Implementa un `UISlider` que captura valores numéricos para actualizar un `UILabel` ("Edad: X años") en tiempo real mediante un `@IBAction`.
*   **Control de Opacidad (`Alpha`):** Un segundo `UISlider` permite al usuario ajustar la transparencia de una imagen (`UIImageView`), modificando su propiedad `alpha` entre 0.0 y 1.0.
*   **Modificación de Propiedades de Vista:** Un botón (`UIButton`) cambia el color de fondo de la vista principal (`view.backgroundColor`) al color azul del sistema (`.systemBlue`).
*   **Visibilidad de Elementos (`isHidden`):** Incorpora un botón que alterna el estado de visibilidad de la imagen, utilizando el método `.toggle()` sobre la propiedad `isHidden`.
*   **Carga de Imágenes Programática:** Un botón específico carga y asigna un objeto `UIImage` (referenciando el recurso "foto") al componente `UIImageView` desde el código.

## Tecnologías Utilizadas

*   **Lenguaje:** Swift
*   **Framework UI:** UIKit
*   **Entorno de Desarrollo:** Xcode
*   **Arquitectura:** MVC (Modelo-Vista-Controlador basado en Storyboards)

## Estructura del Proyecto

De acuerdo con la estructura del repositorio `act2`, los archivos clave se organizan de la siguiente manera dentro de la carpeta `ACT2`:

*   `ViewController.swift`: Contiene la lógica del controlador de la vista, definiendo las referencias a la interfaz (`@IBOutlet`) y las funciones de respuesta a eventos (`@IBAction`).
*   `AppDelegate.swift` y `SceneDelegate.swift`: Archivos delegados que manejan el ciclo de vida de la aplicación y la configuración de las escenas (ventanas) del dispositivo.
*   `Info.plist`: Archivo XML (Property List) que define la configuración, metadatos y manifiesto de escenas de la aplicación.
*   `Assets.xcassets`: Directorio destinado a almacenar los recursos gráficos de la aplicación, como la imagen utilizada en el `UIImageView`.
*   `Base.lproj`: Carpeta que típicamente contiene el archivo `Main.storyboard` para el diseño visual de la interfaz.
