import 'package:flutter/material.dart';
import '../../domain/entities/categoria.dart';
import '../../../../core/constants/cadenas_app.dart';
import '../../../../core/di/inyeccion_dependencias.dart';
import '../../../../core/widgets/estado_vacio.dart';
import '../../../home/domain/entities/destino.dart';
import '../../../home/presentation/screens/destino_detalle_screen.dart';
import '../../../home/presentation/widgets/destino_card.dart';
import '../../../../core/widgets/indicador_carga.dart';
import '../../../../core/widgets/mensaje_error.dart';

class DestinosPorCategoriaScreen extends StatefulWidget {
  final Categoria categoria;

  const DestinosPorCategoriaScreen({super.key, required this.categoria});

  @override
  State<DestinosPorCategoriaScreen> createState() =>
      _DestinosPorCategoriaScreenState();
}

class _DestinosPorCategoriaScreenState
    extends State<DestinosPorCategoriaScreen> {
  late Future<List<Destino>> _futuroDestinosFiltrados;

  @override
  void initState() {
    super.initState();
    _futuroDestinosFiltrados = InyeccionDependencias.instancia
        .obtenerDestinosPorCategoria(widget.categoria.id);
  }

  void _recargar() {
    setState(() {
      _futuroDestinosFiltrados = InyeccionDependencias.instancia
          .obtenerDestinosPorCategoria(widget.categoria.id);
    });
  }

  void _abrirDetalle(Destino destino) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DestinoDetalleScreen(destino: destino),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoria.nombre)),
      body: FutureBuilder<List<Destino>>(
        future: _futuroDestinosFiltrados,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const IndicadorCarga();
          } else if (snapshot.hasError) {
            return MensajeError(
              mensaje: CadenasApp.errorFiltro,
              alReintentar: _recargar,
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return EstadoVacio(
              icono: Icons.location_off_outlined,
              titulo: 'Sin destinos por ahora',
              mensaje:
                  'No hay lugares registrados en ${widget.categoria.nombre}.',
            );
          }

          final destinos = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: destinos.length,
            itemBuilder: (context, index) {
              final destino = destinos[index];
              return DestinoCard(
                destino: destino,
                onTap: () => _abrirDetalle(destino),
              );
            },
          );
        },
      ),
    );
  }
}
