import 'package:pokedex/models/pokemon/pokemon_response.dart';
import 'package:pokedex/models/pokemon_generation_response.dart';

abstract class IPokemonRepository {
  Future<PokemonGenerationResponse> getAllPokemonsByGeneration(int generation);
  Future<PokemonResponse> getPokemonById(int id);
}
