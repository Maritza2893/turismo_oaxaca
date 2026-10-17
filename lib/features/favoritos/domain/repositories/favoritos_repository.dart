import '../../../home/domain/entities/destino.dart';

abstract class FavoritosRepository {
  List<Destino> obtenerFavoritos();
  bool esFavorito(Destino destino);
  void alternar(Destino destino);
}