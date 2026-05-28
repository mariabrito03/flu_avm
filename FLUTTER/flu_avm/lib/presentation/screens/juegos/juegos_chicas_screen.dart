
import 'package:flutter/material.dart';

class JuegosChicasScreen extends StatelessWidget {
  const JuegosChicasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kewpie tiene   hambre'),
      ),
      body: const Center(
        child: Text('Demo de juego para chicas'),
      ),
    );
  }
}

