import 'package:flutter/material.dart';
// Importo mi widget personalizado 'AppDrawer'.
import '../../app_drawer.dart';

// Esta clase es la pantalla principal de mi Práctica 5.
class MenuGameScreen extends StatelessWidget {
  // Constructor para el widget.
  const MenuGameScreen({super.key});

  @override
  // El método 'build' que dibuja la interfaz.
  Widget build(BuildContext context) {
    // El widget 'Scaffold' me proporciona la estructura básica de una pantalla
    return Scaffold(
      // La 'AppBar' es la barra superior de mi pantalla.
      appBar: AppBar(title: const Text('Práctica 5')),
      // Aquí se inserta mi widget 'AppDrawer'.
      drawer: const AppDrawer(),
      // Es el contenido principal de la pantalla.
      body: const Center(
        child: Text(
          // El texto que le quiero mostrar al usuario.
          '¡Bienvenido a la Práctica 5!\nUsa el menú de hamburguesa para navegar.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
