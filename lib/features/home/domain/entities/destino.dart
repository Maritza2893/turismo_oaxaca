class Destino {
  final String id;
  final String categoriaId;
  final String nombre;
  final String descripcion;
  final String ubicacion;
  final double calificacion;
  final String imagenUrl;
  final List<String> galeria;
  final bool destacado;

  Destino({
    required this.id,
    required this.categoriaId,
    required this.nombre,
    required this.descripcion,
    required this.ubicacion,
    required this.calificacion,
    required this.imagenUrl,
    required this.galeria,
    required this.destacado,
  });
}
