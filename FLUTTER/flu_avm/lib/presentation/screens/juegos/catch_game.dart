import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flu_avm/presentation/screens/juegos/objeto_cayendo.dart';
 
class CatchGame extends FlameGame with HorizontalDragDetector {
 
  late SpriteComponent bebe;
  final Random _random = Random();
  int puntuacion = 0;
  int vidas = 3;
  bool juegoTerminado = false;
 
  // Cambia este número para ajustar el tamaño del bebé
  static const double tamBebe = 300;
 
  final AudioPlayer _musicaPlayer = AudioPlayer();
  final AudioPlayer _efectoPlayer = AudioPlayer();
 
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
      size: Vector2(tamBebe, tamBebe),
      position: Vector2(size.x / 2 - tamBebe / 2, size.y - tamBebe),
    );
    add(bebe);
 
    // Música de fondo en bucle
    try {
      await _musicaPlayer.setReleaseMode(ReleaseMode.loop);
      await _musicaPlayer.play(AssetSource('audio/musica_fondo.mp3'), volume: 0.5);
    } catch (_) {}
 
    // Primer objeto
    _spawnObjeto();
  }
 
  @override
  void onRemove() {
    _musicaPlayer.stop();
    _musicaPlayer.dispose();
    _efectoPlayer.dispose();
    super.onRemove();
  }
 
  void actualizarHud() {
    overlays.remove('hud');
    overlays.add('hud');
  }
 
  void _spawnObjeto() {
    if (juegoTerminado) return;
    final esBiberon = _random.nextBool();
    add(ObjetoCayendo(
      nombreAsset: esBiberon ? 'biberon.png' : 'osito.png',
      posicionX: _random.nextDouble() * (size.x - 100),
      onAtrapar: () async {
        puntuacion++;
        actualizarHud();
 
        // Victoria al llegar a 10
        if (puntuacion >= 10) {
          juegoTerminado = true;
          try {
            await _musicaPlayer.stop();
            await _efectoPlayer.play(AssetSource('audio/victoria.mp3'));
          } catch (_) {}
          overlays.add('victoria');
          return;
        }
 
        _spawnObjeto();
      },
      onPerdido: () {
        vidas--;
        actualizarHud();
        if (vidas <= 0) {
          juegoTerminado = true;
          try {
            _musicaPlayer.stop();
          } catch (_) {}
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
    bebe.position.x = bebe.position.x.clamp(0, size.x - tamBebe);
  }
}