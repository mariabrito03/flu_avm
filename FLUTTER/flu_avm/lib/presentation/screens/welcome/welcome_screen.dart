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

        const SizedBox(height: 200),
        const Center(child: Text('Página de inicio')),
      ],
    ),
  ),
),
    );
  }
}