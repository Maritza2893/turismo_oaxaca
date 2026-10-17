import 'package:flutter/material.dart';
import '../theme/colores_app.dart';
import 'boton_primario.dart';

class EstadoVacio extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String mensaje;
  final String? accion;
  final VoidCallback? alPresionar;

  const EstadoVacio({
    super.key,
    required this.icono,
    required this.titulo,
    required this.mensaje,
    this.accion,
    this.alPresionar,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icono, size: 54, color: ColoresApp.secundario),
            const SizedBox(height: 16),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (accion != null && alPresionar != null) ...[
              const SizedBox(height: 18),
              BotonPrimario(texto: accion!, onPressed: alPresionar!),
            ],
          ],
        ),
      ),
    );
  }
}