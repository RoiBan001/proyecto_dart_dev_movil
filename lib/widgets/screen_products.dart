import 'package:flutter/material.dart';

import '../screens/detalle_screen.dart';

final List<Map<String, dynamic>> productosIniciales = [
  {'nombre': 'Manzana', 'precio': '3000', 'icono': Icons.apple},
  {'nombre': 'Pan', 'precio': '5000', 'icono': Icons.breakfast_dining},
  {'nombre': 'Leche', 'precio': '4500', 'icono': Icons.local_drink},
];

class ScreenProducts extends StatelessWidget {
  const ScreenProducts({
    super.key,
    required this.productos,
    required this.onEliminar,
  });

  final List<Map<String, dynamic>> productos;
  final void Function(int index) onEliminar;

  @override
  Widget build(BuildContext context) {
    if (productos.isEmpty) {
      return const Center(child: Text('No hay productos'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: productos.length,
      itemBuilder: (context, index) {
        final producto = productos[index];
        final String nombre = producto['nombre'];
        final String precio = producto['precio'];
        final IconData icono = producto['icono'];

        return Dismissible(
          // La key identifica a CADA fila; debe ser única
          key: ValueKey(nombre),
          // Solo se puede deslizar de derecha a izquierda
          direction: DismissDirection.endToStart,
          // Lo que aparece detrás de la Card al deslizarla
          background: Container(
            margin: const EdgeInsets.all(4), // mismo margen que la Card
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            onEliminar(index);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$nombre eliminado')),
            );
          },
          child: Card(
            child: ListTile(
              leading: Hero(
                tag: nombre,
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: FittedBox(
                    child: Icon(
                      icono,
                      color: const Color.fromARGB(255, 185, 42, 78),
                    ),
                  ),
                ),
              ),
              title: Text(nombre),
              subtitle: Text('\$$precio'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalleScreen(
                      producto: nombre,
                      precio: precio,
                      icono: icono,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}