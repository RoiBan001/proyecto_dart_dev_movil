# Widgets de Flutter

Nombre: Steban Rivera
Fecha: 17/11/2026
Widgets: Drawer, Card, Hero, Dismissible, Badge

Los ejemplos están en `lib/demos/` y se abren desde la app: menú lateral (☰) → **Demos de widgets**.

---

## Drawer

### 1. Qué es y para qué sirve

Es un panel que se desliza desde el borde de la pantalla y se queda encima del contenido. Sirve para guardar la navegación principal de la app (secciones, ajustes, perfil) sin ocupar espacio todo el tiempo: el usuario lo abre cuando lo necesita y se cierra al elegir una opción.

### 2. Cuándo usarlo y cuándo no

Úsalo cuando la app tiene varias secciones (más de cuatro o cinco) o opciones que no se usan siempre, como ajustes o ayuda. No lo uses si solo hay dos o tres secciones que el usuario visita seguido: para eso es mejor una barra inferior, porque el Drawer esconde las opciones y obliga a un toque extra.

Confusiones comunes:

- El Drawer no se pone en cualquier parte: va en la propiedad `drawer` (izquierda) o `endDrawer` (derecha) de un `Scaffold`.
- Cuando el `Scaffold` tiene `drawer`, el `AppBar` cambia la flecha de regresar por el ícono ☰. Si la pantalla necesita volver atrás, hay que poner la flecha a mano con `leading: BackButton()`.
- Para abrirlo desde un botón se usa `Scaffold.of(context).openDrawer()`, pero ese `context` tiene que estar dentro del Scaffold. Si no, da error. Por eso en el ejemplo uso un `Builder`.

### 3. Ejemplo mínimo

Archivo: `lib/demos/drawer_demo.dart`

```dart
Scaffold(
  appBar: AppBar(title: const Text('Drawer')),
  drawer: const Drawer(
    child: Center(child: Text('Hola, soy un Drawer')),
  ),
)
```

### 4. Explicación del ejemplo

Con solo asignar un `Drawer` a la propiedad `drawer` del Scaffold, Flutter agrega el ícono ☰ al AppBar y permite abrir el panel tocándolo o deslizando desde el borde izquierdo. El panel tiene el ancho por defecto (304) y muestra el texto centrado. Se cierra tocando fuera de él o deslizándolo de vuelta.

En la demo el ☰ no aparece porque puse una flecha de regresar, así que lo abro con un botón que llama `Scaffold.of(context).openDrawer()`.

### 5. Propiedades importantes

| Propiedad | Para qué sirve |
|---|---|
| `child` | Contenido del panel. Normalmente un `ListView` con un `DrawerHeader` y varios `ListTile`. |
| `width` | Ancho del panel. Por defecto es 304. |
| `backgroundColor` | Color de fondo del panel. |
| `elevation` | Qué tan elevado se ve sobre el contenido (sombra). |
| `shape` | Forma del panel, por ejemplo con esquinas redondeadas. |

Propiedades relacionadas del `Scaffold`: `drawer` (se abre por la izquierda) y `endDrawer` (se abre por la derecha).

### 6. Ejemplo personalizado

```dart
Drawer(
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
        decoration: BoxDecoration(color: Color.fromARGB(255, 185, 42, 78)),
        child: Text('Mi tienda',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
      ListTile(
        leading: const Icon(Icons.home),
        title: const Text('Inicio'),
        onTap: () => Navigator.pop(context),
      ),
      // ... Carrito y Ajustes igual
    ],
  ),
)
```

Este Drawer va en el `endDrawer`, así que se abre desde la derecha. Es más angosto (260), tiene fondo rosado claro, esquinas redondeadas del lado izquierdo y una cabecera con el color de la app. Cada opción es un `ListTile` que cierra el panel con `Navigator.pop(context)`.

### 7. Dónde lo usaría en mi app

Ya lo uso: es el menú lateral de la pantalla principal (`lib/widgets/app_drawer.dart`). Tiene la opción **Productos** y la opción **Demos de widgets**, que lleva a la pantalla con estos ejemplos. Reemplazó el botón ☰ que antes estaba en el AppBar y no hacía nada.

### 8. Fuentes y ayudas

