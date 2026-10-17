import 'package:flutter/material.dart';
import '../theme/colores_app.dart';

class IndicadorCarga extends StatelessWidget {
  const IndicadorCarga({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColoresApp.primario,
      ),
    );
  }
}