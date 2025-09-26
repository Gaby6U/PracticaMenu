import 'package:flutter/material.dart';
// Importamos mi widget de menú lateral para la navegación.
import '../../app_drawer.dart';

// Esta es la pantalla principal que muestra todos mis módulos o herramientas offline.
class KitOfflineScreen extends StatelessWidget {
  const KitOfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kit Offline')),
      drawer: const AppDrawer(), // Agrego el menú de navegación.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Se muestran 2 tarjetas por fila
          crossAxisSpacing: 16, // Espacio entre las tarjetas en horizontal.
          mainAxisSpacing: 16, // Espacio entre las tarjetas en vertical.
          children: [
            _buildModuleCard(
              context,
              title: 'Notas Rápidas',
              icon: Icons.note_add_rounded,
              color: Colors.blueAccent,
              route: '/notes', // La ruta a la que va a navegar.
            ),
            _buildModuleCard(
              context,
              title: 'Calculadora de IMC',
              icon: Icons.monitor_weight_rounded,
              color: Colors.green,
              route: '/imc',
            ),
            _buildModuleCard(
              context,
              title: 'Galería Local',
              icon: Icons.photo_library_rounded,
              color: Colors.orange,
              route: '/gallery',
            ),
            _buildModuleCard(
              context,
              title: 'Juego: Par o Impar',
              icon: Icons.casino_rounded,
              color: Colors.purple,
              route: '/odd_even',
            ),
          ],
        ),
      ),
    );
  }

  // Mi función auxiliar para crear una tarjeta de módulo
  Widget _buildModuleCard(
    BuildContext context, {
    required String title, // El título del módulo.
    required IconData icon, // El icono que va a tener.
    required Color color, // El color principal del icono.
    required String route, // La ruta de navegación.
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
