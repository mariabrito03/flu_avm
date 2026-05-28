
import 'package:flutter/material.dart';

class JuegoBebeScreen extends StatelessWidget {
  const JuegoBebeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alimenta a kewpie'),
      ),
      body: const Center(
        child: Text('Dale de comer sin que se enfade'),
      ),
    );
  }
}