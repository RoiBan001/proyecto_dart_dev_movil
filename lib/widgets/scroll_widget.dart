import 'package:flutter/material.dart';

import '../screens/detalle_screen.dart';

class ScrollWidget extends StatelessWidget {
  const ScrollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productos = ['manzana', 'pan', 'leche', 'cafe', 'huevos'];

    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: Text(productos[index]),
          subtitle: Text('Producto ${index + 1}'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalleScreen(
                  producto: productos[index],
                  numero: index + 1,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
