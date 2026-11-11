# Consulta: 3 widgets de Flutter

Explicación de tres widgets usados en este proyecto: `Scaffold`, `ListView.builder` y `ListTile`.

## 1. Scaffold

**Qué es:** la estructura base de una pantalla en Material Design. Funciona como un esqueleto con espacios ya definidos para cada parte de la pantalla, así no hay que posicionar nada a mano.

**Propiedades principales:**

| Propiedad | Para qué sirve |
|---|---|
| `appBar` | La barra superior |
| `body` | El contenido principal |
| `floatingActionButton` | El botón flotante |
| `bottomNavigationBar` | La barra de navegación inferior |
| `drawer` | Un menú lateral deslizable |

**En este proyecto** (`lib/main.dart`):

```dart
Scaffold(
  appBar: CustomAppBar(title: 'My first app'),
  body: ScrollWidget(),
  floatingActionButton: CustomFab(),
  bottomNavigationBar: CustomBottomNav(),
)
```

## 2. ListView.builder

**Qué es:** una lista con scroll que construye sus elementos bajo demanda. Solo crea los elementos visibles en pantalla, no todos de una vez. Por eso es eficiente con listas largas: con 10.000 productos, solo construye los 8 o 10 que caben en la pantalla.

**Propiedades principales:**

| Propiedad | Para qué sirve |
|---|---|
| `itemCount` | Cuántos elementos tiene la lista |
| `itemBuilder` | Función que recibe el `index` y devuelve el widget de esa posición |
| `scrollDirection` | Dirección del scroll: vertical (por defecto) u horizontal |

**En este proyecto** (`lib/widgets/scroll_widget.dart`):

```dart
ListView.builder(
  itemCount: productos.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(productos[index]));
  },
)
```

**Diferencia con `ListView` normal:** el `ListView` normal recibe todos los hijos ya creados en `children: [...]`. Sirve para listas cortas y fijas. Para listas largas o dinámicas se usa `.builder`.

## 3. ListTile

**Qué es:** una fila prediseñada para listas. Organiza un ícono, un título, un subtítulo y una acción con los espacios y tamaños de Material Design, sin tener que armar el `Row` a mano.

**Propiedades principales:**

| Propiedad | Para qué sirve |
|---|---|
| `leading` | Widget al inicio, normalmente un ícono o avatar |
| `title` | Texto principal |
| `subtitle` | Texto secundario, debajo del título |
| `trailing` | Widget al final, como una flecha o un switch |
| `onTap` | Función que se ejecuta al tocar la fila |

**En este proyecto** (`lib/widgets/scroll_widget.dart`):

```dart
ListTile(
  leading: const Icon(Icons.shopping_cart),
  title: Text(productos[index]),
  subtitle: Text('Producto ${index + 1}'),
  trailing: const Icon(Icons.arrow_forward),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleScreen(
          producto: productos[index],
          numero: index + 1,
        ),
      ),
    );
  },
)
```

## Cómo trabajan juntos

En la app los tres van anidados:

```
Scaffold                  → arma la pantalla
└── body: ListView.builder   → genera la lista con scroll
    └── ListTile             → una fila por cada producto
```

## Referencias

- [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html)
- [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
- [ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html)
