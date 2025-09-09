import 'package:flutter/material.dart';
import 'menu_game.dart'; // Solo importa la pantalla de inicio de la práctica 5

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuGameScreen(),
    );
  }
}
