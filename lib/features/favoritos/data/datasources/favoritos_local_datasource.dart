import '../../../../core/utils/cargador_json.dart';
import '../models/destino_model.dart';

class DestinosDatasource {
  Future<List<DestinoModel>> obtenerDestinos() async {
    final listaJson = await CargadorJson.cargarLista('assets/data/destinos.json');
    return listaJson.map((json) => DestinoModel.fromJson(json)).toList();
  }
}