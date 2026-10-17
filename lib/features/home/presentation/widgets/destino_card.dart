import 'package:flutter/material.dart';
import '../../domain/entities/destino.dart';
import '../../../../core/widgets/caja_imagen_red.dart';
import 'rating_badge.dart';
import '../../../../core/theme/colores_app.dart';

class DestinoCard extends StatelessWidget {
  final Destino destino;
  final VoidCallback onTap;

  const DestinoCard({super.key, required this.destino, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: ColoresApp.superficie,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CajaImagenRed(url: destino.imagenUrl, altura: 160),
                Positioned(
                  top: 12,
                  right: 12,
                  child: RatingBadge(calificacion: destino.calificacion),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destino.nombre,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destino.ubicacion,
                    style: const TextStyle(
                      fontSize: 14,
                      color: ColoresApp.textoSecundario,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}