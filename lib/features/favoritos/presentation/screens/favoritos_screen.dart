import 'package:flutter/material.dart';

import '../../../../core/constants/cadenas_app.dart';
import '../../../../core/widgets/estado_vacio.dart';
import '../../../home/domain/entities/destino.dart';
import '../../../home/presentation/screens/destino_detalle_screen.dart';
import '../../../home/presentation/widgets/destino_card.dart';
import '../controllers/favoritos_store.dart';

class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({super.key});

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  Future<void> _abrirDetalle(Destino destino) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DestinoDetalleScreen(destino: destino),
      ),
    );
    // Al volver, refresca la lista por si se quitó el destino de favoritos.
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final favoritos = FavoritosStore().favoritos;

    return Scaffold(
      appBar: AppBar(title: const Text('Mis Favoritos')),
      body: favoritos.isEmpty
          ? EstadoVacio(
              icono: Icons.favorite_border,
              titulo: 'Todavía no tienes favoritos',
              mensaje: CadenasApp.sinFavoritos,
              accion: 'Explorar destinos',
              // FavoritosScreen se abrió con Navigator.push desde Home,
              // así que Navigator.pop regresa a Home.
              alPresionar: () => Navigator.pop(context),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final destino = favoritos[index];
                return DestinoCard(
                  destino: destino,
                  onTap: () => _abrirDetalle(destino),
                );
              },
            ),
    );
  }
}