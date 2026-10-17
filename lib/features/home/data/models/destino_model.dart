import '../../domain/entities/destino.dart';

class DestinoModel extends Destino {
  DestinoModel({
    required super.id,
    required super.categoriaId,
    required super.nombre,
    required super.descripcion,
    required super.ubicacion,
    required super.calificacion,
    required super.imagenUrl,
    required super.galeria,
    required super.destacado,
  });

  factory DestinoModel.fromJson(Map<String, dynamic> json) {
    String textoRequerido(String campo) {
      final valor = json[campo];
      if (valor is! String || valor.trim().isEmpty) {
        throw FormatException(
          'Destino inválido: "$campo" es obligatorio y debe ser texto.',
        );
      }
      return valor;
    }

    final calificacionJson = json['calificacion'];
    if (calificacionJson is! num ||
        calificacionJson < 0 ||
        calificacionJson > 5) {
      throw const FormatException(
        'Destino inválido: "calificacion" debe ser un número entre 0 y 5.',
      );
    }

    final galeriaJson = json['galeria'];
    if (galeriaJson is! List ||
        galeriaJson.any((item) => item is! String || item.trim().isEmpty)) {
      throw const FormatException(
        'Destino inválido: "galeria" debe ser una lista de URL de texto.',
      );
    }

    final destacadoJson = json['destacado'];
    if (destacadoJson is! bool) {
      throw const FormatException(
        'Destino inválido: "destacado" debe ser true o false.',
      );
    }

    return DestinoModel(
      id: textoRequerido('id'),
      categoriaId: textoRequerido('categoriaId'),
      nombre: textoRequerido('nombre'),
      descripcion: textoRequerido('descripcion'),
      ubicacion: textoRequerido('ubicacion'),
      calificacion: calificacionJson.toDouble(),
      imagenUrl: textoRequerido('imagenUrl'),
      galeria: List<String>.from(galeriaJson),
      destacado: destacadoJson,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'categoriaId': categoriaId,
        'nombre': nombre,
        'descripcion': descripcion,
        'ubicacion': ubicacion,
        'calificacion': calificacion,
        'imagenUrl': imagenUrl,
        'galeria': galeria,
        'destacado': destacado,
      };
}