- api.flutter.dev, página de `Drawer`: https://api.flutter.dev/flutter/material/Drawer-class.html
- docs.flutter.dev, receta "Add a drawer to a screen": https://docs.flutter.dev/cookbook/design/drawer
- Usé Claude (IA de Anthropic) para elegir los widgets, escribir el código de los ejemplos y redactar este documento. Yo ejecuté y probé los ejemplos en mi proyecto.

---

## Card

### 1. Qué es y para qué sirve

Es un contenedor con esquinas redondeadas y una sombra suave que lo hace ver "levantado" sobre el fondo. Sirve para agrupar información relacionada de un mismo elemento, como un producto con su nombre, precio e ícono, y separarla visualmente del resto.

### 2. Cuándo usarlo y cuándo no

Úsalo cuando cada elemento de una lista o cuadrícula es una unidad con varios datos, como productos, publicaciones o contactos. No lo uses para envolver toda una pantalla ni para textos sueltos: muchas tarjetas dentro de tarjetas recargan la interfaz. Si solo necesitas separar filas simples, basta un `Divider`.

Confusiones comunes:

- La Card **no tiene espacio interno**: si le pones un texto directo, queda pegado al borde. Hay que agregar un `Padding`.
- Por defecto **no recorta** su contenido. Si adentro hay una imagen o un bloque de color, se sale de las esquinas redondeadas, a menos que uses `clipBehavior: Clip.antiAlias`.
- Sí tiene un margen externo por defecto (4 por cada lado), que separa una Card de la otra.

### 3. Ejemplo mínimo

Archivo: `lib/demos/card_demo.dart`

```dart
const Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Hola, soy una Card'),
  ),
)
```

### 4. Explicación del ejemplo

La Card dibuja un rectángulo con esquinas redondeadas (radio 12), el color de superficie del tema y una sombra leve. El `Padding` de 16 deja espacio entre el borde y el texto. Sin ese `Padding`, el texto queda pegado a la orilla de la tarjeta.

### 5. Propiedades importantes

| Propiedad | Para qué sirve |
|---|---|
| `child` | Contenido de la tarjeta. |
| `color` | Color de fondo de la tarjeta. |
| `elevation` | Altura de la sombra. Con 0 se ve plana. |
| `shadowColor` | Color de la sombra. |
| `shape` | Forma y borde, por ejemplo el radio de las esquinas y una línea alrededor. |
| `margin` | Espacio externo alrededor de la tarjeta. Por defecto es 4. |
| `clipBehavior` | Si recorta el contenido para que respete las esquinas redondeadas. |

### 6. Ejemplo personalizado

```dart
Card(
  elevation: 8,
  color: const Color.fromARGB(255, 255, 240, 244),
  shadowColor: const Color.fromARGB(255, 185, 42, 78),
  margin: const EdgeInsets.symmetric(horizontal: 8),
  clipBehavior: Clip.antiAlias,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    side: const BorderSide(
      color: Color.fromARGB(255, 185, 42, 78),
      width: 2,
    ),
  ),
  child: Column(
    children: [
      Container(
        height: 100,
        color: const Color.fromARGB(255, 185, 42, 78),
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
)
```

La sombra es más alta (8) y de color rosado, las esquinas son más redondas (20) y tiene un borde rosado de 2. Adentro hay una franja de color con un ícono y debajo un `ListTile` con el producto. Gracias a `clipBehavior: Clip.antiAlias`, la franja respeta las esquinas redondeadas. Si lo quito, la franja se sale por las esquinas de arriba.

### 7. Dónde lo usaría en mi app

Ya lo uso en la lista de productos (`lib/widgets/screen_products.dart`): cada producto es un `ListTile` dentro de una Card, así cada uno se ve como una tarjeta separada con su ícono, nombre y precio.

### 8. Fuentes y ayudas

- api.flutter.dev, página de `Card`: https://api.flutter.dev/flutter/material/Card-class.html
- Usé Claude (IA de Anthropic) para escribir el código de los ejemplos y redactar este documento. Yo ejecuté y probé los ejemplos en mi proyecto.

---

## Hero

### 1. Qué es y para qué sirve

Es un widget que anima un elemento entre dos pantallas: cuando navegas, el elemento parece "volar" desde su posición en la primera pantalla hasta su posición en la segunda, cambiando de tamaño en el camino. Sirve para que el usuario entienda que la pantalla nueva es el detalle del elemento que tocó.

