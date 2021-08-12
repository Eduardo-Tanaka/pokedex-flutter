abstract class PokemonBlocEvent {
  const PokemonBlocEvent();
}

class PokemonRetrieved extends PokemonBlocEvent {
  final int id;

  const PokemonRetrieved(this.id);
}
