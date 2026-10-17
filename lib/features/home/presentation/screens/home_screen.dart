import 'package:flutter/material.dart';
import '../../../../core/constants/cadenas_app.dart';
import '../../../../core/di/inyeccion_dependencias.dart';
import '../../../../core/widgets/estado_vacio.dart';
import '../../../../core/widgets/indicador_carga.dart';
import '../../../../core/widgets/mensaje_error.dart';
import '../../../../core/widgets/seccion_titulo.dart';
import '../../../categorias/presentation/screens/categorias_screen.dart';
import '../../../favoritos/presentation/screens/favoritos_screen.dart';
import '../../domain/entities/destino.dart';
import '../widgets/destino_card.dart';
import 'destino_detalle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Destino>> _futuroDestinos;

  @override
  void initState() {
    super.initState();
    _futuroDestinos = InyeccionDependencias.instancia.obtenerDestinos();
  }

  void _recargar() {
    setState(() {
      _futuroDestinos = InyeccionDependencias.instancia.obtenerDestinos();
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

  void _abrirCategorias() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CategoriasScreen()),
    );
  }

  void _abrirFavoritos() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FavoritosScreen()),
    );
  }

  Widget _tarjeta(Destino destino) {
    return DestinoCard(
      destino: destino,
      onTap: () => _abrirDetalle(destino),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descubre Oaxaca'),
        actions: [
          IconButton(
            tooltip: 'Ver categorías',
            icon: const Icon(Icons.category),
            onPressed: _abrirCategorias,
          ),
          IconButton(
            tooltip: 'Ver favoritos',
            icon: const Icon(Icons.favorite),
            onPressed: _abrirFavoritos,
          ),
        ],
      ),
      body: FutureBuilder<List<Destino>>(
        future: _futuroDestinos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const IndicadorCarga();
          } else if (snapshot.hasError) {
            return MensajeError(
              mensaje: CadenasApp.errorDestinos,
              alReintentar: _recargar,
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const EstadoVacio(
              icono: Icons.travel_explore,
              titulo: 'Aún no hay destinos',
              mensaje: 'Intenta nuevamente más tarde.',
            );
          }

          final destinos = snapshot.data!;
          final destacados = destinos.where((d) => d.destacado).toList();
          final resto = destinos.where((d) => !d.destacado).toList();
          // 2 encabezados de sección + las tarjetas de cada grupo
          final totalItems = 2 + destacados.length + resto.length;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: totalItems,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const SeccionTitulo(
                  titulo: 'Destinos para descubrir',
                  subtitulo: 'Lugares seleccionados de Oaxaca',
                );
              }
              if (index <= destacados.length) {
                return _tarjeta(destacados[index - 1]);
              }
              if (index == destacados.length + 1) {
                return const SeccionTitulo(titulo: 'Explora todo Oaxaca');
              }
              return _tarjeta(resto[index - destacados.length - 2]);
            },
          );
        },
      ),
    );
  }
}