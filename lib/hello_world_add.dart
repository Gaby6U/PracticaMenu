import 'package:flutter/material.dart';
// Importo mi widget de menú lateral, ¡necesario para la navegación!
import 'app_drawer.dart';

// Este es el widget principal para mi práctica de "Agregar Hola Mundo".
class HelloWorldAddScreen extends StatefulWidget {
  const HelloWorldAddScreen({super.key});

  @override
  // Creo el estado asociado a este widget.
  State<HelloWorldAddScreen> createState() => _HelloWorldAddScreenState();
}

// La clase maneja datos y la lógica de la pantalla.
class _HelloWorldAddScreenState extends State<HelloWorldAddScreen> {
  // Esta es la lista que guardará todos mis mensajes de "Hola Mundo".
  List<String> helloWorldMessages = [];

  // Mi función para agregar un nuevo mensaje a la lista.
  void addHelloWorld() {
    // redibuja la interfaz
    setState(() {
      // Agrego un nuevo string a la lista.
      helloWorldMessages.add('Hola Mundo ${helloWorldMessages.length + 1}');
    });
  }

  @override
  // El método 'build' que construye la interfaz.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Hola Mundo'),
      ), // El título de mi barra.
      drawer: const AppDrawer(), // Agrego el menú de navegación lateral.
      floatingActionButton: FloatingActionButton(
        onPressed: addHelloWorld, // Le asigno mi función para agregar mensajes.
        child: const Icon(Icons.add),
      ),
      // El 'body' tiene una lógica condicional Si la lista está vacía, muestro un mensaje de ayuda en el centro.
      body: helloWorldMessages.isEmpty
          // Mensaje central si la lista está vacía.
          ? const Center(child: Text('Presiona "+" para agregar mensajes'))
          // Si la lista *NO* está vacía, muestro la lista de mensajes usando 'ListView.builder'.
          : ListView.builder(
              itemCount: helloWorldMessages
                  .length, // El número total de mensajes a mostrar.
              // La función para construir cada elemento de la lista.
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  helloWorldMessages[index],
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
