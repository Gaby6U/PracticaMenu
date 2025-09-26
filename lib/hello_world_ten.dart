import 'package:flutter/material.dart';
// Importo mi widget de menú lateral para la navegación.
import 'app_drawer.dart';

// Este es el widget principal de mi práctica de "Hola Mundo" diez veces.
// Lo hago un 'StatefulWidget' porque necesito que la lista de mensajes se muestre/oculte
class HelloWorldTenTimesScreen extends StatefulWidget {
  const HelloWorldTenTimesScreen({super.key});

  @override
  // Este método crea la instancia de estado asociada al widget.
  State<HelloWorldTenTimesScreen> createState() =>
      _HelloWorldTenTimesScreenState();
}

// La clase de estado donde reside toda la lógica y los datos.
class _HelloWorldTenTimesScreenState extends State<HelloWorldTenTimesScreen> {
  // Esta variable booleana controla si se debe mostrar o no la lista de mensajes.
  bool showMessages = false;

  // Inicializo una lista de 10 mensajes.
  // El índice va de 0 a 9, así que le sumo 1 para que empiece en 'Hola Mundo 1'.
  final List<String> messages = List.generate(
    10,
    (index) => 'Hola Mundo ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    // Uso 'Scaffold' para la estructura básica de la pantalla.
    return Scaffold(
      // Mi barra de aplicación con el título de la práctica.
      appBar: AppBar(title: const Text('10 Hola Mundo')),
      // Agrego el menú lateral de navegación a mi pantalla.
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              // El evento que se dispara al presionar el botón.
              onPressed: () {
                setState(() {
                  showMessages = !showMessages;
                });
              },
              // El texto del botón cambia según el estado de 'showMessages'.
              child: Text(
                showMessages ? 'Ocultar Hola Mundo' : 'Mostrar Hola Mundo',
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Aquí uso el operador condicional 'if' para mostrar o no el siguiente widget.
          if (showMessages)
            Expanded(
              // 'ListView.builder' es la forma eficiente de crear listas grandes en Flutter,
              // solo construye los elementos que son visibles.
              child: ListView.builder(
                itemCount: messages.length,
                // Esta función se llama para construir cada fila de la lista.
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    messages[index], // Obtengo el mensaje de mi lista usando el índice.
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
