import 'package:flutter/material.dart';
import 'menu_game.dart';
import 'hello_world_ten.dart';
import 'hello_world_add.dart';
import 'registration_form.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menú de Prácticas',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio (Práctica 5)'),
            onTap: () {
              Navigator.pop(context); // Cierra el drawer
              // Usa pushReplacement para ir al inicio
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MenuGameScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.looks_one),
            title: const Text('Práctica 1'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelloWorldTenTimesScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.looks_two),
            title: const Text('Práctica 2'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelloWorldAddScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.looks_4),
            title: const Text('Práctica 4'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistrationFormScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.casino),
            title: const Text('Juego: Piedra, Papel o Tijera'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RockPaperScissorsGame(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
