import '../entities/destino.dart';

abstract class DestinosRepository {
  Future<List<Destino>> obtenerDestinos();
}
