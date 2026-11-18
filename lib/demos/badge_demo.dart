import 'package:flutter/material.dart';

const _rosa = Color.fromARGB(255, 185, 42, 78);
const _titulo = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

class BadgeDemo extends StatefulWidget {
  const BadgeDemo({super.key});

  @override
  State<BadgeDemo> createState() => _BadgeDemoState();
}

class _BadgeDemoState extends State<BadgeDemo> {
  int _cantidad = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Badge')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // EJEMPLO MÍNIMO: sin label, se ve solo un puntito
            const Text('Ejemplo mínimo', style: _titulo),
            const SizedBox(height: 16),
            const Badge(
              child: Icon(Icons.notifications, size: 40),
            ),

            const SizedBox(height: 40),

            // EJEMPLO PERSONALIZADO: contador que cambia
            const Text('Ejemplo personalizado', style: _titulo),
            const SizedBox(height: 24),
            Row(
              children: [
                Badge(
                  isLabelVisible: _cantidad > 0,
                  label: Text(_cantidad > 99 ? '99+' : '$_cantidad'),
                  backgroundColor: _rosa,
                  textColor: Colors.white,
                  largeSize: 22,
                  offset: const Offset(8, -8),
                  child: const Icon(Icons.shopping_cart, size: 48),
                ),
                const SizedBox(width: 40),
                IconButton.filledTonal(
                  icon: const Icon(Icons.remove),
                  onPressed: _cantidad > 0
                      ? () => setState(() => _cantidad--)
                      : null,
                ),
                const SizedBox(width: 8),
                IconButton.filledTonal(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => _cantidad++),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}