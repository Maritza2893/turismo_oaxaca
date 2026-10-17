import 'package:flutter_test/flutter_test.dart';
import 'package:turismo_oaxaca/features/home/data/models/destino_model.dart';

Map<String, dynamic> destinoValido() => {
  'id': 'monte-alban', 'categoriaId': 'historia', 'nombre': 'Monte Albán',
  'descripcion': 'Zona arqueológica', 'ubicacion': 'Oaxaca', 'calificacion': 4.9,
  'imagenUrl': 'https://example.com/main.jpg',
  'galeria': ['https://example.com/gallery.jpg'], 'destacado': true,
};
void main() {
  group('DestinoModel.fromJson', () {
    test('convierte los campos válidos', () {
      final destino = DestinoModel.fromJson(destinoValido());
      expect(destino.id, 'monte-alban'); expect(destino.calificacion, 4.9);
      expect(destino.galeria, hasLength(1)); expect(destino.destacado, isTrue);
      expect(destino.toJson()['nombre'], 'Monte Albán');
    });
    test('falla con un campo obligatorio ausente', () {
      final json = destinoValido()..remove('nombre');
      expect(() => DestinoModel.fromJson(json), throwsA(isA<FormatException>()));
    });
    test('falla si la calificación tiene tipo incorrecto', () {
      final json = destinoValido()..['calificacion'] = 'excelente';
      expect(() => DestinoModel.fromJson(json), throwsA(isA<FormatException>()));
    });
    test('falla si galeria no es una lista de cadenas', () {
      final json = destinoValido()..['galeria'] = [1, false];
      expect(() => DestinoModel.fromJson(json), throwsA(isA<FormatException>()));
    });
  });
}
