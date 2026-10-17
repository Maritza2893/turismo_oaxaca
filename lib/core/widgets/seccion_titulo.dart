import 'package:flutter/material.dart';

class SeccionTitulo extends StatelessWidget {
  final String titulo;
  final String? subtitulo;

  const SeccionTitulo({super.key, required this.titulo, this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: Theme.of(context).textTheme.titleLarge),
          if (subtitulo != null) ...[
            const SizedBox(height: 4),
            Text(subtitulo!, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ],
      ),
    );
  }
}