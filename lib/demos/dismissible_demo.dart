import 'package:flutter/material.dart';

const _titulo = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({super.key});

  @override
  State<DismissibleDemo> createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  List<String> _minimos = ['Uno', 'Dos', 'Tres'];
  List<String> _correos = ['Correo de Ana', 'Correo de Luis', 'Correo de Sofía'];

  void _reiniciar() {
    setState(() {
      _minimos = ['Uno', 'Dos', 'Tres'];
      _correos = ['Correo de Ana', 'Correo de Luis', 'Correo de Sofía'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _reiniciar),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // EJEMPLO MÍNIMO
          const Text('Ejemplo mínimo (desliza)', style: _titulo),
          for (final item in _minimos)
            Dismissible(
              key: ValueKey(item),
              onDismissed: (direction) {
                // OBLIGATORIO: quitarlo de la lista, si no Flutter da error
                setState(() => _minimos.remove(item));
              },
              child: ListTile(title: Text(item)),
            ),

          const SizedBox(height: 32),

          // EJEMPLO PERSONALIZADO
          const Text('Ejemplo personalizado', style: _titulo),
          const Text('→ eliminar (pide confirmación)   ← archivar'),
          for (final item in _correos)
            Dismissible(
              key: ValueKey(item),
              // Fondo al deslizar hacia la DERECHA →
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Eliminar', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              // Fondo al deslizar hacia la IZQUIERDA ←
              secondaryBackground: Container(
                color: Colors.green,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.archive, color: Colors.white),
              ),
              // Para eliminar hay que deslizar más (60 % del ancho)
              dismissThresholds: const {DismissDirection.startToEnd: 0.6},
              // Decide si de verdad se descarta: true = sí, false = vuelve
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) return true;
                final confirmado = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('¿Eliminar?'),
                    content: Text('Se eliminará "$item".'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Eliminar'),
                      ),
                    ],
                  ),
                );
                return confirmado ?? false;
              },
              onDismissed: (direction) {
                setState(() => _correos.remove(item));
                final accion = direction == DismissDirection.startToEnd
                    ? 'eliminado'
                    : 'archivado';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$item $accion')),
                );
              },
              child: ListTile(
                leading: const Icon(Icons.mail),
                title: Text(item),
              ),
            ),
        ],
      ),
    );
  }
}