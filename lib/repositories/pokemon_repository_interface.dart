import 'package:pokedex/models/pokemon_generation_response.dart';

abstract class IPokemonRepository {
  Future<PokemonGenerationResponse> getAllPokemonsByGeneration(int generation);
}
