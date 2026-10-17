
import 'package:flutter/material.dart';
import 'core/constants/cadenas_app.dart';
import 'core/theme/tema_app.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const TurismoOaxacaApp());
}

class TurismoOaxacaApp extends StatelessWidget {
  const TurismoOaxacaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CadenasApp.tituloApp,
      debugShowCheckedModeBanner: false,
      theme: TemaApp.claro,
      home: const HomeScreen(),
    );
  }
}
