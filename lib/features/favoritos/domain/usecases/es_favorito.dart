import '../../../home/domain/entities/destino.dart';
import '../repositories/favoritos_repository.dart';

class EsFavorito {
  final FavoritosRepository repository;
  const EsFavorito(this.repository);
  bool call(Destino destino) => repository.esFavorito(destino);
}