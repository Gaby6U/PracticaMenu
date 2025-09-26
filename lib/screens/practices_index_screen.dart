import 'package:flutter/material.dart';
// Importamos mi widget de menú lateral.
import '../app_drawer.dart';

// Esta pantalla actúa como el índice de todas las prácticas del portafolio.
class PracticesIndexScreen extends StatelessWidget {
  const PracticesIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Índice de Prácticas'),
      ), // Título de la barra.
      drawer: const AppDrawer(), // Agrego mi menú de navegación.
      // 'ListView' es ideal para una lista de opciones que puede desplazarse.
      body: ListView(
        children: <Widget>[
          // Uso mi función auxiliar para construir cada elemento (Tile) de la lista.
          _buildPracticeListTile(
            context,
            'Práctica 1: 10 Hola Mundo',
            '/practice/hello_world_ten', // La ruta a la que navega.
          ),
          _buildPracticeListTile(
            context,
            'Práctica 2: Agregar Hola Mundo',
            '/practice/hello_world_add',
          ),
          _buildPracticeListTile(
            context,
            'Práctica 3: Formulario de Registro',
            '/practice/registration_form',
          ),
          _buildPracticeListTile(
            context,
            'Práctica 4: Juego',
            '/practice/rock_paper_scissors',
          ),
        ],
      ),
    );
  }

  // Función auxiliar para construir una tarjeta de práctica con su navegación.
  Widget _buildPracticeListTile(
    BuildContext context,
    String title,
    String routeName,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(title), // El título que se muestra al usuario.
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
