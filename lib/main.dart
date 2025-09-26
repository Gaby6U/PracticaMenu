import 'package:flutter/material.dart';

// Importo todas mis pantallas principales y subpantallas
import 'screens/hub_screen.dart'; // La pantalla principal, el "hub" de la app.
import 'screens/practices_index_screen.dart'; // Donde listaré las prácticas.
import 'screens/settings_screen.dart'; // La pantalla de ajustes
import 'screens/kit_offline/kit__offline_screen.dart'; // La pantalla principal de kit offline.
import 'screens/kit_offline/notes_screen.dart'; // La pantalla de notas rápidas.
import 'screens/kit_offline/imc_calculator_screen.dart'; // La calculadora de IMC.
import 'screens/kit_offline/local_gallery_screen.dart'; // Galería.
import 'screens/kit_offline/odd_or_even_game_screen.dart'; // Juego de par o impar.

// Archivos de prácticas
import 'hello_world_ten.dart'; // Práctica: Imprimir "Hola Mundo" diez veces.
import 'hello_world_add.dart'; // Práctica: Sumar dos números con "Hola Mundo".
import 'registration_form.dart'; // Práctica: Un formulario de registro.
import 'rock_paper_scissors.dart'; // Práctica: El juego de Piedra, Papel o Tijera.

void main() {
  // Ejecuto mi widget principal.
  runApp(const MyApp());
}

// 'MyApp' es la clase base de mi aplicación.
class MyApp extends StatefulWidget {
  // Constructor.
  const MyApp({super.key});

  @override
  // Esto crea y devuelve el objeto de estado asociado al widget.
  State<MyApp> createState() => _MyAppState();
}

// La clase 'State' donde guardo la lógica y los datos de 'MyApp',
class _MyAppState extends State<MyApp> {
  // Declaro mi variable para el modo de tema.
  ThemeMode _themeMode = ThemeMode.system;

  // Una función para cambiar entre tema claro y tema oscuro.
  void toggleTheme() {
    // Uso 'setState' para notificar a Flutter que el estado ha cambiado
    setState(() {
      // Si el tema actual es claro, lo cambio a oscuro; si no, lo cambio a claro.
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    // El widget principal de mi app.
    return MaterialApp(
      title:
          'AppHub Portafolio', // El título que aparece en el administrador de tareas.
      debugShowCheckedModeBanner: false,
      // Defino el tema claro base, usando el azul como color primario.
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      // Defino el tema oscuro.
      darkTheme: ThemeData.dark(useMaterial3: true),
      // Esta línea le dice a Flutter qué tema usar (light, dark o system),
      themeMode: _themeMode,
      initialRoute: '/',
      // Aquí defino todas las rutas o pantallas a las que puedo navegar en mi app.
      routes: {
        // Rutas de pantallas principales
        '/': (context) => const HubScreen(), // mi Hub.
        '/practices': (context) =>
            const PracticesIndexScreen(), // El índice de mis prácticas.
        // La pantalla de ajustes necesita mi función 'toggleTheme' para cambiar el tema.
        '/settings': (context) => SettingsScreen(toggleTheme: toggleTheme),
        '/kit_offline': (context) =>
            const KitOfflineScreen(), // El kit de herramientas.
        '/notes': (context) => const NotesScreen(), // La pantalla de notas.
        '/imc': (context) => const IMCCalculatorScreen(), // La calculadora IMC.
        '/gallery': (context) =>
            const LocalGalleryScreen(), // La galería local.
        '/odd_even': (context) =>
            const OddOrEvenGameScreen(), // El juego de par o impar.
        // Rutas de prácticas
        '/practice/hello_world_ten': (context) =>
            const HelloWorldTenTimesScreen(),
        '/practice/hello_world_add': (context) => const HelloWorldAddScreen(),
        '/practice/registration_form': (context) =>
            const RegistrationFormScreen(),
        '/practice/rock_paper_scissors': (context) =>
            const RockPaperScissorsScreen(),
      },
    );
  }
}
