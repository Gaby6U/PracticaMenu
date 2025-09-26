import 'package:flutter/material.dart';
// Importamos mi widget de menú lateral.
import '../../app_drawer.dart';

// Esta pantalla es para los ajustes de la aplicación.
// solo recibe una función para cambiar el tema.
class SettingsScreen extends StatelessWidget {
  final Function toggleTheme;

  const SettingsScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ), // Título de la barra de la aplicación.
      drawer: const AppDrawer(), // Agrego mi menú de navegación.
      body: ListView(
        children: <Widget>[
          // 'SwitchListTile' es un widget para activar o desactivar una opción.
          SwitchListTile(
            title: const Text('Modo oscuro'), // El título de la opción.
            // El valor del interruptor se basa en si el brillo del tema actual
            value: Theme.of(context).brightness == Brightness.dark,
            // 'onChanged' es la función que se ejecuta al mover el interruptor.
            onChanged: (bool value) {
              toggleTheme(); // Llamo a la función que recibí para cambiar el tema.
            },
            // El icono que se muestra a la izquierda del título.
            secondary: Icon(
              // Usamos un operador ternario para cambiar el icono según el tema.
              Theme.of(context).brightness == Brightness.dark
                  ? Icons
                        .dark_mode // Si está oscuro, muestro el icono de luna.
                  : Icons.light_mode, // Si está claro, muestro el icono de sol.
            ),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.info_outline), // Un icono de información.
            title: const Text('Acerca de'), // Título de la fila.
            onTap: () {
              // Al tocar, muestro una ventana de diálogo de 'acerca de'.
              showAboutDialog(
                context: context,
                applicationName:
                    'AppHub Portafolio', // Nombre de la aplicación.
                applicationVersion: '1.0.0', // Versión de la aplicación.
                applicationIcon: const Icon(
                  Icons.apps,
                ), // Icono de la aplicación.
                children: <Widget>[
                  const Text('Desarrollado por Gabriela G.'),
                ], // Contenido adicional.
              );
            },
          ),
        ],
      ),
    );
  }
}
