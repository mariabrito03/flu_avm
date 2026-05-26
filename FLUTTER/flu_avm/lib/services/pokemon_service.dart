
// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:flu_avm/presentation/providers/providers.dart';

class PokemonService {

  // ignore: strict_top_level_inference, avoid_types_as_parameter_names
  static getPokemon<String>(String pokemon) async {

    final dio = Dio();

    try {
      final responsio = await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonIdsProvider');
      final pokemonData = responsio.data;
      return pokemonData;
    } catch (e) {
      return e;
    }

  }

}