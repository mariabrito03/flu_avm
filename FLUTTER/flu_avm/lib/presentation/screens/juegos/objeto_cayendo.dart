
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class ObjetoCayendo extends SpriteComponent with HasGameReference<FlameGame> {
  final String nombreAsset;
  final double posicionX;
  final VoidCallback onAtrapar;
  final VoidCallback onPerdido;
  final SpriteComponent bebeRef;
  final Vector2 gameSize;
  final double velocidad = 200;

  ObjetoCayendo({
    required this.nombreAsset,
    required this.posicionX,
    required this.onAtrapar,
    required this.onPerdido,
    required this.bebeRef,
    required this.gameSize,
  });

  @override
  Future<void> onLoad() async {
    sprite = await game.loadSprite(nombreAsset);
    size = Vector2(60, 60);
    position = Vector2(posicionX, -60);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += velocidad * dt;

    // Colisión con el bebé
    if (position.y + size.y >= bebeRef.position.y &&
        position.x + size.x >= bebeRef.position.x &&
        position.x <= bebeRef.position.x + bebeRef.size.x) {
      removeFromParent();
      onAtrapar();
      return;
    }

    // Se perdió
    if (position.y > gameSize.y) {
      removeFromParent();
      onPerdido();
    }
  }
}