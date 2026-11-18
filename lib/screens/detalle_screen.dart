import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class DetalleScreen extends StatelessWidget {
  const DetalleScreen({
    super.key,
    required this.producto,
    required this.precio,
    this.icono = Icons.shopping_cart,
  });

  final String producto;
  final String precio;
  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: producto),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: producto,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: FittedBox(
                    child: Icon(
                      icono,
                      color: const Color.fromARGB(255, 185, 42, 78),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(producto, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(
                '\$$precio',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Volver a la lista'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
