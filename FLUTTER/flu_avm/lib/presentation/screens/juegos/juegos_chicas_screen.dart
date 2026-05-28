import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

      SafeArea(
  child: Expanded(
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(60),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 60,
                mainAxisSpacing: 60,
                childAspectRatio: 1,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                final esJuegoBebe = index == 0;
                return _GameCard(
                  index: index,
                  esJuegoBebe: esJuegoBebe,
                );
              },
            ),
          ),
        ),
      ],
    ),
  ),
),

        ],
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  final int index;
  final bool esJuegoBebe;

  const _GameCard({required this.index, required this.esJuegoBebe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (esJuegoBebe) {
          context.push('/juego-bebe');
        } else {
       
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              backgroundColor: Colors.pink.shade50,
              title: const Text('Próximamente'),
              content: const Text('Este minijuego estará disponible pronto.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cerrar'),
                ),
              ],
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 202, 217).withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: esJuegoBebe ? const Color.fromRGBO(239, 176, 197, 1) : Colors.white54,
            width: esJuegoBebe ? 3 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 247, 202, 217).withOpacity(0.3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              esJuegoBebe ? Icons.child_care : Icons.lock,
              size: 40,
              color: esJuegoBebe ? const Color.fromARGB(255, 245, 200, 215) : Colors.white54,
            ),
            const SizedBox(height: 8),
            Text(
              esJuegoBebe ? 'Alimenta al bebe' : 'minijuego',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: esJuegoBebe ? Colors.white : Colors.white54,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}