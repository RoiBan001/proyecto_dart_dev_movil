import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        // Con un drawer, el AppBar cambia la flecha de regresar por el ☰.
        // Aquí la forzamos para poder volver al menú de demos.
        leading: const BackButton(),
      ),

      // EJEMPLO MÍNIMO: se abre desde la izquierda
      drawer: const Drawer(
        child: Center(child: Text('Hola, soy un Drawer')),
      ),

      // EJEMPLO PERSONALIZADO: se abre desde la derecha
      endDrawer: const DrawerPersonalizado(),

      // Builder da un context que está DENTRO del Scaffold,
      // necesario para que Scaffold.of(context) lo encuentre.
      body: Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                child: const Text('Abrir ejemplo mínimo'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                child: const Text('Abrir ejemplo personalizado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerPersonalizado extends StatelessWidget {
  const DrawerPersonalizado({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      elevation: 8,
      backgroundColor: const Color.fromARGB(255, 255, 240, 244),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(24)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 185, 42, 78),
            ),
            child: Text(
              'Mi tienda',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Carrito'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ajustes'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}