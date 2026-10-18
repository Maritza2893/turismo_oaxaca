import '../../../home/domain/entities/destino.dart';
import '../../domain/repositories/favoritos_repository.dart';
import '../datasources/favoritos_local_datasource.dart';

class FavoritosRepositoryImpl implements FavoritosRepository {
  final FavoritosLocalDatasource datasource;
  FavoritosRepositoryImpl({FavoritosLocalDatasource? datasource})
      : datasource = datasource ?? FavoritosLocalDatasource.instance;

  @override
  List<Destino> obtenerFavoritos() => datasource.obtenerTodos();
  @override
  bool esFavorito(Destino destino) => datasource.contiene(destino);
  @override
  void alternar(Destino destino) => datasource.alternar(destino);
}
