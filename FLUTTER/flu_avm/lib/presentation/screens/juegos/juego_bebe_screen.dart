import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'catch_game.dart';
import 'game_hud.dart';
 
class JuegoBebeScreen extends StatefulWidget {
  const JuegoBebeScreen({super.key});
 
  @override
  State<JuegoBebeScreen> createState() => _JuegoBebeScreenState();
}
 
class _JuegoBebeScreenState extends State<JuegoBebeScreen> {
  late CatchGame _game;
 
  @override
  void initState() {
    super.initState();
    _game = CatchGame();
  }
 
  void _reiniciar() {
    setState(() {
      _game = CatchGame();
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: _game,
        overlayBuilderMap: {
 
          // HUD — volver + puntuación + vidas + pause en una sola fila
          'hud': (context, game) => GameHud(game: game as CatchGame),
 
          // Menú de pausa
          'pauseMenu': (context, game) => Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.pink, width: 2),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '⏸ Pausa',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      (game as CatchGame).resumeEngine();
                      game.overlays.remove('pauseMenu');
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Continuar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(180, 48),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
              onPressed: () {
                  (game as CatchGame).reanudarJuego();  // ← usa reanudarJuego()
                  game.overlays.remove('pauseMenu');
                  },
                    icon: const Icon(Icons.refresh, color: Colors.pink),
                    label: const Text(
                      'Reiniciar',
                      style: TextStyle(color: Colors.pink),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.pink),
                      minimumSize: const Size(180, 48),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.go('/juegos-chicas'),
                    child: const Text('Volver al menú'),
                  ),
                ],
              ),
            ),
          ),
 
          // Game Over
          'gameOver': (context, game) => Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '💔 Game Over',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Puntuación: ${(game as CatchGame).puntuacion}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: _reiniciar,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Volver a jugar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.go('/juegos-chicas'),
                    child: const Text('Volver al menú'),
                  ),
                ],
              ),
            ),
          ),
 
          // Victoria
          'victoria': (context, game) => Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.pink, width: 3),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '¡Oleeeeeeeeee!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '¡Victoria, el bebote está contento!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: _reiniciar,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Jugar de nuevo'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => context.go('/juegos-chicas'),
                    child: const Text('Volver al juegos para chicas'),
                  ),
                ],
              ),
            ),
          ),
        },
        initialActiveOverlays: const ['hud'],
      ),
    );
  }
}
 