### 2. Cuándo usarlo y cuándo no

Úsalo cuando pasas de una lista a la pantalla de detalle de un elemento, por ejemplo la foto o el ícono de un producto. No lo uses para animar algo dentro de una misma pantalla, porque Hero solo funciona al cambiar de ruta. Tampoco lo pongas en todo: si muchos elementos vuelan a la vez, la transición se ve confusa.

Confusiones comunes:

- Necesitas **dos** Hero, uno en cada pantalla, con el **mismo `tag`**. Si los tags no coinciden, no hay animación y no sale ningún error.
- No puede haber dos Hero con el mismo `tag` en una misma pantalla, porque Flutter lanza un error. En una lista hay que usar un tag distinto por elemento, como el nombre del producto.
- Durante el vuelo se dibuja el widget de la pantalla destino. Si es un `Icon` de tamaño fijo, el ícono "salta" en vez de crecer suave. Envolverlo en un `FittedBox` lo arregla.

### 3. Ejemplo mínimo

Archivo: `lib/demos/hero_demo.dart`

```dart
// Pantalla 1 (al tocarlo navega a la pantalla 2)
Hero(
  tag: 'demo-minimo',
  child: Container(width: 60, height: 60, color: Colors.amber),
)

// Pantalla 2
Hero(
  tag: 'demo-minimo',
  child: Container(width: 200, height: 200, color: Colors.amber),
)
```

### 4. Explicación del ejemplo

Hay un cuadro amarillo pequeño en la primera pantalla y uno grande en la segunda, los dos con el tag `'demo-minimo'`. Al tocar el pequeño se hace un `Navigator.push`. Flutter detecta que las dos pantallas tienen un Hero con el mismo tag y anima el cuadro desde 60×60 en su posición original hasta 200×200 en el centro de la nueva pantalla. Al regresar, hace la animación al revés.

### 5. Propiedades importantes

| Propiedad | Para qué sirve |
|---|---|
| `tag` | Identificador que une los dos Hero. Debe ser igual en ambas pantallas y único en cada una. |
| `child` | El widget que se anima. |
| `placeholderBuilder` | Lo que se muestra en el lugar original mientras el Hero está volando. Por defecto queda vacío. |
| `flightShuttleBuilder` | Permite cambiar el widget que se ve durante el vuelo. |
| `transitionOnUserGestures` | Si la animación también ocurre al regresar con el gesto de deslizar (iOS). Por defecto es `false`. |

La duración no es del Hero sino de la ruta: con `PageRouteBuilder` y `transitionDuration` se puede hacer más lenta o más rápida.

### 6. Ejemplo personalizado

```dart
// Pantalla 1
Hero(
  tag: 'demo-personalizado',
  placeholderBuilder: (context, size, child) => Container(
    width: size.width,
    height: size.height,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  child: _caja(80, 40), // círculo rosado con ícono
)

// Navegación con animación de 1 segundo
Navigator.push(
  context,
  PageRouteBuilder(
    transitionDuration: const Duration(seconds: 1),
    reverseTransitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondaryAnimation) =>
        const _DestinoPersonalizado(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  ),
);

// Pantalla 2
Hero(
  tag: 'demo-personalizado',
  child: _caja(220, 24), // cuadro grande con esquinas redondeadas
)
```

Un círculo rosado de 80 se convierte en un cuadro de 220 con esquinas redondeadas. La transición dura 1 segundo para que se aprecie, y la pantalla nueva aparece con un desvanecido (`FadeTransition`). Mientras el elemento vuela, en su lugar original queda una silueta gris gracias a `placeholderBuilder`. El ícono va dentro de un `FittedBox`, así crece junto con la caja.

### 7. Dónde lo usaría en mi app

Ya lo uso entre la lista de productos y la pantalla de detalle: el ícono de cada producto (`screen_products.dart`) vuela y se agranda hasta el ícono grande de `detalle_screen.dart`. El `tag` es el nombre del producto, así cada fila tiene su propio Hero.

### 8. Fuentes y ayudas

- api.flutter.dev, página de `Hero`: https://api.flutter.dev/flutter/widgets/Hero-class.html
- docs.flutter.dev, guía "Hero animations": https://docs.flutter.dev/ui/animations/hero-animations
- Usé Claude (IA de Anthropic) para escribir el código de los ejemplos y redactar este documento. Yo ejecuté y probé los ejemplos en mi proyecto.

