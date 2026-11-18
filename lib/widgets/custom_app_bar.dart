import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: const Color.fromARGB(255, 185, 42, 78),
      foregroundColor: Colors.white,
    );
  }

  // Altura estándar de un AppBar (56)
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
