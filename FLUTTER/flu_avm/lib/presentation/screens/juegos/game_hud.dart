import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'catch_game.dart';
 
class GameHud extends StatelessWidget {
  final CatchGame game;
 
  const GameHud({super.key, required this.game});
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
 
            // Botón volver
            IconButton(
              onPressed: () => context.go('/juegos-chicas'),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              style: IconButton.styleFrom(
                backgroundColor: Colors.pink.withValues(alpha: 0.7),
              ),
            ),
 
            // Puntuación
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.pink.withValues(alpha: 0.8),
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
                color: Colors.pink.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '🍼' * game.vidas,
                style: const TextStyle(fontSize: 18),
              ),
            ),
 
            // Botón pause
            IconButton(
              onPressed: () {
                if (game.paused) {
                  game.resumeEngine();
                  game.overlays.remove('pauseMenu');
                } else {
                  game.pauseEngine();
                  game.overlays.add('pauseMenu');
                }
              },
              icon: Icon(
                game.paused ? Icons.play_arrow : Icons.pause,
                color: Colors.white,
              ),
              style: IconButton.styleFrom(
                backgroundColor: Colors.pink.withValues(alpha: 0.7),
              ),
            ),
 
          ],
        ),
      ),
    );
  }
}