import '../../domain/entities/destino.dart';
import '../../domain/repositories/destinos_repository.dart';
import '../datasources/destinos_datasource.dart';

class DestinosRepositoryImpl implements DestinosRepository {
  final DestinosDatasource datasource;

  DestinosRepositoryImpl({required this.datasource});

  @override
  Future<List<Destino>> obtenerDestinos() => datasource.obtenerDestinos();
}
