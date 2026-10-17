import 'package:flutter/material.dart';
import '../../../../core/theme/colores_app.dart';
import '../../../../core/widgets/caja_imagen_red.dart';

/// Cabecera colapsable del detalle: un SliverAppBar con la imagen de fondo.
class DestinoHeroHeader extends StatelessWidget {
  final String imagenUrl;
  final String nombre;
  final List<Widget> acciones;

  const DestinoHeroHeader({
    super.key,
    required this.imagenUrl,
    required this.nombre,
    this.acciones = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: ColoresApp.primario,
      foregroundColor: ColoresApp.blanco,
      actions: acciones,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(
          start: 56,
          end: 56,
          bottom: 16,
        ),
        title: Text(
          nombre,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColoresApp.blanco,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            CajaImagenRed(url: imagenUrl, altura: 300),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.35),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.6),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}