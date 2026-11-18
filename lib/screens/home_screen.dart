import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_fab.dart';
import '../widgets/screen_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Copia de la lista original, para poder modificarla
  final List<Map<String, dynamic>> _productos = List.of(productosIniciales);

  void _eliminarProducto(int index) {
    setState(() {
      _productos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My first app'),
      drawer: const AppDrawer(),
      body: ScreenProducts(
        productos: _productos,
        onEliminar: _eliminarProducto,
      ),
      floatingActionButton: const CustomFab(),
      bottomNavigationBar: CustomBottomNav(cantidad: _productos.length),
    );
  }
}