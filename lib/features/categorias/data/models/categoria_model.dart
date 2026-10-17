import '../../domain/entities/categoria.dart';

class CategoriaModel extends Categoria {
  CategoriaModel({
    required super.id,
    required super.nombre,
    required super.icono,
    required super.descripcion,
  });

  factory CategoriaModel.fromJson(Map<String, dynamic> json) {
    String requerido(String campo) {
      final valor = json[campo];
      if (valor is! String || valor.trim().isEmpty) {
        throw FormatException(
          'Categoría inválida: "$campo" es obligatorio y debe ser texto.',
        );
      }
      return valor;
    }

    return CategoriaModel(
      id: requerido('id'),
      nombre: requerido('nombre'),
      icono: requerido('icono'),
      descripcion: requerido('descripcion'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'icono': icono,
        'descripcion': descripcion,
      };
}
