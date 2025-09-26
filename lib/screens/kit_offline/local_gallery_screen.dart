import 'package:flutter/material.dart';
// Importamos mi widget de menú lateral.
import '../../app_drawer.dart';

// Esta pantalla es para mostrar una galería de imágenes locales.
class LocalGalleryScreen extends StatelessWidget {
  const LocalGalleryScreen({super.key});

  // La lista de rutas de las imágenes que se van a mostrar.
  final List<String> _imagePaths = const [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galería Local')),
      drawer: const AppDrawer(), // Agregamos el menú de navegación.
      // Solo carga los elementos que son visibles en la pantalla.
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Muestra 2 elementos por fila.
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _imagePaths.length,
        // 'itemBuilder' es una función que se llama para construir cada elemento de la cuadrícula.
        itemBuilder: (context, index) {
          return GestureDetector(
            // Al presionar sobre una imagen, mostramos una ventana de diálogo.
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Imagen ${index + 1}'), // Título de la ventana.
                    content: Image.asset(
                      _imagePaths[index],
                    ), // La imagen en sí.
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cerrar'),
                        onPressed: () {
                          // Cierra la ventana de diálogo.
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            // 'Hero' es un widget que crea una animación de transición visualmente agradable.
            child: Hero(
              tag: 'imageHero${index + 1}',
              // 'Image.asset' carga la imagen desde los archivos del proyecto.
              child: Image.asset(_imagePaths[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
