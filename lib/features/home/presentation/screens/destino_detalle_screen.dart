
import 'package:flutter/material.dart';
import '../../domain/entities/destino.dart';
import '../widgets/destino_hero_header.dart';
import '../widgets/info_chip.dart';
import '../widgets/image_gallery.dart';
import '../../../../core/widgets/seccion_titulo.dart';
import '../../../favoritos/presentation/widgets/favorite_button.dart';

class DestinoDetalleScreen extends StatelessWidget {
  final Destino destino;

  const DestinoDetalleScreen({
    super.key,
    required this.destino,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DestinoHeroHeader(
            imagenUrl: destino.imagenUrl,
            nombre: destino.nombre,
            acciones: [FavoriteButton(destino: destino)],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: InfoChip(
                          icono: Icons.location_on,
                          texto: destino.ubicacion,
                        ),
                      ),
                      const SizedBox(width: 12),
                      InfoChip(
                        icono: Icons.star,
                        texto: '${destino.calificacion}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SeccionTitulo(
                    titulo: 'Acerca del lugar',
                  ),
                  Text(
                    destino.descripcion,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  const SeccionTitulo(
                    titulo: 'Galería fotográfica',
                  ),
                  ImageGallery(
                    imagenes: destino.galeria
                        .where((url) => url != destino.imagenUrl)
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

