import 'package:flutter/material.dart';

const _rosa = Color.fromARGB(255, 185, 42, 78);
const _titulo = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

class HeroDemo extends StatelessWidget {
  const HeroDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // EJEMPLO MÍNIMO
            const Text('Ejemplo mínimo (toca el cuadro)', style: _titulo),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const _DestinoMinimo()),
              ),
              child: Hero(
                tag: 'demo-minimo',
                child: Container(width: 60, height: 60, color: Colors.amber),
              ),
            ),

            const SizedBox(height: 32),

            // EJEMPLO PERSONALIZADO
            const Text('Ejemplo personalizado (toca el círculo)', style: _titulo),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  // Animación más lenta para que se aprecie
                  transitionDuration: const Duration(seconds: 1),
                  reverseTransitionDuration: const Duration(seconds: 1),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const _DestinoPersonalizado(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              ),
              child: Hero(
                tag: 'demo-personalizado',
                // Lo que se ve en el lugar original mientras el Hero vuela
                placeholderBuilder: (context, size, child) => Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: _caja(80, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Caja rosada con un ícono. FittedBox hace que el ícono crezca
// junto con la caja durante la animación.
Widget _caja(double tamano, double radio) {
  return Container(
    width: tamano,
    height: tamano,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: _rosa,
      borderRadius: BorderRadius.circular(radio),
    ),
    child: const FittedBox(
      child: Icon(Icons.local_drink, color: Colors.white),
    ),
  );
}

class _DestinoMinimo extends StatelessWidget {
  const _DestinoMinimo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Destino mínimo')),
      body: Center(
        child: Hero(
          tag: 'demo-minimo', // MISMO tag que en la pantalla anterior
          child: Container(width: 200, height: 200, color: Colors.amber),
        ),
      ),
    );
  }
}

class _DestinoPersonalizado extends StatelessWidget {
  const _DestinoPersonalizado();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Destino personalizado')),
      body: Center(
        child: Hero(
          tag: 'demo-personalizado',
          child: _caja(220, 24),
        ),
      ),
    );
  }
}