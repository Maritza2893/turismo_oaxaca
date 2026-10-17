
import 'package:flutter/material.dart';
import 'core/constants/cadenas_app.dart';
import 'core/theme/tema_app.dart';

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
      home: const PantallaInicial(),
    );
  }
}

class PantallaInicial extends StatelessWidget {
  const PantallaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turismo Oaxaca'),
      ),
      body: const Center(
        child: Text(
          'Descubre Oaxaca',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
