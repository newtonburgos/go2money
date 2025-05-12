import 'package:flutter/material.dart';

// final ThemeData lightTheme = ThemeData(
//   brightness: Brightness.light,
//   useMaterial3: true,
//   colorSchemeSeed: Colors.blue,
// );

// final ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   useMaterial3: true,
//   colorSchemeSeed: Colors.blueGrey,
// );

const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,

  // ─── MARCA PRINCIPAL ───────────────────────────────────────────────────────
  primary: Color.fromRGBO(
    0,
    150,
    135,
    1,
  ), // AppBar, FAB, ElevatedButton bg, íconos activos nav‑bar
  onPrimary: Color.fromRGBO(255, 255, 255, 1), // Texto/íconos sobre `primary`
  primaryContainer: Color.fromRGBO(
    178,
    223,
    219,
    1,
  ), // Card destacada, NavigationRail seleccionado, Chip “filled”
  onPrimaryContainer: Color.fromRGBO(
    0,
    54,
    46,
    1,
  ), // Texto/íconos sobre `primaryContainer`
  // ─── ACCIONES SECUNDARIAS ──────────────────────────────────────────────────
  secondary: Color.fromRGBO(
    38,
    166,
    154,
    1,
  ), // IconButton/TextButton alternos, Badges “Nuevo”
  onSecondary: Color.fromRGBO(0, 0, 0, 1), // Contenido sobre `secondary`
  secondaryContainer: Color.fromRGBO(
    200,
    238,
    230,
    1,
  ), // Filtros/etiquetas, fondo Stepper, pill‑tabs
  onSecondaryContainer: Color.fromRGBO(
    18,
    55,
    48,
    1,
  ), // Texto/íconos sobre `secondaryContainer`
  // ─── ACENTO TERCIARIO ──────────────────────────────────────────────────────
  tertiary: Color.fromRGBO(
    139,
    195,
    74,
    1,
  ), // CheckBox activo, Slider activo, barra progreso OK
  onTertiary: Color.fromRGBO(0, 0, 0, 1), // Contenido sobre `tertiary`
  tertiaryContainer: Color.fromRGBO(
    220,
    255,
    173,
    1,
  ), // Snackbar éxito, tarjeta “estado OK”
  onTertiaryContainer: Color.fromRGBO(
    40,
    60,
    14,
    1,
  ), // Texto/íconos sobre `tertiaryContainer`
  // ─── ERRORES ───────────────────────────────────────────────────────────────
  error: Color.fromRGBO(
    186,
    26,
    26,
    1,
  ), // Botones “Eliminar”, iconos estado crítico
  onError: Color.fromRGBO(255, 255, 255, 1), // Contenido sobre `error`
  errorContainer: Color.fromRGBO(
    255,
    218,
    214,
    1,
  ), // Banner/Snackbar de error, borde TextField inválido
  onErrorContainer: Color.fromRGBO(
    65,
    0,
    2,
    1,
  ), // Texto/íconos sobre `errorContainer`
  // ─── SUPERFICIES ───────────────────────────────────────────────────────────
  surface: Color.fromRGBO(
    250,
    253,
    250,
    1,
  ), // Scaffold, Cards, Sheets, ListTiles
  onSurface: Color.fromRGBO(
    9,
    9,
    9,
    1,
  ), // Texto/íconos primarios sobre `surface`
  surfaceContainerHighest: Color.fromRGBO(
    230,
    244,
    232,
    1,
  ), // Dialog, Drawer, Menú desplegable
  onSurfaceVariant: Color.fromRGBO(
    18,
    17,
    18,
    1,
  ), // Texto/íconos secundarios (sub‑títulos, hints)
  // ─── LÍNEAS Y BORDES ───────────────────────────────────────────────────────
  outline: Color.fromRGBO(
    124,
    124,
    124,
    1,
  ), // Border TextField, divisores, DataTable líneas
  outlineVariant: Color.fromRGBO(
    200,
    200,
    200,
    1,
  ), // Bordes sutiles (Cards hover, Chips)
  // ─── OTROS UTILITARIOS ─────────────────────────────────────────────────────
  shadow: Color.fromRGBO(0, 0, 0, 1), // Sombras de elevación
  scrim: Color.fromRGBO(0, 0, 0, 1), // Cortina detrás de BottomSheet/Dialog
  inverseSurface: Color.fromRGBO(
    20,
    24,
    21,
    1,
  ), // AppBar/BottomBar en modo elevado oscuro
  onInverseSurface: Color.fromRGBO(
    245,
    245,
    245,
    1,
  ), // Texto/íconos sobre `inverseSurface`
  inversePrimary: Color.fromRGBO(
    58,
    207,
    186,
    1,
  ), // Resaltado en superficies oscuras (p.e. FAB en dark)
  surfaceTint: Color.fromRGBO(
    0,
    150,
    135,
    1,
  ), // Tinte usado por Material 3 para la elevación
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,

  // ─── MARCA PRINCIPAL ───────────────────────────────────────────────────────
  primary: Color.fromRGBO(
    94,
    221,
    203,
    1,
  ), // AppBar, FAB, ElevatedButton bg, iconos activos nav‑bar
  onPrimary: Color.fromRGBO(0, 0, 0, 1), // Texto/íconos sobre `primary`
  primaryContainer: Color.fromRGBO(
    0,
    79,
    71,
    1,
  ), // Card destacada, NavigationRail seleccionado, Chip “filled”
  onPrimaryContainer: Color.fromRGBO(
    178,
    223,
    219,
    1,
  ), // Texto/íconos sobre `primaryContainer`
  // ─── ACCIONES SECUNDARIAS ──────────────────────────────────────────────────
  secondary: Color.fromRGBO(
    81,
    205,
    191,
    1,
  ), // IconButton/TextButton alternos, Badges “Nuevo”
  onSecondary: Color.fromRGBO(0, 0, 0, 1), // Contenido sobre `secondary`
  secondaryContainer: Color.fromRGBO(
    0,
    72,
    65,
    1,
  ), // Filtros/etiquetas, fondo Stepper, pill‑tabs
  onSecondaryContainer: Color.fromRGBO(
    200,
    238,
    230,
    1,
  ), // Texto/íconos sobre `secondaryContainer`
  // ─── ACENTO TERCIARIO ──────────────────────────────────────────────────────
  tertiary: Color.fromRGBO(
    180,
    236,
    129,
    1,
  ), // CheckBox activo, Slider activo, barra progreso OK
  onTertiary: Color.fromRGBO(0, 0, 0, 1), // Contenido sobre `tertiary`
  tertiaryContainer: Color.fromRGBO(
    42,
    77,
    18,
    1,
  ), // Snackbar éxito, tarjeta “estado OK”
  onTertiaryContainer: Color.fromRGBO(
    220,
    255,
    173,
    1,
  ), // Texto/íconos sobre `tertiaryContainer`
  // ─── ERRORES ───────────────────────────────────────────────────────────────
  error: Color.fromRGBO(
    255,
    180,
    171,
    1,
  ), // Botones “Eliminar”, iconos estado crítico
  onError: Color.fromRGBO(105, 0, 5, 1), // Contenido sobre `error`
  errorContainer: Color.fromRGBO(
    147,
    0,
    10,
    1,
  ), // Banner/Snackbar de error, borde TextField inválido
  onErrorContainer: Color.fromRGBO(
    255,
    218,
    214,
    1,
  ), // Texto/íconos sobre `errorContainer`
  // ─── SUPERFICIES ───────────────────────────────────────────────────────────
  surface: Color.fromRGBO(15, 20, 19, 1), // Scaffold, Cards, Sheets, ListTiles
  onSurface: Color.fromRGBO(
    230,
    233,
    232,
    1,
  ), // Texto/íconos primarios sobre `surface`
  surfaceContainerHighest: Color.fromRGBO(
    39,
    44,
    43,
    1,
  ), // Dialog, Drawer, Menú desplegable
  onSurfaceVariant: Color.fromRGBO(
    202,
    211,
    210,
    1,
  ), // Texto/íconos secundarios (sub‑títulos, hints)
  // ─── LÍNEAS Y BORDES ───────────────────────────────────────────────────────
  outline: Color.fromRGBO(
    124,
    124,
    124,
    1,
  ), // Border TextField, divisores, DataTable líneas
  outlineVariant: Color.fromRGBO(
    68,
    68,
    68,
    1,
  ), // Bordes sutiles (Cards hover, Chips)
  // ─── OTROS UTILITARIOS ─────────────────────────────────────────────────────
  shadow: Color.fromRGBO(0, 0, 0, 1), // Sombras de elevación
  scrim: Color.fromRGBO(0, 0, 0, 1), // Cortina detrás de BottomSheet/Dialog
  inverseSurface: Color.fromRGBO(
    240,
    240,
    240,
    1,
  ), // Fondo de AppBar/BottomBar en modo claro elevado
  onInverseSurface: Color.fromRGBO(
    32,
    32,
    32,
    1,
  ), // Texto/íconos sobre `inverseSurface`
  inversePrimary: Color.fromRGBO(
    58,
    207,
    186,
    1,
  ), // Resaltado en superficies claras (p.e. FAB en light)
  surfaceTint: Color.fromRGBO(
    94,
    221,
    203,
    1,
  ), // Tinte usado por Material 3 para la elevación
);

