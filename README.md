# Atrapa los 5 Pesos (SwiftUI - Actividad 3)

Este proyecto es un minijuego de agilidad mental y reflejos para iOS, desarrollado completamente con SwiftUI y Swift. El objetivo principal es poner a prueba la rapidez del jugador al intentar tocar una moneda de "5 pesos" que cambia de posición constantemente en la pantalla antes de que se agote el tiempo.

**Autor:** Roberto Daniel Ramos Flores

## ¿Cómo jugar?

1.  Al iniciar la aplicación, presiona el botón **Iniciar** para comenzar la partida.
2.  Aparecerá una moneda de $5 en una posición aleatoria de la pantalla.
3.  Toca la moneda lo más rápido posible. Cada toque exitoso sumará **1 punto** a tu marcador y moverá la moneda a una nueva ubicación.
4.  Si tardas más de 0.85 segundos en tocarla, la moneda se moverá automáticamente para aumentar la dificultad.
5.  El juego dura exactamente **10 segundos**. El contador de tiempo cambiará de color a amarillo en los últimos 3 segundos como advertencia. Al finalizar, podrás ver tu puntuación y presionar "¡Otra Vez! 🇲🇽" para reiniciar.

## Características Técnicas y UI

*   **Interfaz Declarativa:** Interfaz construida usando `VStack`, `HStack`, y `ZStack` en SwiftUI.
*   **Gestos (Tap Gesture):** Detección de toques a través de `.onTapGesture` para interactuar con la moneda.
*   **Temporizadores (Timers):** Uso de `Timer.scheduledTimer` para manejar la cuenta regresiva del juego (1 segundo) y el movimiento automático de la moneda (0.85 segundos).
*   **Animaciones:** Desplazamiento suave de la moneda implementado con `.animation(.easeInOut(duration: 0.2))`.
*   **Diseño Temático:** Fondo de pantalla implementado con un `LinearGradient` utilizando los colores de la bandera de México, y un diseño de moneda creado con figuras de SwiftUI (`Circle`) superpuestas y estilizadas.

## Estructura del Proyecto

De acuerdo con el árbol de archivos del repositorio[cite: 11], la estructura principal es la siguiente:

*   `Actividad_3App.swift`: Archivo principal que define el punto de entrada de la aplicación (`@main`) y carga la vista principal[cite: 11].
*   `ContentView.swift`: Contiene toda la lógica del juego, las variables de estado (`@State`) para la puntuación y el tiempo, y la construcción de la interfaz gráfica[cite: 11].
*   `SpinComponent.swift`: Un componente de **RealityKit** que define un eje de rotación en un entorno 3D, preparando la aplicación para posibles integraciones de realidad aumentada[cite: 11].
*   `Assets.xcassets`: Carpeta destinada a los recursos gráficos estáticos de la aplicación[cite: 11].
