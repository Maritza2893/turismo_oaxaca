import '../../features/home/data/datasources/destinos_datasource.dart';
import '../../features/home/data/repositories/destinos_repository_impl.dart';
import '../../features/home/domain/repositories/destinos_repository.dart';
import '../../features/home/domain/usecases/obtener_destinos.dart';
import '../../features/categorias/data/datasources/categorias_datasource.dart';
import '../../features/categorias/data/repositories/categorias_repository_impl.dart';
import '../../features/categorias/domain/repositories/categorias_repository.dart';
import '../../features/categorias/domain/usecases/obtener_categorias.dart';
import '../../features/categorias/domain/usecases/obtener_destinos_por_categoria.dart';
import '../../features/favoritos/data/datasources/favoritos_local_datasource.dart';
import '../../features/favoritos/data/repositories/favoritos_repository_impl.dart';
import '../../features/favoritos/domain/repositories/favoritos_repository.dart';
import '../../features/favoritos/domain/usecases/obtener_favoritos.dart';
import '../../features/favoritos/domain/usecases/alternar_favorito.dart';
import '../../features/favoritos/domain/usecases/es_favorito.dart';

/// Único punto de composición: la presentación no construye implementaciones de data.
class InyeccionDependencias {
  InyeccionDependencias._();
  static final InyeccionDependencias instancia = InyeccionDependencias._();

  late final DestinosRepository _destinosRepository = DestinosRepositoryImpl(datasource: DestinosDatasource());
  late final CategoriasRepository _categoriasRepository = CategoriasRepositoryImpl(datasource: CategoriasDatasource());
  late final FavoritosRepository _favoritosRepository = FavoritosRepositoryImpl(datasource: FavoritosLocalDatasource.instance);

  late final obtenerDestinos = ObtenerDestinos(_destinosRepository);
  late final obtenerCategorias = ObtenerCategorias(_categoriasRepository);
  late final obtenerDestinosPorCategoria = ObtenerDestinosPorCategoria(_destinosRepository);
  late final obtenerFavoritos = ObtenerFavoritos(_favoritosRepository);
  late final alternarFavorito = AlternarFavorito(_favoritosRepository);
  late final esFavorito = EsFavorito(_favoritosRepository); 
}  