extension DisabledColors on ColorScheme {
  /// Texto, íconos y bordes deshabilitados (38 % opacidad sobre onSurface)
  Color get disabledLightFg => Color.fromRGBO(9, 9, 9, 0.38);

  /// Relleno de controles deshabilitados (12 % opacidad sobre onSurface)
  Color get disabledLightBg => Color.fromRGBO(9, 9, 9, 0.122);

  /// Texto, íconos y bordes deshabilitados (38 % opacidad sobre onSurface)
  Color get disabledDarkFg => Color.fromRGBO(230, 233, 232, 0.38);

  /// Relleno de controles deshabilitados (12 % opacidad sobre onSurface)
  Color get disabledDarkBg => Color.fromRGBO(230, 233, 232, 0.122);
}

class AppTheme {
  ThemeData getThemelightTheme() => ThemeData(
    colorScheme: flexSchemeLight,

    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            flexSchemeLight.primary, // const Color.fromRGBO(0, 122, 255, 1.0),
      ),
    ),
    disabledColor:
        flexSchemeLight
            .disabledLightBg, // const Color.fromRGBO(142, 142, 147, 0.192),
    // appBarTheme: AppBarTheme(
    //   iconTheme: IconThemeData(color: flexSchemeLight.disabledLightFg),
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: flexSchemeLight.surface, // o cs.primaryContainer
      elevation: 2,
      selectedItemColor: flexSchemeLight.primary,
      unselectedItemColor: flexSchemeLight.onSurface.withValues(alpha: 0.60),
      selectedIconTheme: IconThemeData(color: flexSchemeLight.primary),
      unselectedIconTheme: IconThemeData(
        color: flexSchemeLight.onSurface.withValues(alpha: 0.60),
      ),
      selectedLabelStyle: TextStyle(color: flexSchemeLight.primary),
      unselectedLabelStyle: TextStyle(
        color: flexSchemeLight.onSurface.withValues(alpha: 0.60),
      ),
    ),

    // Drawer (works for Material 2 y 3) — usa tu ColorScheme en la var `cs`
    drawerTheme: DrawerThemeData(
      backgroundColor:
          flexSchemeLight.surface, // neutro; cámbialo a cs.primaryContainer
      // si quieres branding de fondo
      elevation: 4, // sombra sutil sobre el contenido
      scrimColor: Colors.black.withValues(
        alpha: 0.32,
      ), // velo detrás del Drawer
    ),

    // ListTile que vive dentro del Drawer
    listTileTheme: ListTileThemeData(
      // ❶ Estado seleccionado
      selectedTileColor:
          flexSchemeLight.primaryContainer, // resalta la fila activa
      selectedColor: flexSchemeLight.primary, // icono + label activo
      // ❷ Estado no seleccionado
      iconColor: flexSchemeLight.onSurface.withValues(
        alpha: 0.74,
      ), // iconos inactivos
      textColor: flexSchemeLight.onSurface.withValues(
        alpha: 0.87,
      ), // texto inactivo
      // ❸ Dense‑ness y shape opcionales
      dense: true, // filas más compactas
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Opcional: NavigationDrawer (Material 3) — idéntica lógica
    navigationDrawerTheme: NavigationDrawerThemeData(
      backgroundColor: flexSchemeLight.surface, // o cs.primaryContainer
      elevation: 0,
      indicatorColor:
          flexSchemeLight.primaryContainer, // burbuja detrás de fila activa
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        return TextStyle(
          color:
              states.contains(WidgetState.selected)
                  ? flexSchemeLight.primary
                  : flexSchemeLight.onSurface.withValues(alpha: 0.74),
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        return IconThemeData(
          color:
              states.contains(WidgetState.selected)
                  ? flexSchemeLight.primary
                  : flexSchemeLight.onSurface.withValues(alpha: 0.74),
        );
      }),
    ),

    scaffoldBackgroundColor: flexSchemeLight.surface,

    // ─── AppBar – al estilo de tu BottomNavigationBar ───────────────────────────
    // Usa la var `cs` que apunta al ColorScheme (flexSchemeLight o flexSchemeDark)
    appBarTheme: AppBarTheme(
      // FONDO: elige UNA de estas dos líneas ↓ según tu gusto de branding
      backgroundColor: flexSchemeLight.primary, // neutro y minimalista
      // backgroundColor: cs.primary,       // marca fuerte (descomenta y comenta la anterior)
      elevation: 0, // sin sombra fija; SurfaceTint hará el trabajo
      // TEXTO + ICONOS
      foregroundColor: flexSchemeLight.surface, // si usas cs.surface como fondo
      // foregroundColor: cs.onPrimary,     // si usas cs.primary como fondo (descomenta)
      iconTheme: IconThemeData(color: flexSchemeLight.surface),
      actionsIconTheme: IconThemeData(color: flexSchemeLight.surface),

      // TIPOGRAFÍA DEL TÍTULO
      titleTextStyle: TextStyle(
        color: flexSchemeLight.surface, // o cs.onPrimary si fondo = cs.primary
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),

      // OPCIONAL: agrégale un borde inferior sutil estilo iOS/M3 cuando elevation = 0
      shape: const Border(
        bottom: BorderSide(width: 0.5, color: Colors.black12),
      ),
    ),
  );

  ThemeData getThemeDarkTheme() => ThemeData(
    colorScheme: flexSchemeDark,

    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            flexSchemeDark.primary, //  const Color.fromRGBO(0, 122, 255, 1.0),
      ),
    ),
    disabledColor: flexSchemeDark.disabledDarkBg,

    // appBarTheme: AppBarTheme(
    //   iconTheme: IconThemeData(color: flexSchemeDark.disabledDarkFg),
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: flexSchemeDark.surface, // o cs.primaryContainer
      elevation: 2,
      selectedItemColor: flexSchemeDark.primary,
      unselectedItemColor: flexSchemeDark.onSurface.withValues(alpha: 0.60),
      selectedIconTheme: IconThemeData(color: flexSchemeDark.primary),
      unselectedIconTheme: IconThemeData(
        color: flexSchemeDark.onSurface.withValues(alpha: 0.60),
      ),
      selectedLabelStyle: TextStyle(color: flexSchemeDark.primary),
      unselectedLabelStyle: TextStyle(
        color: flexSchemeDark.onSurface.withValues(alpha: 0.60),
      ),
    ),

    // Drawer (works for Material 2 y 3) — usa tu ColorScheme en la var `cs`
    drawerTheme: DrawerThemeData(
      backgroundColor:
          flexSchemeDark.surface, // neutro; cámbialo a cs.primaryContainer
      // si quieres branding de fondo
      elevation: 4, // sombra sutil sobre el contenido
      scrimColor: Colors.black.withValues(
        alpha: 0.32,
      ), // velo detrás del Drawer
    ),

    // ListTile que vive dentro del Drawer
    listTileTheme: ListTileThemeData(
      // ❶ Estado seleccionado
      selectedTileColor:
          flexSchemeDark.primaryContainer, // resalta la fila activa
      selectedColor: flexSchemeLight.primary, // icono + label activo
      // ❷ Estado no seleccionado
      iconColor: flexSchemeDark.onSurface.withValues(
        alpha: 0.74,
      ), // iconos inactivos
      textColor: flexSchemeDark.onSurface.withValues(
        alpha: 0.87,
      ), // texto inactivo
      // ❸ Dense‑ness y shape opcionales
      dense: true, // filas más compactas
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // Opcional: NavigationDrawer (Material 3) — idéntica lógica
    navigationDrawerTheme: NavigationDrawerThemeData(
      backgroundColor: flexSchemeDark.surface, // o cs.primaryContainer
      elevation: 0,
      indicatorColor:
          flexSchemeDark.primaryContainer, // burbuja detrás de fila activa
      labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
        return TextStyle(
          color:
              states.contains(WidgetState.selected)
                  ? flexSchemeDark.primary
                  : flexSchemeDark.onSurface.withValues(alpha: 0.74),
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
        return IconThemeData(
          color:
              states.contains(WidgetState.selected)
                  ? flexSchemeDark.primary
                  : flexSchemeDark.onSurface.withValues(alpha: 0.74),
        );
      }),
    ),

    scaffoldBackgroundColor: flexSchemeDark.surface,

    // ─── AppBar – al estilo de tu BottomNavigationBar ───────────────────────────
    // Usa la var `cs` que apunta al ColorScheme (flexSchemeLight o flexSchemeDark)
    appBarTheme: AppBarTheme(
      // FONDO: elige UNA de estas dos líneas ↓ según tu gusto de branding
      backgroundColor: flexSchemeDark.onPrimary, // neutro y minimalista
      // backgroundColor: cs.primary,       // marca fuerte (descomenta y comenta la anterior)
      elevation: 0, // sin sombra fija; SurfaceTint hará el trabajo
      // TEXTO + ICONOS
      foregroundColor: flexSchemeDark.tertiary, // si usas cs.surface como fondo
      // foregroundColor: cs.onPrimary,     // si usas cs.primary como fondo (descomenta)
      iconTheme: IconThemeData(color: flexSchemeDark.tertiary),
      actionsIconTheme: IconThemeData(color: flexSchemeDark.tertiary),

      // TIPOGRAFÍA DEL TÍTULO
      titleTextStyle: TextStyle(
        color: flexSchemeDark.tertiary, // o cs.onPrimary si fondo = cs.primary
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),

      // OPCIONAL: agrégale un borde inferior sutil estilo iOS/M3 cuando elevation = 0
      shape: const Border(
        bottom: BorderSide(width: 0.5, color: Colors.black12),
      ),
    ),
  );
}
