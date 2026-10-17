import '../../domain/entities/categoria.dart';
import '../../domain/repositories/categorias_repository.dart';
import '../datasources/categorias_datasource.dart';

class CategoriasRepositoryImpl implements CategoriasRepository {
  final CategoriasDatasource datasource;

  CategoriasRepositoryImpl({required this.datasource});

  @override
  Future<List<Categoria>> obtenerCategorias() => datasource.obtenerCategorias();
}
