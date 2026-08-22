//
//  ContentView.swift
//  Actividad 3
//
//  21/06/26.
//

import SwiftUI

/*

Juego: Atrapa los 5 Pesos
 Este es un minijuego de agilidad mental y reflejos desarrollado en SwiftUI.
 El objetivo del jugador es tocar la moneda de 5 pesos mexicanos tantas veces como sea posible antes de que se agote el tiempo.
 
 ¿Cómo jugar?:
 1. Al iniciar la aplicación, presiona el botón Iniciar para empezar
 2. Aparecerá una moneda de $5 en una posición aleatoria de la pantalla
 3. Toca la moneda rápidamente. Cada toque exitoso sumará 1 punto a tu marcador y moverá la moneda a otro lugar
 4. Si tardas demasiado en tocarla, la moneda se moverá sola para desafiarte
 5. El juego dura 10 segundos. Cuando el contador llegue a 0, el juego terminará y podrás ver tu puntuación final y presionar "Jugar de Nuevo".
 */

struct ContentView: View {
    // Estados del juego logica y puntuacion)
    @State private var score = 0
    @State private var timeLeft = 10
    @State private var isPlaying = false
    
    // Posición de la moneda en la pantalla
    @State private var coinPosition = CGPoint(x: 150, y: 300)
    
    // Temporizadores para el juego
    @State private var gameTimer: Timer?
    @State private var coinTimer: Timer?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 1. Fondo personalizado: Bandera de México (Verde, Blanco y Verde)
                LinearGradient(gradient: Gradient(colors: [
                    Color(red: 0.0, green: 0.43, blue: 0.24),  // Verde Mexicano
                    Color.white,                               // Blanco
                    Color(red: 0.81, green: 0.15, blue: 0.19)   // Rojo Mexicano
                ]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                // 2. Interfaz Principal
                VStack {
                    // Marcadores superiores (Puntuación y Tiempo)
                    HStack {
                        Text("Puntos: \(score)")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                        
                        Spacer()
                        
                        Text("Tiempo: \(timeLeft)s")
                            .font(.title2)
                            .bold()
                            // Indicador visual: parpadea o se pone amarillo/rojo al final
                            .foregroundColor(timeLeft <= 3 ? .yellow : .white)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Botón de inicio / Reinicio con estilo patrio
                    if !isPlaying {
                        Button(action: {
                            startGame(in: geometry.size)
                        }) {
                            Text(timeLeft == 0 ? "¡Otra Vez! 🇲🇽" : "Iniciar")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 220)
                                .background(Color(red: 0.0, green: 0.43, blue: 0.24)) // Botón verde
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                        }
                    }
                    
                    Spacer()
                }
                
                // 3. Elemento principal:  moneda de 5 Pesos
                if isPlaying {
                    // se crea una moneda con el texto "$5"
                    ZStack {
                        Circle()
                            .fill(Color(red: 0.75, green: 0.6, blue: 0.2)) // Color dorado/bronce de los 5 pesos
                            .frame(width: 70, height: 70)
                            .shadow(radius: 4)
                            .overlay(
                                Circle()
                                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 5) // Aro exterior plateado  de la moneda
                            )
                        
                        Text("$5")
                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                            .foregroundColor(.black.opacity(0.7))
                    }
                    // Aplica la posición aleatoria calculada
                    .position(coinPosition)
                    // Animación de desplazamiento suave
                    .animation(.easeInOut(duration: 0.2), value: coinPosition)
                    // Detección de toques (Tap Gesture)
                    .onTapGesture {
                        score += 1
                        moveCoin(in: geometry.size)
                    }
                }
            }
        }
    }
    
    //  LÓGICA DEL JUEGO
    
    /// Inicia los parametros del juego y los temporizadores
    func startGame(in size: CGSize) {
        score = 0
        timeLeft = 10
        isPlaying = true
        moveCoin(in: size)
        
        // Temporizador para la cuenta regresiva (1 segundo)
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeLeft > 0 {
                timeLeft -= 1
            } else {
                endGame()
            }
        }
        
        // Temporizador para mover los 5 pesos automáticamente si el usuario no los toca
        coinTimer = Timer.scheduledTimer(withTimeInterval: 0.85, repeats: true) { _ in
            moveCoin(in: size)
        }
    }
    
    /// Mueve la moneda a una posición aleatoria segura dentro de la pantalla
    func moveCoin(in size: CGSize) {
        // Se restan margenes para que la moneda no quede cortada en las orillas de la pantalla
        let randomX = CGFloat.random(in: 45...(size.width - 45))
        let randomY = CGFloat.random(in: 120...(size.height - 120))
        
        coinPosition = CGPoint(x: randomX, y: randomY)
    }
    
    /// Finaliza el juego y limpia los timers de la memoria RAM
    func endGame() {
        isPlaying = false
        gameTimer?.invalidate()
        coinTimer?.invalidate()
    }
}

//  vista previa
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
