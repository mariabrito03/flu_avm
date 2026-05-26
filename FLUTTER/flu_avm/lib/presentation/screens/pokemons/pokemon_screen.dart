
// ignore_for_file: unused_element

// ignore: unused_import
import 'package:flu_avm/config/config.dart';
import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';


class PokemonScreen extends ConsumerWidget {

  final String pokemonId;

  const PokemonScreen({
    super.key,
    required this.pokemonId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  // ignore: unused_local_variable
  final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

  return pokemonAsync.when(
    data: (pokemon) => _PokemonVisum(pokemon: pokemon),
    error: (error, stackTrace) => _ErrorWidget(nuntius: error.toString()),
    loading: () => _LoadingWidget(),
);

   
  }
}

class _PokemonVisum extends StatelessWidget {
  
  final Pokemon pokemon;

  const _PokemonVisum({
    required this.pokemon
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.nomen),
      ),
    body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      'Sus habilidades son:',
      style: GoogleFonts.russoOne(fontSize: 20),
    ), // Text
    Text(
      pokemon.faculfates.join(', '),
      style: GoogleFonts.russoOne(fontSize: 22),
    ), // Text
    Image.network(
      pokemon.faciemImaginem ?? '',
      fit: BoxFit.contain,
      width: 300,
      height: 300,
    ), // Image.network
    const SizedBox(height: 15),
    Text(
      'Mide ${ pokemon.altitudo / 10 }m. y pesa ${ pokemon.pondus / 10 }kg.',
      style: GoogleFonts.russoOne(fontSize: 22),
            ), // Text
          ],
        )
      ), // Center
    ); // Scaffold
  }
}

class _ErrorWidget extends StatelessWidget {
  final String nuntius;

  const _ErrorWidget({
    required this.nuntius
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Error: $nuntius'),
      ), // Center
    ); // Scaffold
  }
}
class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ), // Center
    ); // Scaffold
  }
}
