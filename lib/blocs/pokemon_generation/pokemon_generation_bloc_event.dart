abstract class PokemonGenerationBlocEvent {
  const PokemonGenerationBlocEvent();
}

class PokemonGenerationRetrieved extends PokemonGenerationBlocEvent {
  final int generation;

  const PokemonGenerationRetrieved(this.generation);
}
