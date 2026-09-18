# Widgets App - Flutter & Material 3

<div align="center">

  ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
  ![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
  ![Material 3](https://img.shields.io/badge/Material_3-7C4DFF?style=for-the-badge&logo=materialdesign&logoColor=white)
  ![GoRouter](https://img.shields.io/badge/go__router-18.0.1-blue?style=for-the-badge)

  <p align="center">
    Una aplicación catálogo en <b>Flutter</b> diseñada para explorar, probar y visualizar componentes, estilos y patrones modernos de <b>Material Design 3</b> con navegación declarativa y tematización dinámica.
  </p>

</div>

---

## 📱 Descripción

**Widgets App** es un catálogo interactivo de componentes de interfaz de usuario construido en Flutter. Su objetivo es servir como referencia práctica y base arquitectónica para el uso de componentes de Material 3, navegación por rutas nombradas con `go_router` y un sistema modular de temas personalizables.

---

## ✨ Características Principales

- **🎨 Material 3 y Tematización Dinámica:**
  - Configuración centralizada en `AppTheme`.
  - Paleta de colores predefinida basada en `colorSchemeSeed`.
  - Estructura escalable para alternar temas y modos de color.

- **🛣️ Navegación Declarativa (`go_router`):**
  - Manejo de rutas limpias y nombradas (`/`, `/buttons`, `/cards`).
  - Navegación optimizada para plataformas móviles y web.

- **📦 Catálogo de Componentes:**
  - **Botones (`/buttons`):** Muestras de variantes (`ElevatedButton`, estados deshabilitados, botones con iconos y disposición flexible con `Wrap`).
  - **Tarjetas (`/cards`):** Galería exhaustiva con 4 variantes de diseño y diferentes niveles de elevación (0.0 a 10.0 dp):
    1. **Tarjetas Elevadas:** Uso de sombras para simular profundidad física.
    2. **Tarjetas con Borde (Outlined):** Diseño perimetral estilizado.
    3. **Tarjetas Rellenas (Filled):** Superficie tonal sin sombras duras.
    4. **Tarjetas con Imagen:** Tarjetas multimedia con gradientes visuales y carga asíncrona.

---

## 📂 Estructura del Proyecto

El proyecto sigue una estructura limpia y orientada a la separación de responsabilidades:

```text
lib/
├── config/
│   ├── menu/
│   │   └── menu_items.dart      # Definición de opciones del menú principal
│   ├── router/
│   │   └── app_router.dart      # Configuración de rutas con GoRouter
│   └── theme/
│       └── app_theme.dart       # Configuración de temas y paleta de colores Material 3
├── presentation/
│   └── screens/
│       ├── buttons/
│       │   └── butons_screen.dart # Pantalla demostrativa de botones
│       ├── cards/
│       │   └── cards_screen.dart  # Pantalla demostrativa de tarjetas y elevaciones
│       ├── home/
│       │   └── home_screen.dart   # Menú principal y lista de navegación
│       └── screens.dart           # Archivo barril para exportación de pantallas
└── main.dart                    # Punto de entrada de la aplicación
```

---

## 🚀 Comenzando

### Requisitos Previos

Asegúrate de tener instalado en tu entorno local:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versión 3.12 o superior recomendada)
- [Dart SDK](https://dart.dev/get-dart)
- Un emulador configurado (Android / iOS) o dispositivo físico habilitado para depuración.

### Instalación

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/Joestarb/widgets_app_flutter.git
   cd widgets_app_flutter
   ```

2. **Obtener las dependencias:**
   ```bash
   flutter pub get
   ```

3. **Ejecutar la aplicación:**
   ```bash
   flutter run
   ```

---

## 🛠️ Tecnologías y Librerías

| Herramienta / Paquete | Propósito |
| :--- | :--- |
| [Flutter](https://flutter.dev/) | Framework multiplataforma de UI |
| [Dart](https://dart.dev/) | Lenguaje de programación base |
| [go_router](https://pub.dev/packages/go_router) | Enrutamiento declarativo para Flutter |
| [flutter_lints](https://pub.dev/packages/flutter_lints) | Reglas de estilo y buenas prácticas de código |

---

## 🤝 Contribución

Las contribuciones son bienvenidas. Si deseas agregar nuevos widgets o mejorar los existentes:

1. Haz un Fork del proyecto.
2. Crea una rama para tu feature (`git checkout -b feature/NuevoWidget`).
3. Realiza tus cambios y haz commit (`git commit -m 'feat: Add NuevoWidget'`).
4. Haz push a la rama (`git push origin feature/NuevoWidget`).
5. Abre un Pull Request.

---

## 📄 Licencia

Este proyecto se distribuye con propósitos educativos y de desarrollo personal.
