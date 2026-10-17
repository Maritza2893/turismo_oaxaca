import 'package:flutter/material.dart';
import '../../../../core/di/inyeccion_dependencias.dart';
import '../../domain/entities/categoria.dart';
import '../widgets/category_tile.dart';
import '../../../../core/constants/cadenas_app.dart';
import '../../../../core/widgets/estado_vacio.dart';
import '../../../../core/widgets/indicador_carga.dart';
import '../../../../core/widgets/mensaje_error.dart';
import 'destinos_por_categoria_screen.dart';

class CategoriasScreen extends StatefulWidget {
  const CategoriasScreen({super.key});

  @override
  State<CategoriasScreen> createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen> {
  late Future<List<Categoria>> _futuroCategorias;

  @override
  void initState() {
    super.initState();
    _futuroCategorias = InyeccionDependencias.instancia.obtenerCategorias();
  }

  void _recargar() {
    setState(() {
      _futuroCategorias = InyeccionDependencias.instancia.obtenerCategorias();
    });
  }

  void _abrirDestinos(Categoria categoria) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // objeto completo para usar su ID
        builder: (_) => DestinosPorCategoriaScreen(categoria: categoria),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorías Turísticas')),
      body: FutureBuilder<List<Categoria>>(
        future: _futuroCategorias,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const IndicadorCarga();
          } else if (snapshot.hasError) {
            return MensajeError(
              mensaje: CadenasApp.errorCategorias,
              alReintentar: _recargar,
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const EstadoVacio(
              icono: Icons.category_outlined,
              titulo: 'Sin categorías',
              mensaje: CadenasApp.sinCategorias,
            );
          }

          final categorias = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: categorias.length,
            itemBuilder: (context, index) {
              final categoria = categorias[index];
              return CategoryTile(
                categoria: categoria,
                onTap: () => _abrirDestinos(categoria),
              );
            },
          );
        },
      ),
    );
  }
}
