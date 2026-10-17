import 'package:flutter/material.dart';

import 'colores_app.dart';

class TemaApp {
  static ThemeData get claro => ThemeData(
    useMaterial3: true,
    primaryColor: ColoresApp.primario,
    scaffoldBackgroundColor: ColoresApp.fondo,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColoresApp.primario,
      secondary: ColoresApp.secundario,
    ).copyWith(surface: ColoresApp.superficie, error: ColoresApp.error),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColoresApp.primario,
      foregroundColor: ColoresApp.blanco,
      elevation: 0,
      centerTitle: false,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: ColoresApp.textoPrincipal,
        height: 1.2,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: ColoresApp.textoPrincipal,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ColoresApp.textoPrincipal,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.45,
        color: ColoresApp.textoPrincipal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.4,
        color: ColoresApp.textoSecundario,
      ),
    ),
    cardTheme: const CardThemeData(
      color: ColoresApp.superficie,
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
  );
}
