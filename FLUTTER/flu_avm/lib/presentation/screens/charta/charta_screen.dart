

/*TEMPORAL: Pantalla de mapa desactivada para desarrollo en Chrome
// Para reactivar: borrar el widget temporal de abajo y descomentar todo el bloque original
// ignore_for_file: unnecessary_const

import 'package:flu_avm/Config/config.dart';
import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flu_avm/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';



class ChartaScreen extends ConsumerStatefulWidget {
  const ChartaScreen({super.key});

  @override
  ConsumerState<ChartaScreen> createState() => _ChartaScreenState();
}

class _ChartaScreenState extends ConsumerState<ChartaScreen> {

  // ignore: unused_field
  CircleAnnotationManager? _circleAnnotationManager;
  // ignore: unused_field
  Cancelable? _dragCancelable;


  // ignore: unused_element
  void _initiareCircleAnnotations(MapboxMap mapboxmap) { 
  
  mapboxmap.annotations.createCircleAnnotationManager().then((manager) {
     _circleAnnotationManager = manager;

     _setupDragListener(manager);

     _addereVelRenovaMarker();
    });
  }

  // ignore: unused_element
  void _setupDragListener(CircleAnnotationManager manager){

    _dragCancelable?.cancel();

    // ignore: unused_local_variable
    final socketService = ref.read(socketServiceProvider);

    _dragCancelable = manager.dragEvents(
      onChanged: (CircleAnnotation annotation) {
        final pos = annotation.geometry.coordinates;
        ref.read(coordsMarkerProvider.notifier).state = pos;
        socketService.mitterePositio(pos);
      },
      onEnd: (CircleAnnotation annotation) {
        final pos = annotation.geometry.coordinates;
        ref.read(coordsMarkerProvider.notifier).state = pos;
        socketService.mitterePositio(pos);
        },
      );
    }


  Future<void> _addereVelRenovaMarker() async {
    final manager = _circleAnnotationManager;
    if (manager == null) return;

    await manager.deleteAll();

    final placed  = ref.read(markerPositumProvider);

/*
    if (!placed) {
      await manager.deleteAll();
      return;
    }


    // ignore: unused_local_variable
    final situs = ref.read(coordsMarkerProvider);

    // ignore: unused_local_variable
    final color = ref.read(formColorProvider);

    // ignore: unused_local_variable


    try {
      await manager.create(optiones);
    }
      catch (e) {
        debugPrint('Error al crear marcador : $e');
    }
    */

    if (placed){
      final situs = ref.read(coordsMarkerProvider);
      final color = ref.read(formColorProvider);

      // ignore: unused_local_variable
      final optiones = CircleAnnotationOptions(
        geometry: Point (coordinates: situs),
        circleColor: color.toARGB32(),
        circleRadius: 14.0,
        circleStrokeColor: Colors.white.toARGB32(),
        isDraggable: true,

    );
    
    try {
      await manager.create(optiones);
    }catch (e) {
      debugPrint('Error al crear marcador : $e');
    }
   }

   // ignore: unused_local_variable
  final aliiRudi = ref.read(aliisUsoresProvider).value ?? [];

   // ignore: unused_local_variable
   final meusId = ref.watch(socketServiceProvider).meusSocketId;

  // ignore: unused_local_variable
   final alii = aliiRudi.where((u) => u.id != meusId).toList();

   for (final usor in alii){
    // ignore: unused_local_variable
    final usorColor = adHexExColor(usor.colorhex);

      // ignore: unused_local_variable
      final aliaOptionen = CircleAnnotationOptions(
        geometry: Point (coordinates: usor.positio),
        circleColor: usorColor.toARGB32(),
        circleRadius: 14.0,
        circleStrokeColor: Colors.white.toARGB32(),
        isDraggable: false,
      );
      try {
        await manager.create(aliaOptionen);
      }catch (e) {
        debugPrint('Error al crear marcador de otros usuarios ${usor.nomen} : $e');
      }
   }
  

  }


  @override
  void dispose() {
    _dragCancelable?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ref.listen<bool>(markerPositumProvider, (previous, next) {
      if ( next == true) {
        _addereVelRenovaMarker();
      }
    });
  
    ref.listen(aliisUsoresProvider , (prev, next) {
        _addereVelRenovaMarker();
      
     });


    return Scaffold(
      appBar : AppBar(
        title: Text('Mapas'),
        ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MapWidget(
            key: const ValueKey('main_map'),
            // ignore: deprecated_member_use
            cameraOptions: CameraOptions(
              center: Point(
                coordinates: initialisMarkerPositio,
                ),                
                zoom: 14.5,
              ),
              styleUri: MapboxStyles.MAPBOX_STREETS,
              onMapCreated:  _initiareCircleAnnotations,
            ),
            Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ref.watch(markerPositumProvider)
                  ? InformaUsoris(
                      nomen: ref.watch(formNomenProvider),
                      positio: ref.watch(coordsMarkerProvider),
                      color: ref.watch(formColorProvider),
                  ) : ComplereForm(),
                ),
               ),
             ],
          ),
         );
   }
  }
*/
import 'package:flutter/material.dart';

class ChartaScreen extends StatelessWidget {
  const ChartaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapas')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('Mapa desactivado temporalmente',
                style: TextStyle(color: Colors.grey)),
            Text('(solo disponible en Android/iOS)',
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}