import '../../domain/entities/destino.dart';
import '../../domain/repositories/favoritos_repository.dart';
import '../datasources/favoritos_datasource.dart';

class DestinosRepositoryImpl implements DestinosRepository {
  final DestinosDatasource datasource;

  DestinosRepositoryImpl({required this.datasource});

  @override
  Future<List<Destino>> obtenerDestinos() => datasource.obtenerDestinos();
}