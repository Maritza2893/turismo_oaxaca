import '../../../home/domain/entities/destino.dart';
import '../../../home/domain/repositories/destinos_repository.dart';

class ObtenerDestinosPorCategoria {
  final DestinosRepository repository;
  const ObtenerDestinosPorCategoria(this.repository);

  Future<List<Destino>> call(String categoriaId) async {
    final destinos = await repository.obtenerDestinos();
    return destinos.where((destino) => destino.categoriaId == categoriaId).toList();
  }
}
