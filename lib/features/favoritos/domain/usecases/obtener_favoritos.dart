import '../../../home/domain/entities/destino.dart';
import '../repositories/favoritos_repository.dart';

class ObtenerFavoritos {
  final FavoritosRepository repository;
  const ObtenerFavoritos(this.repository);
  List<Destino> call() => repository.obtenerFavoritos();
}