abstract class PokemonSpeciesBlocEvent {
  const PokemonSpeciesBlocEvent();
}

class PokemonSpecieRetrieved extends PokemonSpeciesBlocEvent {
  final int id;

  const PokemonSpecieRetrieved(this.id);
}
