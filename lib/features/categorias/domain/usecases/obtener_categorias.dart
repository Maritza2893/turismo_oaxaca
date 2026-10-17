import '../entities/categoria.dart';
import '../repositories/categorias_repository.dart';

class ObtenerCategorias {
  final CategoriasRepository repository;
  const ObtenerCategorias(this.repository);

  Future<List<Categoria>> call() => repository.obtenerCategorias();
}
