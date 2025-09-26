// Importamos la librería 'dart:math' para poder generar números aleatorios,
import 'dart:math';
// Importamos 'package:flutter/material.dart' para todos los widgets.
import 'package:flutter/material.dart';
// Importamos menú lateral.
import '../../app_drawer.dart';

// Clase del juego de Piedra, Papel o Tijera.
class RockPaperScissorsScreen extends StatefulWidget {
  const RockPaperScissorsScreen({super.key});

  @override
  // Creo el estado asociado a este widget.
  State<RockPaperScissorsScreen> createState() =>
      _RockPaperScissorsScreenState();
}

// La clase de estado donde guardo toda la lógica del juego.
class _RockPaperScissorsScreenState extends State<RockPaperScissorsScreen> {
  // Uso 'late' porque estas variables se inicializarán después.
  late GameChoice _userChoice;
  late GameChoice _deviceChoice;

  // El mensaje de resultado que se muestra al usuario.
  String _result = 'Elige una opción para empezar';
  // Los marcadores inicializados en 0.
  int _userScore = 0;
  int _deviceScore = 0;

  // Una lista con todas las opciones válidas del juego.
  final List<GameChoice> _choices = [
    GameChoice.rock,
    GameChoice.paper,
    GameChoice.scissors,
  ];

  // La función principal que se ejecuta cada vez que el usuario elige.
  void _playRound(GameChoice userChoice) {
    // Creo un objeto 'Random' para generar números aleatorios.
    final random = Random();
    // Elijo la jugada de la aplicación aleatoriamente usando 'nextInt'
    final deviceChoice = _choices[random.nextInt(_choices.length)];

    String resultMessage;
    // --- Lógica del juego ---
    // 1. Condición de EMPATE
    if (userChoice == deviceChoice) {
      resultMessage = '¡Empate!';
      // 2. Condición de GANAR
    } else if (
    // Piedra le gana a Tijera
    (userChoice == GameChoice.rock && deviceChoice == GameChoice.scissors) ||
        // Papel le gana a Piedra
        (userChoice == GameChoice.paper && deviceChoice == GameChoice.rock) ||
        // Tijera le gana a Papel
        (userChoice == GameChoice.scissors &&
            deviceChoice == GameChoice.paper)) {
      resultMessage = '¡Ganaste!';
      _userScore++; // Sumo un punto al marcador del usuario.
      // 3. Cualquier otro caso es PERDER
    } else {
      resultMessage = '¡Perdiste!';
      _deviceScore++; // Sumo un punto al marcador de la aplicación.
    }

    // Llamo a 'setState' para actualizar la interfaz con los nuevos datos.
    setState(() {
      // Guardo las elecciones para mostrarlas en pantalla.
      _userChoice = userChoice;
      _deviceChoice = deviceChoice;
      // Actualizo el mensaje de resultado.
      _result = resultMessage;
    });
  }

  // Función para poner los marcadores a cero.
  void _resetScore() {
    setState(() {
      _userScore = 0;
      _deviceScore = 0;
      _result = 'Elige una opción para empezar';
    });
  }

  // Función auxiliar para obtener el emoji correspondiente a cada jugada.
  String _getEmoji(GameChoice choice) {
    switch (choice) {
      case GameChoice.rock:
        return '🪨';
      case GameChoice.paper:
        return '📄';
      case GameChoice.scissors:
        return '✂️';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Piedra, Papel o Tijera')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // El contenido está organizado verticalmente con 'Column'.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Sección de marcador
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Marcador del Usuario
                Column(
                  children: [
                    const Text(
                      'Usuario',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Muestro la puntuación del usuario
                    Text(
                      '$_userScore',
                      style: const TextStyle(fontSize: 48, color: Colors.green),
                    ),
                  ],
                ),
                // Marcador de la Aplicación
                Column(
                  children: [
                    const Text(
                      'Dispositivo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Muestro la puntuación del dispositivo
                    Text(
                      '$_deviceScore',
                      style: const TextStyle(fontSize: 48, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              _result, // El resultado de la última ronda.
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Muestro las elecciones de la ronda solo si ya se jugó una.
            if (_result != 'Elige una opción para empezar')
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Muestro el emoji de la elección del usuario.
                  Text(
                    'Tu elección: ${_getEmoji(_userChoice)}',
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 20),
                  // Muestro el emoji de la elección de la aplicación.
                  Text(
                    'App: ${_getEmoji(_deviceChoice)}',
                    style: const TextStyle(fontSize: 28),
                  ),
                ],
              ),
            const SizedBox(height: 40),
            // Fila de botones para jugar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Uso mi función auxiliar para crear cada botón de forma limpia.
                _buildChoiceButton(GameChoice.rock),
                _buildChoiceButton(GameChoice.paper),
                _buildChoiceButton(GameChoice.scissors),
              ],
            ),
            const SizedBox(height: 40),
            // Botón para reiniciar el marcador
            ElevatedButton.icon(
              onPressed: _resetScore, // Llamo a mi función de reinicio.
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar Marcador'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para construir un botón de jugada.
  Widget _buildChoiceButton(GameChoice choice) {
    return ElevatedButton(
      // Al presionar, llamo a la lógica principal del juego.
      onPressed: () => _playRound(choice),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      // Muestro el emoji usando mi otra función auxiliar.
      child: Text(_getEmoji(choice), style: const TextStyle(fontSize: 50)),
    );
  }
}

// Defino un 'enum' (enumeración) para representar las tres posibles jugadas.
enum GameChoice { rock, paper, scissors }
