
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flu_avm/presentation/screens/juegos/objeto_cayendo.dart';
// ignore: unused_import
import 'package:flutter/material.dart';

class CatchGame extends FlameGame with HorizontalDragDetector {
  
  late SpriteComponent bebe;
  final Random _random = Random();
  int puntuacion = 0;
  int vidas = 3;
  bool juegoTerminado = false;

  @override
  Future<void> onLoad() async {
    // Fondo
    final fondoSprite = await loadSprite('cocina.jpg');
    add(SpriteComponent(
      sprite: fondoSprite,
      size: size,
      position: Vector2.zero(),
    ));

    // Jugador (bebé)
    final bebeSprite = await loadSprite('bebe.png');
    bebe = SpriteComponent(
      sprite: bebeSprite,
      size: Vector2(100, 100),
      position: Vector2(size.x / 2 - 50, size.y - 130),
    );
    add(bebe);

    // Primer objeto que cae
    _spawnObjeto();
  }

  void _spawnObjeto() {
    if (juegoTerminado) return;
    final esBiberon = _random.nextBool();
    add(
      ObjetoCayendo(
      nombreAsset: esBiberon ? 'biberon.png' : 'osito.png',
      posicionX: _random.nextDouble() * (size.x - 60),
      onAtrapar: () {
        puntuacion++;
        _spawnObjeto();
      },
      onPerdido: () {
        vidas--;
        if (vidas <= 0) {
          juegoTerminado = true;
          overlays.add('gameOver');
        }
        _spawnObjeto();
      },
      bebeRef: bebe,
      gameSize: size,
    ));
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    bebe.position.x += info.delta.global.x;
    bebe.position.x = bebe.position.x.clamp(0, size.x - 100);
  }
}