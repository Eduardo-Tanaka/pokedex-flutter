import 'package:pokedex/models/pokemon_generation_response.dart';

abstract class PokemonGenerationBlocEvent {
  const PokemonGenerationBlocEvent();
}

class PokemonGenerationRetrieved extends PokemonGenerationBlocEvent {
  final int generation;

  const PokemonGenerationRetrieved(this.generation);
}

class PokemonGenerationFiltered extends PokemonGenerationBlocEvent {
  final PokemonGenerationResponse original;
  final PokemonGenerationResponse filtered;

  const PokemonGenerationFiltered(this.original, this.filtered);
}
