
import 'package:dio/dio.dart';
import 'package:flu_avm/mappers/pokemon_mapper.dart';

class PokemonService {

  // ignore: strict_top_level_inference, avoid_types_as_parameter_names
  static getPokemon<String>(String pokemonId) async {

    final dio = Dio();

    try {
      final responsio = await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');

      final pokemon = PokemonMapper.pokeApiPokemonToEntity(responsio.data);

      return (pokemon, 'Data obtenida corréctamente');

    } catch (e) {

      return (null, 'No se pudo obtener el Pokemon');
    }

  }

}