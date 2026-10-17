import 'package:flutter/material.dart';
import '../../../../core/widgets/caja_imagen_red.dart';

class ImageGallery extends StatelessWidget {
  final List<String> imagenes;

  const ImageGallery({super.key, required this.imagenes});

  @override
  Widget build(BuildContext context) {
    if (imagenes.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagenes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 120,
              child: CajaImagenRed(url: imagenes[index], altura: 100),
            ),
          );
        },
      ),
    );
  }
}