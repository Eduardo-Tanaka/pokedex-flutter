import 'package:pokedex/models/evolution_chain/evolution_chain_response.dart';
import 'package:pokedex/models/pokemon/pokemon_response.dart';
import 'package:pokedex/models/pokemon_generation_response.dart';
import 'package:pokedex/models/pokemon_species/pokemon_species_response.dart';

abstract class IPokemonRepository {
  Future<PokemonGenerationResponse> getAllPokemonsByGeneration(int generation);
  Future<PokemonResponse> getPokemonById(int id);
  Future<PokemonSpeciesResponse> getPokemonSpecieById(int id);
  Future<EvolutionChainResponse> getEvolutionChainById(int id);
}
