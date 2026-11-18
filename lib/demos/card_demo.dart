import 'package:flutter/material.dart';

const _rosa = Color.fromARGB(255, 185, 42, 78);
const _titulo = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // EJEMPLO MÍNIMO
          const Text('Ejemplo mínimo', style: _titulo),
          const SizedBox(height: 8),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Hola, soy una Card'),
            ),
          ),

          const SizedBox(height: 32),

          // EJEMPLO PERSONALIZADO
          const Text('Ejemplo personalizado', style: _titulo),
          const SizedBox(height: 8),
          Card(
            elevation: 8,
            color: const Color.fromARGB(255, 255, 240, 244),
            shadowColor: _rosa,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: _rosa, width: 2),
            ),
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: _rosa,
                  child: const Center(
                    child: Icon(Icons.local_drink, size: 60, color: Colors.white),
                  ),
                ),
                const ListTile(
                  title: Text('Leche'),
                  subtitle: Text('\$4500'),
                  trailing: Icon(Icons.add_shopping_cart),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}