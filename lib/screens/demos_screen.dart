import 'package:flutter/material.dart';

import '../demos/drawer_demo.dart';
import '../widgets/custom_app_bar.dart';
import '../demos/card_demo.dart';
import '../demos/hero_demo.dart';
import '../demos/badge_demo.dart';
import '../demos/dismissible_demo.dart';

class DemosScreen extends StatelessWidget {
  const DemosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Demos de widgets'),
      body: ListView(
        children: [
          _itemDemo(context, 'Drawer', 'Menú lateral deslizable',
              Icons.menu_open, const DrawerDemo()),
          _itemDemo(context, 'Card', 'Tarjeta con sombra y bordes',
              Icons.credit_card, const CardDemo()),
          _itemDemo(context, 'Hero', 'Animación entre pantallas',
              Icons.flight, const HeroDemo()),
          _itemDemo(context, 'Dismissible', 'Deslizar para descartar',
              Icons.swipe, const DismissibleDemo()),
          _itemDemo(context, 'Badge', 'Indicador o contador sobre un ícono',
              Icons.notifications_active, const BadgeDemo()),
          // Aquí iremos agregando Card, Hero, Dismissible y Badge
        ],
      ),
    );
  }

  Widget _itemDemo(BuildContext context, String nombre, String descripcion,
      IconData icono, Widget pantalla) {
    return ListTile(
      leading: Icon(icono),
      title: Text(nombre),
      subtitle: Text(descripcion),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pantalla),
      ),
    );
  }
}