---

## Dismissible

### 1. Qué es y para qué sirve

Es un widget que permite descartar un elemento deslizándolo hacia un lado con el dedo o el mouse. Mientras se desliza, muestra un fondo detrás (por ejemplo rojo con un ícono de basura) y, al soltarlo, el elemento sale de la pantalla. Sirve para acciones rápidas sobre elementos de una lista, como eliminar o archivar.

### 2. Cuándo usarlo y cuándo no

Úsalo en listas donde el usuario borra o archiva elementos seguido, como correos, notificaciones o un carrito de compras. No lo uses como la única forma de hacer una acción importante, porque el gesto no es visible y el usuario puede no descubrirlo. Tampoco para acciones que no se pueden deshacer sin pedir confirmación.

Confusiones comunes:

- Dismissible **solo anima** la salida, no borra el dato. En `onDismissed` hay que quitar el elemento de la lista con `setState`. Si no, Flutter lanza el error *"A dismissed Dismissible widget is still part of the tree"*.
- La `key` es obligatoria y debe ser única para cada elemento. No conviene usar el `index`, porque cambia cuando borras un elemento. Es mejor un dato propio del elemento, como su nombre o id.
- `background` es el fondo al deslizar hacia la derecha. Si pones `secondaryBackground`, ese se usa al deslizar hacia la izquierda.

### 3. Ejemplo mínimo

Archivo: `lib/demos/dismissible_demo.dart`

```dart
for (final item in _minimos)
  Dismissible(
    key: ValueKey(item),
    onDismissed: (direction) {
      setState(() => _minimos.remove(item));
    },
    child: ListTile(title: Text(item)),
  ),
```

### 4. Explicación del ejemplo

Cada elemento de la lista `['Uno', 'Dos', 'Tres']` es un `ListTile` dentro de un Dismissible, con su texto como `key`. Se puede deslizar hacia cualquiera de los dos lados. Al pasar del 40 % del ancho y soltar, el elemento sale de la pantalla y se llama `onDismissed`, que lo quita de la lista con `setState` para que Flutter redibuje sin él. No tiene fondo, así que detrás solo se ve el color de la pantalla.

La pantalla es un `StatefulWidget` porque la lista cambia. El botón ↻ del AppBar restaura los elementos.

### 5. Propiedades importantes

| Propiedad | Para qué sirve |
|---|---|
| `key` | Identificador único del elemento. Es obligatoria. |
| `child` | El elemento que se desliza. |
| `onDismissed` | Función que se ejecuta cuando el elemento se descarta. Aquí se borra el dato. |
| `direction` | Hacia dónde se puede deslizar: `horizontal` (por defecto), `endToStart`, `startToEnd`, etc. |
| `background` | Lo que se ve detrás al deslizar hacia la derecha (o hacia ambos lados si no hay `secondaryBackground`). |
| `secondaryBackground` | Lo que se ve detrás al deslizar hacia la izquierda. |
| `confirmDismiss` | Función que decide si de verdad se descarta (`true`) o el elemento vuelve a su lugar (`false`). |
| `dismissThresholds` | Qué porcentaje hay que deslizar para que cuente. Por defecto es 0.4 (40 %). |

### 6. Ejemplo personalizado

```dart
Dismissible(
  key: ValueKey(item),
  background: Container(            // deslizar a la derecha →
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
  secondaryBackground: Container(   // deslizar a la izquierda ←
    color: Colors.green,
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    child: const Icon(Icons.archive, color: Colors.white),
  ),
  dismissThresholds: const {DismissDirection.startToEnd: 0.6},
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
  child: ListTile(leading: const Icon(Icons.mail), title: Text(item)),
)
```

Funciona como una bandeja de correo con dos acciones según la dirección. Hacia la derecha muestra un fondo rojo con "Eliminar", exige deslizar el 60 % y, antes de borrar, pide confirmación con un diálogo: si el usuario cancela, el elemento vuelve a su lugar. Hacia la izquierda muestra un fondo verde y archiva sin preguntar. En ambos casos aparece un mensaje abajo (`SnackBar`) que dice qué pasó.

### 7. Dónde lo usaría en mi app

