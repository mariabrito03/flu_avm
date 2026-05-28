import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class JuegosChicasScreen extends StatefulWidget {
  const JuegosChicasScreen({super.key});

  @override
  State<JuegosChicasScreen> createState() => _JuegosChicasScreenState();
}

class _JuegosChicasScreenState extends State<JuegosChicasScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/interfaz_animada.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Video de fondo en bucle
          if (_controller.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),

          // Contenido encima del video
          const Center(child: Text('Grid')),
        ],
      ),
    );
  }
}
