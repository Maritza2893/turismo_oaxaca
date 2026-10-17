import '../entities/destino.dart';
import '../repositories/destinos_repository.dart';

class ObtenerDestinos {
  final DestinosRepository repository;
  const ObtenerDestinos(this.repository);

  Future<List<Destino>> call() => repository.obtenerDestinos();
}