import '../../../home/domain/entities/destino.dart';
import '../repositories/favoritos_repository.dart';

class AlternarFavorito {
  final FavoritosRepository repository;
  const AlternarFavorito(this.repository);
  void call(Destino destino) => repository.alternar(destino);
}