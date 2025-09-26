import 'package:flutter/material.dart';
// Importamos mi widget de menú lateral.
import '../../app_drawer.dart';

// Esta pantalla es para crear y gestionar notas rápidas.
class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  // Crea y retorna el objeto de estado para esta pantalla.
  State<NotesScreen> createState() => _NotesScreenState();
}

// La clase de estado donde reside la lógica y los datos.
class _NotesScreenState extends State<NotesScreen> {
  // La lista mutable que almacenará todas las notas del usuario.
  final List<String> _notes = [];
  // Un controlador para interactuar con el campo de texto.
  final TextEditingController _textController = TextEditingController();

  // Función para agregar una nueva nota a la lista.
  void _addNote() {
    // 1. Verifico que el campo de texto no esté vacío.
    if (_textController.text.isNotEmpty) {
      // 2. Uso 'setState' para actualizar la UI.
      setState(() {
        _notes.add(
          _textController.text,
        ); // Añado el texto del controlador a la lista.
      });
      _textController
          .clear(); // Limpio el campo de texto después de agregar la nota.

      // Muestro un mensaje temporal al usuario confirmando la acción.
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Nota agregada')));
    }
  }

  // Función para vaciar completamente la lista de notas.
  void _clearAllNotes() {
    // Uso 'setState' para notificar el cambio de estado.
    setState(() {
      _notes.clear(); // Vacío la lista.
    });
    // Muestro un SnackBar de confirmación.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Todas las notas han sido borradas')),
    );
  }

  @override
  void dispose() {
    _textController.dispose(); // Libero el controlador de texto.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas rápidas'),
        // 'actions' es la lista de widgets que van a la derecha del título.
        actions: [
          // Botón de ícono para borrar todas las notas.
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _clearAllNotes, // Asigno la función para borrar todo.
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: _notes.length, // El número de notas a mostrar.
        itemBuilder: (context, index) {
          // Cada nota se muestra dentro de una tarjeta (Card).
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(title: Text(_notes[index])),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Al presionar el FAB, muestro un diálogo emergente.
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Nueva Nota'),
                content: TextField(
                  controller:
                      _textController, // Asocio mi controlador a este TextField.
                  decoration: const InputDecoration(
                    hintText: 'Escribe tu nota aquí...',
                  ),
                ),
                actions: <Widget>[
                  // Botón de Cancelar
                  TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      // Cierro el diálogo sin hacer nada.
                      Navigator.of(context).pop();
                    },
                  ),
                  // Botón de Agregar
                  TextButton(
                    child: const Text('Agregar'),
                    onPressed: () {
                      _addNote(); // Ejecuto la lógica para agregar la nota.
                      // Cierro el diálogo.
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add), // Icono de suma (+) en el FAB.
      ),
    );
  }
}
