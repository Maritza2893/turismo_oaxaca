import 'package:flutter/material.dart';
import '../../domain/entities/categoria.dart';
import '../../../../core/theme/colores_app.dart';

class CategoryTile extends StatelessWidget {
  final Categoria categoria;
  final VoidCallback onTap;

  const CategoryTile({super.key, required this.categoria, required this.onTap});

  IconData _iconoCategoria(String nombre) {
    switch (nombre) {
      case 'history_edu': return Icons.account_balance;
      case 'restaurant': return Icons.restaurant;
      case 'park': return Icons.park;
      case 'palette': return Icons.palette;
      default: return Icons.explore;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: ColoresApp.primario,
          child: Icon(_iconoCategoria(categoria.icono), color: ColoresApp.blanco),
        ),
        title: Text(
          categoria.nombre,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(categoria.descripcion),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