Ya lo uso en la lista de productos: cada Card se puede deslizar de derecha a izquierda para eliminar el producto, con un fondo rojo de basura y un mensaje de confirmación. Para eso la lista se movió a `HomeScreen`, que es un `StatefulWidget`, y `ScreenProducts` le avisa cuando hay que borrar un producto.

### 8. Fuentes y ayudas

- api.flutter.dev, página de `Dismissible`: https://api.flutter.dev/flutter/widgets/Dismissible-class.html
- docs.flutter.dev, receta "Implement swipe to dismiss": https://docs.flutter.dev/cookbook/gestures/dismissible
- Usé Claude (IA de Anthropic) para escribir el código de los ejemplos y redactar este documento. Yo ejecuté y probé los ejemplos en mi proyecto.

---

## Badge

### 1. Qué es y para qué sirve

Es una marca pequeña que se pone sobre la esquina de otro widget, normalmente un ícono. Puede ser un puntito o un óvalo con un número o texto corto. Sirve para avisar que hay algo nuevo o pendiente, como notificaciones sin leer o productos en el carrito.

### 2. Cuándo usarlo y cuándo no

Úsalo para indicar cantidades o novedades sobre íconos de navegación, del AppBar o de botones: mensajes nuevos, elementos en el carrito, actualizaciones. No lo uses para información importante o larga, porque es pequeño y fácil de ignorar, ni lo pongas en muchos íconos a la vez, porque pierde su efecto de llamar la atención.

Confusiones comunes:

- Sin `label` no aparece un cero ni queda vacío: se dibuja un **puntito** pequeño.
- Si la cantidad es 0, el Badge no se oculta solo. Hay que usar `isLabelVisible: cantidad > 0`.
- No limita los números grandes: si el valor es 1500, muestra "1500". Para mostrar "99+" hay que hacerlo a mano.

### 3. Ejemplo mínimo

Archivo: `lib/demos/badge_demo.dart`

```dart
const Badge(
  child: Icon(Icons.notifications, size: 40),
)
```

### 4. Explicación del ejemplo

El Badge envuelve un ícono de campana. Como no tiene `label`, dibuja un puntito rojo (del color de error del tema) de tamaño 6 en la esquina superior derecha del ícono. Es la forma de decir "hay algo nuevo" sin dar un número.

### 5. Propiedades importantes

| Propiedad | Para qué sirve |
|---|---|
| `child` | El widget sobre el que se pone la marca, normalmente un ícono. |
| `label` | Contenido de la marca, por ejemplo `Text('3')`. Sin label se ve un puntito. |
| `isLabelVisible` | Muestra u oculta la marca sin quitar el widget. Por defecto es `true`. |
| `backgroundColor` | Color de la marca. |
| `textColor` | Color del texto del label. |
| `smallSize` / `largeSize` | Tamaño del puntito (6 por defecto) y alto del óvalo con label (16 por defecto). |
| `offset` | Mueve la marca desde su posición normal. |

### 6. Ejemplo personalizado

```dart
Badge(
  isLabelVisible: _cantidad > 0,
  label: Text(_cantidad > 99 ? '99+' : '$_cantidad'),
  backgroundColor: const Color.fromARGB(255, 185, 42, 78),
  textColor: Colors.white,
  largeSize: 22,
  offset: const Offset(8, -8),
  child: const Icon(Icons.shopping_cart, size: 48),
)
```

Es un contador sobre un carrito grande. Al lado hay dos botones, − y +, que cambian `_cantidad` con `setState`, y el número del Badge se actualiza al instante. La marca es rosada con texto blanco, un poco más grande (22) y movida hacia afuera con `offset`. Cuando la cantidad llega a 0 desaparece, y si pasa de 99 muestra "99+".

### 7. Dónde lo usaría en mi app

Ya lo uso en la barra de navegación inferior (`custom_bottom_nav.dart`): el ícono de Home muestra cuántos productos hay en la lista. Cuando elimino uno deslizándolo, el número baja, y si borro todos, la marca desaparece.

### 8. Fuentes y ayudas

- api.flutter.dev, página de `Badge`: https://api.flutter.dev/flutter/material/Badge-class.html
- Usé Claude (IA de Anthropic) para escribir el código de los ejemplos y redactar este documento. Yo ejecuté y probé los ejemplos en mi proyecto.