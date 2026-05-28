import 'package:flutter/material.dart';
import 'catch_game.dart';

class GameHud extends StatelessWidget {
  final CatchGame game;

  const GameHud({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Puntuación
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '⭐ ${game.puntuacion}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          // Vidas
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '🍼 ' * game.vidas,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}