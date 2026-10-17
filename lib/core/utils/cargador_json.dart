import 'dart:convert';
import 'package:flutter/services.dart';

class CargadorJson {
  static Future<List<Map<String, dynamic>>> cargarLista(String ruta) async {
    final contenido = await rootBundle.loadString(ruta);
    final dynamic decodificado;
    try {
      decodificado = jsonDecode(contenido);
    } on FormatException catch (error) {
      throw FormatException('El archivo "$ruta" no contiene JSON válido: ${error.message}');
    }
    if (decodificado is! List) {
      throw FormatException('El archivo "$ruta" debe contener una lista JSON.');
    }
    return decodificado.asMap().entries.map((entrada) {
      if (entrada.value is! Map) {
        throw FormatException('El elemento ${entrada.key} de "$ruta" debe ser un objeto JSON.');
      }
      return Map<String, dynamic>.from(entrada.value as Map);
    }).toList();
  }
}
