import '../../../home/domain/entities/destino.dart';
import '../../../../core/di/inyeccion_dependencias.dart';

class FavoritosStore {
  FavoritosStore._();
  static final FavoritosStore _instance = FavoritosStore._();
  factory FavoritosStore() => _instance;

  final _di = InyeccionDependencias.instancia;
  List<Destino> get favoritos => _di.obtenerFavoritos();
  bool esFavorito(Destino destino) => _di.esFavorito(destino);
  void alternarFavorito(Destino destino) => _di.alternarFavorito(destino);
}