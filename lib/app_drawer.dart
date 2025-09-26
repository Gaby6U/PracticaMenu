// Importo el paquete esencial de Flutter para construir la interfaz.
import 'package:flutter/material.dart';

// Defino mi widget AppDrawer, solo muestra las opciones de navegación.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // El widget 'Drawer', menú lateral que sale al presionar el icono de "hamburguesa".
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        // Aquí coloco todos los elementos del menú.
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Text(
              'Menú del Portafolio', // Mi título de menú.
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // Inicio (Hub)
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio (Hub)'),
            onTap: () {
              // Navego a la ruta '/' (mi pantalla principal).
              // Uso 'pushReplacementNamed' para reemplazar la pantalla actual,
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          // Índice de Prácticas
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Índice de Prácticas'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/practices');
            },
          ),
          // Kit Offline
          ExpansionTile(
            leading: const Icon(Icons.apps),
            title: const Text('Proyecto: Kit Offline'),
            children: <Widget>[
              // Elementos dentro del submenú
              ListTile(
                title: const Text('Notas rápidas'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/notes');
                },
              ),
              ListTile(
                title: const Text('Calculadora de IMC'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/imc');
                },
              ),
              ListTile(
                title: const Text('Galería local'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/gallery');
                },
              ),
              ListTile(
                title: const Text('Juego: Par o Impar'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/odd_even');
                },
              ),
            ],
          ),
          const Divider(),
          // Ajustes
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
