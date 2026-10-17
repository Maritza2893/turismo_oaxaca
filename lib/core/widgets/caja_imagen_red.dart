import 'package:flutter/material.dart';
import '../theme/colores_app.dart';

class CajaImagenRed extends StatelessWidget {
  final String url;
  final double altura;
  final double anchura;
  final BoxFit ajuste;

  const CajaImagenRed({
    super.key,
    required this.url,
    this.altura = 200,
    this.anchura = double.infinity,
    this.ajuste = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        height: altura,
        width: anchura,
        fit: ajuste,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            height: altura,
            width: anchura,
            color: ColoresApp.secundario.withValues(alpha: 0.12),
            child: const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => Container(
          height: altura,
          width: anchura,
          color: ColoresApp.secundario.withValues(alpha: 0.22),
          child: const Icon(Icons.broken_image, color: ColoresApp.textoSecundario),
        ),
      ),
    );
  }
}