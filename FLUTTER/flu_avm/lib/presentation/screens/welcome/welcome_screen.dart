import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flu_avm/presentation/providers/providers.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool estTenebris = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.data_object),
            SizedBox(width: 8),
            Text('Flu Avm'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(estTenebrisModusProvider.notifier).state = !estTenebris;
            },
            icon: Icon(
              estTenebris
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Badge WS
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('WS', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 12),

              // Imágenes
              SizedBox(
                height: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/movil.png', height: 130),
                    Image.asset('assets/puntos.png', height: 40),
                    Image.asset('assets/servidor.png', height: 130),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Badge CONECTADO
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.circle, color: Colors.green, size: 10),
                    SizedBox(width: 6),
                    Text(
                      'CONECTADO',
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Título y descripción
              const Text(
                'WebSockets en vivo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Aprende a construir apps con datos en tiempo real en Flutter. '
                'Dos ejemplos prácticos te esperan dentro.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              const SizedBox(height: 16),

              // Tarjetas mapa y votaciones
              Row(
                children: [
                  Expanded(
                    child: _FeatureCard(
                      image: 'assets/mapa.jpg',
                      title: 'Mapas',
                      subtitle: 'Ubicación en tiempo real',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _FeatureCard(
                      image: 'assets/votaciones.jpg',
                      title: 'Votaciones',
                      subtitle: 'Gráfico que se actualiza',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
