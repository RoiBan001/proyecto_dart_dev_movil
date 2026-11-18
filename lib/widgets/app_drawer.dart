import 'package:flutter/material.dart';

import '../screens/demos_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 185, 42, 78),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'My first app',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Productos'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.widgets),
            title: const Text('Demos de widgets'),
            onTap: () {
              Navigator.pop(context); // primero cierra el drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DemosScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}