import '../../../../core/utils/cargador_json.dart';
import '../models/categoria_model.dart';

class CategoriasDatasource {
  Future<List<CategoriaModel>> obtenerCategorias() async {
    final datos = await CargadorJson.cargarLista(
      'assets/data/categorias.json',
    );

    return datos
        .map((dato) => CategoriaModel.fromJson(dato))
        .toList();
  }
}
