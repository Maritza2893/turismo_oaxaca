import 'package:flutter/material.dart';
import '../controllers/favoritos_store.dart';
import '../../../../core/theme/colores_app.dart';
import '../../../home/domain/entities/destino.dart';

class FavoriteButton extends StatefulWidget {
  final Destino destino;

  const FavoriteButton({super.key, required this.destino});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool _esFavorito;

  @override
  void initState() {
    super.initState();
    _esFavorito = FavoritosStore().esFavorito(widget.destino);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _esFavorito ? Icons.favorite : Icons.favorite_border,
        color: _esFavorito ? ColoresApp.acento : (Theme.of(context).appBarTheme.foregroundColor ?? ColoresApp.blanco),
      ),
      onPressed: () {
        setState(() {
          FavoritosStore().alternarFavorito(widget.destino);
          _esFavorito = FavoritosStore().esFavorito(widget.destino);
        });
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _esFavorito ? 'Agregado a favoritos' : 'Eliminado de favoritos',
            ),
            duration: const Duration(milliseconds: 800),
          ),
        );
      },
    );
  }
}