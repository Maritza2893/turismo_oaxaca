import '../../../home/domain/entities/destino.dart';

/// Mantiene los favoritos en memoria mientras la aplicación está abierta.
class FavoritosLocalDatasource {
  FavoritosLocalDatasource._();
  static final FavoritosLocalDatasource instance = FavoritosLocalDatasource._();

  final List<Destino> _favoritos = [];
  List<Destino> obtenerTodos() => List.unmodifiable(_favoritos);
  bool contiene(Destino destino) => _favoritos.any((item) => item.id == destino.id);

  void alternar(Destino destino) {
    if (contiene(destino)) {
      _favoritos.removeWhere((item) => item.id == destino.id);
    } else {
      _favoritos.add(destino);
    }
  }
}
